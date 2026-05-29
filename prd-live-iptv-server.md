# PRD — Live IPTV Streaming Server
**Project:** Live IPTV Proxy Streaming Server (PHP)
**Versi:** 1.2.0
**Tanggal:** 29 Mei 2026
**Status:** Draft

> **Changelog v1.2:** Menambahkan fitur Channel Manager di admin panel (ganti nama channel & update link stream langsung dari UI), analisis kapasitas hardware server (16 core / 12GB RAM), dan section khusus estimasi kapasitas user.
> **Changelog v1.1:** Menambahkan fitur Admin Monitoring Panel ke dalam scope v1.0 — mencakup login admin, dashboard viewer aktif real-time, session tracker, heartbeat ping, dan API endpoint JSON.

---

## 1. Latar Belakang & Masalah

Saat ini user dalam jaringan lokal (LAN/intranet) melakukan streaming IPTV secara langsung ke server penyedia IPTV eksternal. Akibatnya:

- **Bandwidth jaringan terkuras** — setiap user membuka koneksi tersendiri ke server IPTV luar.
- **Efisiensi rendah** — jika 50 user menonton channel yang sama, ada 50 koneksi terpisah ke sumber yang sama.
- **Tidak ada kontrol** — admin tidak bisa mengatur atau memonitor siapa yang menonton apa.
- **Latensi tinggi** — setiap klien bergantung pada koneksi internet masing-masing ke sumber IPTV.

**Solusi:** Membangun sebuah **IPTV Proxy Streaming Server berbasis PHP** yang berfungsi sebagai perantara (proxy/relay). Server ini mengambil satu stream dari sumber IPTV eksternal, lalu mendistribusikannya ke semua klien lokal. Klien cukup membuka URL server lokal untuk menonton — tidak ada koneksi langsung ke sumber IPTV luar.

---

## 2. Tujuan

| # | Tujuan | Indikator Keberhasilan |
|---|--------|------------------------|
| 1 | Mengurangi konsumsi bandwidth keluar (upstream) | Hanya 1 koneksi ke server IPTV eksternal, berapa pun jumlah viewer |
| 2 | Menyediakan 1 channel live IPTV yang bisa diakses klien via browser | Klien buka URL → langsung streaming tanpa plugin |
| 3 | Memudahkan deployment | Instalasi hanya butuh PHP + web server (Apache/Nginx) |
| 4 | Performa stabil | Stream tidak terputus meski ada banyak klien simultan |

---

## 3. Scope & Batasan

### ✅ Dalam Scope (v1.0)
- Proxy streaming **1 channel IPTV** (sumber: URL `.m3u8` / HTTP stream dari provider)
- Output ke klien dalam format **HLS (HTTP Live Streaming)** atau **HTTP chunked stream**
- Halaman web player sederhana (HTML5 `<video>` + HLS.js)
- Konfigurasi source URL melalui file config
- Logging akses klien (IP, waktu, durasi)
- **Panel Admin** — halaman monitoring viewer aktif, statistik, dan log akses (diproteksi password)
- **Channel Manager** — admin dapat mengganti nama channel dan update link stream sumber langsung dari UI tanpa edit file, berlaku real-time

### ❌ Di Luar Scope (v1.0)
- Multi-channel (playlist m3u) — direncanakan untuk v2.0
- Autentikasi user / login untuk klien
- DVR / time-shift recording
- Transcode video (tidak ada konversi format)

---

## 4. Pengguna & Peran

| Peran | Deskripsi | Aksi |
|-------|-----------|------|
| **Admin** | Pengelola server | Login panel admin, monitor viewer aktif, pantau log, konfigurasi source URL |
| **Client/Viewer** | User jaringan lokal | Buka URL di browser → langsung nonton |

---

## 5. Arsitektur Sistem

```
[Sumber IPTV Eksternal]
        |
        | (1 koneksi HTTP/HLS dari server)
        ▼
+-----------------------------+
|    PHP Streaming Server     |
|  - proxy_stream.php         |
|  - config.php               |
|  - session_tracker.php      |  ← catat viewer aktif
|  - cache/buffer chunk       |
+-----------------------------+
        |                  |
        | (stream lokal)   | (admin login)
        ├──────────┐       ▼
        ▼          ▼   [admin/]
  [Client A]  [Client B]  Panel Monitor
  (HLS Player)(HLS Player) - Viewer aktif
                            - Log akses
                            - Status server
```

### Komponen Utama

| Komponen | File | Fungsi |
|----------|------|--------|
| Proxy Stream | `proxy_stream.php` | Fetch stream dari sumber, relay ke klien |
| Config | `config.php` | Simpan source URL, token, timeout, kredensial admin |
| Config Writer | `config_writer.php` | Update `channel.json` saat admin ganti channel/link |
| Channel Data | `channel.json` | Penyimpanan nama channel & link stream aktif (writable) |
| Player Page | `index.html` | Halaman HTML5 + HLS.js untuk klien |
| Session Tracker | `session_tracker.php` | Tulis/baca file sesi viewer aktif ke `sessions/` |
| Admin Panel | `admin/index.php` | Dashboard monitoring: viewer aktif, log, status server |
| Admin Channel | `admin/channel.php` | Halaman Channel Manager: form ganti nama & link stream |
| Admin Auth | `admin/login.php` | Login form + session PHP untuk proteksi panel |
| Segment Cache | `cache/` | Buffer segmen HLS sementara (opsional) |
| Logger | `logger.php` | Catat log akses klien |

---

## 6. Spesifikasi Fungsional

### 6.1 Proxy Stream (Core)

**File:** `proxy_stream.php`

- Membaca `IPTV_SOURCE_URL` dari `config.php`
- Membuka koneksi ke URL sumber menggunakan `cURL` atau `file_get_contents` dengan stream
- Meneruskan data secara **chunked** ke klien menggunakan `fpassthru()` / output buffering
- Mengirimkan header HTTP yang sesuai:
  - `Content-Type: video/MP2T` atau `application/vnd.apple.mpegurl`
  - `Transfer-Encoding: chunked`
  - `Cache-Control: no-cache`
- Menangani koneksi klien yang terputus (disconnect detection)
- **Timeout reconnect:** Jika sumber terputus, server mencoba reconnect otomatis hingga 3x sebelum mengembalikan error

**Flow:**
```
Client Request → proxy_stream.php
    → cURL buka stream ke sumber IPTV
    → loop: baca chunk → kirim ke klien → flush
    → jika klien disconnect: tutup koneksi sumber
```

---

### 6.2 Channel Manager

**File:** `admin/channel.php` + `config_writer.php` + `channel.json`

Fitur ini memungkinkan admin **mengganti nama channel dan link stream sumber secara real-time dari browser**, tanpa perlu SSH atau edit file manual.

#### Alur Kerja

```
Admin buka admin/channel.php
    → Tampil form: Nama Channel + Link Stream URL
    → Admin isi / edit → klik "Simpan & Terapkan"
    → POST ke config_writer.php
    → config_writer.php tulis ulang channel.json
    → proxy_stream.php baca channel.json setiap request
    → Klien yang connect berikutnya otomatis pakai link baru
```

#### File `channel.json` (writable oleh PHP)

```json
{
  "channel_name": "TVRI Nasional",
  "stream_url": "http://provider.example.com/stream/tvri",
  "updated_at": "2026-05-29 10:30:00",
  "updated_by": "admin"
}
```

#### Halaman `admin/channel.php`

Form dengan field:

| Field | Tipe | Keterangan |
|-------|------|------------|
| Nama Channel | Text input | Nama yang ditampilkan di player klien |
| Link Stream URL | Textarea | URL sumber IPTV (http/https, .m3u8, RTMP, dsb) |
| Test Link | Tombol | Cek apakah URL sumber bisa diakses sebelum disimpan |
| Simpan & Terapkan | Tombol submit | Tulis ke `channel.json`, berlaku langsung |

#### Fitur Tambahan Channel Manager

- **Riwayat link** — simpan 5 link terakhir yang pernah dipakai (sebagai backup/rollback cepat)
- **Test koneksi** — sebelum simpan, PHP coba buka URL sumber (HEAD request via cURL); tampilkan status "✅ URL Bisa Diakses" atau "❌ URL Tidak Dapat Dijangkau"
- **Notifikasi viewer** — saat admin ganti link, klien yang sedang nonton menerima pesan overlay: *"Stream sedang diperbarui, mohon tunggu..."* dan player otomatis reload setelah 5 detik
- **Pergantian tanpa downtime** — proxy_stream.php membaca `channel.json` setiap kali ada koneksi baru masuk; klien yang sudah terkoneksi akan tetap di stream lama hingga mereka reload

#### API Endpoint Channel

Ditambahkan ke `admin/api.php`:

| Endpoint | Method | Aksi |
|----------|--------|------|
| `api.php?action=get_channel` | GET | Ambil info channel aktif (nama + URL) |
| `api.php?action=save_channel` | POST | Simpan channel baru ke `channel.json` |
| `api.php?action=test_url` | POST | Cek apakah URL stream bisa diakses |
| `api.php?action=channel_history` | GET | Ambil 5 riwayat link terakhir |
| `api.php?action=rollback_channel` | POST | Rollback ke salah satu link di riwayat |

---

### 6.3 Konfigurasi

**File:** `config.php`

```php
<?php
define('STREAM_TIMEOUT',   30);     // detik timeout koneksi
define('CHUNK_SIZE',       8192);   // byte per chunk
define('MAX_RETRIES',      3);      // retry jika sumber putus
define('ENABLE_LOG',       true);
define('LOG_FILE',         __DIR__ . '/logs/access.log');
define('CHANNEL_FILE',     __DIR__ . '/channel.json'); // link stream aktif
define('ADMIN_USER',       'admin');
define('ADMIN_PASS',       ''); // isi dengan password_hash(...)
```

> Catatan: `IPTV_SOURCE_URL` tidak lagi di `config.php` — dipindah ke `channel.json` agar bisa diubah dari UI admin tanpa edit file PHP.

### 6.4 Web Player

**File:** `index.html`

- Tampilan fullscreen-friendly, responsif (mobile & desktop)
- Menggunakan **HLS.js** untuk kompatibilitas browser luas
- Nama channel ditampilkan secara dinamis (diambil dari `api.php?action=get_channel`)
- Auto-play saat halaman dibuka
- Indikator buffering / loading
- Menampilkan overlay notifikasi jika admin sedang ganti channel
- Tidak perlu login atau input apapun — buka URL langsung streaming

### 6.5 Logging

**File:** `logger.php`

Format log:
```
[2026-05-29 10:00:00] IP: 192.168.1.5 | START | UA: Mozilla/5.0...
[2026-05-29 10:45:12] IP: 192.168.1.5 | STOP  | Durasi: 45m 12s
[2026-05-29 11:00:00] CHANNEL_CHANGE  | Oleh: admin | URL baru: http://...
```

---

### 6.6 Session Tracker (Viewer Aktif)

**File:** `session_tracker.php`

Mekanisme tracking viewer aktif menggunakan **file-based session** di folder `sessions/`:

- Saat klien mulai streaming → `proxy_stream.php` panggil `session_tracker.php` → buat file `sessions/{token}.json`
- Isi file sesi:
  ```json
  {
    "ip": "192.168.1.5",
    "user_agent": "Mozilla/5.0...",
    "start_time": "2026-05-29 10:00:00",
    "last_ping": "2026-05-29 10:45:00"
  }
  ```
- Klien mengirim **heartbeat** (ping) ke `ping.php` setiap 10 detik → update `last_ping`
- Jika `last_ping` > 30 detik yang lalu → dianggap **offline**, file sesi dihapus otomatis
- `session_tracker.php` menyediakan fungsi:
  - `getActiveSessions()` → return array semua viewer yang sedang aktif
  - `cleanExpiredSessions()` → hapus sesi yang sudah timeout

**Mengapa file-based, bukan database?**
Tidak memerlukan instalasi MySQL/DB — cukup PHP + folder `sessions/` yang writable.

---

### 6.7 Panel Admin

**Akses:** `http://192.168.x.x/iptv/admin/`

#### 6.7.1 Login Admin

**File:** `admin/login.php`

- Form login (username + password)
- Kredensial disimpan di `config.php` (bcrypt hash)
- Menggunakan **PHP Session** untuk menjaga status login
- Jika belum login → redirect ke `login.php`
- Tombol Logout tersedia di semua halaman admin

#### 6.7.2 Dashboard Monitoring

**File:** `admin/index.php`

Menampilkan informasi secara **real-time** (auto-refresh setiap 10 detik via AJAX):

| Widget | Data yang Ditampilkan |
|--------|----------------------|
| 🟢 **Viewer Aktif** | Jumlah user yang sedang streaming saat ini (angka besar) |
| 📋 **Tabel Viewer** | IP address, waktu mulai, durasi menonton, User Agent |
| 📡 **Status Stream** | Sumber IPTV: Online / Offline / Reconnecting |
| 📺 **Channel Aktif** | Nama channel + link stream yang sedang berjalan |
| 📊 **Grafik Harian** | Chart jumlah viewer per jam (hari ini) |
| 📜 **Log Terbaru** | 20 baris terakhir dari `logs/access.log` |
| ⏱️ **Uptime Server** | Sudah berapa lama server berjalan |

#### 6.7.3 Channel Manager (Ganti Channel & Link Stream)

**File:** `admin/channel.php`

Halaman khusus untuk mengelola channel yang sedang di-relay. Navigasi: sidebar admin → menu **"Channel Manager"**.

**Form yang tersedia:**

| Field | Tipe | Keterangan |
|-------|------|------------|
| Nama Channel | Text input | Nama ditampilkan di player klien (contoh: "TVRI Nasional") |
| Link Stream URL | Textarea | URL sumber IPTV baru — bisa http, https, .m3u8 |
| **[Test Koneksi]** | Tombol | Cek URL sebelum disimpan, tampilkan ✅ atau ❌ + kode HTTP |
| **[Simpan & Terapkan]** | Tombol submit | Tulis ke `channel.json`, berlaku langsung untuk klien baru |

**Riwayat Link (Rollback):**

Tabel 5 link terakhir yang pernah dipakai:

| # | Nama Channel | URL | Dipakai Pada | Aksi |
|---|--------------|-----|--------------|------|
| 1 | TVRI Sport HD | http://... | 28 Mei 2026 09:00 | [Pakai Lagi] |
| 2 | TVRI Nasional | http://... | 27 Mei 2026 14:30 | [Pakai Lagi] |

Tombol **[Pakai Lagi]** langsung mengisi form dengan link lama — admin tinggal klik Simpan.

**Notifikasi ke Viewer:**
Saat admin menyimpan link baru, server menandai flag `stream_changed = true` di `channel.json`. Klien yang sedang nonton akan melihat overlay: *"Channel sedang diperbarui, harap tunggu..."* dan player auto-reload dalam 5 detik.

#### 6.7.4 API Endpoint Admin

**File:** `admin/api.php`

| Endpoint | Method | Response / Aksi |
|----------|--------|----------------|
| `api.php?action=active_viewers` | GET | `{"count": 5, "viewers": [...]}` |
| `api.php?action=stream_status` | GET | `{"status": "online", "source_url": "..."}` |
| `api.php?action=server_stats` | GET | `{"uptime": "2h 15m", "total_today": 42}` |
| `api.php?action=recent_logs` | GET | `{"logs": [...]}` |
| `api.php?action=get_channel` | GET | `{"name": "TVRI", "url": "http://..."}` |
| `api.php?action=save_channel` | POST | Simpan channel baru ke `channel.json` |
| `api.php?action=test_url` | POST | Cek apakah URL dapat dijangkau, return HTTP status |
| `api.php?action=channel_history` | GET | Array 5 riwayat link terakhir |
| `api.php?action=rollback_channel` | POST | Rollback ke link dari riwayat |

#### 6.7.5 UI Admin Panel

- Tampilan **dark mode** dengan aksen sinyal TV (hijau/oranye)
- Sidebar navigasi: Dashboard · Channel Manager · Log · Pengaturan
- Responsif — bisa diakses dari HP admin
- Auto-refresh data setiap 10 detik (tanpa reload halaman)

---

## 7. Spesifikasi Non-Fungsional

| Aspek | Target |
|-------|--------|
| **Performa** | Maksimal delay/latensi ke klien: < 5 detik dari sumber |
| **Skalabilitas** | Mendukung **200–500 klien simultan** pada hardware 16 core / 12GB RAM (lihat section 15) |
| **Availability** | Auto-reconnect ke sumber jika terputus, tanpa restart manual |
| **Efisiensi Bandwidth** | Hanya 1 stream keluar ke internet, berapapun jumlah klien lokal |
| **Kompatibilitas** | Klien: Chrome, Firefox, Edge, Safari (iOS & Android) |
| **Keamanan** | Akses hanya dari IP range jaringan lokal (whitelist via config/firewall) |

---

## 8. Tech Stack

| Layer | Teknologi |
|-------|-----------|
| Server Language | PHP 8.x |
| Web Server | Apache 2.4 / Nginx |
| HTTP Client | cURL (PHP extension) |
| Frontend Player | HTML5 `<video>` + [HLS.js](https://github.com/video-dev/hls.js/) |
| OS | Linux (Ubuntu 22.04 / CentOS 9) |
| Opsional Cache | tmpfs / RAM disk untuk buffer segmen HLS |

---

## 9. Struktur Direktori Project

```
iptv-server/
├── index.html              # Halaman player untuk klien
├── proxy_stream.php        # Core: proxy & relay stream
├── ping.php                # Heartbeat endpoint dari klien
├── config.php              # Konfigurasi dasar (credentials, timeout, path)
├── config_writer.php       # Tulis ulang channel.json dari admin
├── channel.json            # Data channel aktif: nama + link stream (writable)
├── logger.php              # Modul logging
├── session_tracker.php     # Manajemen sesi viewer aktif
├── admin/
│   ├── index.php           # Dashboard monitoring utama
│   ├── channel.php         # Channel Manager: ganti nama & link stream
│   ├── login.php           # Halaman login admin
│   ├── logout.php          # Proses logout
│   ├── api.php             # Endpoint JSON untuk AJAX dashboard + channel
│   └── assets/
│       ├── admin.css       # Styling panel admin
│       └── admin.js        # Logic auto-refresh, chart, form channel
├── cache/                  # Buffer segmen HLS sementara
│   └── .gitkeep
├── sessions/               # File sesi viewer aktif
│   └── .gitkeep
├── logs/                   # Log akses klien
│   └── .gitkeep
└── README.md               # Dokumentasi instalasi
```

---

## 10. Alur Penggunaan (User Journey)

```
Admin - Setup:
  1. Install PHP + Apache/Nginx di server lokal
  2. Upload file project ke /var/www/html/iptv/
  3. Edit config.php → isi IPTV_SOURCE_URL + ADMIN_USER + ADMIN_PASS
  4. Beri permission write pada folder: sessions/, logs/, cache/
  5. Bagikan URL player ke klien: http://192.168.x.x/iptv/

Admin - Monitoring:
  1. Buka browser → http://192.168.x.x/iptv/admin/
  2. Login dengan username & password
  3. Dashboard tampil → lihat berapa viewer aktif saat ini
  4. Pantau tabel IP viewer, durasi nonton, status stream
  5. Data auto-refresh setiap 10 detik

Client:
  1. Buka browser
  2. Ketik URL: http://192.168.x.x/iptv/
  3. Halaman terbuka → video langsung play otomatis
  4. Browser kirim heartbeat ping setiap 10 detik ke server
  5. Selesai — tidak ada langkah lain
```

---

## 11. Risiko & Mitigasi

| Risiko | Dampak | Mitigasi |
|--------|--------|----------|
| Sumber IPTV eksternal down | Stream terputus untuk semua klien | Auto-reconnect + tampilkan pesan error di player |
| Bandwidth server ke internet terbatas | Buffering / lag | Pastikan koneksi server ke ISP cukup untuk 1 stream HD (min. 5 Mbps) |
| Banyak klien simultan → beban CPU tinggi | Server lambat | Gunakan `fpassthru` tanpa processing; optimalkan chunk size |
| Akses tidak sah dari luar jaringan | Penyalahgunaan bandwidth | Whitelist IP lokal di `.htaccess` atau firewall |
| Source URL berubah/kadaluarsa | Stream berhenti | Admin update `config.php`; tambah notif error di player |

---

## 12. Milestone & Timeline

| Fase | Deliverable | Estimasi |
|------|-------------|----------|
| **Fase 1** | Setup & core proxy stream (1 channel, 1 klien) | 2 hari |
| **Fase 2** | Multi-klien simultan + reconnect logic | 1 hari |
| **Fase 3** | Web player (HLS.js, auto-play, responsif) | 1 hari |
| **Fase 4** | Session tracker + heartbeat ping system | 1 hari |
| **Fase 5** | Admin panel: login, dashboard, API endpoint | 2 hari |
| **Fase 6** | Logging + whitelist IP + README | 1 hari |
| **Testing** | Uji beban 10-20 klien simultan + verifikasi monitor | 1 hari |
| **v1.0 Release** | Deploy ke server produksi | 1 hari |

**Total estimasi:** ~10 hari kerja

---

## 13. Kriteria Penerimaan (Acceptance Criteria)

- [ ] Server dapat mengambil stream dari URL sumber IPTV eksternal
- [ ] Minimal 10 klien simultan dapat menonton tanpa buffering berlebihan
- [ ] Hanya **1 koneksi keluar** ke server IPTV sumber (diverifikasi via `netstat`)
- [ ] Klien buka URL di browser → video mulai dalam < 10 detik
- [ ] Jika sumber terputus, server mencoba reconnect otomatis
- [ ] Log akses tersimpan di `logs/access.log`
- [ ] Admin dapat login ke panel di `/admin/` dengan username & password
- [ ] Dashboard admin menampilkan **jumlah viewer aktif secara real-time**
- [ ] Tabel viewer menampilkan: IP, waktu mulai, durasi, device
- [ ] Data dashboard auto-refresh setiap 10 detik tanpa reload halaman
- [ ] Status stream (online/offline) tampil di dashboard admin
- [ ] Admin dapat **mengganti nama channel** dari halaman Channel Manager
- [ ] Admin dapat **mengganti link stream URL** dari halaman Channel Manager
- [ ] Tombol **Test Koneksi** berhasil mengecek URL sebelum disimpan
- [ ] Setelah link diganti, klien baru langsung pakai link baru
- [ ] Viewer aktif menerima notifikasi overlay saat admin ganti channel
- [ ] **Riwayat 5 link** terakhir tersimpan dan bisa di-rollback
- [ ] Berjalan di PHP 8.x + Apache/Nginx tanpa dependensi eksternal tambahan

---

## 14. Rencana v2.0 (Future)

- Support **multi-channel** (parsing playlist `.m3u`) dengan pilihan channel di player
- **Panel admin v2**: ganti source URL langsung dari UI tanpa edit file
- **Grafik historis** jumlah viewer per hari/minggu/bulan
- **Kick viewer**: admin bisa memutus koneksi user tertentu dari dashboard
- Autentikasi klien via **token URL** (hanya user dengan token bisa menonton)
- Transcode menggunakan **FFmpeg** (opsional, untuk konversi format/kualitas)
- Docker container untuk kemudahan deployment

---

## 15. Analisis Kapasitas Hardware

### Spesifikasi Server

| Komponen | Spesifikasi |
|----------|-------------|
| CPU | 16 Core |
| RAM | 12 GB |
| Web Server | Nginx (direkomendasikan) atau Apache |
| PHP | PHP-FPM 8.x |

---

### Mengapa PHP Proxy Sangat Ringan?

Sistem ini **tidak melakukan transcode atau proses video** — PHP hanya bertugas sebagai pipa data:

```
Sumber IPTV → [baca buffer] → [tulis ke socket klien] → selesai
```

Tidak ada kompresi, tidak ada konversi format, tidak ada rendering. Beban CPU sangat minimal. Yang bekerja keras justru **jaringan lokal (LAN)**, bukan CPU/RAM server.

---

### Estimasi Kapasitas User Simultan

#### Asumsi Stream

| Parameter | Nilai |
|-----------|-------|
| Kualitas stream | HD 720p |
| Bitrate sumber | ~2–4 Mbps per stream |
| Bandwidth LAN server | 1 Gbps (standar ethernet) |

#### Batas per Faktor

| Faktor Pembatas | Kapasitas Estimasi | Keterangan |
|-----------------|-------------------|------------|
| **CPU (16 core)** | **500–1.000+ user** | Proxy tanpa transcode sangat ringan; 1 worker PHP hanya butuh ~1–3% CPU per klien |
| **RAM (12 GB)** | **400–800 user** | Setiap proses PHP-FPM ~5–15 MB; dengan 300 worker = ~3 GB RAM; sisanya untuk OS + buffer |
| **Bandwidth LAN 1 Gbps** | **250–500 user** | Stream HD 2 Mbps × 500 user = 1 Gbps — ini batas realistis paling ketat |
| **Bandwidth LAN 100 Mbps** | **25–50 user** | Jika LAN internal hanya 100 Mbps, ini jadi bottleneck utama |

#### Kesimpulan Kapasitas

| Kondisi LAN | Estimasi User Aman | Catatan |
|-------------|-------------------|---------|
| LAN 1 Gbps | **300–500 user** | Sweet spot; CPU & RAM masih punya headroom |
| LAN 100 Mbps | **30–50 user** | Bottleneck di jaringan, bukan server |
| LAN 10 Gbps | **800–1.000+ user** | CPU/RAM jadi pembatas, pertimbangkan Nginx + goroutine |

> **Rekomendasi praktis:** Dengan spek 16 core / 12GB RAM dan LAN 1 Gbps, server ini **mampu melayani 300–500 user simultan** dengan aman menggunakan PHP-FPM + Nginx.

---

### Konfigurasi yang Direkomendasikan

#### Nginx (`nginx.conf`)

```nginx
worker_processes        16;           # sesuai jumlah core
worker_connections      2048;
keepalive_timeout       65;
sendfile                on;
tcp_nopush              on;
```

#### PHP-FPM (`www.conf`)

```ini
pm                      = dynamic
pm.max_children         = 400         # maks proses PHP simultan
pm.start_servers        = 50
pm.min_spare_servers    = 20
pm.max_spare_servers    = 100
pm.max_requests         = 500         # restart worker setelah N request (cegah memory leak)
```

#### OS Tuning (`/etc/sysctl.conf`)

```bash
net.core.somaxconn       = 65535
net.ipv4.tcp_max_syn_backlog = 65535
fs.file-max              = 500000     # max file descriptor (penting untuk banyak koneksi)
```

---

### Perbandingan Beban vs Kapasitas

| Jumlah User | CPU Usage | RAM Usage | Bandwidth LAN | Status |
|-------------|-----------|-----------|---------------|--------|
| 50 user | ~5% | ~1 GB | ~100 Mbps | 🟢 Sangat Ringan |
| 100 user | ~10% | ~2 GB | ~200 Mbps | 🟢 Ringan |
| 200 user | ~20% | ~4 GB | ~400 Mbps | 🟢 Normal |
| 300 user | ~30% | ~6 GB | ~600 Mbps | 🟡 Optimal |
| 500 user | ~50% | ~9 GB | ~1 Gbps | 🟡 Batas Aman |
| 700 user | ~70% | ~11 GB | >1 Gbps ❌ | 🔴 LAN Penuh |

> Angka di atas adalah estimasi untuk stream HD 2 Mbps. Jika sumber stream SD (500 Kbps–1 Mbps), kapasitas user bisa 2–4x lebih banyak.

---

### Rekomendasi Tambahan untuk Skalabilitas

- **Gunakan Nginx** (bukan Apache) — jauh lebih efisien untuk koneksi simultan banyak
- **PHP-FPM** dengan `pm = dynamic` dan `max_children = 400`
- **Aktifkan `output_buffering = Off`** di `php.ini` agar chunked transfer berjalan optimal
- **Mount `sessions/` dan `cache/` ke tmpfs (RAM disk)** untuk I/O lebih cepat:
  ```bash
  tmpfs /var/www/html/iptv/sessions tmpfs defaults,size=256M 0 0
  ```
- Monitor real-time dengan `htop`, `nethogs`, dan `ss -s` untuk pantau koneksi aktif

---

*Dokumen ini dibuat sebagai dasar pengembangan sistem Live IPTV Proxy Server v1.0*
