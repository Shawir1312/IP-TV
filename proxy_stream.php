<?php
// proxy_stream.php - Smart HLS Proxy & Relay Stream
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/session_tracker.php';
require_once __DIR__ . '/logger.php';

// Disable timeout for long running stream
set_time_limit(0);
// Disable output buffering
while (ob_get_level() > 0) {
    ob_end_clean();
}

$start_time = date('Y-m-d H:i:s');
$is_main_request = !isset($_GET['url']);
$token = null;

if ($is_main_request) {
    // This is the initial request from the player
    $token = init_session_tracking();
    if ($token) {
        setcookie('session_token', $token, time() + 86400, '/', '', false, true);
        log_start();
    }
} else {
    // Update ping if session token exists
    if (isset($_COOKIE['session_token'])) {
        update_session_ping($_COOKIE['session_token']);
    }
}

function get_current_stream_url() {
    $pdo = get_db();
    $stmt = $pdo->prepare("SELECT stream_url FROM channels WHERE is_active = 1 LIMIT 1");
    $stmt->execute();
    $row = $stmt->fetch();
    return $row ? $row['stream_url'] : null;
}

// Resolve relative URLs to absolute URLs
function rel2abs($rel, $base) {
    if (parse_url($rel, PHP_URL_SCHEME) != '') return $rel;
    if ($rel[0] == '#' || $rel[0] == '?') return $base . $rel;
    extract(parse_url($base));
    $path = preg_replace('#/[^/]*$#', '', $path);
    if ($rel[0] == '/') $path = '';
    $abs = "$host$path/$rel";
    $re = array('#(/\.?/)#', '#/(?!\.\.)[^/]+/\.\./#');
    for ($n = 1; $n > 0; $abs = preg_replace($re[1], '/', $abs, -1, $n)) {}
    return $scheme . '://' . $abs;
}

$target_url = $is_main_request ? get_current_stream_url() : base64_decode($_GET['url']);

if (!$target_url) {
    http_response_code(404);
    die("Stream URL not found.");
}

// Check if the target is an M3U8 playlist
$is_m3u8 = (stripos(parse_url($target_url, PHP_URL_PATH), '.m3u8') !== false) || $is_main_request;

if ($is_m3u8) {
    // --- HLS M3U8 PROXY MODE ---
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $target_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 15);
    
    $content = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $content_type = curl_getinfo($ch, CURLINFO_CONTENT_TYPE);
    curl_close($ch);

    if ($http_code != 200 || empty($content)) {
        http_response_code(404);
        die("Source playlist unavailable.");
    }

    // If it's actually a TS file but didn't have extension, redirect to TS mode
    if (stripos($content_type, 'video') !== false && stripos($content_type, 'mpegurl') === false) {
        header("Location: proxy_stream.php?url=" . base64_encode($target_url));
        exit;
    }

    // Process the playlist to rewrite URLs
    $lines = explode("\n", $content);
    $output = "";

    foreach ($lines as $line) {
        $line = trim($line);
        if (empty($line)) continue;

        if ($line[0] === '#') {
            // It's a tag, pass it through (unless it's an absolute URI tag, but we'll ignore edge cases for now)
            $output .= $line . "\n";
        } else {
            // It's a URL (variant playlist or TS chunk)
            $absolute_url = rel2abs($line, $target_url);
            $proxied_url = "proxy_stream.php?url=" . urlencode(base64_encode($absolute_url));
            $output .= $proxied_url . "\n";
        }
    }

    header('Content-Type: application/vnd.apple.mpegurl');
    header('Cache-Control: no-cache, no-store, must-revalidate');
    header('Access-Control-Allow-Origin: *');
    echo $output;

} else {
    // --- TS CHUNK / RAW STREAM RELAY MODE ---
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $target_url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, false);
    curl_setopt($ch, CURLOPT_HEADER, false);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) VLC/3.0.18');
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
    curl_setopt($ch, CURLOPT_TIMEOUT, 0); // No timeout for continuous streams
    
    header('Access-Control-Allow-Origin: *');
    header('Cache-Control: no-cache, no-store, must-revalidate');

    // Pass through Content-Type from the source
    curl_setopt($ch, CURLOPT_HEADERFUNCTION, function($curl, $header) {
        if (stripos($header, 'Content-Type:') === 0) {
            header(trim($header));
        }
        return strlen($header);
    });

    // Write directly to output buffer (which is turned off, so it streams directly)
    curl_setopt($ch, CURLOPT_WRITEFUNCTION, function($ch, $data) {
        if (connection_aborted()) return 0; // Abort if client disconnects
        echo $data;
        flush();
        return strlen($data);
    });

    curl_exec($ch);
    curl_close($ch);
}

if ($is_main_request && $token) {
    log_stop($start_time);
}
?>
