-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2021 at 07:55 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spp1`
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
(2, 'Teknik Jaringan Dan Komputer'),
(3, 'Teknik Sepeda Motor'),
(4, 'Teknik Kendaraan Ringan'),
(5, 'Agribisnis Pemeliharaan Holtikultural'),
(6, 'Pembenihan dan pemulian tanaman'),
(7, 'Multimedia');

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
(2, 1, 'XII RPL 2'),
(3, 2, 'XII TKJ 1'),
(4, 2, 'XII TKJ 2'),
(5, 7, 'XII MM 1'),
(6, 7, 'XII MM 2'),
(7, 5, 'XII APH 1'),
(8, 5, 'XII APH 2'),
(17, 3, 'XII TSM 1'),
(18, 3, 'XII TSM 2'),
(19, 3, 'XII TSM 3'),
(20, 4, 'XII TKR 1'),
(21, 4, 'XII TKR 2'),
(22, 4, 'XI TKR');

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
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
(72, '2021-04-09 15:10:55', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(73, '2021-04-09 15:11:00', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(74, '2021-04-09 15:11:29', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(75, '2021-04-09 15:13:01', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(76, '2021-04-09 15:13:45', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(77, '2021-04-09 15:14:08', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(78, '2021-04-09 15:14:21', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(79, '2021-04-09 15:14:35', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(80, '2021-04-09 15:19:48', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(81, '2021-04-09 15:32:49', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(82, '2021-04-09 15:32:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(83, '2021-04-09 15:32:52', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(84, '2021-04-09 15:39:46', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(85, '2021-04-09 15:40:07', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(86, '2021-04-09 15:50:55', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(87, '2021-04-09 15:51:01', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(88, '2021-04-09 15:53:52', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(89, '2021-04-09 16:02:47', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(90, '2021-04-09 16:04:42', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(91, '2021-04-09 16:05:48', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(92, '2021-04-09 16:06:29', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(93, '2021-04-09 16:06:51', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(94, '2021-04-09 16:08:06', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(95, '2021-04-09 16:08:37', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(96, '2021-04-09 16:09:48', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(97, '2021-04-09 16:10:43', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(98, '2021-04-09 16:12:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(99, '2021-04-10 00:45:08', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(100, '2021-04-10 00:45:18', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(101, '2021-04-15 02:43:31', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(102, '2021-04-15 04:38:38', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(103, '2021-04-15 04:52:40', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(104, '2021-04-15 04:52:44', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(105, '2021-04-15 05:05:41', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(106, '2021-04-15 05:05:55', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(107, '2021-04-15 05:06:31', 'ahmad123', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(108, '2021-04-15 05:06:32', 'ahmad123', 'pembayaran', 'Menambah data transaksi pembayaran', '', '');

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
(68, 1, '0020719053', '2020-02-26', '2017-07-20', 'Juli', '2017', 1, 135000, 'LUNAS'),
(69, 1, '0020719053', '2020-02-26', '2017-08-20', 'Agustus', '2017', 1, 135000, 'LUNAS'),
(70, 1, '0020719053', '2021-04-09', '2017-09-20', 'September', '2017', 1, 135000, 'LUNAS'),
(71, 1, '0020719053', '2021-04-09', '2017-10-20', 'Oktober', '2017', 1, 135000, 'LUNAS'),
(72, 1, '0020719053', '2021-04-09', '2017-11-20', 'November', '2017', 1, 135000, 'LUNAS'),
(73, 20, '0020719053', '2021-04-15', '2017-12-20', 'Desember', '2017', 1, 135000, 'LUNAS'),
(74, 20, '0020719053', '2021-04-15', '2018-01-20', 'Januari', '2018', 1, 135000, 'LUNAS'),
(75, 1, '0020719053', NULL, '2018-02-20', 'Februari', '2018', 1, 135000, ''),
(76, 1, '0020719053', NULL, '2018-03-20', 'Maret', '2018', 1, 135000, ''),
(77, 1, '0020719053', NULL, '2018-04-20', 'April', '2018', 1, 135000, ''),
(78, 1, '0020719053', NULL, '2018-05-20', 'Mei', '2018', 1, 135000, ''),
(79, 1, '0020719053', NULL, '2018-06-20', 'Juni', '2018', 1, 135000, ''),
(92, 1, '0020719054', '2020-02-26', '2018-07-20', 'Juli', '2018', 2, 170000, 'LUNAS'),
(93, 1, '0020719054', '2020-02-27', '2018-08-20', 'Agustus', '2018', 2, 170000, 'LUNAS'),
(94, 1, '0020719054', '2020-02-27', '2018-09-20', 'September', '2018', 2, 170000, 'LUNAS'),
(95, 1, '0020719054', NULL, '2018-10-20', 'Oktober', '2018', 2, 170000, ''),
(96, 1, '0020719054', NULL, '2018-11-20', 'November', '2018', 2, 170000, ''),
(97, 1, '0020719054', NULL, '2018-12-20', 'Desember', '2018', 2, 170000, ''),
(98, 1, '0020719054', NULL, '2019-01-20', 'Januari', '2019', 2, 170000, ''),
(99, 1, '0020719054', NULL, '2019-02-20', 'Februari', '2019', 2, 170000, ''),
(100, 1, '0020719054', NULL, '2019-03-20', 'Maret', '2019', 2, 170000, ''),
(101, 1, '0020719054', NULL, '2019-04-20', 'April', '2019', 2, 170000, ''),
(102, 1, '0020719054', NULL, '2019-05-20', 'Mei', '2019', 2, 170000, ''),
(103, 1, '0020719054', NULL, '2019-06-20', 'Juni', '2019', 2, 170000, ''),
(117, 1, '1212323232', NULL, '2017-07-21', 'Juli', '2017', 1, 135000, ''),
(118, 1, '1212323232', NULL, '2017-08-21', 'Agustus', '2017', 1, 135000, ''),
(119, 1, '1212323232', NULL, '2017-09-21', 'September', '2017', 1, 135000, ''),
(120, 1, '1212323232', NULL, '2017-10-21', 'Oktober', '2017', 1, 135000, ''),
(121, 1, '1212323232', NULL, '2017-11-21', 'November', '2017', 1, 135000, ''),
(122, 1, '1212323232', NULL, '2017-12-21', 'Desember', '2017', 1, 135000, ''),
(123, 1, '1212323232', NULL, '2018-01-21', 'Januari', '2018', 1, 135000, ''),
(124, 1, '1212323232', NULL, '2018-02-21', 'Februari', '2018', 1, 135000, ''),
(125, 1, '1212323232', NULL, '2018-03-21', 'Maret', '2018', 1, 135000, ''),
(126, 1, '1212323232', NULL, '2018-04-21', 'April', '2018', 1, 135000, ''),
(127, 1, '1212323232', NULL, '2018-05-21', 'Mei', '2018', 1, 135000, ''),
(128, 1, '1212323232', NULL, '2018-06-21', 'Juni', '2018', 1, 135000, ''),
(129, 1, '2121212121', '2021-04-09', '2019-07-20', 'Juli', '2019', 2, 135000, 'LUNAS'),
(130, 1, '2121212121', '2021-04-09', '2019-08-20', 'Agustus', '2019', 2, 135000, 'LUNAS'),
(131, 1, '2121212121', NULL, '2019-09-20', 'September', '2019', 2, 135000, ''),
(132, 1, '2121212121', NULL, '2019-10-20', 'Oktober', '2019', 2, 135000, ''),
(133, 1, '2121212121', NULL, '2019-11-20', 'November', '2019', 2, 135000, ''),
(134, 1, '2121212121', NULL, '2019-12-20', 'Desember', '2019', 2, 135000, ''),
(135, 1, '2121212121', NULL, '2020-01-20', 'Januari', '2020', 2, 135000, ''),
(136, 1, '2121212121', NULL, '2020-02-20', 'Februari', '2020', 2, 135000, ''),
(137, 1, '2121212121', '2021-04-09', '2020-03-20', 'Maret', '2020', 2, 135000, 'LUNAS'),
(138, 1, '2121212121', NULL, '2020-04-20', 'April', '2020', 2, 135000, ''),
(139, 1, '2121212121', NULL, '2020-05-20', 'Mei', '2020', 2, 135000, ''),
(140, 1, '2121212121', NULL, '2020-06-20', 'Juni', '2020', 2, 135000, ''),
(141, 1, '1232312134', NULL, '2121-07-20', 'Juli', '2121', 2, 135000, ''),
(142, 1, '1232312134', NULL, '2121-08-20', 'Agustus', '2121', 2, 135000, ''),
(143, 1, '1232312134', NULL, '2121-09-20', 'September', '2121', 2, 135000, ''),
(144, 1, '1232312134', NULL, '2121-10-20', 'Oktober', '2121', 2, 135000, ''),
(145, 1, '1232312134', NULL, '2121-11-20', 'November', '2121', 2, 135000, ''),
(146, 1, '1232312134', NULL, '2121-12-20', 'Desember', '2121', 2, 135000, ''),
(147, 1, '1232312134', NULL, '2122-01-20', 'Januari', '2122', 2, 135000, ''),
(148, 1, '1232312134', NULL, '2122-02-20', 'Februari', '2122', 2, 135000, ''),
(149, 1, '1232312134', NULL, '2122-03-20', 'Maret', '2122', 2, 135000, ''),
(150, 1, '1232312134', NULL, '2122-04-20', 'April', '2122', 2, 135000, ''),
(151, 1, '1232312134', NULL, '2122-05-20', 'Mei', '2122', 2, 135000, ''),
(152, 1, '1232312134', NULL, '2122-06-20', 'Juni', '2122', 2, 135000, '');

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
(3, 2, 'petugas', 'b53fe7751b37e40ff34d012c7774d65f', 'Petugas', 'petugas1'),
(17, 2, 'sriadi', '602ad683250ae3b5f4ed3a8d499b576e', 'Sri Adi Cahyono', 'sriadi'),
(19, 2, 'restu', '733b5e6a2e24f2764086325a28b6013d', 'restudoni', 'awaw'),
(20, 2, 'ahmad1', '8de13959395270bf9d6819f818ab1a00', 'ahmad123', 'ahmad123');

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
  `ALAMAT` text,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`NISN`, `ID_KELAS`, `ID_SPP`, `NIS`, `NAMA`, `ALAMAT`, `NO_TELP`, `TIMESTAMP`) VALUES
('0020719053', 1, 1, '12345678', 'Sri Adi Cahyono', 'Jl.Kahayan No 25', '085655514570', '2020-02-26 12:07:52'),
('0020719054', 1, 2, '23456789', 'Muhammad Nurozikin', 'Jl.Darungan City', '098767876555', '2020-02-26 15:35:28'),
('1212323232', 2, 1, '12321234', 'Rojak', 'Jln Mawar', '0812312345673', '2021-04-09 15:13:00'),
('1232312134', 17, 2, '12423123', 'Ali', 'Jln Babatan', '081245178212', '2021-04-09 16:04:41'),
('2121212121', 8, 2, '24564534', 'Feri', 'Jln Beteng Sidomekar', '4231345678321', '2021-04-09 15:19:47');

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
(1, '2017/2018', 135000),
(2, '2018/2019', 135000),
(3, '2020/2021', 135000),
(4, '2021/2022', 135000);

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
  MODIFY `ID_JURUSAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `ID_LEVEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `ID_PETUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  MODIFY `ID_SPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
