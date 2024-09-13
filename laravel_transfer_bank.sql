-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 13 Sep 2024 pada 01.28
-- Versi server: 8.0.30
-- Versi PHP: 8.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_transfer_bank`
--
CREATE DATABASE IF NOT EXISTS `laravel_transfer_bank` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `laravel_transfer_bank`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `nama_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_bank` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `banks`
--

INSERT INTO `banks` (`id`, `nama_bank`, `kode_bank`, `created_at`, `updated_at`) VALUES
(1, 'Bank Central Asia', 'BCA', '2024-09-12 15:36:57', '2024-09-12 15:36:57'),
(2, 'Bank Nasional Indonesia', 'BNI', '2024-09-12 15:37:35', '2024-09-12 15:37:35'),
(3, 'Bank Rakyat Indonesia', 'BRI', '2024-09-12 15:38:45', '2024-09-12 15:38:45'),
(4, 'Bank Mandiri', 'MANDIRI', '2024-09-12 15:39:06', '2024-09-12 15:39:06'),
(5, 'CIMB Niaga', 'CIMB', '2024-09-13 01:07:51', '2024-09-13 01:07:53'),
(6, 'Bank Permata', 'PERMATA', '2024-09-13 01:08:25', '2024-09-13 01:08:23'),
(7, 'Bank Danamon', 'DANAMON', '2024-09-13 01:08:59', '2024-09-13 01:08:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_09_12_190417_create_personal_access_tokens_table', 1),
(26, '2024_09_12_212447_create_banks_table', 2),
(27, '2024_09_12_212651_create_rekening_admins_table', 2),
(28, '2024_09_12_213240_create_transaksi_transfers_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening_admins`
--

CREATE TABLE `rekening_admins` (
  `id` bigint UNSIGNED NOT NULL,
  `bank_id` bigint UNSIGNED NOT NULL,
  `nomor_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pemilik_rekening` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rekening_admins`
--

INSERT INTO `rekening_admins` (`id`, `bank_id`, `nomor_rekening`, `pemilik_rekening`, `created_at`, `updated_at`) VALUES
(1, 1, '7001983749', 'PT BosCOD Indonesia', '2024-09-13 01:11:01', '2024-09-13 01:11:04'),
(2, 2, '12700283733', 'PT BosCOD Indonesia', '2024-09-13 01:10:18', '2024-09-13 01:10:21'),
(3, 3, '0882982344', 'PT BosCOD Indonesia', '2024-09-13 01:11:47', '2024-09-13 01:11:49'),
(4, 4, '0064287592', 'PT BosCOD Indonesia', '2024-09-13 01:15:20', '2024-09-13 01:15:23'),
(5, 5, '7458333490', 'PT BosCOD Indonesia', '2024-09-13 01:16:07', '2024-09-13 01:16:04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_transfers`
--

CREATE TABLE `transaksi_transfers` (
  `id` bigint UNSIGNED NOT NULL,
  `id_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `bank_pengirim_id` bigint UNSIGNED NOT NULL,
  `bank_tujuan_id` bigint UNSIGNED NOT NULL,
  `rekening_tujuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `atas_nama_tujuan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai_transfer` decimal(15,2) NOT NULL,
  `kode_unik` int NOT NULL,
  `biaya_admin` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_transfer` decimal(15,2) NOT NULL,
  `rekening_perantara` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_perantara_id` bigint UNSIGNED NOT NULL,
  `berlaku_hingga` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `transaksi_transfers`
--

INSERT INTO `transaksi_transfers` (`id`, `id_transaksi`, `user_id`, `bank_pengirim_id`, `bank_tujuan_id`, `rekening_tujuan`, `atas_nama_tujuan`, `nilai_transfer`, `kode_unik`, `biaya_admin`, `total_transfer`, `rekening_perantara`, `bank_perantara_id`, `berlaku_hingga`, `created_at`, `updated_at`) VALUES
(1, 'TF24091200001', 2, 2, 1, '60184819383', 'Fulan', 50000.00, 984, 0.00, 50984.00, '1234567890', 2, '2024-09-13 23:17:18', '2024-09-12 16:17:18', '2024-09-12 16:17:18'),
(2, 'TF24091200002', 2, 2, 1, '60184819383', 'Fulan', 100000.00, 938, 0.00, 100938.00, '1234567890', 2, '2024-09-13 23:19:05', '2024-09-12 16:19:05', '2024-09-12 16:19:05'),
(3, 'TF24091200003', 2, 2, 2, '60184819383', 'Fulan', 100000.00, 274, 0.00, 100274.00, '1234567890', 2, '2024-09-13 23:20:21', '2024-09-12 16:20:21', '2024-09-12 16:20:21'),
(4, 'TF24091300004', 1, 2, 2, '60184817183', 'Zulmi', 50000.00, 880, 0.00, 50880.00, '1234567890', 2, '2024-09-14 07:54:53', '2024-09-13 00:54:53', '2024-09-13 00:54:53'),
(5, 'TF24091300005', 1, 2, 2, '60984817183', 'John', 200000.00, 891, 0.00, 200891.00, '1234567890', 2, '2024-09-14 07:56:43', '2024-09-13 00:56:43', '2024-09-13 00:56:43'),
(6, 'TF24091300006', 1, 2, 2, '60984817183', 'John', 200000.00, 832, 0.00, 200832.00, '12700283733', 2, '2024-09-14 08:21:39', '2024-09-13 01:21:39', '2024-09-13 01:21:39'),
(7, 'TF24091300007', 1, 1, 3, '60984817183', 'John', 200000.00, 676, 0.00, 200676.00, '7001983749', 1, '2024-09-14 08:21:55', '2024-09-13 01:21:55', '2024-09-13 01:21:55'),
(8, 'TF24091300008', 1, 1, 4, '60984817183', 'John', 200000.00, 184, 0.00, 200184.00, '7001983749', 1, '2024-09-14 08:24:09', '2024-09-13 01:24:09', '2024-09-13 01:24:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', NULL, '$2y$12$Ix0lfs9sh0ZlMjqhrSp1Euq47Gt28otzAeL3xtzigTPUV3sQ75G.6', NULL, '2024-09-12 12:22:42', '2024-09-12 12:22:42'),
(2, 'BosCOD', 'user@boscod.com', NULL, '$2y$12$OyL2WzuSFohhIkGBi24KQ.BTlKzeIwH4LMSedUrlXyIhMSaUHZ3ma', NULL, '2024-09-12 12:32:10', '2024-09-12 12:32:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `rekening_admins`
--
ALTER TABLE `rekening_admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rekening_admins_bank_id_foreign` (`bank_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `transaksi_transfers`
--
ALTER TABLE `transaksi_transfers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaksi_transfers_id_transaksi_unique` (`id_transaksi`),
  ADD KEY `transaksi_transfers_user_id_foreign` (`user_id`),
  ADD KEY `transaksi_transfers_bank_pengirim_id_foreign` (`bank_pengirim_id`),
  ADD KEY `transaksi_transfers_bank_tujuan_id_foreign` (`bank_tujuan_id`),
  ADD KEY `transaksi_transfers_bank_perantara_id_foreign` (`bank_perantara_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rekening_admins`
--
ALTER TABLE `rekening_admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi_transfers`
--
ALTER TABLE `transaksi_transfers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `rekening_admins`
--
ALTER TABLE `rekening_admins`
  ADD CONSTRAINT `rekening_admins_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_transfers`
--
ALTER TABLE `transaksi_transfers`
  ADD CONSTRAINT `transaksi_transfers_bank_pengirim_id_foreign` FOREIGN KEY (`bank_pengirim_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `transaksi_transfers_bank_perantara_id_foreign` FOREIGN KEY (`bank_perantara_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `transaksi_transfers_bank_tujuan_id_foreign` FOREIGN KEY (`bank_tujuan_id`) REFERENCES `banks` (`id`),
  ADD CONSTRAINT `transaksi_transfers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
