<?php
// session_tracker.php - MySQL-based active viewer tracking
require_once __DIR__ . '/config.php';

function init_session_tracking() {
    $ip = $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
    $ua = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
    $token = hash('sha256', $ip . $ua . session_id());

    $pdo = get_db();

    // Check if session already exists
    $stmt = $pdo->prepare("SELECT id FROM viewer_sessions WHERE token = ?");
    $stmt->execute([$token]);

    if ($stmt->fetch()) {
        // Update existing session ping
        $stmt = $pdo->prepare("UPDATE viewer_sessions SET last_ping = NOW() WHERE token = ?");
        $stmt->execute([$token]);
    } else {
        // Insert new session
        $stmt = $pdo->prepare("INSERT INTO viewer_sessions (token, ip, user_agent, start_time, last_ping) VALUES (?, ?, ?, NOW(), NOW())");
        $stmt->execute([$token, $ip, $ua]);
    }

    return $token;
}

function update_session_ping($token) {
    if (!preg_match('/^[a-f0-9]{64}$/', $token)) {
        return false;
    }

    $pdo = get_db();
    $stmt = $pdo->prepare("UPDATE viewer_sessions SET last_ping = NOW() WHERE token = ?");
    $stmt->execute([$token]);
    return $stmt->rowCount() > 0;
}

function get_active_sessions() {
    $pdo = get_db();

    // First, clean expired sessions (last_ping > 30 seconds ago)
    $pdo->exec("DELETE FROM viewer_sessions WHERE last_ping < NOW() - INTERVAL 30 SECOND");

    // Now get active ones
    $stmt = $pdo->query("SELECT ip, user_agent, start_time, last_ping FROM viewer_sessions ORDER BY start_time DESC");
    return $stmt->fetchAll();
}

function clean_expired_sessions() {
    $pdo = get_db();
    $pdo->exec("DELETE FROM viewer_sessions WHERE last_ping < NOW() - INTERVAL 30 SECOND");
}
?>
