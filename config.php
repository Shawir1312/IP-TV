<?php
// config.php - Main Configuration File

// Stream Settings
define('STREAM_TIMEOUT', 30);     // Connection timeout in seconds
define('CHUNK_SIZE', 8192);       // Bytes per chunk
define('MAX_RETRIES', 3);         // Retry count if source disconnects

// Logging
define('ENABLE_LOG', true);

// Database Settings
define('DB_HOST', 'localhost');
define('DB_NAME', 'iptv');
define('DB_USER', 'iptv');
define('DB_PASS', 'iptv');

// Admin Credentials
// Default user: admin / admin123
define('ADMIN_USER', 'admin');
define('ADMIN_PASS_HASH', '$2y$10$YourHashHere'); // Will be set by install.php

// --- Database Connection ---
function get_db() {
    static $pdo = null;
    if ($pdo === null) {
        try {
            $dsn = 'mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8mb4';
            $pdo = new PDO($dsn, DB_USER, DB_PASS, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ]);
        } catch (PDOException $e) {
            http_response_code(500);
            die('Database connection failed.');
        }
    }
    return $pdo;
}

// Helper function to verify CSRF token
function verify_csrf_token($token) {
    if (empty($_SESSION['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $token)) {
        http_response_code(403);
        die("CSRF Token Validation Failed.");
    }
}

// Helper function to generate CSRF token
function generate_csrf_token() {
    if (empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}
?>
