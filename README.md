# S.NET TV (IP-TV Player & Management)

A web-based IPTV streaming platform and management panel. This application allows administrators to manage IPTV channels, stream sources via a built-in proxy, and provides users with a seamless web player experience.

## Features

- **Web Player**: Built-in video player using `hls.js` and `mpegts.js` for robust playback of HLS (`.m3u8`) and raw MPEG-TS streams.
- **Admin Panel**: Manage active channels, switch streams in real-time, and control system settings.
- **Real-Time Updates**: The player automatically detects when an admin changes the active channel and reloads the stream without requiring manual user refreshes.
- **Session Tracking**: Built-in heartbeat (ping) system to track active viewer sessions.
- **Stream Proxy**: Includes a PHP-based stream proxy (`proxy_stream.php`) to bypass CORS and hide actual stream URLs.
- **M3U Parser**: Utilities for parsing M3U playlists and validating IP/TS streams.

## Directory Structure

- `admin/` - Admin control panel and API endpoints.
- `index.html` - The main web player interface for end-users.
- `config.php` - Database and application configuration.
- `proxy_stream.php` - Handles streaming the video data to the client.
- `session_tracker.php` & `ping.php` - Viewer session management.

## Setup

1. Import the provided `iptv.sql` into your MySQL database.
2. Update the database credentials in `config.php`.
3. Configure your web server (Apache/Nginx) to point to the directory.
4. Access the admin panel at `/admin/` to set up your first channel.

---
*Developed for Shawir ID.*
