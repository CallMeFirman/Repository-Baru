-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2023 at 05:43 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `manajemen_sdm`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `Kode_Absen` varchar(10) NOT NULL,
  `ID_Karyawan` varchar(10) NOT NULL,
  `Jam_Masuk` datetime NOT NULL,
  `Jam_Istirahat` datetime NOT NULL,
  `Jam_Lembur` datetime NOT NULL,
  `Jam_Pulang` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gaji`
--

CREATE TABLE `gaji` (
  `ID_Gaji` varchar(10) NOT NULL,
  `ID_Karyawan` varchar(10) NOT NULL,
  `Tanggal_Gaji` date NOT NULL,
  `Gaji_Perbulan` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ijin`
--

CREATE TABLE `jenis_ijin` (
  `Kode_Ijin` varchar(10) NOT NULL,
  `ID_Karyawan` varchar(10) NOT NULL,
  `Jenis_Ijin` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `ID_Karyawan` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Alamat` varchar(25) NOT NULL,
  `No_Hp` varchar(12) NOT NULL,
  `Agama` varchar(10) NOT NULL,
  `Bagian` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pendidikan`
--

CREATE TABLE `pendidikan` (
  `ID_Pendidikan` varchar(10) NOT NULL,
  `ID_Karyawan` varchar(10) NOT NULL,
  `Lulusan` varchar(15) NOT NULL,
  `Alamat` varchar(25) NOT NULL,
  `Masa_Pendidikan` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_ijin`
--

CREATE TABLE `pengajuan_ijin` (
  `Kode_Pengajuan` varchar(10) NOT NULL,
  `Kode_Ijin` varchar(10) NOT NULL,
  `Jumlah_Ijin` varchar(15) NOT NULL,
  `Tanggal_Ijin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengembangan_diri`
--

CREATE TABLE `pengembangan_diri` (
  `ID_Promosi` varchar(10) NOT NULL,
  `ID_Karyawan` varchar(10) NOT NULL,
  `Kode_Absen` varchar(10) NOT NULL,
  `Tingkat_Promosi` varchar(30) NOT NULL,
  `Ketentuan_Promosi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `ID_Pengguna` varchar(10) NOT NULL,
  `ID_Karyawan` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Username` varchar(15) NOT NULL,
  `Password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan`
--

CREATE TABLE `tunjangan` (
  `ID_Tunjangan` varchar(10) NOT NULL,
  `ID_Gaji` varchar(10) NOT NULL,
  `Jenis_Tunjangan` varchar(15) NOT NULL,
  `Jumlah_Tunjangan` int(15) NOT NULL,
  `Jumlah_Gaji` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`Kode_Absen`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`);

--
-- Indexes for table `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`ID_Gaji`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`);

--
-- Indexes for table `jenis_ijin`
--
ALTER TABLE `jenis_ijin`
  ADD PRIMARY KEY (`Kode_Ijin`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`ID_Karyawan`);

--
-- Indexes for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD PRIMARY KEY (`ID_Pendidikan`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`);

--
-- Indexes for table `pengajuan_ijin`
--
ALTER TABLE `pengajuan_ijin`
  ADD PRIMARY KEY (`Kode_Pengajuan`),
  ADD KEY `Kode_Ijin` (`Kode_Ijin`);

--
-- Indexes for table `pengembangan_diri`
--
ALTER TABLE `pengembangan_diri`
  ADD PRIMARY KEY (`ID_Promosi`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`),
  ADD KEY `Kode_Absen` (`Kode_Absen`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`ID_Pengguna`),
  ADD KEY `ID_Karyawan` (`ID_Karyawan`);

--
-- Indexes for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`ID_Tunjangan`),
  ADD KEY `ID_Gaji` (`ID_Gaji`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absensi`
--
ALTER TABLE `absensi`
  ADD CONSTRAINT `absensi_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `gaji`
--
ALTER TABLE `gaji`
  ADD CONSTRAINT `gaji_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `jenis_ijin`
--
ALTER TABLE `jenis_ijin`
  ADD CONSTRAINT `jenis_ijin_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `pendidikan`
--
ALTER TABLE `pendidikan`
  ADD CONSTRAINT `pendidikan_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `pengajuan_ijin`
--
ALTER TABLE `pengajuan_ijin`
  ADD CONSTRAINT `pengajuan_ijin_ibfk_1` FOREIGN KEY (`Kode_Ijin`) REFERENCES `jenis_ijin` (`Kode_Ijin`);

--
-- Constraints for table `pengembangan_diri`
--
ALTER TABLE `pengembangan_diri`
  ADD CONSTRAINT `pengembangan_diri_ibfk_1` FOREIGN KEY (`Kode_Absen`) REFERENCES `absensi` (`Kode_Absen`);

--
-- Constraints for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD CONSTRAINT `pengguna_ibfk_1` FOREIGN KEY (`ID_Karyawan`) REFERENCES `karyawan` (`ID_Karyawan`);

--
-- Constraints for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD CONSTRAINT `tunjangan_ibfk_1` FOREIGN KEY (`ID_Gaji`) REFERENCES `gaji` (`ID_Gaji`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
