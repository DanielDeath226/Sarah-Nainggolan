-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Okt 2024 pada 22.06
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
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `idkamar` int(11) NOT NULL,
  `nomor_kamar` varchar(45) NOT NULL,
  `status_ruangan` varchar(45) NOT NULL,
  `idtype_kamar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `idkaryawan` int(11) NOT NULL,
  `nama_karyawan` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nomor_hp` varchar(45) NOT NULL,
  `posisi_jabatan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `idpelanggan` int(11) NOT NULL,
  `nama_lengkap` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nomor_hp` varchar(45) NOT NULL,
  `alamat` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idpembayaran` int(11) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `metode_pembayaran` enum('atm','cash') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
--

CREATE TABLE `reservasi` (
  `idreservasi` int(11) NOT NULL,
  `taggal_masuk` date NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `total_harga` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `idkamar` int(11) NOT NULL,
  `idpembayaran` int(11) NOT NULL,
  `idroom_servis` int(11) NOT NULL,
  `idpelanggan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `room_servis`
--

CREATE TABLE `room_servis` (
  `idroom_servis` int(11) NOT NULL,
  `nama_servis` varchar(45) NOT NULL,
  `deskripsi_servis` varchar(45) NOT NULL,
  `harga_servis` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `type_kamar`
--

CREATE TABLE `type_kamar` (
  `idtype_kamar` int(11) NOT NULL,
  `nama_type` varchar(45) NOT NULL,
  `deskripsi_kamar` longtext NOT NULL,
  `harga_kamar` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`idkamar`),
  ADD KEY `fk_kamar_type_kamar1_idx` (`idtype_kamar`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`idkaryawan`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`idpelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idpembayaran`);

--
-- Indeks untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`idreservasi`),
  ADD KEY `fk_reservasi_kamar1_idx` (`idkamar`),
  ADD KEY `fk_reservasi_pembayaran1_idx` (`idpembayaran`),
  ADD KEY `fk_reservasi_room_servis1_idx` (`idroom_servis`),
  ADD KEY `fk_reservasi_pelanggan1_idx` (`idpelanggan`);

--
-- Indeks untuk tabel `room_servis`
--
ALTER TABLE `room_servis`
  ADD PRIMARY KEY (`idroom_servis`);

--
-- Indeks untuk tabel `type_kamar`
--
ALTER TABLE `type_kamar`
  ADD PRIMARY KEY (`idtype_kamar`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `idkamar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `idkaryawan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `idpelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `idpembayaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `idreservasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `room_servis`
--
ALTER TABLE `room_servis`
  MODIFY `idroom_servis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `type_kamar`
--
ALTER TABLE `type_kamar`
  MODIFY `idtype_kamar` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD CONSTRAINT `fk_kamar_type_kamar1` FOREIGN KEY (`idtype_kamar`) REFERENCES `type_kamar` (`idtype_kamar`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD CONSTRAINT `fk_reservasi_kamar1` FOREIGN KEY (`idkamar`) REFERENCES `kamar` (`idkamar`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservasi_pelanggan1` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`idpelanggan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservasi_pembayaran1` FOREIGN KEY (`idpembayaran`) REFERENCES `pembayaran` (`idpembayaran`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reservasi_room_servis1` FOREIGN KEY (`idroom_servis`) REFERENCES `room_servis` (`idroom_servis`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
