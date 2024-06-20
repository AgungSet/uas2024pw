-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for 2024_pw_uas
CREATE DATABASE IF NOT EXISTS `2024_pw_uas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `2024_pw_uas`;

-- Dumping structure for table 2024_pw_uas.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `nama` text,
  PRIMARY KEY (`id_customer`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 2024_pw_uas.customer: ~0 rows (approximately)
INSERT INTO `customer` (`id_customer`, `nama`) VALUES
	(1, 'agung'),
	(2, 'ags');

-- Dumping structure for table 2024_pw_uas.dosen
CREATE TABLE IF NOT EXISTS `dosen` (
  `id_dosen` int NOT NULL AUTO_INCREMENT,
  `nidn_dosen` bigint NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  `jk_dosen` enum('Pria','Wanita') NOT NULL,
  `alamat_dosen` text NOT NULL,
  `foto_dosen` text NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 2024_pw_uas.dosen: ~2 rows (approximately)
INSERT INTO `dosen` (`id_dosen`, `nidn_dosen`, `nama_dosen`, `jk_dosen`, `alamat_dosen`, `foto_dosen`) VALUES
	(7, 658767276347, 'sutinah muhammad', 'Wanita', 'piji dawe kudus', '666afdf43f579.jpeg'),
	(8, 1, 'Agung', 'Pria', 'piji', '666d681254cd2.png');

-- Dumping structure for table 2024_pw_uas.jadwal_kuliah
CREATE TABLE IF NOT EXISTS `jadwal_kuliah` (
  `id_jadwalkuliah` int NOT NULL AUTO_INCREMENT,
  `tanggal_entri` date NOT NULL,
  `hari_kuliah` text NOT NULL,
  `jam_kuliah` text NOT NULL,
  `tempat_kuliah` text NOT NULL,
  `id_matakuliah` int NOT NULL,
  `id_dosen` int NOT NULL,
  PRIMARY KEY (`id_jadwalkuliah`),
  KEY `id_mahasiswa` (`id_matakuliah`),
  KEY `id_dosen` (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 2024_pw_uas.jadwal_kuliah: ~0 rows (approximately)
INSERT INTO `jadwal_kuliah` (`id_jadwalkuliah`, `tanggal_entri`, `hari_kuliah`, `jam_kuliah`, `tempat_kuliah`, `id_matakuliah`, `id_dosen`) VALUES
	(4, '2024-06-14', 'Rabu', ' sampai ', 'hjbjhb', 6, 6);

-- Dumping structure for table 2024_pw_uas.mata_kuliah
CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id_matakuliah` int NOT NULL AUTO_INCREMENT,
  `mata_kuliah` text NOT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table 2024_pw_uas.mata_kuliah: ~3 rows (approximately)
INSERT INTO `mata_kuliah` (`id_matakuliah`, `mata_kuliah`) VALUES
	(7, 'giugiuui'),
	(8, 'Kemeja Batik'),
	(9, 'Outer Batik');

-- Dumping structure for table 2024_pw_uas.penjualan
CREATE TABLE IF NOT EXISTS `penjualan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NOT NULL,
  `namaproduk` text COLLATE utf8mb4_general_ci NOT NULL,
  `harga` int NOT NULL,
  `totalpesanan` int NOT NULL,
  `totalharga` int NOT NULL,
  `idcustomer` int NOT NULL,
  `catatan` text COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_penjualan_customer` (`idcustomer`),
  CONSTRAINT `FK_penjualan_customer` FOREIGN KEY (`idcustomer`) REFERENCES `customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table 2024_pw_uas.penjualan: ~3 rows (approximately)
INSERT INTO `penjualan` (`id`, `tanggal`, `namaproduk`, `harga`, `totalpesanan`, `totalharga`, `idcustomer`, `catatan`) VALUES
	(1, '2024-06-15 18:32:00', '8', 1, 1, 1, 1, '1'),
	(2, '2024-06-16 06:21:00', '9', 200, 2, 890909, 1, 'ssdsd'),
	(3, '2024-06-16 06:24:00', '7', 4343, 34343, 34343, 2, 'rerer');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
