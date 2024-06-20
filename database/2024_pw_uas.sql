
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` int NOT NULL AUTO_INCREMENT,
  `nama` text,
  PRIMARY KEY (`id_customer`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `customer` (`id_customer`, `nama`) VALUES
	(1, 'agung'),
	(2, 'ags');

CREATE TABLE IF NOT EXISTS `dosen` (
  `id_dosen` int NOT NULL AUTO_INCREMENT,
  `nidn_dosen` bigint NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  `jk_dosen` enum('Pria','Wanita') NOT NULL,
  `alamat_dosen` text NOT NULL,
  `foto_dosen` text NOT NULL,
  PRIMARY KEY (`id_dosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `dosen` (`id_dosen`, `nidn_dosen`, `nama_dosen`, `jk_dosen`, `alamat_dosen`, `foto_dosen`) VALUES
	(7, 658767276347, 'sutinah muhammad', 'Wanita', 'piji dawe kudus', '666afdf43f579.jpeg'),
	(8, 1, 'Agung', 'Pria', 'piji', '666d681254cd2.png');

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


INSERT INTO `jadwal_kuliah` (`id_jadwalkuliah`, `tanggal_entri`, `hari_kuliah`, `jam_kuliah`, `tempat_kuliah`, `id_matakuliah`, `id_dosen`) VALUES
	(4, '2024-06-14', 'Rabu', ' sampai ', 'hjbjhb', 6, 6);


CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `id_matakuliah` int NOT NULL AUTO_INCREMENT,
  `mata_kuliah` text NOT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `mata_kuliah` (`id_matakuliah`, `mata_kuliah`) VALUES
	(7, 'giugiuui'),
	(8, 'Kemeja Batik'),
	(9, 'Outer Batik');


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

INSERT INTO `penjualan` (`id`, `tanggal`, `namaproduk`, `harga`, `totalpesanan`, `totalharga`, `idcustomer`, `catatan`) VALUES
	(1, '2024-06-15 18:32:00', '8', 1, 1, 1, 1, '1'),
	(2, '2024-06-16 06:21:00', '9', 200, 2, 890909, 1, 'ssdsd'),
	(3, '2024-06-16 06:24:00', '7', 4343, 34343, 34343, 2, 'rerer');

