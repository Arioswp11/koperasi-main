-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Agu 2024 pada 17.23
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `mt_anggota`
--

CREATE TABLE `mt_anggota` (
  `id` int(11) NOT NULL,
  `no_anggota` varchar(10) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `nik` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_id` int(11) DEFAULT NULL,
  `jenis_kelamin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `mt_anggota`
--

INSERT INTO `mt_anggota` (`id`, `no_anggota`, `nama`, `nik`, `email`, `no_hp`, `alamat`, `status`, `created_at`, `created_by`, `updated_at`, `updated_id`, `deleted_at`, `deleted_id`, `jenis_kelamin`) VALUES
(9, '24070001', 'Arif', '202131420011', 'arifbudiarti.08@gmail.com', '081329789175', 'KETEGAN RT 03 RW 01 TAMAN', 1, '2024-07-27 22:26:53', NULL, '2024-07-27 22:26:53', NULL, NULL, NULL, 1),
(21, '24080002', 'Ario', '202131420006', 'ario@gmail.com', '085848987976', 'Jalan Tanjungsari no 42, Surabaya', 1, '2024-08-02 21:02:00', NULL, '2024-08-02 22:12:00', 11, NULL, NULL, 1),
(22, '24080003', 'Fikri', '202131420003', 'fikri@gmail.com', '082314124184', 'Jl kota baru gresik', 1, '2024-08-02 21:49:29', NULL, '2024-08-02 22:12:06', 11, NULL, NULL, 1),
(23, '24080004', 'Ali', '202131420004', 'ali@gmail.com', '0812314676312', 'Jalan Jalan', 1, '2024-08-02 21:51:28', NULL, '2024-08-02 22:12:12', 11, NULL, NULL, 1),
(24, '24080005', 'Surya', '202131420002', 'surya@gmail.com', '030147107481304', 'Jalan', 1, '2024-08-02 22:13:28', NULL, '2024-08-02 22:13:28', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mt_petugas`
--

CREATE TABLE `mt_petugas` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `tmt` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `mt_petugas`
--

INSERT INTO `mt_petugas` (`id`, `id_anggota`, `nip`, `tmt`, `status`, `created_at`, `created_by`, `updated_at`, `updated_id`, `deleted_at`, `deleted_id`) VALUES
(1, 9, 'KSP924070001', '2024-07-01 00:00:00', 1, '2024-07-30 11:00:12', 3, '2024-07-30 11:04:10', 3, NULL, NULL),
(5, 21, 'KSP2124080002', '2024-08-02 00:00:00', 1, '2024-08-02 21:47:18', 3, '2024-08-02 21:47:18', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mt_users`
--

CREATE TABLE `mt_users` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `mt_users`
--

INSERT INTO `mt_users` (`id`, `id_anggota`, `username`, `password`, `status`, `created_at`, `created_by`, `updated_at`, `updated_id`, `deleted_at`, `deleted_id`) VALUES
(3, 9, 'arif', '$2y$10$j6c6RYqNCaMfopGuVTXo5upz0jnGStfhv9kis9hlTOZqOebEEGOU.', 1, '2024-07-27 22:26:53', NULL, '2024-07-27 22:26:53', NULL, NULL, NULL),
(11, 21, 'ario', '$2y$10$7jnyX9eYrxoG8ISboIr/z.pfnWDILpfSP4mD0WWJ1Py0vqOxsqEJy', 1, '2024-08-02 21:02:00', NULL, '2024-08-02 21:02:00', NULL, NULL, NULL),
(12, 22, 'fikri', '$2y$10$ZXUiTjPh.Aa/FiNmfRfNv.9o0cBsDAcIdla/O15SaYy98x9mqaCpK', 1, '2024-08-02 21:49:29', NULL, '2024-08-02 21:49:29', NULL, NULL, NULL),
(13, 23, 'ali', '$2y$10$NrTpN/YEwELRTKjruITMA.7Omy2OYKvwspY.RVfqwH.HMbPyho.eG', 1, '2024-08-02 21:51:28', NULL, '2024-08-02 21:51:28', NULL, NULL, NULL),
(14, 24, 'surya', '$2y$10$tE0N/O0sdxNxM7BT6EYVq.OjEwQK.P7psYRxbF8GizQOkO0mCNQ2K', 1, '2024-08-02 22:13:28', NULL, '2024-08-02 22:13:28', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tc_bayar`
--

CREATE TABLE `tc_bayar` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `id_pinjam` int(11) DEFAULT NULL,
  `kredit` int(11) DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `saldo` decimal(10,0) DEFAULT NULL,
  `sisa` decimal(10,0) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_id` int(11) DEFAULT NULL,
  `tgl_pembayaran` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tc_bayar`
--

INSERT INTO `tc_bayar` (`id`, `id_anggota`, `id_pinjam`, `kredit`, `nominal`, `saldo`, `sisa`, `status`, `created_at`, `created_by`, `updated_at`, `updated_id`, `deleted_at`, `deleted_id`, `tgl_pembayaran`) VALUES
(1, 22, 5, 1, 8750, 8750, 96250, 1, '2024-08-09 20:35:33', NULL, '2024-08-09 20:35:33', NULL, NULL, NULL, '2024-08-09 00:00:00'),
(2, 22, 5, 2, 8750, 17500, 87500, 1, '2024-08-09 20:35:42', NULL, '2024-08-09 20:35:42', NULL, NULL, NULL, '2024-08-09 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tc_pinjam`
--

CREATE TABLE `tc_pinjam` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `tgl_peminjaman` datetime DEFAULT NULL,
  `kredit` int(11) DEFAULT NULL,
  `bunga` double DEFAULT NULL,
  `pokok_cicilan` decimal(10,0) DEFAULT NULL,
  `pokok_bunga` decimal(10,0) DEFAULT NULL,
  `pokok_peminjaman` decimal(10,0) DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: aktif;0:batal;2:selesai',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_id` int(11) DEFAULT NULL,
  `total_cicilan` decimal(10,0) DEFAULT NULL,
  `total_peminjaman` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tc_pinjam`
--

INSERT INTO `tc_pinjam` (`id`, `id_anggota`, `tgl_peminjaman`, `kredit`, `bunga`, `pokok_cicilan`, `pokok_bunga`, `pokok_peminjaman`, `status`, `created_at`, `created_by`, `updated_at`, `updated_id`, `deleted_at`, `deleted_id`, `total_cicilan`, `total_peminjaman`) VALUES
(4, 21, '2024-08-09 00:00:00', 12, 1, 83, 1, 1000, 1, '2024-08-09 20:34:06', 11, '2024-08-09 20:34:10', 11, NULL, NULL, 84, 1010),
(5, 22, '2024-08-09 00:00:00', 12, 5, 8333, 417, 100000, 1, '2024-08-09 20:34:28', 11, '2024-08-09 20:34:36', 11, NULL, NULL, 8750, 105000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tc_simpan`
--

CREATE TABLE `tc_simpan` (
  `id` int(11) NOT NULL,
  `id_anggota` int(11) DEFAULT NULL,
  `tgl_transaksi` datetime DEFAULT NULL,
  `nominal` decimal(10,0) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_id` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tc_simpan`
--

INSERT INTO `tc_simpan` (`id`, `id_anggota`, `tgl_transaksi`, `nominal`, `status`, `created_at`, `created_by`, `updated_at`, `updated_id`, `deleted_at`, `deleted_id`) VALUES
(6, 22, '2024-08-02 00:00:00', 100000, 99, '2024-08-02 22:54:11', 11, '2024-08-02 22:55:46', 11, '2024-08-02 22:55:46', 11),
(7, 22, '2024-07-02 00:00:00', 100000, 99, '2024-08-02 22:54:44', 11, '2024-08-02 22:56:01', 11, '2024-08-02 22:56:01', 11),
(8, 22, '2024-08-02 00:00:00', 2000000, 99, '2024-08-02 23:10:58', 11, '2024-08-03 17:04:01', 11, '2024-08-03 17:04:01', 11),
(9, 23, '2024-08-02 00:00:00', 1000000, 1, '2024-08-02 23:11:45', 11, '2024-08-02 23:11:45', 11, NULL, NULL),
(10, 24, '2024-07-02 00:00:00', 1000000, 1, '2024-08-02 23:13:36', 11, '2024-08-02 23:13:36', 11, NULL, NULL),
(11, 22, '2024-08-08 13:08:00', 1000000, 1, '2024-08-03 17:00:31', 11, '2024-08-08 13:08:49', 11, NULL, NULL),
(12, 23, '2024-08-08 13:09:00', 1000000, 1, '2024-08-08 13:09:21', 11, '2024-08-08 13:09:21', 11, NULL, NULL),
(13, 21, '2024-08-09 19:42:00', 1000000, 1, '2024-08-09 19:42:25', 11, '2024-08-09 19:42:25', 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_bayar`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_bayar` (
`id` int(11)
,`id_anggota` int(11)
,`id_pinjam` int(11)
,`kredit` int(11)
,`nominal` decimal(10,0)
,`saldo` decimal(10,0)
,`sisa` decimal(10,0)
,`status` int(11)
,`created_at` datetime
,`created_by` int(11)
,`updated_at` datetime
,`updated_id` int(11)
,`deleted_at` datetime
,`deleted_id` int(11)
,`tgl_pembayaran` datetime
,`total_peminjaman` decimal(10,0)
,`nama` varchar(255)
,`no_anggota` varchar(10)
,`email` varchar(255)
,`no_hp` varchar(15)
,`alamat` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_petugas`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_petugas` (
`id` int(11)
,`id_anggota` int(11)
,`nip` varchar(255)
,`tmt` datetime
,`status` int(11)
,`created_at` datetime
,`created_by` int(11)
,`updated_at` datetime
,`updated_id` int(11)
,`deleted_at` datetime
,`deleted_id` int(11)
,`no_anggota` varchar(10)
,`nama` varchar(255)
,`nik` varchar(255)
,`email` varchar(255)
,`alamat` varchar(255)
,`jenis_kelamin` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_pinjam`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_pinjam` (
`no_anggota` varchar(10)
,`nama` varchar(255)
,`alamat` varchar(255)
,`no_hp` varchar(15)
,`id` int(11)
,`id_anggota` int(11)
,`tgl_peminjaman` datetime
,`kredit` int(11)
,`bunga` double
,`pokok_cicilan` decimal(10,0)
,`pokok_bunga` decimal(10,0)
,`pokok_peminjaman` decimal(10,0)
,`status` int(11)
,`created_at` datetime
,`created_by` int(11)
,`updated_at` datetime
,`updated_id` int(11)
,`deleted_at` datetime
,`deleted_id` int(11)
,`total_cicilan` decimal(10,0)
,`total_peminjaman` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_simpan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_simpan` (
`id` int(11)
,`no_anggota` varchar(10)
,`nama` varchar(255)
,`alamat` varchar(255)
,`no_hp` varchar(15)
,`saldo` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `v_user`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `v_user` (
`id` int(11)
,`id_anggota` int(11)
,`username` varchar(255)
,`password` varchar(255)
,`status` int(11)
,`created_at` datetime
,`created_by` int(11)
,`updated_at` datetime
,`updated_id` int(11)
,`deleted_at` datetime
,`deleted_id` int(11)
,`nama` varchar(255)
,`no_anggota` varchar(10)
,`email` varchar(255)
,`jenis_kelamin` int(11)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `v_bayar`
--
DROP TABLE IF EXISTS `v_bayar`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_bayar`  AS SELECT `tc_bayar`.`id` AS `id`, `tc_bayar`.`id_anggota` AS `id_anggota`, `tc_bayar`.`id_pinjam` AS `id_pinjam`, `tc_bayar`.`kredit` AS `kredit`, `tc_bayar`.`nominal` AS `nominal`, `tc_bayar`.`saldo` AS `saldo`, `tc_bayar`.`sisa` AS `sisa`, `tc_bayar`.`status` AS `status`, `tc_bayar`.`created_at` AS `created_at`, `tc_bayar`.`created_by` AS `created_by`, `tc_bayar`.`updated_at` AS `updated_at`, `tc_bayar`.`updated_id` AS `updated_id`, `tc_bayar`.`deleted_at` AS `deleted_at`, `tc_bayar`.`deleted_id` AS `deleted_id`, `tc_bayar`.`tgl_pembayaran` AS `tgl_pembayaran`, `tc_pinjam`.`total_peminjaman` AS `total_peminjaman`, `mt_anggota`.`nama` AS `nama`, `mt_anggota`.`no_anggota` AS `no_anggota`, `mt_anggota`.`email` AS `email`, `mt_anggota`.`no_hp` AS `no_hp`, `mt_anggota`.`alamat` AS `alamat` FROM ((`tc_bayar` join `mt_anggota` on(`tc_bayar`.`id_anggota` = `mt_anggota`.`id`)) join `tc_pinjam` on(`tc_bayar`.`id_pinjam` = `mt_anggota`.`id`)) WHERE `tc_bayar`.`deleted_at` is null AND `mt_anggota`.`status` = 1 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_petugas`
--
DROP TABLE IF EXISTS `v_petugas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_petugas`  AS SELECT `mt_petugas`.`id` AS `id`, `mt_petugas`.`id_anggota` AS `id_anggota`, `mt_petugas`.`nip` AS `nip`, `mt_petugas`.`tmt` AS `tmt`, `mt_petugas`.`status` AS `status`, `mt_petugas`.`created_at` AS `created_at`, `mt_petugas`.`created_by` AS `created_by`, `mt_petugas`.`updated_at` AS `updated_at`, `mt_petugas`.`updated_id` AS `updated_id`, `mt_petugas`.`deleted_at` AS `deleted_at`, `mt_petugas`.`deleted_id` AS `deleted_id`, `mt_anggota`.`no_anggota` AS `no_anggota`, `mt_anggota`.`nama` AS `nama`, `mt_anggota`.`nik` AS `nik`, `mt_anggota`.`email` AS `email`, `mt_anggota`.`alamat` AS `alamat`, `mt_anggota`.`jenis_kelamin` AS `jenis_kelamin` FROM (`mt_petugas` join `mt_anggota` on(`mt_petugas`.`id_anggota` = `mt_anggota`.`id`)) WHERE `mt_petugas`.`deleted_at` is null AND `mt_petugas`.`status` = 1 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_pinjam`
--
DROP TABLE IF EXISTS `v_pinjam`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pinjam`  AS SELECT `b`.`no_anggota` AS `no_anggota`, `b`.`nama` AS `nama`, `b`.`alamat` AS `alamat`, `b`.`no_hp` AS `no_hp`, `a`.`id` AS `id`, `a`.`id_anggota` AS `id_anggota`, `a`.`tgl_peminjaman` AS `tgl_peminjaman`, `a`.`kredit` AS `kredit`, `a`.`bunga` AS `bunga`, `a`.`pokok_cicilan` AS `pokok_cicilan`, `a`.`pokok_bunga` AS `pokok_bunga`, `a`.`pokok_peminjaman` AS `pokok_peminjaman`, `a`.`status` AS `status`, `a`.`created_at` AS `created_at`, `a`.`created_by` AS `created_by`, `a`.`updated_at` AS `updated_at`, `a`.`updated_id` AS `updated_id`, `a`.`deleted_at` AS `deleted_at`, `a`.`deleted_id` AS `deleted_id`, `a`.`total_cicilan` AS `total_cicilan`, `a`.`total_peminjaman` AS `total_peminjaman` FROM (`tc_pinjam` `a` join `mt_anggota` `b` on(`a`.`id_anggota` = `b`.`id`)) ORDER BY `a`.`id` ASC ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_simpan`
--
DROP TABLE IF EXISTS `v_simpan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_simpan`  AS SELECT `b`.`id` AS `id`, `b`.`no_anggota` AS `no_anggota`, `b`.`nama` AS `nama`, `b`.`alamat` AS `alamat`, `b`.`no_hp` AS `no_hp`, sum(case when `a`.`status` = 1 and `a`.`deleted_at` is null then `a`.`nominal` else 0 end) AS `saldo` FROM (`tc_simpan` `a` join `mt_anggota` `b` on(`a`.`id_anggota` = `b`.`id`)) GROUP BY `b`.`id`, `b`.`nama`, `b`.`alamat`, `b`.`no_hp` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `v_user`
--
DROP TABLE IF EXISTS `v_user`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_user`  AS SELECT `mt_users`.`id` AS `id`, `mt_users`.`id_anggota` AS `id_anggota`, `mt_users`.`username` AS `username`, `mt_users`.`password` AS `password`, `mt_users`.`status` AS `status`, `mt_users`.`created_at` AS `created_at`, `mt_users`.`created_by` AS `created_by`, `mt_users`.`updated_at` AS `updated_at`, `mt_users`.`updated_id` AS `updated_id`, `mt_users`.`deleted_at` AS `deleted_at`, `mt_users`.`deleted_id` AS `deleted_id`, `mt_anggota`.`nama` AS `nama`, `mt_anggota`.`no_anggota` AS `no_anggota`, `mt_anggota`.`email` AS `email`, `mt_anggota`.`jenis_kelamin` AS `jenis_kelamin` FROM (`mt_users` join `mt_anggota` on(`mt_users`.`id_anggota` = `mt_anggota`.`id`)) WHERE `mt_users`.`deleted_at` is null AND `mt_users`.`status` = 1 ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `mt_anggota`
--
ALTER TABLE `mt_anggota`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `no_anggota` (`no_anggota`) USING BTREE;

--
-- Indeks untuk tabel `mt_petugas`
--
ALTER TABLE `mt_petugas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_anggota` (`id_anggota`) USING BTREE;

--
-- Indeks untuk tabel `mt_users`
--
ALTER TABLE `mt_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `id_anggota` (`id_anggota`) USING BTREE;

--
-- Indeks untuk tabel `tc_bayar`
--
ALTER TABLE `tc_bayar`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `tc_pinjam`
--
ALTER TABLE `tc_pinjam`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `tc_simpan`
--
ALTER TABLE `tc_simpan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `mt_anggota`
--
ALTER TABLE `mt_anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `mt_petugas`
--
ALTER TABLE `mt_petugas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `mt_users`
--
ALTER TABLE `mt_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tc_bayar`
--
ALTER TABLE `tc_bayar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tc_pinjam`
--
ALTER TABLE `tc_pinjam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tc_simpan`
--
ALTER TABLE `tc_simpan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `mt_petugas`
--
ALTER TABLE `mt_petugas`
  ADD CONSTRAINT `mt_petugas_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `mt_anggota` (`id`);

--
-- Ketidakleluasaan untuk tabel `mt_users`
--
ALTER TABLE `mt_users`
  ADD CONSTRAINT `mt_users_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `mt_anggota` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
