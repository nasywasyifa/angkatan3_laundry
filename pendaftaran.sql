-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2024 at 09:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pendaftaran`
--

-- --------------------------------------------------------

--
-- Table structure for table `gelombang`
--

CREATE TABLE `gelombang` (
  `id` int(50) NOT NULL,
  `nama_gelombang` varchar(50) NOT NULL,
  `aktif` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gelombang`
--

INSERT INTO `gelombang` (`id`, `nama_gelombang`, `aktif`, `created_at`, `update_at`) VALUES
(7, '', 0, '2024-11-13 04:26:38', '2024-11-13 04:26:38'),
(8, '', 0, '2024-11-13 04:27:18', '2024-11-13 04:27:18'),
(9, 'Gelombang 1', 0, '2024-11-13 04:27:25', '2024-11-13 04:27:25'),
(10, 'Gelombang 1', 0, '2024-11-13 04:28:14', '2024-11-13 04:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `id` int(11) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id`, `nama_jurusan`, `created_at`, `updated_at`) VALUES
(10, 'Tata Rias', '2024-11-13 04:48:40', '2024-11-13 04:48:40'),
(11, 'Operator Komputer', '2024-11-13 04:48:40', '2024-11-13 04:48:40'),
(12, 'Tata Graha', '2024-11-13 04:48:40', '2024-11-13 04:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` int(50) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `nama_level`, `created_at`, `updated_at`) VALUES
(6, 'User', '2024-11-13 03:12:19', '2024-11-13 03:12:19'),
(7, 'Admin', '2024-11-13 03:39:17', '2024-11-13 03:39:17'),
(8, 'PIC', '2024-11-13 03:39:40', '2024-11-13 03:39:40'),
(9, 'PIC2', '2024-11-13 03:41:06', '2024-11-13 03:41:06'),
(10, 'PIC Design Grafis', '2024-11-13 03:42:04', '2024-11-13 03:42:04'),
(11, 'PIC Design Grafis', '2024-11-13 03:42:32', '2024-11-13 03:42:32'),
(12, 'PIC Tata Boga', '2024-11-13 03:43:45', '2024-11-13 03:43:45');

-- --------------------------------------------------------

--
-- Table structure for table `peserta_pelatihan`
--

CREATE TABLE `peserta_pelatihan` (
  `id` int(50) NOT NULL,
  `id_jurusan` int(50) NOT NULL,
  `id_gelombang` int(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `kartu_keluarga` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `pendidikan_terakhir` varchar(50) NOT NULL,
  `nama_sekolah` varchar(50) NOT NULL,
  `kejuruan` varchar(50) NOT NULL,
  `nomor_hp` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `aktivitas_saat_ini` varchar(50) NOT NULL,
  `status` tinyint(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta_pelatihan`
--

INSERT INTO `peserta_pelatihan` (`id`, `id_jurusan`, `id_gelombang`, `nama_lengkap`, `nik`, `kartu_keluarga`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `pendidikan_terakhir`, `nama_sekolah`, `kejuruan`, `nomor_hp`, `email`, `aktivitas_saat_ini`, `status`, `created_at`, `update_at`) VALUES
(2, 0, 0, 'Hanifah', '123', '1234', 'Laki-laki', 'tangerang', '2024-11-12', 'sma', 'smk', 'Tata Boga', '123', 'admin@gmail.com', 'Sekolah', 0, '2024-11-12 06:58:22', '2024-11-13 02:05:09'),
(4, 0, 0, 'nanas', '123', '1234', 'perempuan', 'ikn', '2024-11-30', 'smp', 'penabur', 'Web Programming', '088975451995', 'apel@gmail.com', 'Berkebun', 0, '2024-11-12 08:22:58', '2024-11-13 02:05:38'),
(5, 0, 0, 'syifa', '123', '1234', 'perempuan', 'gambir', '2024-11-23', 'sd', 'jakone', 'Content Creator', '08888888', 'semangka@gmail.com', 'Bekerja', 0, '2024-11-13 01:50:16', '2024-11-13 02:06:03'),
(6, 0, 0, 'vfdf', '123saf', 'fdre', 'perempuan', 'bogor', '2024-11-13', 'smk', 'tgwe', 'Web Programming', 'ettewt', 'nanas@gmail.com', 'aktivitas_saat_ini', 0, '2024-11-13 02:15:03', '2024-11-13 02:15:03');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(50) NOT NULL,
  `id_level` int(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `upadate_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama_lengkap`, `email`, `password`, `created_at`, `upadate_at`) VALUES
(2, 5, 'nanas', 'nanas@gmail.com', '12345678', '2024-11-13 03:13:53', '2024-11-13 03:13:53');

-- --------------------------------------------------------

--
-- Table structure for table `users_jurusan`
--

CREATE TABLE `users_jurusan` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gelombang`
--
ALTER TABLE `gelombang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta_pelatihan`
--
ALTER TABLE `peserta_pelatihan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jurusan` (`id_jurusan`),
  ADD KEY `id_jurusan_2` (`id_jurusan`,`id_gelombang`),
  ADD KEY `id_jurusan_3` (`id_jurusan`,`id_gelombang`),
  ADD KEY `id_gelombang` (`id_gelombang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_level` (`id_level`);

--
-- Indexes for table `users_jurusan`
--
ALTER TABLE `users_jurusan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gelombang`
--
ALTER TABLE `gelombang`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `peserta_pelatihan`
--
ALTER TABLE `peserta_pelatihan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_jurusan`
--
ALTER TABLE `users_jurusan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
