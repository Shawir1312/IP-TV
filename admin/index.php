<?php
session_start();
if (empty($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header('Location: login.php');
    exit;
}

// Calculate uptime (approximate based on filemtime of config.php)
$uptime_start = filemtime(__DIR__ . '/../config.php');
$uptime_seconds = time() - $uptime_start;
$uptime_str = gmdate("H\h i\m s\s", $uptime_seconds);
// If it's more than 24 hours
if ($uptime_seconds > 86400) {
    $days = floor($uptime_seconds / 86400);
    $uptime_str = $days . "d " . gmdate("H\h i\m s\s", $uptime_seconds % 86400);
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - IPTV Admin</title>
    <link rel="stylesheet" href="assets/admin.css">
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            📺 IPTV Proxy
        </div>
        <ul class="nav-links">
            <li><a href="index.php" class="active">Dashboard</a></li>
            <li><a href="channel.php">Channel Manager</a></li>
        </ul>
        <a href="logout.php" class="logout-btn">🚪 Logout</a>
    </div>

    <div class="main-content">
        <div class="header-bar">
            <h2>Dashboard Monitoring</h2>
            <div>Uptime Server: <strong id="server-uptime"><?= $uptime_str ?></strong></div>
        </div>

        <div class="grid-container">
            <div class="card">
                <h3>Viewer Aktif</h3>
                <div class="stat-value" id="active-count">0</div>
                <div style="color: #888">Sedang menonton saat ini</div>
            </div>
            
            <div class="card">
                <h3>Status Stream</h3>
                <div class="stat-value" id="stream-status-text"><span class="badge badge-offline">Mengecek...</span></div>
                <div style="color: #888; margin-top: 10px;" id="current-channel-name">-</div>
            </div>
        </div>

        <div class="card" style="margin-bottom: 20px;">
            <h3>Tabel Viewer Aktif</h3>
            <table>
                <thead>
                    <tr>
                        <th>IP Address</th>
                        <th>Waktu Mulai</th>
                        <th>Last Ping</th>
                        <th>Device / User Agent</th>
                    </tr>
                </thead>
                <tbody id="viewers-table-body">
                    <tr><td colspan="4">Memuat data...</td></tr>
                </tbody>
            </table>
        </div>

        <div class="card">
            <h3>Log Akses Terbaru</h3>
            <div class="log-box" id="recent-logs">Memuat log...</div>
        </div>
    </div>

    <script src="assets/admin.js"></script>
    <script>
        // Init Dashboard refresh
        document.addEventListener('DOMContentLoaded', () => {
            refreshDashboard();
            setInterval(refreshDashboard, 10000); // 10 seconds auto-refresh
        });
    </script>
</body>
</html>
