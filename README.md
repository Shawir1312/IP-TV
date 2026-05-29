# S.NET TV (IP-TV Player & Management)

Platform streaming IP-TV dan panel manajemen berbasis web. Aplikasi ini memungkinkan administrator untuk mengelola channel IPTV, mengatur sumber stream melalui proxy bawaan, dan memberikan pengalaman menonton yang lancar melalui web player bagi pengguna.

## Fitur Utama

- **Web Player**: Pemutar video bawaan yang menggunakan `hls.js` dan `mpegts.js` untuk pemutaran stream HLS (`.m3u8`) dan format mentah MPEG-TS dengan stabil.
- **Admin Panel**: Kelola channel yang aktif, ganti stream secara *real-time*, dan atur pengaturan sistem.
- **Pembaruan Real-Time**: Player mendeteksi secara otomatis saat admin mengganti channel yang sedang aktif dan akan memuat ulang stream tanpa perlu *refresh* manual dari sisi pengguna.
- **Pelacakan Sesi (Session Tracking)**: Sistem *heartbeat* (ping) bawaan untuk melacak sesi penonton yang sedang aktif.
- **Stream Proxy**: Termasuk proxy stream berbasis PHP (`proxy_stream.php`) untuk melewati batasan CORS dan menyembunyikan URL asli dari stream.
- **M3U Parser**: Utilitas untuk membaca/parsing *playlist* M3U dan memvalidasi stream IP/TS.

## Struktur Direktori

- `admin/` - Panel kontrol admin dan endpoint API.
- `index.html` - Antarmuka pemutar web utama untuk pengguna akhir.
- `config.php` - Konfigurasi database dan aplikasi.
- `proxy_stream.php` - Menangani pengiriman data video (streaming) ke klien.
- `session_tracker.php` & `ping.php` - Manajemen pelacakan sesi penonton.

## Panduan Instalasi

1. **Persiapan Database**:
   - Buat database baru di MySQL/MariaDB.
   - *Import* file `iptv.sql` yang tersedia ke dalam database tersebut.
   
2. **Konfigurasi Sistem**:
   - Buka file `config.php` dan sesuaikan kredensial database (username, password, nama database).
   
3. **Persiapan Web Server**:
   - Letakkan seluruh file proyek di folder *root* web server Anda (misal: `/www/wwwroot/iptv.shawir.id/` atau pada panel hosting).
   - Pastikan server Anda menggunakan PHP dan mendukung akses database MySQL/MariaDB.
   
4. **Selesai**:
   - Akses web player melalui URL utama domain Anda.
   - Akses panel admin pada `/admin/` untuk mulai mengelola channel.

---
*Dikembangkan untuk Shawir ID.*
