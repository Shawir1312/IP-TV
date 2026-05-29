<?php
session_start();
if (empty($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header('Location: login.php');
    exit;
}
require_once __DIR__ . '/../config.php';
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Channel Manager - IPTV Admin</title>
    <link rel="stylesheet" href="assets/admin.css">
    <script src="https://cdn.jsdelivr.net/npm/hls.js@1"></script>
    <script src="https://cdn.jsdelivr.net/npm/mpegts.js@1.7.3/dist/mpegts.min.js"></script>
    <script>
        const CSRF_TOKEN = <?= json_encode($_SESSION['csrf_token']) ?>;
    </script>
    <style>
        .channel-list {
            max-height: 400px;
            overflow-y: auto;
            border: 1px solid var(--border-color);
            border-radius: 4px;
            margin-top: 10px;
        }
        .channel-item {
            padding: 10px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background 0.2s;
        }
        .channel-item:hover {
            background: rgba(255,255,255,0.05);
        }
        .channel-item.active {
            border-left: 3px solid var(--primary-color);
            background: rgba(0, 230, 118, 0.1);
        }
        .channel-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .channel-logo {
            width: 40px;
            height: 40px;
            object-fit: contain;
            background: #000;
            border-radius: 4px;
        }
        .filter-bar {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
        }
        .filter-bar input, .filter-bar select {
            padding: 8px;
            background: rgba(0,0,0,0.2);
            border: 1px solid var(--border-color);
            color: #fff;
            border-radius: 4px;
        }
        /* Modal for Preview */
        .modal {
            display: none;
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0,0,0,0.8);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background: var(--panel-bg);
            padding: 20px;
            border-radius: 8px;
            width: 90%;
            max-width: 600px;
            border: 1px solid var(--border-color);
            position: relative;
        }
        .close-btn {
            position: absolute;
            top: 10px; right: 15px;
            font-size: 24px;
            cursor: pointer;
            color: #aaa;
        }
        .close-btn:hover { color: #fff; }
        .preview-player {
            width: 100%;
            background: #000;
            margin-top: 15px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            📺 IPTV Proxy
        </div>
        <ul class="nav-links">
            <li><a href="index.php">Dashboard</a></li>
            <li><a href="channel.php" class="active">Channel Manager</a></li>
        </ul>
        <a href="logout.php" class="logout-btn">🚪 Logout</a>
    </div>

    <div class="main-content">
        <h2>Channel Manager</h2>
        <p>Ganti channel dan URL sumber stream secara real-time.</p>

        <div id="alert-container"></div>

        <div class="grid-container" style="grid-template-columns: 1fr 1fr;">
            <!-- Form Card for Manual Input -->
            <div class="card">
                <h3>Manual Input / Aktif Saat Ini</h3>
                <form id="channel-form">
                    <div class="form-group">
                        <label>Nama Channel</label>
                        <input type="text" id="channel_name" required placeholder="Contoh: TVRI Nasional">
                    </div>
                    <div class="form-group">
                        <label>Link Stream URL</label>
                        <textarea id="stream_url" required placeholder="http://provider.com/live.m3u8"></textarea>
                    </div>
                    <div style="display: flex; gap: 10px;">
                        <button type="button" class="btn btn-secondary" onclick="testUrl()">Test Koneksi</button>
                        <button type="submit" class="btn btn-primary">Simpan & Terapkan</button>
                    </div>
                    <div id="test-result" style="margin-top: 15px; font-weight: bold;"></div>
                </form>
            </div>

            <!-- Import M3U Playlist Card -->
            <div class="card">
                <h3>Import Playlist M3U</h3>
                <form id="import-form">
                    <div class="form-group">
                        <label>URL M3U Playlist</label>
                        <input type="text" id="playlist_url" required placeholder="https://mgi24.github.io/tvdigital/idwork.m3u">
                    </div>
                    <button type="submit" class="btn btn-accent" id="btn-import">Import / Update Playlist</button>
                    <div id="import-status" style="margin-top: 10px; font-size: 0.9em; color: #aaa;"></div>
                </form>

                <div style="margin-top: 30px;">
                    <h3>Riwayat Link (Manual)</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Nama Channel</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody id="history-table-body">
                            <tr><td colspan="2">Memuat riwayat...</td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- M3U Channels List -->
        <div class="card">
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <h3>Daftar Channel dari Playlist</h3>
                <span id="playlist-total-count" class="badge badge-online">0 Channel</span>
            </div>
            
            <div class="filter-bar">
                <input type="text" id="filter-search" placeholder="Cari nama channel..." onkeyup="filterPlaylist()">
                <select id="filter-group" onchange="filterPlaylist()">
                    <option value="">Semua Kategori</option>
                </select>
            </div>

            <div class="channel-list" id="playlist-container">
                <div style="padding: 20px; text-align: center; color: #888;">
                    Belum ada playlist yang diimport. Silakan import M3U di atas.
                </div>
            </div>
        </div>
    </div>

    <!-- Preview Modal -->
    <div id="preview-modal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closePreview()">&times;</span>
            <h3 id="preview-title">Preview Channel</h3>
            <div id="preview-url" style="word-break: break-all; font-size: 0.8em; color: #888; margin-bottom: 10px;"></div>
            <video id="preview-video" class="preview-player" controls autoplay></video>
            <div style="margin-top: 20px; text-align: right;">
                <button class="btn btn-primary" id="btn-set-preview-active">Terapkan sebagai Channel Aktif</button>
            </div>
        </div>
    </div>

    <script src="assets/admin.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            loadCurrentChannel();
            loadHistory();
            loadPlaylist();
            
            document.getElementById('channel-form').addEventListener('submit', function(e) {
                e.preventDefault();
                saveChannel();
            });

            document.getElementById('import-form').addEventListener('submit', function(e) {
                e.preventDefault();
                importPlaylist();
            });
        });
    </script>
</body>
</html>
