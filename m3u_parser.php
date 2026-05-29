<?php
// m3u_parser.php - Parse M3U/M3U8 playlist into individual channels
require_once __DIR__ . '/config.php';

/**
 * Fetch and parse an M3U playlist URL into an array of channels.
 * Returns array of ['name' => ..., 'url' => ..., 'logo' => ..., 'group' => ...]
 */
function parse_m3u_from_url($playlist_url) {
    $ch = curl_init($playlist_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
    $content = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($http_code !== 200 || empty($content)) {
        return false;
    }

    return parse_m3u_content($content);
}

/**
 * Parse raw M3U content string into channel array.
 */
function parse_m3u_content($content) {
    $lines = explode("\n", str_replace("\r\n", "\n", $content));
    $channels = [];
    $current = null;

    foreach ($lines as $line) {
        $line = trim($line);
        if (empty($line)) continue;

        if (strpos($line, '#EXTINF:') === 0) {
            $current = [
                'name' => '',
                'url' => '',
                'logo' => '',
                'group' => '',
            ];

            // Extract tvg-logo
            if (preg_match('/tvg-logo="([^"]*)"/', $line, $m)) {
                $current['logo'] = $m[1];
            }

            // Extract group-title
            if (preg_match('/group-title="([^"]*)"/', $line, $m)) {
                $current['group'] = $m[1];
            }

            // Extract channel name (everything after the last comma)
            $comma_pos = strrpos($line, ',');
            if ($comma_pos !== false) {
                $current['name'] = trim(substr($line, $comma_pos + 1));
            }

        } elseif ($current !== null && strpos($line, '#') !== 0) {
            // This is the URL line
            $current['url'] = $line;
            if (!empty($current['name']) && !empty($current['url'])) {
                $channels[] = $current;
            }
            $current = null;
        }
    }

    return $channels;
}

/**
 * Import parsed channels into the database.
 * Clears existing playlist channels and re-imports.
 */
function import_playlist_to_db($playlist_url) {
    $channels = parse_m3u_from_url($playlist_url);
    if ($channels === false || empty($channels)) {
        return ['success' => false, 'message' => 'Gagal mengambil atau memparse playlist M3U.', 'count' => 0];
    }

    $pdo = get_db();

    // Auto-create tables if they don't exist
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

    // Save the playlist URL in a settings-like approach
    $stmt = $pdo->prepare("DELETE FROM playlist_channels");
    $stmt->execute();

    // Save playlist source URL
    $stmt = $pdo->prepare("REPLACE INTO playlist_sources (id, playlist_url, imported_at) VALUES (1, ?, NOW())");
    $stmt->execute([$playlist_url]);

    // Batch insert channels
    $stmt = $pdo->prepare("INSERT INTO playlist_channels (channel_name, stream_url, logo_url, group_name, sort_order) VALUES (?, ?, ?, ?, ?)");

    $order = 0;
    foreach ($channels as $ch) {
        $order++;
        $stmt->execute([
            $ch['name'],
            $ch['url'],
            $ch['logo'],
            $ch['group'],
            $order
        ]);
    }

    return ['success' => true, 'message' => "Berhasil mengimpor $order channel.", 'count' => $order];
}
?>
