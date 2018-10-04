-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 12. Agustus 2018 jam 21:16
-- Versi Server: 5.1.41
-- Versi PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `id4034249_winmerch`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kategori`
--

CREATE TABLE IF NOT EXISTS `t_kategori` (
  `id_kategori` char(10) NOT NULL,
  `nama_kategori` varchar(40) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_kategori`
--

INSERT INTO `t_kategori` (`id_kategori`, `nama_kategori`) VALUES
('JK', 'JAKET'),
('SY', 'SYAL'),
('TS', 'KAOS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_keranjang`
--

CREATE TABLE IF NOT EXISTS `t_keranjang` (
  `id_keranjang` int(10) NOT NULL AUTO_INCREMENT,
  `id_member` int(10) NOT NULL,
  `id_produk` char(10) NOT NULL,
  `qty` int(5) NOT NULL,
  `ukuran` varchar(3) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id_keranjang`),
  KEY `id_produk` (`id_produk`),
  KEY `id_member` (`id_member`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `t_keranjang`
--

INSERT INTO `t_keranjang` (`id_keranjang`, `id_member`, `id_produk`, `qty`, `ukuran`) VALUES
(5, 2, 'SY-3', 1, 'M');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_kontak`
--

CREATE TABLE IF NOT EXISTS `t_kontak` (
  `id_kontak` int(5) NOT NULL,
  `sms` varchar(20) NOT NULL,
  `telpon` varchar(20) NOT NULL,
  `instagram` varchar(25) NOT NULL,
  `email_kontak` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kontak`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_kontak`
--

INSERT INTO `t_kontak` (`id_kontak`, `sms`, `telpon`, `instagram`, `email_kontak`) VALUES
(1, '087872229360', '087872229360', 'win.merch.id', 'budi@wm-jkt.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_member`
--

CREATE TABLE IF NOT EXISTS `t_member` (
  `id_member` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `provinsi` varchar(50) NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `forgot_key` varchar(30) NOT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `t_member`
--

INSERT INTO `t_member` (`id_member`, `username`, `password`, `nama_lengkap`, `email`, `no_telp`, `alamat`, `provinsi`, `kota`, `kode_pos`, `forgot_key`) VALUES
(1, 'Budiman', '35c21f2e50b3ab1c91b7ba7d3e3904ee', 'Agus Budiman Putra', 'budimanputra53@gmail.com', '087872229360', 'Jl. Masjid, Sudimara Barat.', 'Tangerang', 'Tangerang', 15151, ''),
(2, 'abp', '7b9b6d1b19e3fd8809428f2bf1d5fd7b', 'Abp', 'abp@gmail.com', '081534121238', 'jalan ciledug raya nomor 21', 'Banten', 'Tangerang', 12134, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_order`
--

CREATE TABLE IF NOT EXISTS `t_order` (
  `id_order` int(10) NOT NULL AUTO_INCREMENT,
  `id_produk` varchar(10) NOT NULL,
  `id_member` int(10) NOT NULL,
  `id_tagihan` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `ukuran` varchar(3) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id_order`),
  KEY `t_order_ibfk_2` (`id_member`),
  KEY `t_order_ibfk_3` (`id_produk`),
  KEY `t_order_ibfk_4` (`id_tagihan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data untuk tabel `t_order`
--

INSERT INTO `t_order` (`id_order`, `id_produk`, `id_member`, `id_tagihan`, `qty`, `ukuran`) VALUES
(2, 'JK-5', 1, 3, 200, 'XL'),
(3, 'TS-1', 1, 4, 1, 'M'),
(4, 'TS-2', 2, 5, 1, 'M');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pengaturan`
--

CREATE TABLE IF NOT EXISTS `t_pengaturan` (
  `id` int(1) NOT NULL,
  `judul_website` varchar(50) NOT NULL,
  `banner_website` varchar(50) NOT NULL,
  `banner_admin` varchar(50) NOT NULL,
  `favicon` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL,
  `panduan` longtext NOT NULL,
  `slide` enum('aktif','tidak aktif') NOT NULL,
  `polling` enum('aktif','tidak aktif') NOT NULL,
  `google_analystics` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pengaturan`
--

INSERT INTO `t_pengaturan` (`id`, `judul_website`, `banner_website`, `banner_admin`, `favicon`, `keyword`, `deskripsi`, `panduan`, `slide`, `polling`, `google_analystics`) VALUES
(1, 'Win Merch Jakarta - Official Merchandise Jakarta', '', './admin/img/banner.jpg', './images/fav.ico', 'toko online, jakarta fashion, jakarta, persija, macan', 'Sebuah Jak Distro Yang Oren Banget', '<center><span style="font-size:18px;"><span class="title"><strong class="title">Panduan Berbelanja di<br>"Win Merch Jakarta - Official Merchandise Jakarta"</strong></span></span></center>\r\n\r\n<center>&nbsp;</center>\r\n\r\n<p>1. Buka Halaman Home atau halaman produk yang ingin di order</p>\r\n\r\n<p>2. Pilih kategori produk yang ingin dibeli pada tab menu atau kategori.</p>\r\n\r\n<p>3. Pilih produk yang akan dibeli, kemudian&nbsp; tekan tombol <strong>&#39;Pesan di Whatsapp&#39;</strong></p>\r\n\r\n<p>4. Secara otomatis orderan masuk ke jejaring sosial pemilik/whatsapp pemilik.</p>\r\n\r\n<p>5. Apabila ingin menambah orderan, bisa diketik sendiri melalui chatting pribadi whatsapp</p>\r\n\r\n<p>7. Kirim dan tunggu balasan rekening dari pemilik.</p>\r\n\r\n<p>8. Lakukan pembayaran ke rekening yang sudah ditetapkan</p>\r\n\r\n<p>9. Foto bukti pembayaran, lalu kirim bukti poto struk melalui whatsapp.</p>\r\n\r\n<p>10. Tunggu balasan rekening dari pemilik, dan barang akan segera dikirim.</p>\r\n', 'aktif', 'aktif', 'UA-123132');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pesan`
--

CREATE TABLE IF NOT EXISTS `t_pesan` (
  `id_pesan` int(3) NOT NULL AUTO_INCREMENT,
  `tgl_pesan` date NOT NULL,
  `dari` varchar(20) NOT NULL,
  `untuk` varchar(20) NOT NULL,
  `judul_pesan` varchar(50) NOT NULL,
  `isi_pesan` varchar(200) NOT NULL,
  PRIMARY KEY (`id_pesan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data untuk tabel `t_pesan`
--


-- --------------------------------------------------------

--
-- Struktur dari tabel `t_polling`
--

CREATE TABLE IF NOT EXISTS `t_polling` (
  `id_polling` int(5) NOT NULL AUTO_INCREMENT,
  `isi` varchar(100) NOT NULL,
  `status` enum('Jawab','Tanya') NOT NULL,
  `rating` int(5) NOT NULL,
  PRIMARY KEY (`id_polling`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `t_polling`
--

INSERT INTO `t_polling` (`id_polling`, `isi`, `status`, `rating`) VALUES
(1, 'Bagaimanakah Pelayanan Kami?', 'Tanya', 0),
(2, 'Sangat Bagus', 'Jawab', 0),
(3, 'Bagus', 'Jawab', 0),
(4, 'Biasa', 'Jawab', 0),
(5, 'Kurang', 'Jawab', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_produk`
--

CREATE TABLE IF NOT EXISTS `t_produk` (
  `id_produk` char(10) NOT NULL,
  `id_kategori` char(10) NOT NULL,
  `nama_produk` varchar(50) NOT NULL,
  `harga_produk` int(40) NOT NULL,
  `gambar_produk` varchar(30) NOT NULL,
  `deskripsi_produk` longtext NOT NULL,
  `berat` varchar(5) NOT NULL,
  `stok` enum('Masih','Habis') NOT NULL,
  `tgl_post` date NOT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_produk`
--

INSERT INTO `t_produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `gambar_produk`, `deskripsi_produk`, `berat`, `stok`, `tgl_post`) VALUES
('JK-2', 'JK', 'League', 200000, './images/produk/JK-2.jpg', 'Jaket original Persija Jakarta sponsor league size s m l xl', '1', 'Masih', '2018-08-05'),
('JK-3', 'JK', 'Specs', 150000, './images/produk/JK-3.jpg', 'Jacket Specs size s m l xl', '1.5', 'Masih', '2018-08-05'),
('JK-4', 'JK', 'Merah - Putih', 200000, './images/produk/JK-4.jpg', 'Jaket Merah Putih Persija Jakarta .......', '2', 'Masih', '2018-08-05'),
('JK-5', 'JK', 'Jakartans', 300000, './images/produk/JK-5.jpg', 'Djakartans (Limited Edition!) ukuran: S, M, L, XL.', '2', 'Masih', '2018-08-05'),
('SY-1', 'SY', 'Menembus Tradisi', 150000, './images/produk/SY-1.jpg', 'syal MENEMBUS TRADISI PERSIJA JAKARTA buatan indonesia', '1', 'Masih', '2018-08-05'),
('SY-2', 'SY', 'Gue Persija ', 150000, './images/produk/SY-2.jpg', 'syal gue persija buatan indonesia', '1', 'Masih', '2018-08-05'),
('SY-3', 'SY', 'Jakartans', 250000, './images/produk/SY-3.jpg', 'Syal Jakartans buatan negara polandia ', '1', 'Masih', '2018-08-06'),
('TS-1', 'TS', 'Coyt', 120000, './images/produk/TS-1.jpg', 'Tshirt come on you tiger Persija Jakarta size s m l xl', '1', 'Masih', '2018-08-05'),
('TS-10', 'TS', 'It s my drug', 120000, './images/produk/TS-10.jpg', 'Kaos It is my drug size s m l xl', '1', 'Masih', '2018-08-05'),
('TS-11', 'TS', 'Red and white', 120000, './images/produk/TS-11.jpg', 'Kaos persija warna hitam size s m l xl ', '1', 'Masih', '2018-08-05'),
('TS-12', 'TS', 'Black and Red', 120000, './images/produk/TS-12.jpg', 'Kaos Persija warna merah dan hitam size s m l xl', '1', 'Masih', '2018-08-06'),
('TS-2', 'TS', 'White and Red', 100000, './images/produk/TS-2.jpg', 'kaos Persija Jakarta warna putih,mersh dan hitam size s m l xl .', '1', 'Masih', '2018-08-05'),
('TS-9', 'TS', 'Ellesse', 100000, './images/produk/TS-9.jpg', 'Kaos Persija Jakarta size s m l xl', '1', 'Masih', '2018-08-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_profil`
--

CREATE TABLE IF NOT EXISTS `t_profil` (
  `id_profil` int(3) NOT NULL AUTO_INCREMENT,
  `nama_toko` varchar(50) NOT NULL,
  `kota_toko` varchar(50) NOT NULL,
  `provinsi_toko` varchar(50) NOT NULL,
  `alamat_toko` varchar(300) NOT NULL,
  `kode_pos` int(10) DEFAULT NULL,
  `tentang_toko` longtext NOT NULL,
  PRIMARY KEY (`id_profil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `t_profil`
--

INSERT INTO `t_profil` (`id_profil`, `nama_toko`, `kota_toko`, `provinsi_toko`, `alamat_toko`, `kode_pos`, `tentang_toko`) VALUES
(1, 'Win Merch Jakarta', 'Jakarta', 'DKI Jakarta', 'Online', 12025, '<h3>&nbsp;</h3>\r\n\r\n<p>Win Merch Jakarta - Official Merchandise Jakarta:</p>\r\n\r\n<p>Adalah Sebuah Toko yang menjual merchandise Persija Jakarta</p>\r\n');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_rekening`
--

CREATE TABLE IF NOT EXISTS `t_rekening` (
  `id_rekening` int(5) NOT NULL AUTO_INCREMENT,
  `nama_pemilik` varchar(100) NOT NULL,
  `no_rekening` varchar(100) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `cabang` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rekening`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `t_rekening`
--

INSERT INTO `t_rekening` (`id_rekening`, `nama_pemilik`, `no_rekening`, `nama_bank`, `cabang`) VALUES
(1, 'Agus Budiman Putra', '123-00-0700821-4', 'Mandiri', 'Jakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_shipping`
--

CREATE TABLE IF NOT EXISTS `t_shipping` (
  `id_shipping` int(5) NOT NULL AUTO_INCREMENT,
  `wilayah` varchar(50) NOT NULL,
  `biaya` varchar(50) NOT NULL,
  `kurir` varchar(50) NOT NULL,
  PRIMARY KEY (`id_shipping`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data untuk tabel `t_shipping`
--

INSERT INTO `t_shipping` (`id_shipping`, `wilayah`, `biaya`, `kurir`) VALUES
(1, 'Batu', '16000', 'PT Pos Indonesia'),
(2, 'Aceh', '25000', 'JNE Regular Service'),
(3, 'Jakarta', '13000', 'PT Pos Indonesia'),
(4, 'Tangerang', '15000', 'PT Pos Indonesia'),
(5, 'Bogor', '15000', 'PT Pos Indonesia'),
(6, 'Depok', '15000', 'PT Pos Indonesia'),
(7, 'Bekasi', '15000', 'PT Pos Indonesia'),
(8, 'Bandung', '15000', 'PT Pos Indonesia'),
(9, 'Garut', '19000', 'PT Pos Indonesia'),
(10, 'Tegal', '14000', 'PT Pos Indonesia'),
(11, 'Magelang', '11500', 'PT Pos Indonesia'),
(12, 'Surakarta', '5000', 'JNE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_slider`
--

CREATE TABLE IF NOT EXISTS `t_slider` (
  `id_slider` int(5) NOT NULL,
  `nama_slider` varchar(50) NOT NULL,
  `deskripsi_slider` varchar(100) NOT NULL,
  `foto_slider` varchar(100) NOT NULL,
  PRIMARY KEY (`id_slider`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_slider`
--

INSERT INTO `t_slider` (`id_slider`, `nama_slider`, `deskripsi_slider`, `foto_slider`) VALUES
(0, 'Selamat Datang', 'Selamat Datang di Win Merch Jakarta', './images/slide/slide0.png'),
(1, 'Belanja Mudah', 'Berbelanja di Win Merch Jakarta', './images/slide/slide1.jpg'),
(2, 'Toko Online', 'Toko Online Win Merch Jakarta', './images/slide/slide2.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_statistika`
--

CREATE TABLE IF NOT EXISTS `t_statistika` (
  `id_statistika` int(5) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `online` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_statistika`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data untuk tabel `t_statistika`
--

INSERT INTO `t_statistika` (`id_statistika`, `ip`, `tanggal`, `hits`, `online`) VALUES
(2, '::1', '2018-08-05', 68, '1533419899'),
(3, '::1', '2018-08-06', 11, '1533537681'),
(4, '::1', '2018-08-08', 13, '1533734444'),
(5, '::1', '2018-08-09', 2, '1533803377'),
(6, '::1', '2018-08-12', 2, '1534071366');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tagihan`
--

CREATE TABLE IF NOT EXISTS `t_tagihan` (
  `id_tagihan` int(10) NOT NULL AUTO_INCREMENT,
  `id_member` int(10) NOT NULL,
  `tgl_tagihan` date NOT NULL,
  `total_tagihan` int(50) NOT NULL,
  `foto_faktur` varchar(100) NOT NULL,
  `status_tagihan` enum('Belum Lunas','Lunas') NOT NULL DEFAULT 'Belum Lunas',
  `no_resi` varchar(100) NOT NULL,
  `kurir` varchar(100) NOT NULL,
  PRIMARY KEY (`id_tagihan`),
  KEY `t_tagihan_ibfk_2` (`id_member`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `t_tagihan`
--

INSERT INTO `t_tagihan` (`id_tagihan`, `id_member`, `tgl_tagihan`, `total_tagihan`, `foto_faktur`, `status_tagihan`, `no_resi`, `kurir`) VALUES
(1, 1, '2018-08-05', 2905000, '', 'Belum Lunas', '', ''),
(2, 1, '2018-08-05', 215000, '', 'Belum Lunas', '', ''),
(3, 1, '2018-08-05', 66000000, '', 'Belum Lunas', '', ''),
(4, 1, '2018-08-05', 135000, '', 'Belum Lunas', '', ''),
(5, 2, '2018-08-05', 115000, './images/konfirmasi/5.jpg', 'Lunas', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_templates`
--

CREATE TABLE IF NOT EXISTS `t_templates` (
  `id_template` int(5) NOT NULL AUTO_INCREMENT,
  `nama_template` varchar(30) NOT NULL,
  `lokasi_template` varchar(100) NOT NULL,
  `aktif_template` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_template`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `t_templates`
--

INSERT INTO `t_templates` (`id_template`, `nama_template`, `lokasi_template`, `aktif_template`) VALUES
(1, 'Win Merch', 'winmerch/', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_testimonial`
--

CREATE TABLE IF NOT EXISTS `t_testimonial` (
  `id_testimonial` int(5) NOT NULL AUTO_INCREMENT,
  `id_member` int(10) NOT NULL,
  `isi_testimonial` varchar(100) NOT NULL,
  `tgl_testimonial` date NOT NULL,
  `tampil` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_testimonial`),
  KEY `id_member` (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data untuk tabel `t_testimonial`
--


-- --------------------------------------------------------

--
-- Struktur dari tabel `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `level` enum('super admin','admin') NOT NULL,
  `last_login` varchar(40) NOT NULL,
  `ip_login` varchar(40) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `t_user`
--

INSERT INTO `t_user` (`id_user`, `username`, `password`, `email`, `level`, `last_login`, `ip_login`) VALUES
(1, 'Admin', '771b40499df3ec93265589517f8486bb', 'mail@nusamandiri.ac.id', 'super admin', '01-08-2018 15:22', '::1'),
(2, 'Budi', '771b40499df3ec93265589517f8486bb', 'mail@nusamandiri.ac.id', 'admin', '01-08-2018 12:42', '::1');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `t_keranjang`
--
ALTER TABLE `t_keranjang`
  ADD CONSTRAINT `t_keranjang_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `t_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_keranjang_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `t_member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_order`
--
ALTER TABLE `t_order`
  ADD CONSTRAINT `t_order_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `t_member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_order_ibfk_3` FOREIGN KEY (`id_produk`) REFERENCES `t_produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_order_ibfk_4` FOREIGN KEY (`id_tagihan`) REFERENCES `t_tagihan` (`id_tagihan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_produk`
--
ALTER TABLE `t_produk`
  ADD CONSTRAINT `t_produk_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `t_kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_tagihan`
--
ALTER TABLE `t_tagihan`
  ADD CONSTRAINT `t_tagihan_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `t_member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `t_testimonial`
--
ALTER TABLE `t_testimonial`
  ADD CONSTRAINT `t_testimonial_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `t_member` (`id_member`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
