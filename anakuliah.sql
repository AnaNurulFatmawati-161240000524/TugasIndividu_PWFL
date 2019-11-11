-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 09:58 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anakuliah`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(15) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `no_hp_lama` varchar(15) NOT NULL,
  `no_hp_baru` varchar(15) NOT NULL,
  `tgl_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `nim`, `no_hp_lama`, `no_hp_baru`, `tgl_ubah`) VALUES
(1, '123', '123', '123123', '2019-11-11 14:56:29'),
(2, '161240000524', '082243703589', '082243703588', '2019-11-11 15:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(15) NOT NULL,
  `nim` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama`, `jk`, `alamat`, `no_hp`) VALUES
(2, '161240000524', 'Ana Nurul Fatmawati', 'Perempuan', 'Bandengan RT 16 RW 05 JEPARA', '082243703588'),
(3, '161240000523', 'Ananda Rizqi Winantasya', 'Perempuan', 'Srobyong RT 12 RW 08 Mlonggo Jepara ', '089776543212'),
(4, '161240000521', 'Hikam Ihsanillah', 'Laki-laki', 'Kauman RT 4 RW 05 Jepara', '087665443224');

--
-- Triggers `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `update` BEFORE UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
	INSERT INTO log
    SET id = OLD.id,
    nim = OLD.nim,
    no_hp_lama = OLD.no_hp,
    no_hp_baru = new.no_hp,
    tgl_ubah = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil`
-- (See below for the actual view)
--
CREATE TABLE `tampil` (
`id` int(15)
,`nim` varchar(15)
,`nama` varchar(50)
,`jk` varchar(10)
,`alamat` varchar(50)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Structure for view `tampil`
--
DROP TABLE IF EXISTS `tampil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil`  AS  (select `mahasiswa`.`id` AS `id`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama` AS `nama`,`mahasiswa`.`jk` AS `jk`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`no_hp` AS `no_hp` from `mahasiswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
