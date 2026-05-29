<?php
// logger.php - MySQL-based access logging
require_once __DIR__ . '/config.php';

function log_message($type, $details) {
    if (!ENABLE_LOG) return;

    $pdo = get_db();
    $ip = $_SERVER['REMOTE_ADDR'] ?? 'System';

    $stmt = $pdo->prepare("INSERT INTO access_logs (ip, log_type, details) VALUES (?, ?, ?)");
    $stmt->execute([$ip, $type, $details]);
}

function log_start() {
    $ua = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
    log_message("START", "UA: $ua");
}

function log_stop($start_time) {
    $start = strtotime($start_time);
    $now = time();
    $duration = $now - $start;
    $minutes = floor($duration / 60);
    $seconds = $duration % 60;
    log_message("STOP", "Durasi: {$minutes}m {$seconds}s");
}

function log_channel_change($admin, $new_url) {
    log_message("CHANNEL_CHANGE", "Oleh: $admin | URL baru: $new_url");
}
?>
