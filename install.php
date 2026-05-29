<?php
// install.php - Database initialization script
// Run this once to create tables and set up admin password
// After running, delete this file or restrict access!

require_once __DIR__ . '/config.php';

$pdo = get_db();

echo "<pre>\n";
echo "=== IPTV Server Database Installer ===\n\n";

// --- Create tables ---
$queries = [
    // Channels table (active channel + settings)
    "CREATE TABLE IF NOT EXISTS `channels` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `channel_name` VARCHAR(255) NOT NULL DEFAULT 'Default Channel',
        `stream_url` TEXT NOT NULL,
        `is_active` TINYINT(1) NOT NULL DEFAULT 1,
        `stream_changed` TINYINT(1) NOT NULL DEFAULT 0,
        `updated_by` VARCHAR(100) DEFAULT 'system',
        `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // Channel history table
    "CREATE TABLE IF NOT EXISTS `channel_history` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `channel_name` VARCHAR(255) NOT NULL,
        `stream_url` TEXT NOT NULL,
        `used_at` DATETIME DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // Viewer sessions table
    "CREATE TABLE IF NOT EXISTS `viewer_sessions` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `token` VARCHAR(64) NOT NULL UNIQUE,
        `ip` VARCHAR(45) NOT NULL,
        `user_agent` TEXT,
        `start_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
        `last_ping` DATETIME DEFAULT CURRENT_TIMESTAMP,
        INDEX `idx_token` (`token`),
        INDEX `idx_last_ping` (`last_ping`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // Access logs table
    "CREATE TABLE IF NOT EXISTS `access_logs` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `ip` VARCHAR(45) DEFAULT NULL,
        `log_type` VARCHAR(50) NOT NULL,
        `details` TEXT,
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
        INDEX `idx_created_at` (`created_at`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // Admin users table
    "CREATE TABLE IF NOT EXISTS `admin_users` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `username` VARCHAR(100) NOT NULL UNIQUE,
        `password_hash` VARCHAR(255) NOT NULL,
        `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // Playlist channels table (parsed from M3U)
    "CREATE TABLE IF NOT EXISTS `playlist_channels` (
        `id` INT AUTO_INCREMENT PRIMARY KEY,
        `channel_name` VARCHAR(255) NOT NULL,
        `stream_url` TEXT NOT NULL,
        `logo_url` TEXT DEFAULT NULL,
        `group_name` VARCHAR(255) DEFAULT NULL,
        `sort_order` INT DEFAULT 0,
        `is_online` TINYINT(1) DEFAULT NULL,
        `last_checked` DATETIME DEFAULT NULL,
        INDEX `idx_group` (`group_name`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",

    // Playlist source URL tracker
    "CREATE TABLE IF NOT EXISTS `playlist_sources` (
        `id` INT PRIMARY KEY DEFAULT 1,
        `playlist_url` TEXT NOT NULL,
        `imported_at` DATETIME DEFAULT CURRENT_TIMESTAMP
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4",
];

foreach ($queries as $sql) {
    try {
        $pdo->exec($sql);
        // Extract table name for display
        preg_match('/`(\w+)`/', $sql, $m);
        echo "✅ Table `{$m[1]}` created/verified.\n";
    } catch (PDOException $e) {
        echo "❌ Error: " . $e->getMessage() . "\n";
    }
}

// --- Insert default admin user ---
$admin_user = 'admin';
$admin_pass = password_hash('admin123', PASSWORD_BCRYPT);

$stmt = $pdo->prepare("SELECT id FROM admin_users WHERE username = ?");
$stmt->execute([$admin_user]);
if (!$stmt->fetch()) {
    $stmt = $pdo->prepare("INSERT INTO admin_users (username, password_hash) VALUES (?, ?)");
    $stmt->execute([$admin_user, $admin_pass]);
    echo "✅ Admin user 'admin' created (password: admin123).\n";
} else {
    echo "ℹ️  Admin user 'admin' already exists.\n";
}

// --- Insert default channel ---
$stmt = $pdo->prepare("SELECT id FROM channels WHERE is_active = 1 LIMIT 1");
$stmt->execute();
if (!$stmt->fetch()) {
    $stmt = $pdo->prepare("INSERT INTO channels (channel_name, stream_url, is_active, updated_by) VALUES (?, ?, 1, 'system')");
    $stmt->execute(['Default Channel', 'http://example.com/stream.m3u8']);
    echo "✅ Default channel created.\n";
} else {
    echo "ℹ️  Active channel already exists.\n";
}

echo "\n=== Installation Complete ===\n";
echo "⚠️  IMPORTANT: Delete this file (install.php) after installation!\n";
echo "</pre>\n";
?>
