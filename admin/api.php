<?php
// admin/api.php - Admin API endpoints (MySQL-backed)
session_start();
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../session_tracker.php';
require_once __DIR__ . '/../config_writer.php';
require_once __DIR__ . '/../logger.php';
require_once __DIR__ . '/../m3u_parser.php';

header('Content-Type: application/json');

$action = $_GET['action'] ?? ($_POST['action'] ?? '');

// --- Unprotected endpoint for player ---
if ($action === 'get_channel' && $_SERVER['REQUEST_METHOD'] === 'GET') {
    $pdo = get_db();
    $stmt = $pdo->prepare("SELECT channel_name, stream_url, stream_changed, updated_at FROM channels WHERE is_active = 1 LIMIT 1");
    $stmt->execute();
    $row = $stmt->fetch();
    if ($row) {
        echo json_encode(['status' => 'ok', 'data' => $row]);
    } else {
        http_response_code(404);
        echo json_encode(['status' => 'error', 'message' => 'No active channel']);
    }
    exit;
}

// --- All endpoints below require Admin authentication ---
if (empty($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    http_response_code(401);
    echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
    exit;
}

// Helper to enforce CSRF on POST
function enforce_csrf() {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $data = json_decode(file_get_contents('php://input'), true);
        $token = $data['csrf_token'] ?? ($_POST['csrf_token'] ?? '');
        verify_csrf_token($token);
    }
}

generate_csrf_token();

switch ($action) {
    case 'active_viewers':
        $viewers = get_active_sessions();
        echo json_encode(['status' => 'ok', 'count' => count($viewers), 'viewers' => $viewers]);
        break;

    case 'stream_status':
        $pdo = get_db();
        $stmt = $pdo->prepare("SELECT stream_url FROM channels WHERE is_active = 1 LIMIT 1");
        $stmt->execute();
        $row = $stmt->fetch();
        if ($row) {
            $url = $row['stream_url'];
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_NOBODY, true);
            curl_setopt($ch, CURLOPT_TIMEOUT, 3);
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_exec($ch);
            $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);

            $status = ($code >= 200 && $code < 400) ? 'online' : 'offline';
            echo json_encode(['status' => 'ok', 'stream_status' => $status, 'code' => $code]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'No active channel']);
        }
        break;

    case 'recent_logs':
        $pdo = get_db();
        $stmt = $pdo->query("SELECT ip, log_type, details, created_at FROM access_logs ORDER BY created_at DESC LIMIT 20");
        $logs = $stmt->fetchAll();
        $lines = [];
        foreach ($logs as $log) {
            $lines[] = "[{$log['created_at']}] IP: {$log['ip']} | {$log['log_type']} | {$log['details']}";
        }
        echo json_encode(['status' => 'ok', 'logs' => $lines]);
        break;

    case 'server_stats':
        $pdo = get_db();
        $stmt = $pdo->query("SELECT COUNT(*) as total FROM access_logs WHERE log_type = 'START' AND DATE(created_at) = CURDATE()");
        $row = $stmt->fetch();
        $total_today = $row['total'] ?? 0;
        $uptime_start = filemtime(__DIR__ . '/../config.php');
        $uptime_seconds = time() - $uptime_start;
        $hours = floor($uptime_seconds / 3600);
        $minutes = floor(($uptime_seconds % 3600) / 60);
        $uptime_str = "{$hours}h {$minutes}m";
        echo json_encode(['status' => 'ok', 'uptime' => $uptime_str, 'total_today' => $total_today]);
        break;

    case 'save_channel':
        enforce_csrf();
        $input = json_decode(file_get_contents('php://input'), true) ?? $_POST;
        $name = trim($input['channel_name'] ?? '');
        $url = trim($input['stream_url'] ?? '');

        if (empty($name) || empty($url)) {
            echo json_encode(['status' => 'error', 'message' => 'Name and URL are required']);
            exit;
        }

        if (update_channel($name, $url, ADMIN_USER)) {
            log_channel_change(ADMIN_USER, $url);
            echo json_encode(['status' => 'ok', 'message' => 'Channel updated']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to update channel']);
        }
        break;

    case 'test_url':
        enforce_csrf();
        $input = json_decode(file_get_contents('php://input'), true) ?? $_POST;
        $url = trim($input['url'] ?? '');
        if (empty($url)) {
            echo json_encode(['status' => 'error', 'message' => 'URL is required']);
            exit;
        }
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_NOBODY, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, 5);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_exec($ch);
        $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        echo json_encode(['status' => 'ok', 'code' => $code, 'reachable' => ($code >= 200 && $code < 400)]);
        break;

    case 'channel_history':
        $pdo = get_db();
        $stmt = $pdo->query("SELECT channel_name, stream_url, used_at FROM channel_history ORDER BY used_at DESC LIMIT 5");
        $history = $stmt->fetchAll();
        echo json_encode(['status' => 'ok', 'history' => $history]);
        break;

    // ==========================================
    // Playlist / Multi-Channel M3U Endpoints
    // ==========================================

    case 'import_playlist':
        enforce_csrf();
        $input = json_decode(file_get_contents('php://input'), true) ?? $_POST;
        $playlist_url = trim($input['playlist_url'] ?? '');

        if (empty($playlist_url)) {
            echo json_encode(['status' => 'error', 'message' => 'Playlist URL is required']);
            exit;
        }

        $result = import_playlist_to_db($playlist_url);
        if ($result['success']) {
            log_message('PLAYLIST_IMPORT', "URL: $playlist_url | Count: {$result['count']}");
            echo json_encode(['status' => 'ok', 'message' => $result['message'], 'count' => $result['count']]);
        } else {
            echo json_encode(['status' => 'error', 'message' => $result['message']]);
        }
        break;

    case 'list_playlist':
        $pdo = get_db();

        $pdo->exec("CREATE TABLE IF NOT EXISTS `playlist_channels` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `channel_name` VARCHAR(255) NOT NULL,
            `stream_url` TEXT NOT NULL,
            `logo_url` TEXT DEFAULT NULL,
            `group_name` VARCHAR(255) DEFAULT NULL,
            `sort_order` INT DEFAULT 0,
            `is_online` TINYINT(1) DEFAULT NULL,
            `last_checked` DATETIME DEFAULT NULL,
            INDEX `idx_group` (`group_name`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

        $pdo->exec("CREATE TABLE IF NOT EXISTS `playlist_sources` (
            `id` INT PRIMARY KEY DEFAULT 1,
            `playlist_url` TEXT NOT NULL,
            `imported_at` DATETIME DEFAULT CURRENT_TIMESTAMP
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");

        $group = $_GET['group'] ?? '';
        $search = $_GET['search'] ?? '';

        $sql = "SELECT id, channel_name, stream_url, logo_url, group_name FROM playlist_channels";
        $params = [];
        $conditions = [];

        if (!empty($group)) {
            $conditions[] = "group_name = ?";
            $params[] = $group;
        }
        if (!empty($search)) {
            $conditions[] = "channel_name LIKE ?";
            $params[] = "%$search%";
        }
        if (!empty($conditions)) {
            $sql .= " WHERE " . implode(" AND ", $conditions);
        }
        $sql .= " ORDER BY sort_order ASC";

        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        $channels = $stmt->fetchAll();

        // Also get groups for filter
        $stmt2 = $pdo->query("SELECT DISTINCT group_name FROM playlist_channels WHERE group_name IS NOT NULL AND group_name != '' ORDER BY group_name");
        $groups = $stmt2->fetchAll(PDO::FETCH_COLUMN);

        // Get playlist source
        $stmt3 = $pdo->query("SELECT playlist_url, imported_at FROM playlist_sources WHERE id = 1");
        $source = $stmt3->fetch();

        echo json_encode([
            'status' => 'ok',
            'channels' => $channels,
            'groups' => $groups,
            'total' => count($channels),
            'source' => $source ?: null
        ]);
        break;

    case 'select_playlist_channel':
        enforce_csrf();
        $input = json_decode(file_get_contents('php://input'), true) ?? $_POST;
        $channel_id = intval($input['channel_id'] ?? 0);

        if ($channel_id <= 0) {
            echo json_encode(['status' => 'error', 'message' => 'Invalid channel ID']);
            exit;
        }

        $pdo = get_db();
        $stmt = $pdo->prepare("SELECT channel_name, stream_url FROM playlist_channels WHERE id = ?");
        $stmt->execute([$channel_id]);
        $ch_data = $stmt->fetch();

        if (!$ch_data) {
            echo json_encode(['status' => 'error', 'message' => 'Channel not found']);
            exit;
        }

        if (update_channel($ch_data['channel_name'], $ch_data['stream_url'], ADMIN_USER)) {
            log_channel_change(ADMIN_USER, $ch_data['stream_url']);
            echo json_encode(['status' => 'ok', 'message' => 'Channel "' . $ch_data['channel_name'] . '" sekarang aktif!']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Failed to set channel']);
        }
        break;

    case 'preview_channel':
        $channel_id = intval($_GET['id'] ?? 0);
        if ($channel_id <= 0) {
            echo json_encode(['status' => 'error', 'message' => 'Invalid channel ID']);
            exit;
        }
        $pdo = get_db();
        $stmt = $pdo->prepare("SELECT channel_name, stream_url, logo_url FROM playlist_channels WHERE id = ?");
        $stmt->execute([$channel_id]);
        $ch_data = $stmt->fetch();
        if ($ch_data) {
            echo json_encode(['status' => 'ok', 'data' => $ch_data]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Channel not found']);
        }
        break;

    default:
        echo json_encode(['status' => 'error', 'message' => 'Unknown action']);
}
?>
