-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 29 Bulan Mei 2026 pada 18.21
-- Versi server: 10.11.10-MariaDB-log
-- Versi PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Basis data: `iptv`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `access_logs`
--

CREATE TABLE `access_logs` (
  `id` int(11) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `log_type` varchar(50) NOT NULL,
  `details` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `access_logs`
--

INSERT INTO `access_logs` (`id`, `ip`, `log_type`, `details`, `created_at`) VALUES
(1, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://ott.tvri.co.id/Content/HLS/Live/Channel(TVRINasional)/index.m3u8', '2026-05-29 13:38:14'),
(2, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://210.210.155.35/qwr9ew/s/s07/index1.m3u8', '2026-05-29 13:38:28'),
(3, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://210.210.155.35/session/9ec7c73c-099b-11ea-aff4-b82a72d63267/qwr9ew/s/s04/01.m3u8', '2026-05-29 13:38:30'),
(4, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: https://github.com/riotryulianto/iptv-playlists/blob/main/playlist.m3u', '2026-05-29 13:39:25'),
(5, '103.182.98.1', 'PLAYLIST_IMPORT', 'URL: https://iptv-org.github.io/iptv/countries/id.m3u | Count: 191', '2026-05-29 13:41:08'),
(6, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://202.150.161.117:8000/play/AlBahjahTV', '2026-05-29 13:41:31'),
(7, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:41:39'),
(8, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:41:59'),
(9, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:42:20'),
(10, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:42:52'),
(11, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:43:12'),
(12, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://202.150.161.117:8000/play/AlBahjahTV', '2026-05-29 13:43:23'),
(13, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:43:30'),
(14, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:43:32'),
(15, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:43:32'),
(16, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:43:50'),
(17, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:43:52'),
(18, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:44:12'),
(19, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:44:12'),
(20, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:48:07'),
(21, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:48:10'),
(22, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://103.58.160.157:8278/720-ANTV/playlist.m3u8', '2026-05-29 13:48:25'),
(23, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:48:35'),
(24, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:48:35'),
(25, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:48:54'),
(26, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:48:54'),
(27, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:14'),
(28, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:14'),
(29, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:23'),
(30, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:23'),
(31, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:24'),
(32, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:24'),
(33, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:34'),
(34, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:34'),
(35, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:43'),
(36, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:43'),
(37, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:44'),
(38, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:44'),
(39, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:53'),
(40, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:53'),
(41, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:49:54'),
(42, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:49:54'),
(43, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:03'),
(44, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:03'),
(45, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:04'),
(46, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:04'),
(47, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:06'),
(48, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:06'),
(49, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:14'),
(50, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:14'),
(51, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:24'),
(52, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:24'),
(53, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:26'),
(54, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:26'),
(55, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:34'),
(56, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:34'),
(57, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:36'),
(58, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:36'),
(59, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:44'),
(60, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:44'),
(61, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:46'),
(62, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:46'),
(63, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:54'),
(64, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:54'),
(65, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:50:56'),
(66, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:50:56'),
(67, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:03'),
(68, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:03'),
(69, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:05'),
(70, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:05'),
(71, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:13'),
(72, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:13'),
(73, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:15'),
(74, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:15'),
(75, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:23'),
(76, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:23'),
(77, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:25'),
(78, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:25'),
(79, '127.0.0.1', 'START', 'UA: Unknown', '2026-05-29 13:51:32'),
(80, '127.0.0.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:32'),
(81, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:33'),
(82, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:33'),
(83, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:35'),
(84, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:35'),
(85, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:43'),
(86, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:43'),
(87, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:45'),
(88, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:51:46'),
(89, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:53'),
(90, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:53'),
(91, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:51:57'),
(92, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:51:57'),
(93, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:03'),
(94, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:03'),
(95, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:05'),
(96, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:05'),
(97, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:13'),
(98, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:13'),
(99, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:15'),
(100, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:15'),
(101, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:23'),
(102, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:23'),
(103, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:25'),
(104, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:25'),
(105, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:33'),
(106, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:33'),
(107, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:35'),
(108, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:35'),
(109, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:43'),
(110, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:43'),
(111, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:45'),
(112, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:45'),
(113, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:53'),
(114, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:53'),
(115, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:52:55'),
(116, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:52:55'),
(117, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:03'),
(118, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:03'),
(119, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:05'),
(120, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:05'),
(121, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:13'),
(122, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:13'),
(123, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:15'),
(124, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:15'),
(125, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:23'),
(126, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:23'),
(127, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:25'),
(128, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:25'),
(129, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:33'),
(130, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:33'),
(131, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:35'),
(132, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:35'),
(133, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:43'),
(134, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:43'),
(135, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:45'),
(136, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:45'),
(137, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:53'),
(138, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:53'),
(139, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:53:55'),
(140, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:53:55'),
(141, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:02'),
(142, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:54:03'),
(143, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:05'),
(144, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:05'),
(145, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:12'),
(146, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:54:13'),
(147, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:15'),
(148, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:15'),
(149, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:22'),
(150, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:54:23'),
(151, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:25'),
(152, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:25'),
(153, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:32'),
(154, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:54:33'),
(155, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:35'),
(156, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:35'),
(157, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:35'),
(158, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:35'),
(159, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:42'),
(160, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:42'),
(161, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:44'),
(162, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:44'),
(163, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:54:52'),
(164, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:54:52'),
(165, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:02'),
(166, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:55:02'),
(167, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:04'),
(168, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:55:04'),
(169, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: https://op-group1-swiftservesd-1.dens.tv/s/s11/index.m3u8', '2026-05-29 13:55:08'),
(170, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:12'),
(171, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:13'),
(172, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:14'),
(173, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:14'),
(174, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:15'),
(175, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:28'),
(176, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:29'),
(177, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:55:36'),
(178, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:56:02'),
(179, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://103.58.160.157:8278/720-ANTV/playlist.m3u8', '2026-05-29 13:56:14'),
(180, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:56:21'),
(181, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:21'),
(182, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:56:21'),
(183, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:56:22'),
(184, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:56:24'),
(185, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:24'),
(186, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:56:41'),
(187, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:41'),
(188, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:56:43'),
(189, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:43'),
(190, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:56:44'),
(191, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:44'),
(192, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:56:51'),
(193, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:51'),
(194, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:56:52'),
(195, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:52'),
(196, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:56:54'),
(197, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:56:54'),
(198, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:00'),
(199, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:00'),
(200, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:02'),
(201, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:02'),
(202, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:57:03'),
(203, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:03'),
(204, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:10'),
(205, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:57:11'),
(206, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:11'),
(207, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:11'),
(208, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:57:13'),
(209, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:57:14'),
(210, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:20'),
(211, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:20'),
(212, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:21'),
(213, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:21'),
(214, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:57:23'),
(215, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:57:24'),
(216, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:30'),
(217, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:57:31'),
(218, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:31'),
(219, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:31'),
(220, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:57:33'),
(221, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:33'),
(222, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:40'),
(223, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:40'),
(224, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:41'),
(225, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:41'),
(226, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:57:43'),
(227, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:43'),
(228, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:50'),
(229, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:50'),
(230, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:57:51'),
(231, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:51'),
(232, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:57:53'),
(233, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:57:53'),
(234, '127.0.0.1', 'START', 'UA: Unknown', '2026-05-29 13:58:00'),
(235, '127.0.0.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:00'),
(236, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:00'),
(237, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:00'),
(238, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:01'),
(239, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:01'),
(240, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:58:03'),
(241, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:03'),
(242, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:10'),
(243, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:10'),
(244, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:11'),
(245, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:58:12'),
(246, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:58:13'),
(247, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:13'),
(248, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:20'),
(249, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:20'),
(250, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:21'),
(251, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:21'),
(252, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:58:23'),
(253, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:23'),
(254, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:30'),
(255, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:30'),
(256, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:31'),
(257, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:31'),
(258, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:58:33'),
(259, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:33'),
(260, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:40'),
(261, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:40'),
(262, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:41'),
(263, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:41'),
(264, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:58:43'),
(265, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:43'),
(266, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:50'),
(267, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:50'),
(268, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:58:52'),
(269, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:58:53'),
(270, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:58:53'),
(271, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:58:53'),
(272, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:00'),
(273, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:00'),
(274, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:01'),
(275, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:01'),
(276, '127.0.0.1', 'START', 'UA: Unknown', '2026-05-29 13:59:02'),
(277, '127.0.0.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:02'),
(278, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:59:03'),
(279, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:03'),
(280, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:10'),
(281, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:10'),
(282, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:11'),
(283, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:59:12'),
(284, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:59:12'),
(285, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:59:13'),
(286, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:59:14'),
(287, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:59:15'),
(288, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:20'),
(289, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:20'),
(290, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:21'),
(291, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:21'),
(292, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:30'),
(293, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:30'),
(294, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:31'),
(295, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:31'),
(296, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:59:35'),
(297, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:35'),
(298, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:40'),
(299, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:40'),
(300, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:42'),
(301, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:42'),
(302, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:59:44'),
(303, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:59:45'),
(304, '127.0.0.1', 'START', 'UA: Unknown', '2026-05-29 13:59:49'),
(305, '127.0.0.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:49'),
(306, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:50'),
(307, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:50'),
(308, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:51'),
(309, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:51'),
(310, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 13:59:54'),
(311, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:59:55'),
(312, '127.0.0.1', 'START', 'UA: Unknown', '2026-05-29 13:59:55'),
(313, '127.0.0.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 13:59:56'),
(314, '127.0.0.1', 'START', 'UA: Unknown', '2026-05-29 13:59:56'),
(315, '127.0.0.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:56'),
(316, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 13:59:59'),
(317, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 13:59:59'),
(318, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:01'),
(319, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:01'),
(320, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:09'),
(321, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:09'),
(322, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:10'),
(323, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:00:11'),
(324, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:19'),
(325, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:19'),
(326, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:20'),
(327, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:20'),
(328, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:29'),
(329, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:29'),
(330, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:30'),
(331, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:30'),
(332, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:39'),
(333, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:39'),
(334, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:41'),
(335, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:41'),
(336, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:49'),
(337, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:49'),
(338, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:50'),
(339, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:50'),
(340, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:00:59'),
(341, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:00:59'),
(342, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:00'),
(343, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:00'),
(344, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:09'),
(345, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:09'),
(346, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:10'),
(347, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:10'),
(348, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:19'),
(349, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:19'),
(350, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:20'),
(351, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:20'),
(352, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:29'),
(353, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:29'),
(354, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:30'),
(355, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:30'),
(356, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:39'),
(357, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:39'),
(358, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:40'),
(359, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:40'),
(360, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:49'),
(361, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:49'),
(362, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:50'),
(363, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:50'),
(364, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:01:59'),
(365, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:01:59'),
(366, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:00'),
(367, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:02:00'),
(368, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:08'),
(369, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:02:09'),
(370, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:09'),
(371, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:02:09'),
(372, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:18'),
(373, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:02:19'),
(374, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:19'),
(375, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:02:19'),
(376, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:28'),
(377, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:02:29'),
(378, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:29'),
(379, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:02:29'),
(380, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:38'),
(381, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:02:39'),
(382, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:39'),
(383, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:02:39'),
(384, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:43'),
(385, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:02:44'),
(386, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:49'),
(387, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:02:49'),
(388, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:53'),
(389, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:02:54'),
(390, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:02:59'),
(391, '103.182.98.1', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:03:00'),
(392, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:03'),
(393, '173.0.0.2', 'STOP', 'Durasi: 0m 1s', '2026-05-29 14:03:04'),
(394, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:09'),
(395, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:09'),
(396, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:13'),
(397, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:13'),
(398, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:19'),
(399, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:19'),
(400, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:23'),
(401, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:23'),
(402, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:29');
INSERT INTO `access_logs` (`id`, `ip`, `log_type`, `details`, `created_at`) VALUES
(403, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:29'),
(404, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:33'),
(405, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:33'),
(406, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:40'),
(407, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:40'),
(408, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:43'),
(409, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:43'),
(410, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:49'),
(411, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:49'),
(412, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:03:53'),
(413, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:03:53'),
(414, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:04:03'),
(415, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:04:03'),
(416, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:04:13'),
(417, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:04:13'),
(418, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:04:23'),
(419, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:04:23'),
(420, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:04:33'),
(421, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:04:33'),
(422, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:04:43'),
(423, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:04:43'),
(424, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:04:53'),
(425, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:04:53'),
(426, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:05:03'),
(427, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:05:03'),
(428, '173.0.0.2', 'START', 'UA: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-29 14:05:12'),
(429, '173.0.0.2', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:05:12'),
(430, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 14:05:54'),
(431, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:05:54'),
(432, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 14:05:54'),
(433, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:05:54'),
(434, '103.182.98.1', 'START', 'UA: Mozilla/5.0 (iPhone; CPU iPhone OS 26_4_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/148.0.7778.166 Mobile/15E148 Safari/604.1', '2026-05-29 14:05:59'),
(435, '103.182.98.1', 'STOP', 'Durasi: 0m 0s', '2026-05-29 14:05:59'),
(436, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://202.150.161.117:8000/play/AlBahjahTV', '2026-05-29 14:26:22'),
(437, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: http://103.58.160.157:8278/720-ANTV/playlist.m3u8', '2026-05-29 14:27:23'),
(438, '103.182.98.1', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: https://ott-balancer.tvri.go.id/live/eds/Nasional/hls/Nasional.m3u8', '2026-05-29 14:33:42'),
(439, '192.168.9.10', 'CHANNEL_CHANGE', 'Oleh: admin | URL baru: https://ott-balancer.tvri.go.id/live/eds/SportHD/hls/SportHD.m3u8', '2026-05-29 16:13:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password_hash`, `created_at`) VALUES
(1, 'admin', '$2y$10$FtSl0r9u/eoXKiIVkL3C8uYizNGuV1Zy4pSVr3JYI7Iz6IU624VJS', '2026-05-29 13:36:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `channels`
--

CREATE TABLE `channels` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL DEFAULT 'Default Channel',
  `stream_url` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `stream_changed` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` varchar(100) DEFAULT 'system',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `channels`
--

INSERT INTO `channels` (`id`, `channel_name`, `stream_url`, `is_active`, `stream_changed`, `updated_by`, `updated_at`, `created_at`) VALUES
(1, 'TVRI Sport (720p)', 'https://ott-balancer.tvri.go.id/live/eds/SportHD/hls/SportHD.m3u8', 1, 1, 'admin', '2026-05-29 16:13:12', '2026-05-29 13:36:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `channel_history`
--

CREATE TABLE `channel_history` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `stream_url` text NOT NULL,
  `used_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `channel_history`
--

INSERT INTO `channel_history` (`id`, `channel_name`, `stream_url`, `used_at`) VALUES
(10, 'TVRI (480p) [Geo-blocked]', 'https://op-group1-swiftservesd-1.dens.tv/s/s11/index.m3u8', '2026-05-29 13:56:14'),
(11, 'ANTV (720p)', 'http://103.58.160.157:8278/720-ANTV/playlist.m3u8', '2026-05-29 14:26:22'),
(12, 'Al-Bahjah TV (1080p)', 'http://202.150.161.117:8000/play/AlBahjahTV', '2026-05-29 14:27:23'),
(13, 'ANTV (720p)', 'http://103.58.160.157:8278/720-ANTV/playlist.m3u8', '2026-05-29 14:33:42'),
(14, 'TVRI (1080i)', 'https://ott-balancer.tvri.go.id/live/eds/Nasional/hls/Nasional.m3u8', '2026-05-29 16:13:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlist_channels`
--

CREATE TABLE `playlist_channels` (
  `id` int(11) NOT NULL,
  `channel_name` varchar(255) NOT NULL,
  `stream_url` text NOT NULL,
  `logo_url` text DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `is_online` tinyint(1) DEFAULT NULL,
  `last_checked` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `playlist_channels`
--

INSERT INTO `playlist_channels` (`id`, `channel_name`, `stream_url`, `logo_url`, `group_name`, `sort_order`, `is_online`, `last_checked`) VALUES
(129, 'Al-Bahjah TV (1080p)', 'http://202.150.161.117:8000/play/AlBahjahTV', 'https://i.imgur.com/52dlDZk.png', 'Religious', 1, NULL, NULL),
(130, 'Al-Iman TV (720p)', 'https://tv.aliman.id/aliman/live.m3u8', 'https://i.imgur.com/Qj1EFf1.png', 'Religious', 2, NULL, NULL),
(131, 'Alwafa Tarim TV (Am Media) (720p)', 'https://ammedia.siar.us/ammedia/live/playlist.m3u8', 'https://i.ibb.co/3yfMjmf/logo-3.png', 'Religious', 3, NULL, NULL),
(132, 'Angel TV Indonesia (720p)', 'https://janya-digimix.akamaized.net/vglive-sk-234616/indonesia/ngrp:angelindonesia_all/playlist.m3u8', 'https://i.imgur.com/qKLEGU7.png', 'Religious', 4, NULL, NULL),
(133, 'ANTV (720p)', 'http://103.58.160.157:8278/720-ANTV/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Antv_logo.svg/960px-Antv_logo.svg.png', 'General', 5, NULL, NULL),
(134, 'Ashiil TV (480p)', 'https://ams.juraganstreaming.com:5443/LiveApp/streams/ashiiltv2.m3u8', 'https://i.imgur.com/bTktkcr.png', 'Religious', 6, NULL, NULL),
(135, 'Astha TV (1080p) [Not 24/7]', 'https://hgmtv.com:19360/asthatv/asthatv.m3u8', 'https://asthatv.com/wp-content/uploads/2026/02/Logo-Astha.png', 'Undefined', 7, NULL, NULL),
(136, 'Astro Blitar TV (720p)', 'https://5bf7b725107e5.streamlock.net/abtv/abtv/playlist.m3u8', 'https://i.imgur.com/rORKbGw.png', 'General', 8, NULL, NULL),
(137, 'Atambua TV (720p)', 'http://122.248.43.242:1935/ATAMBUATV/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/7/72/Atambua_TV.png', 'Undefined', 9, NULL, NULL),
(138, 'AXN Asia Indonesia (1080p)', 'https://indihuy.streamized.net/atm/DASH/axn/manifest.mpd', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/AXN_logo_%282015%29.svg/960px-AXN_logo_%282015%29.svg.png', 'Movies;Series', 10, NULL, NULL),
(139, 'Bali TV (540p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/balitv/manifest.mpd', 'https://i.imgur.com/uH1Szme.png', 'Culture', 11, NULL, NULL),
(140, 'Balikpapan TV (720p)', 'https://5bf7b725107e5.streamlock.net/btv/btv/playlist.m3u8', 'https://i.imgur.com/P3whqna.png', 'General', 12, NULL, NULL),
(141, 'Bandung TV (360p)', 'http://202.150.153.254:65500/bandungtvWEBSITE.m3u8', 'https://i.postimg.cc/JzqSzcj9/200px-Logo-bdg-tv-2016.png', 'General', 13, NULL, NULL),
(142, 'Banjar TV (720p) [Not 24/7]', 'https://banjartv.siar.us/banjartv/live/playlist.m3u8', 'https://i.imgur.com/TA76a10.png', 'Undefined', 14, NULL, NULL),
(143, 'Banten TV (720p) [Not 24/7]', 'https://5bf7b725107e5.streamlock.net/bantentv/bantentv/playlist.m3u8', 'https://i.imgur.com/tbtF40p.png', 'Undefined', 15, NULL, NULL),
(144, 'Banyumas TV (720p) [Not 24/7]', 'https://5bf7b725107e5.streamlock.net/bmstv/bmstv/playlist.m3u8', 'https://i.imgur.com/snMxng5.png', 'Undefined', 16, NULL, NULL),
(145, 'Batam TV (480p) [Not 24/7]', 'http://122.248.43.242:1935/BATAMTV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/lo7YXnW.png', 'General', 17, NULL, NULL),
(146, 'BeritaSatu (1080p)', 'https://beritasatu.secureswiftcontent.com/han/beritasatu/bsatu10008r/srtoutput/manifest.m3u8', 'https://i.postimg.cc/6pycF7Vx/300px-IDTV.png', 'News', 18, NULL, NULL),
(147, 'Biznet Adventure (1080p)', 'http://livestream.biznetvideo.net/biznet_adventure/smil:adventure.smil/playlist.m3u8', 'https://i.imgur.com/ZREy4zM.png', 'Undefined', 19, NULL, NULL),
(148, 'Biznet Kids (1080p)', 'http://livestream.biznetvideo.net/biznet_kids/smil:kids.smil/index.m3u8', 'https://i.imgur.com/J5QNqJ0.png', 'Kids', 20, NULL, NULL),
(149, 'Biznet Lifestyle (1080p)', 'http://livestream.biznetvideo.net/biznet_lifestyle/smil:lifestyle.smil/index.m3u8', 'https://i.imgur.com/XqUfQKA.png', 'Lifestyle', 21, NULL, NULL),
(150, 'BN Channel (720p)', 'https://flv.intechmedia.net/live/ch112.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/BN_Channel.png/960px-BN_Channel.png', 'News', 22, NULL, NULL),
(151, 'BRTV (720p)', 'https://5bf7b725107e5.streamlock.net/brtv/brtv/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/id/1/1f/Logo_BRTV.png', 'Undefined', 23, NULL, NULL),
(152, 'BTV (1080p)', 'https://btv.secureswiftcontent.com/han/btv/btv10005r/srtoutput/manifest.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/BTV_%28Indonesia%29_logo_%282025%29.svg/960px-BTV_%28Indonesia%29_logo_%282025%29.svg.png', 'News', 24, NULL, NULL),
(153, 'Bungo TV (480p) [Not 24/7]', 'https://5bf7b725107e5.streamlock.net/bungotv/bungotv/playlist.m3u8', 'https://i.imgur.com/OrCrtDA.png', 'General', 25, NULL, NULL),
(154, 'Caruban TV (1080p)', 'https://stream.carubantv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/3/3a/CarubanTV%28Low-res%29.png', 'Undefined', 26, NULL, NULL),
(155, 'Celebes TV [Not 24/7]', 'https://ams.juraganstreaming.com:5443/LiveApp/streams/celebesmedia.m3u8', 'https://upload.wikimedia.org/wikipedia/id/8/81/Logo_Celebes_TV_2020.png', 'General', 27, NULL, NULL),
(156, 'Channel Jowo [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h77/index.m3u8', 'https://i.imgur.com/fksxiaS.png', 'Undefined', 28, NULL, NULL),
(157, 'CNBC Indonesia (720p)', 'https://live.cnbcindonesia.com/livecnbc/smil:cnbctv.smil/master.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/CNBC_Indonesia_2025.svg/960px-CNBC_Indonesia_2025.svg.png', 'Business', 29, NULL, NULL),
(158, 'DAAI TV', 'https://pull.daaiplus.com/live-DAAIPLUS/live-DAAIPLUS_HD.m3u8', 'https://i.imgur.com/YC7JCHo.png', 'Religious', 30, NULL, NULL),
(159, 'Davika TV (480p)', 'https://5bf7b725107e5.streamlock.net/davika/davika/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/id/6/60/Logo_Davika_TV.png', 'Undefined', 31, NULL, NULL),
(160, 'Dens Food Channel [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h221/index.m3u8', 'https://picture.dens.tv/wp/img/tvchannels_v1/340x160/1687501416_tvchannels_v1.jpg', 'Cooking', 32, NULL, NULL),
(161, 'Dens Life & Style [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h222/index.m3u8', 'https://picture.dens.tv/wp/img/tvchannels_v1/340x160/1687501284_tvchannels_v1.jpg', 'Lifestyle', 33, NULL, NULL),
(162, 'Dens Play [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h225/index.m3u8', 'https://picture.dens.tv/wp/img/tvchannels_v1/340x160/1687501248_tvchannels_v1.jpg', 'Lifestyle', 34, NULL, NULL),
(163, 'Dens ShowBiz [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h203/index.m3u8', 'https://picture.dens.tv/wp/img/tvchannels_v1/340x160/1687501370_tvchannels_v1.jpg', 'Entertainment', 35, NULL, NULL),
(164, 'Dhamma TV (720p) [Not 24/7]', 'https://b.webcache.maxindo.net.id/dhamma/dhamma.m3u8', 'https://dhammaweb.tv/wp-content/uploads/2018/08/cropped-dhammatv-3.png', 'Religious', 36, NULL, NULL),
(165, 'Dhoho TV (720p)', 'https://dhohotv.siar.us/dhohotv/live/playlist.m3u8', 'https://i.imgur.com/4Khyyfh.png', 'General', 37, NULL, NULL),
(166, 'DM TV Malang', 'https://e.siar.us/live/dmtv.m3u8', 'https://i.imgur.com/3iC41QX.png', 'General', 38, NULL, NULL),
(167, 'DMI TV (576i)', 'https://tvstreamcast.com/tawaftv.m3u8', 'https://static.promediateknologi.id/promedia/network/1167/desktop/images/logo.png', 'Religious', 39, NULL, NULL),
(168, 'Duta TV (360p) [Not 24/7]', 'https://dutatv.siar.us/dutatv/live/playlist.m3u8', 'https://i.imgur.com/B4JW54M.png', 'General', 40, NULL, NULL),
(169, 'Efarina TV (720p)', 'https://live.efarinatv.com/hls/bgtaufikganteng.m3u8', 'https://i.imgur.com/iYTimXh.png', 'General', 41, NULL, NULL),
(170, 'Elshinta TV', 'https://ams.juraganstreaming.com:5443/LiveApp/streams/elshintatv.m3u8', 'https://i.imgur.com/x5uoy2H.png', 'General', 42, NULL, NULL),
(171, 'Fajar TV (720p) [Not 24/7]', 'http://122.248.43.242:1935/FAJARTV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/mkuXxRK.png', 'Religious', 43, NULL, NULL),
(172, 'Ficom Channel (720p)', 'https://v3.siar.us/ficomchannel/live/playlist.m3u8', '', 'Entertainment', 44, NULL, NULL),
(173, 'FTV (民視) (720p) [Not 24/7]', 'http://seb.sason.top/ptv/ftv.php?id=ms', 'https://i.imgur.com/q8ahtbT.png', 'General', 45, NULL, NULL),
(174, 'Garuda TV (1080p)', 'https://hgmtv.com:19360/garudatvlivestreaming/garudatvlivestreaming.m3u8', 'https://i.imgur.com/sXsAcZ3.png', 'General', 46, NULL, NULL),
(175, 'GTV (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/globaltv/manifest.mpd', 'https://i.imgur.com/jjuKnYs.png', 'General', 47, NULL, NULL),
(176, 'Huma Betang TV (720p) [Not 24/7]', 'https://v3.siar.us/humabetangtv/live/playlist.m3u8', 'https://i.imgur.com/xBTqOEu.png', 'News', 48, NULL, NULL),
(177, 'I Am Channel (576p)', 'https://61146e7ab7a66.streamlock.net:8089/tes/1/chunklist.m3u8', 'https://i.imgur.com/Gg6OcGT.png', 'Religious', 49, NULL, NULL),
(178, 'IDX Channel (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/idx/manifest.mpd', 'https://i.imgur.com/xPvrcsr.png', 'Business', 50, NULL, NULL),
(179, 'Indonesiana.TV (720p)', 'https://tvstreamcast.com/indonesiana.m3u8', 'https://i.imgur.com/192wiS1.png', 'Entertainment', 51, NULL, NULL),
(180, 'Indosiar [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h235/index.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Indosiar_2015.svg/960px-Indosiar_2015.svg.png', 'General', 52, NULL, NULL),
(181, 'iNews (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/inews/manifest.mpd', 'https://i.imgur.com/M2R3lfg.png', 'News', 53, NULL, NULL),
(182, 'Izzah TV (480p)', 'https://streaming.radiosalamjambi.com/izzahtv.m3u8', 'https://i.imgur.com/my7aqLc.png', 'Religious', 54, NULL, NULL),
(183, 'Jak TV (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/JAK_TV/manifest.mpd', 'https://i.imgur.com/xyLLLOi.png', 'Undefined', 55, NULL, NULL),
(184, 'Jakarta Globe News Channel (1080p)', 'https://jktglobe.secureswiftcontent.com/han/jktglobe/jktglober/srtoutput/manifest.m3u8', 'https://i.postimg.cc/B6GFBy9C/In_Shot_20260121_203812695.png', 'News', 56, NULL, NULL),
(185, 'Jambi TV (480p) [Not 24/7]', 'https://ams.juraganstreaming.com:5443/JambiTV/streams/livestream.m3u8', 'https://static.wikia.nocookie.net/logopedia/images/1/15/Jambi_TV.png', 'General', 57, NULL, NULL),
(186, 'Jawa Pos TV (720p)', 'http://122.248.43.242:1935/JAWAPOSTVSBY/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Jawa_Pos_TV_2024.svg/960px-Jawa_Pos_TV_2024.svg.png', 'General', 58, NULL, NULL),
(187, 'Jawa Pos TV Bali (576p)', 'http://122.248.43.242:1935/JAWAPOSTVBALI/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Jawa_Pos_TV_2024.svg/960px-Jawa_Pos_TV_2024.svg.png', 'General', 59, NULL, NULL),
(188, 'Jawa Pos TV Jakarta (720p)', 'http://122.248.43.242:1935/JAWAPOSTVJKT/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Jawa_Pos_TV_2024.svg/960px-Jawa_Pos_TV_2024.svg.png', 'General', 60, NULL, NULL),
(189, 'Jawa Pos TV Madiun (720p)', 'http://122.248.43.242:1935/JAWAPOSTVMADIUN/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Jawa_Pos_TV_2024.svg/960px-Jawa_Pos_TV_2024.svg.png', 'General', 61, NULL, NULL),
(190, 'Jawa Pos TV Magelang (720p)', 'http://122.248.43.242:1935/JAWAPOSTVMAGELANG/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Jawa_Pos_TV_2024.svg/960px-Jawa_Pos_TV_2024.svg.png', 'General', 62, NULL, NULL),
(191, 'Jawa Pos TV Semarang (720p)', 'http://122.248.43.242:1935/JAWAPOSTVSEMARANG/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Jawa_Pos_TV_2024.svg/960px-Jawa_Pos_TV_2024.svg.png', 'General', 63, NULL, NULL),
(192, 'Jek TV (720p) [Not 24/7]', 'http://27.124.81.245:1935/jektv/myStream/playlist.m3u8', 'https://i.imgur.com/wh75d1f.png', 'General', 64, NULL, NULL),
(193, 'Jogja Istimewa TV (720p)', 'http://103.255.15.222:1935/tv/jitv_720p/playlist.m3u8', 'https://i.imgur.com/VEqQfTu.png', 'General', 65, NULL, NULL),
(194, 'Jogja TV (720p) [Not 24/7]', 'https://stream.jogjatv.co.id/jtvlive/stream/index.m3u8', 'https://static.wikia.nocookie.net/logopedia/images/4/40/Jogjatvnew.png', 'General', 66, NULL, NULL),
(195, 'JTV (540p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/jtv/manifest.mpd', 'https://i.imgur.com/mIDWIQk.png', 'General', 67, NULL, NULL),
(196, 'JTV Kediri', 'http://122.248.43.242:1935/JTVKEDIRI/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/mIDWIQk.png', 'General', 68, NULL, NULL),
(197, 'JTV Madiun', 'http://122.248.43.242:1935/JTVMADIUN/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/mIDWIQk.png', 'General', 69, NULL, NULL),
(198, 'JTV Malang', 'http://122.248.43.242:1935/JTVMALANG/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/mIDWIQk.png', 'General', 70, NULL, NULL),
(199, 'Kawanua TV (720p)', 'http://122.248.43.242:1935/KAWANUATV/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/5/5f/Logo_kawanua_tv.png', 'General', 71, NULL, NULL),
(200, 'Kids TV', 'http://origin5.mediacdn.ru/live/kidstv/index.m3u8', 'https://i.imgur.com/B5YiUIP.png', 'Kids', 72, NULL, NULL),
(201, 'Kilisuci TV', 'https://5bf7b725107e5.streamlock.net/kstv/kstv/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/id/e/e4/Kilisuci_TV_NEW_LOGO_2016.png', 'General', 73, NULL, NULL),
(202, 'Kompas TV [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h234/index.m3u8', 'https://i.imgur.com/bD6UHeZ.png', 'News', 74, NULL, NULL),
(203, 'KTV (720p)', 'https://flv.intechmedia.net/live/ch118.m3u8', 'https://i.imgur.com/j3wtaDc.png', 'General', 75, NULL, NULL),
(204, 'Lingkar TV', 'https://lingkartv.my.id/hls/lingkartv.m3u8', 'https://lingkartv.com/assets/img/logo-square.png', 'Music;News;Religious', 76, NULL, NULL),
(205, 'Madani TV (720p)', 'https://stream.asianastream.com/madani/madanitv.smil/playlist.m3u8', 'https://i.imgur.com/8aonQ0v.png', 'Religious', 77, NULL, NULL),
(206, 'Madu TV (576p)', 'https://re1.siar.us/madutv/hd720/playlist.m3u8', 'https://i.imgur.com/cKpgbgW.png', 'General', 78, NULL, NULL),
(207, 'Magna Channel (1080p) [Not 24/7]', 'https://edge.medcom.id/live-edge/smil:magna.smil/playlist.m3u8', 'https://i.imgur.com/tfJo0SO.png', 'General', 79, NULL, NULL),
(208, 'Matrix TV Yogyakarta (720p)', 'https://stream.matrixtv.id/hls/0/stream.m3u8', 'https://stream.matrixtv.id/logo', 'Undefined', 80, NULL, NULL),
(209, 'MBG TV (1080p)', 'https://stream.convergen.co/mbg_stream/smil:mbStream.smil/playlist.m3u8', 'https://i.imgur.com/t7GsFJN.jpeg', 'Legislative', 81, NULL, NULL),
(210, 'MDTV (1080p)', 'https://wahyu1ptv.pages.dev/MDTV-HD.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/MDTV_logo.svg/960px-MDTV_logo.svg.png', 'Undefined', 82, NULL, NULL),
(211, 'Metro TV', 'https://edge.medcom.id/live-edge/smil:metro.smil/playlist.m3u8', 'https://i.imgur.com/QnU70NI.png', 'News', 83, NULL, NULL),
(212, 'MGI TV (720p) [Geo-blocked]', 'https://tv.rodja.live/tasik/ngrp:mgitv_all/playlist.m3u8', 'https://i.imgur.com/xrNtabe.png', 'Religious', 84, NULL, NULL),
(213, 'MGS TV (720p) [Not 24/7]', 'https://cdn.gunadarma.ac.id/streams/mgstv/ingestmgstv.m3u8', 'https://i.imgur.com/MYU7dsZ.png', 'General', 85, NULL, NULL),
(214, 'MNCTV (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/mnctv/manifest.mpd', 'https://i.imgur.com/SK8pjQy.png', 'General', 86, NULL, NULL),
(215, 'Moji [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h207/index.m3u8', 'https://i.imgur.com/mM9zapJ.png', 'General', 87, NULL, NULL),
(216, 'MQTV (720p) [Not 24/7]', 'https://5bf7b725107e5.streamlock.net/mqtv/mqtv/playlist.m3u8', 'https://i.imgur.com/d8dQo6E.png', 'Religious', 88, NULL, NULL),
(217, 'MTA TV (540p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/mtatv/manifest.mpd', 'https://i.imgur.com/3kGs7k0.png', 'Religious', 89, NULL, NULL),
(218, 'Music Information Channel (720p)', 'https://mic.siar.us/mic/live/mic.m3u8', 'https://i.imgur.com/OUPGCWG.png', 'Music', 90, NULL, NULL),
(219, 'My Cinema [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h192/index.m3u8', 'https://i.imgur.com/BTmcTQO.png', 'Movies', 91, NULL, NULL),
(220, 'My Family [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h194/index.m3u8', 'https://i.imgur.com/IaCmCt9.png', 'Family', 92, NULL, NULL),
(221, 'My Kidz (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/mykids/manifest.mpd', 'https://i.imgur.com/qzZFU6d.png', 'Kids', 93, NULL, NULL),
(222, 'Nabawi TV (720p)', 'http://202.150.161.117:8000/play/NabawiTV', 'https://i.imgur.com/O8WONFB.png', 'Religious', 94, NULL, NULL),
(223, 'Nickelodeon Asia Indonesia (720p)', 'http://202.169.224.202:8800/udp/239.9.1.17:1234', 'https://i.imgur.com/E84jnP8.png', 'Kids', 95, NULL, NULL),
(224, 'Nusantara TV (1080p)', 'https://nusantaratv.siar.us/nusantaratv/live/playlist.m3u8', 'https://i.imgur.com/viun5hj.png', 'General', 96, NULL, NULL),
(225, 'Online TV Nusantara (720p) [Not 24/7]', 'https://5bf7b725107e5.streamlock.net/onlinetvnusantara/onlinetvnusantara/playlist.m3u8', 'https://i.imgur.com/E9CCIpP.jpg', 'Culture;General;Music;News', 97, NULL, NULL),
(226, 'Padang TV (720p) [Not 24/7]', 'http://122.248.43.242:1935/PADANGTV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/EL2BfxY.png', 'General', 98, NULL, NULL),
(227, 'PJTV (720p)', 'https://pjtv28uhf.siar.us/live/pjtv28uhf.m3u8', 'https://i.imgur.com/jxdLWpC.png', 'Undefined', 99, NULL, NULL),
(228, 'PKTV (480p)', 'https://streaming.id18.tunnel.my.id/hls/stream.m3u8', 'https://i.imgur.com/mldv8Sf.png', 'Undefined', 100, NULL, NULL),
(229, 'PONTV (720p)', 'http://122.248.43.242:1935/PONTV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/P5erWzm.png', 'Undefined', 101, NULL, NULL),
(230, 'Puja TV Aceh (1080p) [Not 24/7]', 'https://v6.siar.us/pujatv/live/chunks.m3u8', 'https://i.imgur.com/0TqABCL.png', 'Undefined', 102, NULL, NULL),
(231, 'Radar Lampung TV (480p)', 'https://www.streaming.radartv.co.id/hls/test.m3u8', 'https://upload.wikimedia.org/wikipedia/id/4/42/Logo_RadarTV_Lampung.png', 'Undefined', 103, NULL, NULL),
(232, 'Radar Tasikmalaya TV (720p) [Not 24/7]', 'https://v2.siar.us/radartasikmalaya/live/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Logo_Radar_Tasikmalaya_TV.png', 'Undefined', 104, NULL, NULL),
(233, 'Rajawali TV (576i)', 'http://175.158.57.130:8888/stream/channelid/412436804', 'https://i.imgur.com/dlsv1sl.png', 'Undefined', 105, NULL, NULL),
(234, 'Rakyat Bengkulu TV (720p)', 'https://flv.intechmedia.net/live/ch59.m3u8', 'https://i.imgur.com/5L2q081.png', 'Undefined', 106, NULL, NULL),
(235, 'RCTI', 'http://103.66.62.83:8000/play/a00v/index.m3u8', 'https://i.imgur.com/iLFx8ia.png', 'General', 107, NULL, NULL),
(236, 'RCTI HD (720p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/rcti/manifest.mpd', 'https://i.imgur.com/iLFx8ia.png', 'General', 108, NULL, NULL),
(237, 'RCTV (576p) [Not 24/7]', 'https://v10.siar.us/rctv/live/playlist.m3u8', 'https://i.imgur.com/CyIlt0y.png', 'Undefined', 109, NULL, NULL),
(238, 'Riau TV (1080p) [Not 24/7]', 'http://122.248.43.242:1935/RIAUTV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/1g8FtJi.png', 'Undefined', 110, NULL, NULL),
(239, 'Rinjani TV', 'https://rinjanitv.cloud/hls/tvkabel.m3u8', 'https://lombokindustries.com/assunnah/zone/img/rinjanitv.png', 'Education', 111, NULL, NULL),
(240, 'Rodja TV (720p)', 'https://rodjatv.com/rodjatv/live.m3u8', 'https://i.imgur.com/XwCeHlC.png', 'Undefined', 112, NULL, NULL),
(241, 'RRI Net (1080p)', 'https://private-streaming.rri.go.id/memfs/6f77c7b5-feb2-4935-9f89-e7e9fca0a54a_output_0.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/RRI_NET_2023.svg/960px-RRI_NET_2023.svg.png', 'Undefined', 113, NULL, NULL),
(242, 'RTM ASEAN', 'https://d25tgymtnqzu8s.cloudfront.net/event/smil:event1/chunklist_b2596000_slENG.m3u8', 'https://i.imgur.com/skAiUxg.png', 'News', 114, NULL, NULL),
(243, 'Sakti TV (720p)', 'https://saktitv.siar.us/saktitv/live/playlist.m3u8', 'https://i.imgur.com/IDNjMfQ.png', 'Undefined', 115, NULL, NULL),
(244, 'Salam TV (1080p)', 'https://salamtv.siar.us/live/salamtv.m3u8', 'https://i.imgur.com/00Ifzgo.png', 'Undefined', 116, NULL, NULL),
(245, 'Salira TV (720p)', 'https://live.salira.tv/p/3870/hybrid/play.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/6/6b/Logo_Salira_TV.png', 'Culture;Lifestyle', 117, NULL, NULL),
(246, 'Sampit TV (720p) [Not 24/7]', 'https://sampit-tv.siar.us/live/sampit-tv.m3u8', 'https://i.imgur.com/8cFJa8G.png', 'General', 118, NULL, NULL),
(247, 'Sangaji TV (720p) [Not 24/7]', 'https://cdn.gunadarma.ac.id/streams/sangajitv/ingestsangajitv.m3u8', 'https://i.imgur.com/4rTNT8F.png', 'Undefined', 119, NULL, NULL),
(248, 'SCTV [Geo-blocked]', 'https://op-group1-swiftservehd-1.dens.tv/h/h217/index.m3u8', 'https://i.imgur.com/EMmOvnQ.png', 'General', 120, NULL, NULL),
(249, 'Selaparang TV (720p)', 'https://selaparangtv.siar.us/live/selaparangtv.m3u8', 'https://upload.wikimedia.org/wikipedia/id/c/ce/Logo_Selaparang_TV.png', 'Undefined', 121, NULL, NULL),
(250, 'Semarang TV (720p)', 'http://116.254.112.74/hls/cakralive.m3u8', 'https://i.imgur.com/KFC2WSB.png', 'Undefined', 122, NULL, NULL),
(251, 'Simpang5 TV (360p) [Not 24/7]', 'http://122.248.43.242:1935/SIMPANG5TV/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/d/dc/Simpang5_TV.png', 'Undefined', 123, NULL, NULL),
(252, 'Sin Po TV (540p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/sinpotv/manifest.mpd', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Sin_Po_TV.svg/960px-Sin_Po_TV.svg.png', 'News;Sports', 124, NULL, NULL),
(253, 'Sindo News TV', 'https://cdn10jtedge.indihometv.com/atm/DASH/mncnews/manifest.mpd', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/SindoNewsTV_2023.png/960px-SindoNewsTV_2023.png', 'News', 125, NULL, NULL),
(254, 'SMTV (720p)', 'https://e.siar.us/live/smtv.m3u8', 'https://upload.wikimedia.org/wikipedia/id/6/6e/Logo_SMTV_Sumedang.png', 'Undefined', 126, NULL, NULL),
(255, 'SPOTV (720p)', 'http://primestreams.tv:826/live/mookie22/49aV7nBsK4/119515.m3u8', 'https://i.imgur.com/HaoVsm5.png', 'Sports', 127, NULL, NULL),
(256, 'SPOTV 2 (1080p)', 'http://primestreams.tv:826/live/mookie22/49aV7nBsK4/119516.m3u8', 'https://i.imgur.com/YD8fbTH.png', 'Sports', 128, NULL, NULL),
(257, 'Sriwijaya TV (576p) [Not 24/7]', 'https://sriwijayatv.siar.us/live/sriwijayatv.m3u8', 'https://upload.wikimedia.org/wikipedia/id/7/75/SriwijayaTV_2014.png', 'Undefined', 129, NULL, NULL),
(258, 'Stara TV (720p)', 'https://stream.staratv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 130, NULL, NULL),
(259, 'Stara TV Bandung (1080p)', 'https://bandung.staratv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 131, NULL, NULL),
(260, 'Stara TV Bojonegoro (720p)', 'https://bojonegoro.staratv.id/hls/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 132, NULL, NULL),
(261, 'Stara TV Cianjur (720p)', 'https://cianjur.staratv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 133, NULL, NULL),
(262, 'Stara TV Jakarta (1080p)', 'https://jakarta.staratv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 134, NULL, NULL),
(263, 'Stara TV Malang (1080p)', 'https://malang.staratv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 135, NULL, NULL),
(264, 'Stara TV Parahyangan (720p)', 'https://parahyangan.staratv.id/hls/0/stream.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/9/91/Stara_TV_Sumedang_fix.png', 'Undefined', 136, NULL, NULL),
(265, 'STV (720p) [Not 24/7]', 'http://122.248.43.242:1935/SAMARINDATV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/EIrXgT8.png', 'Undefined', 137, NULL, NULL),
(266, 'Sultra TV (720p) [Not 24/7]', 'http://122.248.43.242:1935/SULTRATV/_definst_/myStream/playlist.m3u8', 'https://i.imgur.com/cmpbNJz.png', 'Undefined', 138, NULL, NULL),
(267, 'Surabaya TV (1080p)', 'https://e.siar.us/live/surabayatv.m3u8', 'https://i.imgur.com/jlss2ll.png', 'Undefined', 139, NULL, NULL),
(268, 'Surau TV (720p)', 'https://surautv.siar.us/live/surautv.m3u8', 'https://i.imgur.com/CKoxcWL.png', 'Undefined', 140, NULL, NULL),
(269, 'TATV (720p) [Not 24/7]', 'https://v2.siar.us/tatv/live.sdp/playlist.m3u8', 'https://i.imgur.com/1f0EC7t.png', 'Undefined', 141, NULL, NULL),
(270, 'Tegar TV Lampung (480p) [Not 24/7] [Geo-blocked]', 'http://wms.klikhost.com:1935/tegartv/tegartv/playlist.m3u8', 'https://i.imgur.com/0Vp3f2J.png', 'Undefined', 142, NULL, NULL),
(271, 'Timor TV (1080p)', 'http://122.248.43.242:1935/TIMORTV/_definst_/myStream/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/8/83/Logo_Timor_TV.png', 'Undefined', 143, NULL, NULL),
(272, 'Trans7 (720p)', 'https://video.detik.com/trans7/smil:trans7.smil/index.m3u8', 'https://i.imgur.com/fAbGImS.png', 'General', 144, NULL, NULL),
(273, 'Trans TV (720p)', 'https://video.detik.com/transtv/smil:transtv.smil/index.m3u8', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/62/Trans_TV_2013.svg/960px-Trans_TV_2013.svg.png', 'General', 145, NULL, NULL),
(274, 'TV9 Nusantara (720p)', 'https://5bf7b725107e5.streamlock.net/tv9/tv9/playlist.m3u8', 'https://upload.wikimedia.org/wikipedia/id/e/ed/TV9_Nusantara.png', 'Undefined', 146, NULL, NULL),
(275, 'TV Mu (720p) [Not 24/7]', 'https://e.siar.us/live/tvmu.m3u8', 'https://upload.wikimedia.org/wikipedia/id/d/d0/TvMu.png', 'Undefined', 147, NULL, NULL),
(276, 'TV MUI (540p)', 'https://cdn10jtedge.indihometv.com/atm/DASH/muitv/manifest.mpd', 'https://i.imgur.com/vWtViyC.png', 'Undefined', 148, NULL, NULL),
(277, 'TV Tabalong (720p) [Not 24/7]', 'https://5bf7b725107e5.streamlock.net/tvtabalong/tvtabalong/playlist.m3u8', 'https://i.imgur.com/2YhDH98.png', 'Undefined', 149, NULL, NULL),
(278, 'TVKU (720p)', 'https://tvku.tv/hlsstream/hls/live.m3u8', 'https://i.imgur.com/BAklJGy.png', 'Undefined', 150, NULL, NULL),
(279, 'tvOne (576i)', 'http://202.80.222.20/cdn/iptv/Tvod/001/channel2000018/1024.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/TvOne_2023.svg/960px-TvOne_2023.svg.png', 'Undefined', 151, NULL, NULL),
(280, 'TVR Parlemen (720p) [Not 24/7]', 'http://103.18.181.69:1935/golive/livestream/playlist.m3u8', 'https://i.imgur.com/2XYpmHL.png', 'Legislative', 152, NULL, NULL),
(281, 'TVRI (1080i)', 'https://ott-balancer.tvri.go.id/live/eds/Nasional/hls/Nasional.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 153, NULL, NULL),
(282, 'TVRI (480p) [Geo-blocked]', 'https://op-group1-swiftservesd-1.dens.tv/s/s11/index.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 154, NULL, NULL),
(283, 'TVRI Aceh (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Aceh/hls/Aceh.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 155, NULL, NULL),
(284, 'TVRI Bali (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Bali/hls/Bali.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 156, NULL, NULL),
(285, 'TVRI Bangka Belitung (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Babel/hls/Babel.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 157, NULL, NULL),
(286, 'TVRI Bengkulu (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Bengkulu/hls/Bengkulu.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 158, NULL, NULL),
(287, 'TVRI Gorontalo (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Gorontalo/hls/Gorontalo.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 159, NULL, NULL),
(288, 'TVRI Jakarta (576i) [Not 24/7]', 'https://ott-balancer.tvri.go.id/live/eds/DKI/hls/DKI.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 160, NULL, NULL),
(289, 'TVRI Jambi (720p) [Not 24/7]', 'https://ott-balancer.tvri.go.id/live/eds/Jambi/hls/Jambi.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 161, NULL, NULL),
(290, 'TVRI Jawa Barat (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Jabar/hls/Jabar.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 162, NULL, NULL),
(291, 'TVRI Jawa Tengah (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Jateng/hls/Jateng.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 163, NULL, NULL),
(292, 'TVRI Jawa Timur (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Jatim/hls/Jatim.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 164, NULL, NULL),
(293, 'TVRI Kalimantan Barat (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Kalbar/hls/Kalbar.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 165, NULL, NULL),
(294, 'TVRI Kalimantan Selatan (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Kalsel/hls/Kalsel.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 166, NULL, NULL),
(295, 'TVRI Kalimantan Tengah (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Kalteng/hls/Kalteng.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 167, NULL, NULL),
(296, 'TVRI Kalimantan Timur (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Kaltim/hls/Kaltim.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 168, NULL, NULL),
(297, 'TVRI Lampung (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Lampung/hls/Lampung.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 169, NULL, NULL),
(298, 'TVRI Maluku (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Ambon/hls/Ambon.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 170, NULL, NULL),
(299, 'TVRI North Sulawesi (1080p)', 'https://ott-balancer.tvri.go.id/live/eds/Sulut/hls/Sulut.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 171, NULL, NULL),
(300, 'TVRI North Sumatra (1080p)', 'https://ott-balancer.tvri.go.id/live/eds/Sumut/hls/Sumut.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 172, NULL, NULL),
(301, 'TVRI Nusa Tenggara Barat (720p)', 'https://ott-balancer.tvri.go.id/live/eds/NTB/hls/NTB.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 173, NULL, NULL),
(302, 'TVRI Nusa Tenggara Timur (480p)', 'https://ott-balancer.tvri.go.id/live/eds/NTT/hls/NTT.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 174, NULL, NULL),
(303, 'TVRI Papua (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Papua/hls/Papua.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 175, NULL, NULL),
(304, 'TVRI Riau (720p) [Not 24/7]', 'https://ott-balancer.tvri.go.id/live/eds/Riau/hls/Riau.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 176, NULL, NULL),
(305, 'TVRI Sport (720p)', 'https://ott-balancer.tvri.go.id/live/eds/SportHD/hls/SportHD.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/TVRI_Sport_2022.svg/960px-TVRI_Sport_2022.svg.png', 'Sports', 177, NULL, NULL),
(306, 'TVRI Sulawesi Barat (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Sulbar/hls/Sulbar.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 178, NULL, NULL),
(307, 'TVRI Sulawesi Selatan (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Sulsel/hls/Sulsel.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 179, NULL, NULL),
(308, 'TVRI Sulawesi Tengah (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Sulteng/hls/Sulteng.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 180, NULL, NULL),
(309, 'TVRI Sulawesi Tenggara (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Sultra/hls/Sultra.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 181, NULL, NULL),
(310, 'TVRI Sumatera Barat (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Sumbar/hls/Sumbar.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 182, NULL, NULL),
(311, 'TVRI Sumatera Selatan (480p)', 'https://ott-balancer.tvri.go.id/live/eds/Sumsel/hls/Sumsel.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 183, NULL, NULL),
(312, 'TVRI West Papua (1080p)', 'https://ott-balancer.tvri.go.id/live/eds/Pabar/hls/Pabar.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 184, NULL, NULL),
(313, 'TVRI World (1080p)', 'https://ott-balancer.tvri.go.id/live/eds/TVRIWorld/hls/TVRIWorld.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/TVRIWorld.png/960px-TVRIWorld.png', 'Undefined', 185, NULL, NULL),
(314, 'TVRI Yogyakarta (720p)', 'https://ott-balancer.tvri.go.id/live/eds/Jogjakarta/hls/Jogjakarta.m3u8', 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/TVRILogo2019.svg/960px-TVRILogo2019.svg.png', 'General', 186, NULL, NULL),
(315, 'U Channel (720p)', 'https://ams.juraganstreaming.com:5443/LiveApp/streams/uchannel1.m3u8', 'https://i.imgur.com/qxkb0cy.png', 'Undefined', 187, NULL, NULL),
(316, 'UBTV Brawijaya (480p)', 'https://ubmedcom.siar.us/live/ubmedcom.m3u8', 'https://i.imgur.com/BQIi7ko.png', 'Undefined', 188, NULL, NULL),
(317, 'UGTV (720p)', 'https://cdn.gunadarma.ac.id/streams/ugtv/ingestugtv.m3u8', 'https://i.imgur.com/iEKDH26.png', 'Undefined', 189, NULL, NULL),
(318, 'VTV (1080p)', 'http://103.66.62.83:8000/play/a00c/index.m3u8', 'https://i.postimg.cc/cJRJr3BR/2560px-VTV-Indonesia-White-2023-svg.png', 'Kids', 190, NULL, NULL),
(319, 'Wesal TV (720p) [Not 24/7]', 'https://ams.juraganstreaming.com:5443/LiveApp/streams/wesaltv.m3u8', 'https://i.imgur.com/Uv8RWks.png', 'Undefined', 191, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `playlist_sources`
--

CREATE TABLE `playlist_sources` (
  `id` int(11) NOT NULL DEFAULT 1,
  `playlist_url` text NOT NULL,
  `imported_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `playlist_sources`
--

INSERT INTO `playlist_sources` (`id`, `playlist_url`, `imported_at`) VALUES
(1, 'https://iptv-org.github.io/iptv/countries/id.m3u', '2026-05-29 13:41:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `viewer_sessions`
--

CREATE TABLE `viewer_sessions` (
  `id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `user_agent` text DEFAULT NULL,
  `start_time` datetime DEFAULT current_timestamp(),
  `last_ping` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indeks untuk tabel yang dibuang
--

--
-- Indeks untuk tabel `access_logs`
--
ALTER TABLE `access_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indeks untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `channel_history`
--
ALTER TABLE `channel_history`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `playlist_channels`
--
ALTER TABLE `playlist_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group` (`group_name`);

--
-- Indeks untuk tabel `playlist_sources`
--
ALTER TABLE `playlist_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `viewer_sessions`
--
ALTER TABLE `viewer_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `idx_token` (`token`),
  ADD KEY `idx_last_ping` (`last_ping`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `access_logs`
--
ALTER TABLE `access_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT untuk tabel `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `channel_history`
--
ALTER TABLE `channel_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `playlist_channels`
--
ALTER TABLE `playlist_channels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=320;

--
-- AUTO_INCREMENT untuk tabel `viewer_sessions`
--
ALTER TABLE `viewer_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
