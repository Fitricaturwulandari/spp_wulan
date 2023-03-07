-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2023 at 01:46 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp3`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_siswa` ()  NO SQL
BEGIN
	SELECT `tbl_siswa`.*, `tbl_kelas`.`nama_kelas`, `tbl_spp`.`tahun`
                FROM `tbl_siswa` JOIN `tbl_kelas`
                ON `tbl_siswa`.`id_kelas` = `tbl_kelas`.`id_kelas`
                JOIN `tbl_spp` ON `tbl_siswa` .`id_spp` = `tbl_spp`.`id_spp` ORDER BY `tbl_siswa`.`NISN`, `tbl_siswa`.`id_kelas` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kelas_get` ()  NO SQL
BEGIN
	SELECT `tbl_kelas`.*, `tbl_jurusan`.`jurusan` FROM `tbl_kelas` JOIN `tbl_jurusan` ON `tbl_kelas`.`id_jurusan` = `tbl_jurusan`.`id_jurusan` ORDER BY `tbl_kelas`.`id_jurusan` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `level_get` (IN `level` INT)  NO SQL
BEGIN
	SELECT * FROM tbl_level WHERE level = id_level;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_check` (IN `user` VARCHAR(100), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_petugas WHERE user = username AND pass = password_petugas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `siswa_check` (IN `user` VARCHAR(10), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_siswa WHERE user = nisn AND pass = nis;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `ID_JURUSAN` int(11) NOT NULL,
  `JURUSAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`ID_JURUSAN`, `JURUSAN`) VALUES
(1, 'Rekayasa Perangkat Lunak'),
(2, 'Teknik  Komputer  Dan Jaringan '),
(3, 'Teknik Kendaraan Ringan'),
(4, 'Multimedia'),
(5, 'Agribisnis Pangan Dan Holtikultura'),
(6, 'Teknik Bisnis Sepeda Motor'),
(16, 'Peternakan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `ID_KELAS` int(11) NOT NULL,
  `ID_JURUSAN` int(11) DEFAULT NULL,
  `NAMA_KELAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`ID_KELAS`, `ID_JURUSAN`, `NAMA_KELAS`) VALUES
(1, 1, 'XII RPL 1'),
(2, 2, 'XII TKJ 1'),
(6, 4, 'XII MM 1'),
(7, 5, 'XII APH 2'),
(9, 3, 'XII TKR 3'),
(10, 6, 'XII TBSM 3'),
(11, 1, 'XII RPL 2'),
(12, 2, 'XII TKJ 2'),
(15, 3, 'XII TKR 1'),
(16, 3, 'XII TKR 2'),
(17, 4, 'XII MM 2'),
(18, 5, 'XII APH 1'),
(25, 1, 'X RPL 4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level`
--

CREATE TABLE `tbl_level` (
  `ID_LEVEL` int(11) NOT NULL,
  `LEVEL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_level`
--

INSERT INTO `tbl_level` (`ID_LEVEL`, `LEVEL`) VALUES
(1, 'Admin'),
(2, 'Petugas'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `log_user` varchar(50) NOT NULL,
  `log_tipe` varchar(50) NOT NULL,
  `log_aksi` varchar(50) NOT NULL,
  `log_assign_to` varchar(50) NOT NULL,
  `log_assign_type` enum('petugas','siswa','spp','kelas','jurusan','transaksi','cetak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_user`, `log_tipe`, `log_aksi`, `log_assign_to`, `log_assign_type`) VALUES
(9, '2020-02-23 13:07:42', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(10, '2020-02-23 13:08:06', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(11, '2020-02-23 13:15:11', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(12, '2020-02-23 13:15:16', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(13, '2020-02-23 13:15:19', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(14, '2020-02-23 13:15:27', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(15, '2020-02-23 14:06:44', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(16, '2020-02-23 14:07:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(17, '2020-02-23 14:07:36', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(18, '2020-02-23 14:08:13', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(19, '2020-02-24 12:38:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(20, '2020-02-24 12:44:24', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(21, '2020-02-25 12:00:19', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(22, '2020-02-26 10:52:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(23, '2020-02-26 10:54:51', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(24, '2020-02-26 10:55:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(25, '2020-02-26 10:56:25', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(26, '2020-02-26 10:58:30', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(27, '2020-02-26 11:01:44', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(28, '2020-02-26 11:02:05', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(29, '2020-02-26 11:41:33', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(30, '2020-02-26 11:41:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(31, '2020-02-26 11:41:41', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(32, '2020-02-26 11:43:40', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(33, '2020-02-26 12:03:14', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(34, '2020-02-26 12:07:03', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(35, '2020-02-26 12:07:53', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(36, '2020-02-26 15:22:58', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(37, '2020-02-26 15:23:43', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(38, '2020-02-26 15:33:49', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(39, '2020-02-26 15:35:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(40, '2020-02-26 16:26:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(41, '2020-02-26 16:30:38', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(42, '2020-02-26 16:36:52', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(43, '2020-02-26 16:37:34', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(44, '2020-02-26 16:39:35', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(45, '2020-02-26 17:21:22', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(46, '2020-02-27 12:05:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(47, '2020-02-27 12:05:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(48, '2020-02-27 12:56:21', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(49, '2020-02-28 06:53:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(50, '2020-02-28 07:16:29', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(51, '2020-02-28 07:29:44', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(52, '2020-02-28 07:30:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(53, '2020-02-28 07:31:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(54, '2020-02-28 07:50:13', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(55, '2020-02-28 08:29:01', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(56, '2020-02-28 08:30:11', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(57, '2020-02-28 08:31:13', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(58, '2020-02-28 08:31:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(59, '2020-02-28 08:32:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(60, '2020-02-28 08:35:07', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(61, '2020-02-28 08:35:20', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(62, '2020-02-28 08:35:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(63, '2020-02-28 08:36:10', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(64, '2020-02-28 08:36:21', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(65, '2020-02-28 08:36:37', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(66, '2020-02-28 08:37:18', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(67, '2020-02-28 08:37:33', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(68, '2020-02-28 08:38:12', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(69, '2020-02-28 08:38:18', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(70, '2020-02-28 09:21:03', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(71, '2020-02-28 09:21:34', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(72, '2023-02-16 01:07:00', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(73, '2023-02-16 01:07:13', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(74, '2023-02-16 01:17:21', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(75, '2023-02-16 01:17:53', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(76, '2023-02-16 01:18:02', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(77, '2023-02-16 01:19:05', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(78, '2023-02-16 01:19:33', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(79, '2023-02-16 01:20:37', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(80, '2023-02-16 01:21:22', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(81, '2023-02-16 01:23:05', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(82, '2023-02-16 01:52:42', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(83, '2023-02-16 02:01:30', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(84, '2023-02-16 02:01:51', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(85, '2023-02-16 02:02:42', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(86, '2023-02-16 02:02:43', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(87, '2023-02-16 02:02:45', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(88, '2023-02-16 02:02:51', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(89, '2023-02-16 05:43:47', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(90, '2023-02-16 05:47:05', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(91, '2023-02-16 05:47:59', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(92, '2023-02-16 05:48:38', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(93, '2023-02-16 05:48:43', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(94, '2023-02-16 05:49:44', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(95, '2023-02-16 05:49:54', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(96, '2023-02-16 05:50:25', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(97, '2023-02-16 05:50:49', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(98, '2023-02-16 05:51:20', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(99, '2023-02-16 05:52:00', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(100, '2023-02-16 05:52:29', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(101, '2023-02-16 05:54:15', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(102, '2023-02-16 05:54:39', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(103, '2023-02-16 05:54:59', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(104, '2023-02-16 05:55:18', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(105, '2023-02-16 05:55:30', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(106, '2023-02-16 05:55:41', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(107, '2023-02-16 05:56:13', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(108, '2023-02-16 05:57:02', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(109, '2023-02-16 05:57:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(110, '2023-02-16 05:58:31', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(111, '2023-02-21 03:35:14', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(112, '2023-02-21 03:35:42', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(113, '2023-02-21 03:36:19', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(114, '2023-02-21 03:37:34', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(115, '2023-02-21 03:38:06', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(116, '2023-02-21 03:39:20', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(117, '2023-02-21 03:42:07', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(118, '2023-02-23 03:59:13', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(119, '2023-02-23 03:59:41', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(120, '2023-02-23 03:59:49', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(121, '2023-02-23 05:55:38', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(122, '2023-02-25 01:35:37', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(123, '2023-02-25 01:35:53', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(124, '2023-02-25 02:16:59', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(125, '2023-02-25 02:17:24', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(126, '2023-02-25 02:18:02', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(127, '2023-02-25 02:36:01', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(128, '2023-02-25 02:40:30', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(129, '2023-02-25 02:40:41', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(130, '2023-02-25 02:46:16', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(131, '2023-02-25 02:46:18', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(132, '2023-02-25 02:46:23', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(133, '2023-02-25 02:55:04', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(134, '2023-02-25 03:00:57', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(135, '2023-02-25 03:08:19', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(136, '2023-02-25 03:08:48', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(137, '2023-02-25 03:33:08', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(138, '2023-02-25 03:39:08', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(139, '2023-02-27 02:22:02', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(140, '2023-02-27 02:23:58', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(141, '2023-02-27 02:24:13', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(142, '2023-02-27 02:27:43', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(143, '2023-02-27 02:28:18', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(144, '2023-02-28 04:26:35', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(145, '2023-02-28 04:26:50', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(146, '2023-02-28 04:27:08', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(147, '2023-02-28 04:27:32', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(148, '2023-02-28 04:27:43', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(149, '2023-02-28 04:28:00', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(150, '2023-02-28 04:30:36', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(151, '2023-02-28 07:12:15', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(152, '2023-02-28 07:28:31', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(153, '2023-02-28 07:28:54', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(154, '2023-02-28 07:30:23', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(155, '2023-02-28 07:42:22', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(156, '2023-03-03 04:19:41', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(157, '2023-03-03 04:20:07', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(158, '2023-03-03 04:21:46', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(159, '2023-03-03 11:42:25', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(160, '2023-03-03 11:42:57', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(161, '2023-03-03 11:43:27', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(162, '2023-03-03 11:43:44', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(163, '2023-03-03 11:43:59', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(164, '2023-03-03 13:32:55', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(165, '2023-03-03 13:47:19', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(166, '2023-03-03 14:02:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(167, '2023-03-03 14:02:44', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(168, '2023-03-04 02:08:50', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(169, '2023-03-04 02:17:20', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(170, '2023-03-04 02:17:30', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(171, '2023-03-04 02:18:54', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(172, '2023-03-04 02:20:12', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(173, '2023-03-04 02:40:58', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(174, '2023-03-04 02:41:09', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(175, '2023-03-04 02:44:06', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(176, '2023-03-04 02:46:12', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(177, '2023-03-04 03:12:54', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(178, '2023-03-04 03:14:25', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(179, '2023-03-04 03:15:52', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(180, '2023-03-04 03:55:44', 'fitriiiii', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(181, '2023-03-04 03:58:01', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(182, '2023-03-04 04:01:30', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(183, '2023-03-04 04:02:34', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(184, '2023-03-04 04:03:18', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(185, '2023-03-04 04:04:39', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(186, '2023-03-04 04:23:16', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(187, '2023-03-04 04:24:16', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(188, '2023-03-04 04:47:30', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(189, '2023-03-04 04:48:02', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(190, '2023-03-04 04:48:35', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(191, '2023-03-04 04:49:49', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(192, '2023-03-04 04:55:27', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(193, '2023-03-04 04:56:44', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(194, '2023-03-04 04:56:49', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(195, '2023-03-04 05:29:26', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(196, '2023-03-04 05:36:44', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(197, '2023-03-04 05:40:44', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(198, '2023-03-04 05:42:40', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(199, '2023-03-04 06:23:59', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(200, '2023-03-04 06:24:47', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(201, '2023-03-04 06:25:21', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(202, '2023-03-04 06:25:23', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(203, '2023-03-04 06:25:23', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(204, '2023-03-04 06:25:23', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(205, '2023-03-04 06:25:27', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(206, '2023-03-04 06:25:28', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(207, '2023-03-04 06:25:28', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(208, '2023-03-04 06:25:36', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(209, '2023-03-04 06:25:50', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(210, '2023-03-04 06:25:53', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(211, '2023-03-04 06:25:56', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(212, '2023-03-04 06:25:56', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(213, '2023-03-04 06:26:07', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(214, '2023-03-04 06:26:09', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(215, '2023-03-04 06:26:11', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(216, '2023-03-04 06:26:26', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(217, '2023-03-04 06:26:29', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(218, '2023-03-04 06:27:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(219, '2023-03-05 07:11:47', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(220, '2023-03-05 07:12:05', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(221, '2023-03-05 07:13:14', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(222, '2023-03-05 07:13:29', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(223, '2023-03-05 07:14:01', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(224, '2023-03-05 07:14:10', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(225, '2023-03-05 07:14:37', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(226, '2023-03-05 07:14:49', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(227, '2023-03-05 07:15:13', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(228, '2023-03-05 07:15:28', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(229, '2023-03-05 07:16:03', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(230, '2023-03-05 07:16:38', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(231, '2023-03-05 07:26:52', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(232, '2023-03-05 07:27:04', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(233, '2023-03-05 07:28:07', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(234, '2023-03-05 07:28:34', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(235, '2023-03-05 07:28:54', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(236, '2023-03-05 07:29:01', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(237, '2023-03-05 07:29:23', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(238, '2023-03-05 07:29:36', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(239, '2023-03-05 07:29:55', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(240, '2023-03-05 07:30:06', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(241, '2023-03-05 07:30:35', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(242, '2023-03-05 07:31:02', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(243, '2023-03-05 08:34:51', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(244, '2023-03-05 08:37:31', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(245, '2023-03-05 08:40:11', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(246, '2023-03-05 12:59:10', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(247, '2023-03-05 13:03:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(248, '2023-03-05 13:04:06', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(249, '2023-03-05 13:07:46', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(250, '2023-03-05 13:11:50', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(251, '2023-03-05 13:25:21', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(252, '2023-03-05 13:32:58', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(253, '2023-03-05 13:37:54', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(254, '2023-03-06 00:18:03', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(255, '2023-03-06 00:23:12', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(256, '2023-03-06 00:24:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(257, '2023-03-06 00:30:00', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(258, '2023-03-06 00:33:28', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(259, '2023-03-06 00:43:28', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(260, '2023-03-06 00:51:49', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(261, '2023-03-06 00:52:06', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(262, '2023-03-06 01:04:33', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(263, '2023-03-06 01:18:56', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(264, '2023-03-06 01:26:47', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(265, '2023-03-06 01:31:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(266, '2023-03-06 01:34:39', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(267, '2023-03-06 01:37:14', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(268, '2023-03-06 01:38:42', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(269, '2023-03-06 01:38:45', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(270, '2023-03-06 01:40:01', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(271, '2023-03-06 01:55:34', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(272, '2023-03-06 02:28:36', 'eka fitriani', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(273, '2023-03-06 05:14:59', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(274, '2023-03-06 06:22:03', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(275, '2023-03-06 06:23:15', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(276, '2023-03-06 06:25:37', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(277, '2023-03-06 06:32:50', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(278, '2023-03-06 06:37:15', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(279, '2023-03-06 06:39:51', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(280, '2023-03-06 06:41:14', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(281, '2023-03-06 06:50:10', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(282, '2023-03-06 06:53:18', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(283, '2023-03-06 06:55:17', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(284, '2023-03-06 06:55:25', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(285, '2023-03-06 06:55:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(286, '2023-03-06 06:56:38', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(287, '2023-03-06 06:59:22', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `NISN` char(10) DEFAULT NULL,
  `TGL_BAYAR` date DEFAULT NULL,
  `JATUH_TEMPO` date NOT NULL,
  `BULAN_DIBAYAR` varchar(9) DEFAULT NULL,
  `TAHUN_DIBAYAR` varchar(4) DEFAULT NULL,
  `ID_SPP` int(11) NOT NULL,
  `JUMLAH_BAYAR` int(11) NOT NULL,
  `KET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`ID_PEMBAYARAN`, `ID_PETUGAS`, `NISN`, `TGL_BAYAR`, `JATUH_TEMPO`, `BULAN_DIBAYAR`, `TAHUN_DIBAYAR`, `ID_SPP`, `JUMLAH_BAYAR`, `KET`) VALUES
(117, 1, '5555555555', '2023-03-04', '2017-07-20', 'Juli', '2017', 3, 0, 'LUNAS'),
(118, 1, '5555555555', '2023-03-05', '2017-08-20', 'Agustus', '2017', 3, 0, 'LUNAS'),
(119, 1, '5555555555', '2023-03-05', '2017-09-20', 'September', '2017', 3, 0, 'LUNAS'),
(120, 1, '5555555555', NULL, '2017-10-20', 'Oktober', '2017', 3, 0, ''),
(121, 1, '5555555555', NULL, '2017-11-20', 'November', '2017', 3, 0, ''),
(122, 1, '5555555555', NULL, '2017-12-20', 'Desember', '2017', 3, 0, ''),
(123, 1, '5555555555', NULL, '2018-01-20', 'Januari', '2018', 3, 0, ''),
(124, 1, '5555555555', NULL, '2018-02-20', 'Februari', '2018', 3, 0, ''),
(125, 1, '5555555555', NULL, '2018-03-20', 'Maret', '2018', 3, 0, ''),
(126, 1, '5555555555', NULL, '2018-04-20', 'April', '2018', 3, 0, ''),
(127, 1, '5555555555', NULL, '2018-05-20', 'Mei', '2018', 3, 0, ''),
(128, 1, '5555555555', NULL, '2018-06-20', 'Juni', '2018', 3, 0, ''),
(129, 1, '1111111111', '2023-02-21', '2017-07-20', 'Juli', '2017', 3, 125000, 'LUNAS'),
(130, 1, '1111111111', '2023-02-25', '2017-08-20', 'Agustus', '2017', 3, 125000, 'LUNAS'),
(131, 1, '1111111111', '2023-02-25', '2017-09-20', 'September', '2017', 3, 125000, 'LUNAS'),
(132, 1, '1111111111', NULL, '2017-10-20', 'Oktober', '2017', 3, 125000, ''),
(133, 1, '1111111111', NULL, '2017-11-20', 'November', '2017', 3, 125000, ''),
(134, 1, '1111111111', NULL, '2017-12-20', 'Desember', '2017', 3, 125000, ''),
(135, 1, '1111111111', NULL, '2018-01-20', 'Januari', '2018', 3, 125000, ''),
(136, 1, '1111111111', NULL, '2018-02-20', 'Februari', '2018', 3, 125000, ''),
(137, 1, '1111111111', NULL, '2018-03-20', 'Maret', '2018', 3, 125000, ''),
(138, 1, '1111111111', NULL, '2018-04-20', 'April', '2018', 3, 125000, ''),
(139, 1, '1111111111', NULL, '2018-05-20', 'Mei', '2018', 3, 125000, ''),
(140, 1, '1111111111', NULL, '2018-06-20', 'Juni', '2018', 3, 125000, ''),
(141, 1, '8976789546', '2023-03-03', '2017-07-20', 'Juli', '2017', 3, 125000, 'LUNAS'),
(142, 1, '8976789546', '2023-03-06', '2017-08-20', 'Agustus', '2017', 3, 125000, 'LUNAS'),
(143, 1, '8976789546', NULL, '2017-09-20', 'September', '2017', 3, 125000, ''),
(144, 1, '8976789546', NULL, '2017-10-20', 'Oktober', '2017', 3, 125000, ''),
(145, 1, '8976789546', NULL, '2017-11-20', 'November', '2017', 3, 125000, ''),
(146, 1, '8976789546', NULL, '2017-12-20', 'Desember', '2017', 3, 125000, ''),
(147, 1, '8976789546', NULL, '2018-01-20', 'Januari', '2018', 3, 125000, ''),
(148, 1, '8976789546', NULL, '2018-02-20', 'Februari', '2018', 3, 125000, ''),
(149, 1, '8976789546', NULL, '2018-03-20', 'Maret', '2018', 3, 125000, ''),
(150, 1, '8976789546', NULL, '2018-04-20', 'April', '2018', 3, 125000, ''),
(151, 1, '8976789546', NULL, '2018-05-20', 'Mei', '2018', 3, 125000, ''),
(152, 1, '8976789546', NULL, '2018-06-20', 'Juni', '2018', 3, 125000, ''),
(153, 1, '2222222', '2023-03-03', '2017-07-20', 'Juli', '2017', 5, 600000, 'LUNAS'),
(154, 1, '2222222', NULL, '2017-08-20', 'Agustus', '2017', 5, 600000, ''),
(155, 1, '2222222', NULL, '2017-09-20', 'September', '2017', 5, 600000, ''),
(156, 1, '2222222', NULL, '2017-10-20', 'Oktober', '2017', 5, 600000, ''),
(157, 1, '2222222', NULL, '2017-11-20', 'November', '2017', 5, 600000, ''),
(158, 1, '2222222', NULL, '2017-12-20', 'Desember', '2017', 5, 600000, ''),
(159, 1, '2222222', NULL, '2018-01-20', 'Januari', '2018', 5, 600000, ''),
(160, 1, '2222222', NULL, '2018-02-20', 'Februari', '2018', 5, 600000, ''),
(161, 1, '2222222', NULL, '2018-03-20', 'Maret', '2018', 5, 600000, ''),
(162, 1, '2222222', NULL, '2018-04-20', 'April', '2018', 5, 600000, ''),
(163, 1, '2222222', NULL, '2018-05-20', 'Mei', '2018', 5, 600000, ''),
(164, 1, '2222222', NULL, '2018-06-20', 'Juni', '2018', 5, 600000, ''),
(297, 1, '1234567892', NULL, '2017-07-20', 'Juli', '2017', 3, 125000, ''),
(298, 1, '1234567892', NULL, '2017-08-20', 'Agustus', '2017', 3, 125000, ''),
(299, 1, '1234567892', NULL, '2017-09-20', 'September', '2017', 3, 125000, ''),
(300, 1, '1234567892', NULL, '2017-10-20', 'Oktober', '2017', 3, 125000, ''),
(301, 1, '1234567892', NULL, '2017-11-20', 'November', '2017', 3, 125000, ''),
(302, 1, '1234567892', NULL, '2017-12-20', 'Desember', '2017', 3, 125000, ''),
(303, 1, '1234567892', NULL, '2018-01-20', 'Januari', '2018', 3, 125000, ''),
(304, 1, '1234567892', NULL, '2018-02-20', 'Februari', '2018', 3, 125000, ''),
(305, 1, '1234567892', NULL, '2018-03-20', 'Maret', '2018', 3, 125000, ''),
(306, 1, '1234567892', NULL, '2018-04-20', 'April', '2018', 3, 125000, ''),
(307, 1, '1234567892', NULL, '2018-05-20', 'Mei', '2018', 3, 125000, ''),
(308, 1, '1234567892', NULL, '2018-06-20', 'Juni', '2018', 3, 125000, ''),
(345, 1, '0765489358', '2023-03-06', '2017-07-20', 'Juli', '2017', 3, 125000, 'LUNAS'),
(346, 1, '0765489358', '2023-03-06', '2017-08-20', 'Agustus', '2017', 3, 125000, 'LUNAS'),
(347, 1, '0765489358', NULL, '2017-09-20', 'September', '2017', 3, 125000, ''),
(348, 1, '0765489358', NULL, '2017-10-20', 'Oktober', '2017', 3, 125000, ''),
(349, 1, '0765489358', NULL, '2017-11-20', 'November', '2017', 3, 125000, ''),
(350, 1, '0765489358', NULL, '2017-12-20', 'Desember', '2017', 3, 125000, ''),
(351, 1, '0765489358', NULL, '2018-01-20', 'Januari', '2018', 3, 125000, ''),
(352, 1, '0765489358', NULL, '2018-02-20', 'Februari', '2018', 3, 125000, ''),
(353, 1, '0765489358', NULL, '2018-03-20', 'Maret', '2018', 3, 125000, ''),
(354, 1, '0765489358', NULL, '2018-04-20', 'April', '2018', 3, 125000, ''),
(355, 1, '0765489358', NULL, '2018-05-20', 'Mei', '2018', 3, 125000, ''),
(356, 1, '0765489358', NULL, '2018-06-20', 'Juni', '2018', 3, 125000, ''),
(357, 1, '0098767898', '2023-03-06', '2017-07-20', 'Juli', '2017', 20, 65000, 'LUNAS'),
(358, 1, '0098767898', '2023-03-06', '2017-08-20', 'Agustus', '2017', 20, 65000, 'LUNAS'),
(359, 1, '0098767898', '2023-03-06', '2017-09-20', 'September', '2017', 20, 65000, 'LUNAS'),
(360, 1, '0098767898', NULL, '2017-10-20', 'Oktober', '2017', 20, 65000, ''),
(361, 1, '0098767898', NULL, '2017-11-20', 'November', '2017', 20, 65000, ''),
(362, 1, '0098767898', NULL, '2017-12-20', 'Desember', '2017', 20, 65000, ''),
(363, 1, '0098767898', NULL, '2018-01-20', 'Januari', '2018', 20, 65000, ''),
(364, 1, '0098767898', NULL, '2018-02-20', 'Februari', '2018', 20, 65000, ''),
(365, 1, '0098767898', NULL, '2018-03-20', 'Maret', '2018', 20, 65000, ''),
(366, 1, '0098767898', NULL, '2018-04-20', 'April', '2018', 20, 65000, ''),
(367, 1, '0098767898', NULL, '2018-05-20', 'Mei', '2018', 20, 65000, ''),
(368, 1, '0098767898', NULL, '2018-06-20', 'Juni', '2018', 20, 65000, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `ID_PETUGAS` int(11) NOT NULL,
  `ID_LEVEL` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD_PETUGAS` varchar(225) DEFAULT NULL,
  `NAMA_PETUGAS` varchar(50) DEFAULT NULL,
  `DESKRIPSI` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`ID_PETUGAS`, `ID_LEVEL`, `USERNAME`, `PASSWORD_PETUGAS`, `NAMA_PETUGAS`, `DESKRIPSI`) VALUES
(1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin'),
(3, 2, 'petugas', 'b53fe7751b37e40ff34d012c7774d65f', 'Petugass', 'petugas1'),
(39, 2, 'wulan', '827ccb0eea8a706c4c34a16891f84e7b', 'wulan27', '12345'),
(40, 2, 'Dina', '827ccb0eea8a706c4c34a16891f84e7b', 'Dinay', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `NISN` char(10) NOT NULL,
  `ID_KELAS` int(11) DEFAULT NULL,
  `ID_SPP` int(11) DEFAULT NULL,
  `NIS` char(8) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` text DEFAULT NULL,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`NISN`, `ID_KELAS`, `ID_SPP`, `NIS`, `NAMA`, `ALAMAT`, `NO_TELP`, `TIMESTAMP`) VALUES
('0098767898', 17, 20, '23456789', 'Fitri Catur Wulandari', 'Paleran', '02938457293', '2023-03-06 06:53:18'),
('0765489358', 1, 3, '45789345', 'eka fitriani', 'Jember', '0984512698457', '2023-03-06 01:37:14'),
('1111111111', 2, 3, '44444444', 'firoh', 'surabaya', '12569845097', '2023-02-21 03:37:34'),
('1234567892', 12, 3, '76543219', 'wulann', 'semboro', '0987345712459', '2023-03-06 00:23:12'),
('2222222', 6, 5, '66666', 'fitriiiii', 'malang', '0973643543', '2023-03-04 02:41:09'),
('5555555555', 1, 3, '99999999', 'eka', 'jember', '1111', '2023-03-04 04:49:49'),
('8976789546', 2, 3, '777777', 'wulan', 'jember', '098643643', '2023-03-05 12:59:10');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `ID_SPP` int(11) NOT NULL,
  `TAHUN` varchar(16) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_spp`
--

INSERT INTO `tbl_spp` (`ID_SPP`, `TAHUN`, `NOMINAL`) VALUES
(3, '2022/2023', 125000),
(5, '2020/2021', 600000),
(19, '2021/2022', 75000),
(20, '2023/2024', 65000),
(21, '2023/2024', 85000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`ID_JURUSAN`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`ID_KELAS`),
  ADD KEY `FK_JURUSAN` (`ID_JURUSAN`);

--
-- Indexes for table `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`ID_LEVEL`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `FK_PETUGAS` (`ID_PETUGAS`),
  ADD KEY `FK_SISWA` (`NISN`);

--
-- Indexes for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`),
  ADD KEY `FK_LEVEL` (`ID_LEVEL`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD KEY `FK_KELAS` (`ID_KELAS`),
  ADD KEY `FK_SPP` (`ID_SPP`);

--
-- Indexes for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`ID_SPP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `ID_JURUSAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `ID_LEVEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=288;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `ID_PETUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  MODIFY `ID_SPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `FK_JURUSAN` FOREIGN KEY (`ID_JURUSAN`) REFERENCES `tbl_jurusan` (`ID_JURUSAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `FK_PETUGAS` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `tbl_petugas` (`ID_PETUGAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SISWA` FOREIGN KEY (`NISN`) REFERENCES `tbl_siswa` (`NISN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD CONSTRAINT `FK_LEVEL` FOREIGN KEY (`ID_LEVEL`) REFERENCES `tbl_level` (`ID_LEVEL`);

--
-- Constraints for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `FK_KELAS` FOREIGN KEY (`ID_KELAS`) REFERENCES `tbl_kelas` (`ID_KELAS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SPP` FOREIGN KEY (`ID_SPP`) REFERENCES `tbl_spp` (`ID_SPP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
