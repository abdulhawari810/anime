-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSanimeQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for anime
DROP DATABASE IF EXISTS `anime`;
CREATE DATABASE IF NOT EXISTS `anime` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `anime`;

-- Dumping structure for table anime.anime
DROP TABLE IF EXISTS `anime`;
CREATE TABLE IF NOT EXISTS `anime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `thumbnail` text NOT NULL,
  `musim` varchar(255) DEFAULT '??',
  `studio` varchar(255) DEFAULT '??',
  `negara` varchar(255) DEFAULT '??',
  `adaptasi` varchar(255) DEFAULT '??',
  `kualitas` varchar(255) DEFAULT '??',
  `durasi` varchar(255) DEFAULT '??',
  `rating` varchar(255) DEFAULT '??',
  `tipe` varchar(255) DEFAULT '??',
  `demografis` varchar(255) DEFAULT '??',
  `eksplisit` varchar(255) DEFAULT '??',
  `kredit` varchar(255) DEFAULT '??',
  `status` varchar(255) DEFAULT 'on-going',
  `total_eps` int DEFAULT '0',
  `skor` int DEFAULT '0',
  `peminat` int DEFAULT '0',
  `genre` text,
  `deskripsi` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table anime.anime: ~3 rows (approximately)
REPLACE INTO `anime` (`id`, `slug`, `judul`, `thumbnail`, `musim`, `studio`, `negara`, `adaptasi`, `kualitas`, `durasi`, `rating`, `tipe`, `demografis`, `eksplisit`, `kredit`, `status`, `total_eps`, `skor`, `peminat`, `genre`, `deskripsi`, `createdAt`, `updatedAt`) VALUES
	(1, 'one-piece', 'One Piece', 'https://trzaxrdmotoeoskpfgzn.supabase.co/storage/v1/object/sign/anime/one-piece/thumbnail/images.jpeg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV83ZmEzMGRjMy0xYTljLTQxMjAtYWFlNy1iNGQwNjQzMzc3NjEiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJhbmltZS9vbmUtcGllY2UvdGh1bWJuYWlsL2ltYWdlcy5qcGVnIiwiaWF0IjoxNzYyMTgyMzQzLCJleHAiOjE3OTM3MTgzNDN9.IEPYfQ88n07YevQtTGzdwq31sBtCN43EneASClN3cDU', 'Fall 1999', 'Toei Animation', 'Jepang', 'Manga', 'HD', '24 menit per episode', 'PG-13 - Remaja 13 tahun ke atas', 'TV', '??', '??', 'kingmrx', 'Sedang Tayang', 0, 8, 1977028, '["Action","Adventure","Fantasy"]', '<p>One Piece, ONE PIECE, OP</p><p>Gol D. Roger dikenal sebagai \'Raja Bajak Laut\', makhluk terkuat dan paling terkenal yang pernah mengarungi Grand Line.</p><p>Penangkapan dan eksekusi Roger oleh Pemerintah Dunia membawa perubahan di seluruh dunia. Kata-kata terakhirnya sebelum kematiannya mengungkapkan keberadaan harta karun terbesar di dunia, One Piece.</p><p>Wahyu inilah yang membawa Grand Age of Pirates, pria yang bermimpi menemukan One Piece—yang menjanjikan kekayaan dan ketenaran yang tak terbatas—dan sangat mungkin puncak kejayaan dan gelar Raja Bajak Laut. Masukkan Monkey D.</p><p>Luffy, seorang bocah 17 tahun yang menentang definisi standar Anda tentang bajak laut. Alih-alih persona populer dari bajak laut yang jahat, keras, dan ompong yang mengobrak-abrik desa untuk bersenang-senang, alasan Luffy menjadi bajak laut adalah salah satu keajaiban murni: pemikiran tentang petualangan seru yang membawanya ke orang-orang yang menarik dan akhirnya, harta yang dijanjikan.</p><p>Mengikuti jejak pahlawan masa kecilnya, Luffy dan krunya melakukan perjalanan melintasi Grand Line, mengalami petualangan gila, mengungkap misteri gelap, dan melawan musuh yang kuat, semuanya untuk mencapai kekayaan yang paling didambakan—One Piece. [Ditulis oleh MAL Penulisan Ulang]</p>', '2025-11-03 15:17:47', '2025-11-03 15:17:47'),
	(2, 'overlord', 'Overlord', 'https://trzaxrdmotoeoskpfgzn.supabase.co/storage/v1/object/sign/anime/Overlord/thumbnail/20250426-1745674380-32167996-8bc1-47ab-96cd-0937857364d5_.webp?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV83ZmEzMGRjMy0xYTljLTQxMjAtYWFlNy1iNGQwNjQzMzc3NjEiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJhbmltZS9PdmVybG9yZC90aHVtYm5haWwvMjAyNTA0MjYtMTc0NTY3NDM4MC0zMjE2Nzk5Ni04YmMxLTQ3YWItOTZjZC0wOTM3ODU3MzY0ZDVfLndlYnAiLCJpYXQiOjE3NjIxODMyNzEsImV4cCI6MTc5MzcxOTI3MX0.IRkY1crxC0bCB6tp1M3CRz6Ukz5rFHhvNvftxJ7E-o8', 'Summer 2015', 'Madhouse', 'Jepang', 'Novel Ringan', 'BD', '24 menit per episode', 'R - 17+ (kekerasan & kata-kata kotor)', 'TV', '??', '??', 'kingmrx', 'Selesai Tayang', 13, 8, 1684253, '["Action","Adventure","Fantasy"]', '<p>Overlord, オーバーロード, Over Lord, โอเวอร์ลอร์ด, โอเวอร์ ลอร์ด จอมมารพิชิตโลก</p><p>Jam terakhir dari game realitas virtual populer Yggdrasil telah tiba. Namun, Momonga, penyihir yang kuat dan penguasa serikat gelap Ainz Ooal Gown, memutuskan untuk menghabiskan waktu terakhirnya di dalam game saat server mulai mati. Yang mengejutkannya, meskipun waktu telah menunjukkan tengah malam, Momonga masih sepenuhnya sadar sebagai karakternya dan, terlebih lagi, karakter non-pemain tampaknya telah mengembangkan kepribadian mereka sendiri!</p><p>Dihadapkan dengan situasi yang tidak normal ini, Momonga memerintahkan para pelayan setianya untuk membantunya menyelidiki dan mengendalikan dunia baru ini, dengan harapan dapat menemukan apa yang menyebabkan perkembangan ini dan apakah ada orang lain yang mengalami hal yang sama.</p><p>[Ditulis oleh MAL Menulis Ulang]</p>', '2025-11-03 15:21:46', '2025-11-03 15:21:46'),
	(3, 'tensei-shitara-slime-datta-ken', 'Tensei shitara Slime Datta Ken', 'https://trzaxrdmotoeoskpfgzn.supabase.co/storage/v1/object/sign/anime/tensei-shittara-datta-ken/thumbnail/123309l.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV83ZmEzMGRjMy0xYTljLTQxMjAtYWFlNy1iNGQwNjQzMzc3NjEiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJhbmltZS90ZW5zZWktc2hpdHRhcmEtZGF0dGEta2VuL3RodW1ibmFpbC8xMjMzMDlsLmpwZyIsImlhdCI6MTc2MjE4Mzg0NCwiZXhwIjoxNzkzNzE5ODQ0fQ.pzF0rYHU6lcerPWO6SkgynGjIrSCg6iSjH2JaPWxE04', 'Fall 2018', '8Bit', 'Jepang', 'Manga', 'BD', '23 menit per episode', 'PG-13 - Remaja berusia 13 tahun ke atas', 'TV', '??', '??', 'kingmrx', 'Selesai Tayang', 24, 8, 1362751, '["Action","Adventure","Fantasy"]', '<p>That Time I Got Reincarnated as a Slime, 転生したらスライムだった件, TenSura</p><p>Satoru Mikami yang berusia tiga puluh tujuh tahun adalah tipikal pekerja korporat, yang sangat puas dengan gaya hidupnya yang monoton di Tokyo, selain gagal mendapatkan pacar sekali pun sepanjang hidupnya. Di tengah pertemuan biasa dengan rekannya, dia menjadi korban penyerang acak di jalanan dan ditikam. Namun, saat ia menyerah pada luka-lukanya, sebuah suara aneh bergema di benaknya, dan mengucapkan serangkaian perintah yang tidak dapat dipahami oleh orang yang sekarat itu.</p><p>Ketika Satoru sadar kembali, ia menemukan bahwa ia telah bereinkarnasi sebagai seorang goop slime di alam asing. Dengan melakukan hal itu, dia memperoleh keterampilan baru—terutama, kekuatan untuk melahap apa pun dan meniru penampilan serta kemampuannya. Dia kemudian menemukan monster tingkat Bencana yang tersegel \'Naga Badai\' Veldora yang telah disegel selama 300 tahun terakhir karena menghancurkan sebuah kota menjadi abu. Bersimpati dengan kesulitannya, Satoru berteman dengannya, berjanji untuk membantu menghancurkan segelnya. Sebagai imbalannya, Veldora menganugerahkan kepadanya nama Rimuru Tempest untuk memberinya perlindungan ilahi.</p><p>Sekarang, terbebas dari kehidupan masa lalunya yang biasa-biasa saja, Rimuru memulai perjalanan baru dengan tujuan yang jelas. Saat ia mulai terbiasa dengan fisik barunya, kejenakaannya menyebar ke seluruh dunia, secara bertahap mengubah nasibnya.</p><p>[Ditulis oleh MAL Rewrite]</p>', '2025-11-03 15:30:54', '2025-11-03 15:30:54');

-- Dumping structure for table anime.episode
DROP TABLE IF EXISTS `episode`;
CREATE TABLE IF NOT EXISTS `episode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `episodeNumber` int DEFAULT '0',
  `videoURL` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `animeID` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `animeID` (`animeID`),
  CONSTRAINT `episode_ibfk_1` FOREIGN KEY (`animeID`) REFERENCES `anime` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table anime.episode: ~46 rows (approximately)
REPLACE INTO `episode` (`id`, `title`, `episodeNumber`, `videoURL`, `createdAt`, `updatedAt`, `animeID`) VALUES
	(8, 'Naga Badai, Veldora', 1, '{"720p":"https://waguri.my.id/kdrive/P4LrBNlq1QT/Kuramanime-TSSDK_BD-01-720p-MangaNeko.mp4?lud=1743509991&pid=60&sid=2342&cce=1","480p":"https://waguri.my.id/kdrive/ZPAuIf3yzkM/Kuramanime-TSSDK_BD-01-480p-MangaNeko.mp4?lud=1743509991&pid=60&sid=2341&cce=1","360p":"https://waguri.my.id/kdrive/hecjbB5jADI/Kuramanime-TSSDK_BD-01-360p-MangaNeko.mp4?lud=1743509991&pid=60&sid=2340&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(9, 'Bertemu Iblis', 2, '{"720p":"https://mushoku.my.id/kdrive/70uan4yTGoh/Kuramanime-TSSDK_BD-02-720p-MangaNeko.mp4?lud=1743509991&pid=61&sid=2347&cce=1","480p":"https://mushoku.my.id/kdrive/ukajoifbzHK/Kuramanime-TSSDK_BD-02-480p-MangaNeko.mp4?lud=1743509991&pid=61&sid=2346&cce=1","360p":"https://mushoku.my.id/kdrive/IdQX02ZZ9nH/Kuramanime-TSSDK_BD-02-360p-MangaNeko.mp4?lud=1743509991&pid=61&sid=2345&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(10, 'Pertempuran di desa Goblin', 3, '{"720p":"https://mutsumi.my.id/kdrive/ZPyTAJ3YDoE/Kuramanime-TSSDK_BD-03-720p-MangaNeko.mp4?lud=1743509992&pid=62&sid=2352&cce=1","480p":"https://mutsumi.my.id/kdrive/W03JsyYbTz5/Kuramanime-TSSDK_BD-03-480p-MangaNeko.mp4?lud=1743509991&pid=62&sid=2351&cce=1","360p":"https://mutsumi.my.id/kdrive/geamcKhu8hf/Kuramanime-TSSDK_BD-03-360p-MangaNeko.mp4?lud=1743509991&pid=62&sid=2350&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(11, 'Di kerajaan kurcaci', 4, '{"720p":"https://yae.my.id/kdrive/EAkj9mHjZNp/Kuramanime-TSSDK_BD-04-720p-MangaNeko.mp4?lud=1743509992&pid=63&sid=2357&cce=1","480p":"https://yae.my.id/kdrive/1ryUy4MsV6D/Kuramanime-TSSDK_BD-04-480p-MangaNeko.mp4?lud=1743509992&pid=63&sid=2356&cce=1","360p":"https://yae.my.id/kdrive/5nwF07r2GFt/Kuramanime-TSSDK_BD-04-360p-MangaNeko.mp4?lud=1743509992&pid=63&sid=2355&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(12, 'Raja Pahlawan, Gazel Dwargo', 5, '{"720p":"https://milim.my.id/kdrive/vjoaE7y1DLp/Kuramanime-TSSDK_BD-05-720p-MangaNeko.mp4?lud=1743509992&pid=64&sid=2362&cce=1","480p":"https://milim.my.id/kdrive/LQgDDBKFprf/Kuramanime-TSSDK_BD-05-480p-MangaNeko.mp4?lud=1743509992&pid=64&sid=2361&cce=1","360p":"https://milim.my.id/kdrive/nQZDSveUo9e/Kuramanime-TSSDK_BD-05-360p-MangaNeko.mp4?lud=1743509992&pid=64&sid=2360&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(13, 'Shizue Izawa', 6, '{"720p":"https://kikoru.my.id/kdrive/SR5rchOtznM/Kuramanime-TSSDK_BD-06-720p-MangaNeko.mp4?lud=1743509992&pid=65&sid=2367&cce=1","480p":"https://kikoru.my.id/kdrive/BVf3kl0CUrf/Kuramanime-TSSDK_BD-06-480p-MangaNeko.mp4?lud=1743509992&pid=65&sid=2366&cce=1","360p":"https://kikoru.my.id/kdrive/f5kU0Ul3GVS/Kuramanime-TSSDK_BD-06-360p-MangaNeko.mp4?lud=1743509992&pid=65&sid=2365&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(14, 'Penakluk Api', 7, '{"720p":"https://mutsumi.my.id/kdrive/j9uhYyqL2IW/Kuramanime-TSSDK_BD-07-720p-MangaNeko.mp4?lud=1743509992&pid=66&sid=2372&cce=1","480p":"https://mutsumi.my.id/kdrive/JeqCRwEJirp/Kuramanime-TSSDK_BD-07-480p-MangaNeko.mp4?lud=1743509992&pid=66&sid=2371&cce=1","360p":"https://mutsumi.my.id/kdrive/rl5v3AWjoDv/Kuramanime-TSSDK_BD-07-360p-MangaNeko.mp4?lud=1743509992&pid=66&sid=2370&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(15, 'Yang akan Terjadi', 8, '{"720p":"https://lena.my.id/kdrive/jVCkZ1mLorb/Kuramanime-TSSDK_BD-08-720p-MangaNeko.mp4?lud=1743509992&pid=67&sid=2377&cce=1","480p":"https://lena.my.id/kdrive/P5TrOzVnfkR/Kuramanime-TSSDK_BD-08-480p-MangaNeko.mp4?lud=1743509992&pid=67&sid=2376&cce=1","360p":"https://lena.my.id/kdrive/jwZPZ4ZhYAr/Kuramanime-TSSDK_BD-08-360p-MangaNeko.mp4?lud=1743509992&pid=67&sid=2375&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(16, 'Serang Para Ogre', 9, '{"720p":"https://sinon.my.id/kdrive/o1BzCdpiNuc/Kuramanime-TSSDK_BD-09-720p-MangaNeko.mp4?lud=1743509992&pid=68&sid=2382&cce=1","480p":"https://sinon.my.id/kdrive/cSz84IBZxZV/Kuramanime-TSSDK_BD-09-480p-MangaNeko.mp4?lud=1743509992&pid=68&sid=2381&cce=1","360p":"https://sinon.my.id/kdrive/dr7gMwek2HN/Kuramanime-TSSDK_BD-09-360p-MangaNeko.mp4?lud=1743509992&pid=68&sid=2380&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(17, 'Dewa Orc', 10, '{"720p":"https://chisato.my.id/kdrive/MTlaglqjpYc/Kuramanime-TSSDK_BD-10-720p-MangaNeko.mp4?lud=1743509992&pid=69&sid=2392&cce=1","480p":"https://chisato.my.id/kdrive/PawF1tyRCnB/Kuramanime-TSSDK_BD-10-480p-MangaNeko.mp4?lud=1743509992&pid=69&sid=2391&cce=1","360p":"https://chisato.my.id/kdrive/ct8pJDt7MEK/Kuramanime-TSSDK_BD-10-360p-MangaNeko.mp4?lud=1743509992&pid=69&sid=2390&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(18, 'Gabiru Disini', 11, '{"720p":"https://lloyd.my.id/kdrive/lBFO6a5fvbH/Kuramanime-TSSDK_BD-11-720p-MangaNeko.mp4?lud=1743509992&pid=70&sid=2397&cce=1","480p":"https://lloyd.my.id/kdrive/T0fYrvmh26i/Kuramanime-TSSDK_BD-11-480p-MangaNeko.mp4?lud=1743509992&pid=70&sid=2396&cce=1","360p":"https://lloyd.my.id/kdrive/M32bELNTIwV/Kuramanime-TSSDK_BD-11-360p-MangaNeko.mp4?lud=1743509992&pid=70&sid=2395&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(19, 'Gigi Berputar Diluar Kendali', 12, '{"720p":"https://miyuki.my.id/kdrive/TfkBZoolnS1/Kuramanime-TSSDK_BD-12-720p-MangaNeko.mp4?lud=1743509993&pid=71&sid=2402&cce=1","480p":"https://miyuki.my.id/kdrive/E8IOHJmThpi/Kuramanime-TSSDK_BD-12-480p-MangaNeko.mp4?lud=1743509992&pid=71&sid=2401&cce=1","360p":"https://miyuki.my.id/kdrive/vgSLdtOM5rC/Kuramanime-TSSDK_BD-12-360p-MangaNeko.mp4?lud=1743509992&pid=71&sid=2400&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(20, 'The Great Clash', 13, '{"720p":"https://chisa.my.id/kdrive/SH1wRkysTtL/Kuramanime-TSSDK_BD-13-720p-MangaNeko.mp4?lud=1743509993&pid=72&sid=2407&cce=1","480p":"https://chisa.my.id/kdrive/dzYZCxvv0ZO/Kuramanime-TSSDK_BD-13-480p-MangaNeko.mp4?lud=1743509993&pid=72&sid=2406&cce=1","360p":"https://chisa.my.id/kdrive/sAMqdN2by9g/Kuramanime-TSSDK_BD-13-360p-MangaNeko.mp4?lud=1743509993&pid=72&sid=2405&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(21, 'Orang Yang Akan Memakan Semuanya', 14, '{"720p":"https://lena.my.id/kdrive/XsGP47p51V8/Kuramanime-TSSDK_BD-14-720p-MangaNeko.mp4?lud=1743509993&pid=73&sid=2412&cce=1","480p":"https://lena.my.id/kdrive/nszL3AQJ1hg/Kuramanime-TSSDK_BD-14-480p-MangaNeko.mp4?lud=1743509993&pid=73&sid=2411&cce=1","360p":"https://lena.my.id/kdrive/WWxPA9YCMkW/Kuramanime-TSSDK_BD-14-360p-MangaNeko.mp4?lud=1743509993&pid=73&sid=2410&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(22, 'Persekutuan Hutan Jura', 15, '{"720p":"https://kobeni.my.id/kdrive/3bgcoirwidS/Kuramanime-TSSDK_BD-15-720p-MangaNeko.mp4?lud=1743509993&pid=74&sid=2417&cce=1","480p":"https://kobeni.my.id/kdrive/BaHLzGznh9F/Kuramanime-TSSDK_BD-15-480p-MangaNeko.mp4?lud=1743509993&pid=74&sid=2416&cce=1","360p":"https://kobeni.my.id/kdrive/hc1n9nqEABp/Kuramanime-TSSDK_BD-15-360p-MangaNeko.mp4?lud=1743509993&pid=74&sid=2415&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(23, 'Serangan Dewa Milim Iblis', 16, '{"720p":"https://kurisu.my.id/kdrive/kJNO4vmQXgk/Kuramanime-TSSDK_BD-16-720p-MangaNeko.mp4?lud=1743509993&pid=75&sid=2422&cce=1","480p":"https://kurisu.my.id/kdrive/4EfpykBe3RB/Kuramanime-TSSDK_BD-16-480p-MangaNeko.mp4?lud=1743509993&pid=75&sid=2421&cce=1","360p":"https://kurisu.my.id/kdrive/ZHmxpkW7k0T/Kuramanime-TSSDK_BD-16-360p-MangaNeko.mp4?lud=1743509993&pid=75&sid=2420&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(24, 'Pertemuan', 17, '{"720p":"https://kanae.my.id/kdrive/3DgyD2qCaad/Kuramanime-TSSDK_BD-17-720p-MangaNeko.mp4?lud=1743509993&pid=76&sid=2427&cce=1","480p":"https://kanae.my.id/kdrive/8OB7CN8qyt0/Kuramanime-TSSDK_BD-17-480p-MangaNeko.mp4?lud=1743509993&pid=76&sid=2426&cce=1","360p":"https://kanae.my.id/kdrive/5hS7J4ByFKC/Kuramanime-TSSDK_BD-17-360p-MangaNeko.mp4?lud=1743509993&pid=76&sid=2425&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(25, 'Iblis Merayap Lebih Dekat', 18, '{"720p":"https://asuna.my.id/kdrive/F2p8rqoTNE7/Kuramanime-TSSDK_BD-18-720p-MangaNeko.mp4?lud=1743509994&pid=77&sid=2432&cce=1","480p":"https://asuna.my.id/kdrive/vfk3NQHU1Ro/Kuramanime-TSSDK_BD-18-480p-MangaNeko.mp4?lud=1743509993&pid=77&sid=2431&cce=1","360p":"https://asuna.my.id/kdrive/VEDlLG8jW6r/Kuramanime-TSSDK_BD-18-360p-MangaNeko.mp4?lud=1743509993&pid=77&sid=2430&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(26, 'Charybdis', 19, '{"720p":"https://tiera.my.id/kdrive/9CIyMPwDUfE/Kuramanime-TSSDK_BD-19-720p-MangaNeko.mp4?lud=1743509994&pid=78&sid=2437&cce=1","480p":"https://tiera.my.id/kdrive/cQ2VEHTwxsU/Kuramanime-TSSDK_BD-19-480p-MangaNeko.mp4?lud=1743509994&pid=78&sid=2436&cce=1","360p":"https://tiera.my.id/kdrive/BUk6zP5ak6S/Kuramanime-TSSDK_BD-19-360p-MangaNeko.mp4?lud=1743509994&pid=78&sid=2435&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(27, 'Yuuki Kagurazaka', 20, '{"720p":"https://sinon.my.id/kdrive/pqtAQ3VxKBE/Kuramanime-TSSDK_BD-20-720p-MangaNeko.mp4?lud=1743509994&pid=79&sid=2442&cce=1","480p":"https://sinon.my.id/kdrive/3AoFbwH9V2a/Kuramanime-TSSDK_BD-20-480p-MangaNeko.mp4?lud=1743509994&pid=79&sid=2441&cce=1","360p":"https://sinon.my.id/kdrive/WqFPlRnEclb/Kuramanime-TSSDK_BD-20-360p-MangaNeko.mp4?lud=1743509994&pid=79&sid=2440&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(28, ' Siswa Shizue', 21, '{"720p":"https://kitasan.my.id/kdrive/WOY3wlaye7S/Kuramanime-TSSDK_BD-21-720p-MangaNeko.mp4?lud=1743509994&pid=80&sid=2447&cce=1","480p":"https://kitasan.my.id/kdrive/sVT58kCw2s5/Kuramanime-TSSDK_BD-21-480p-MangaNeko.mp4?lud=1743509994&pid=80&sid=2446&cce=1","360p":"https://kitasan.my.id/kdrive/JKHiNaG1yJr/Kuramanime-TSSDK_BD-21-360p-MangaNeko.mp4?lud=1743509994&pid=80&sid=2445&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(29, 'Menaklukan Labirin', 22, '{"720p":"https://yae.my.id/kdrive/tiShZjbYAjs/Kuramanime-TSSDK_BD-22-720p-MangaNeko.mp4?lud=1743509994&pid=81&sid=2452&cce=1","480p":"https://yae.my.id/kdrive/lasCv5Prhp1/Kuramanime-TSSDK_BD-22-480p-MangaNeko.mp4?lud=1743509994&pid=81&sid=2451&cce=1","360p":"https://yae.my.id/kdrive/DaSuydECsPZ/Kuramanime-TSSDK_BD-22-360p-MangaNeko.mp4?lud=1743509994&pid=81&sid=2450&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(30, 'Jiwa Yang Diselamatkan', 23, '{"720p":"https://makima.my.id/kdrive/CzKp9qEAQOg/Kuramanime-TSSDK_BD-23-720p-MangaNeko.mp4?lud=1743509994&pid=82&sid=2457&cce=1","480p":"https://makima.my.id/kdrive/vwHo15IMa0s/Kuramanime-TSSDK_BD-23-480p-MangaNeko.mp4?lud=1743509994&pid=82&sid=2456&cce=1","360p":"https://makima.my.id/kdrive/5CcFoc0Uks1/Kuramanime-TSSDK_BD-23-360p-MangaNeko.mp4?lud=1743509994&pid=82&sid=2455&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(31, 'Hitam dan Topeng', 24, '{"720p":"https://chinatsu.my.id/kdrive/f8P3O6vcLI1/Kuramanime-TSSDK_BD-24_END-720p-MangaNeko.mp4?lud=1743509994&pid=83&sid=2462&cce=1","480p":"https://chinatsu.my.id/kdrive/ywHQSl3UPMQ/Kuramanime-TSSDK_BD-24_END-480p-MangaNeko.mp4?lud=1743509994&pid=83&sid=2461&cce=1","360p":"https://chinatsu.my.id/kdrive/bJ8EqKHwT6z/Kuramanime-TSSDK_BD-24_END-360p-MangaNeko.mp4?lud=1743509994&pid=83&sid=2460&cce=1"}', '2025-11-04 05:30:12', '2025-11-04 05:30:12', 3),
	(33, 'Aku Luffy Orang Yang akan Jadi Raja Bajak Laut', 1, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=OFJYdGNoZmEwaG1MUkRtK2t6NHJXdz09","480p":"https://www.mp4upload.com/embed-695iym7rxctg.html","360p":"https://desudrive.com/stream/yuplod.php?id=F6i2rM12U1GM"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(34, 'Masukkan Pendekar Hebat! Pemburu bajak laut Roronoa Zoro!', 2, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=K09EQkpsSHNpbjZTdDM4SEgyRERMdz09","480p":"https://www.mp4upload.com/embed-2qx7w3rbn0e4.html","360p":"https://desudrive.com/stream/yuplod.php?id=mvYUj4Q0RK64"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(35, 'Morgan Melawan Luffy! Siapa Gadis Cantik Itu?', 3, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=S0s1RVV1dSsyVVc4cUJuRnlnYXd0dz09","480p":"https://www.mp4upload.com/embed-b55oif6aaip0.html","360p":"https://desudrive.com/stream/yuplod.php?id=rY181ST747lx"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(36, 'Luffy Masa lalu! Masukkan Shanks Si Bajak Laut Rambut Merah!', 4, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=TkJ5S3ZKenZydnI1bFp0ZjJESGloZz09","480p":"https://www.mp4upload.com/embed-2s489q4ufwud.html","360p":"https://desudrive.com/stream/yuplod.php?id=4N2e3TjnX010"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(37, 'Kekuatan Misterius! Kapten Buggy si Badut!', 5, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=cUl5bHk1M3JLdDg3Uk9GMXdXMUhVUT09","480p":"https://www.mp4upload.com/embed-xahtidv6cffvtxx.html","360p":"https://desudrive.com/stream/yuplod.php?id=61GP3k65Mptm"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(38, 'Situasi Putus Asa! Beast Tamer Mohji vs Luffy!', 6, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=Vk50eFdZcmhKNFlLQU5USDdjRXlodz09","480p":"https://www.mp4upload.com/embed-4cqyf307dcrd.html","360p":"https://desudrive.com/stream/yuplod.php?id=gTdP5h5X0G0Q"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(39, 'Pertarungan Hebat! Zoro vs Cabaji si Acrobat!', 7, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=cUtuQlQ5eFZOSk9neXJLRkxWZmRsdz09","480p":"https://www.mp4upload.com/embed-zcx68i4enc4u.html","360p":"https://desudrive.com/stream/yuplod.php?id=rRdwI747oiX5"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(40, 'Siapa Pemenangnya? Luffy vs Buggy!', 8, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=YTJMZHoxdWJnTHl6RVZ0VkJVMmYwZz09","480p":"https://www.mp4upload.com/embed-u9r2coy3i0zx.html","360p":"https://desudrive.com/stream/yuplod.php?id=E5T2mJ11ARVK"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(41, 'Pembohong Terhormat! Kapten Usopp!', 9, '{"720p":"https://desustream.info/dstream/moedesu/hd/v3/index.php?id=LzUzQXdMdHFqOXNZRmw5TTVrbko1dz09","480p":"https://www.mp4upload.com/embed-ocbc692h004y.html","360p":"https://desudrive.com/stream/yuplod.php?id=3b0JIq5m3YIp"}', '2025-11-04 05:55:09', '2025-11-04 05:55:09', 1),
	(42, 'Akhir Dan Awal', 1, '{"720p":"https://momo.my.id/kdrive/8ow8SRIcVZh/Kuramanime-OVLORD_BD-01-720p-Neo.mp4?lud=1743502420&pid=5333&sid=27377&cce=1","480p":"https://momo.my.id/kdrive/Mbm193QiH1S/Kuramanime-OVLORD_BD-01-480p-Neo.mp4?lud=1743502420&pid=5333&sid=27376&cce=1","360p":"https://momo.my.id/kdrive/ChrFR2u9ZDq/Kuramanime-OVLORD_BD-01-360p-Neo.mp4?lud=1743502420&pid=5333&sid=27375&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(43, 'Penjaga Lantai', 2, '{"720p":"https://mushoku.my.id/kdrive/v4ef1BDz4RI/Kuramanime-OVLORD_BD-02-720p-Neo.mp4?lud=1743502420&pid=5334&sid=27382&cce=1","480p":"https://mushoku.my.id/kdrive/dHxgAJ9I5QC/Kuramanime-OVLORD_BD-02-480p-Neo.mp4?lud=1743502420&pid=5334&sid=27381&cce=1","360p":"https://mushoku.my.id/kdrive/Pk29YiAI5tU/Kuramanime-OVLORD_BD-02-360p-Neo.mp4?lud=1743502420&pid=5334&sid=27380&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(44, 'Pertempuran Di Desa Re-Estize', 3, '{"720p":"https://kaede.my.id/kdrive/xYP1Q2PbunO/Kuramanime-OVLORD_BD-03-720p-Neo.mp4?lud=1743502420&pid=5335&sid=27387&cce=1","480p":"https://kaede.my.id/kdrive/z8zcE261ozA/Kuramanime-OVLORD_BD-03-480p-Neo.mp4?lud=1743502420&pid=5335&sid=27386&cce=1","360p":"https://kaede.my.id/kdrive/F7h9oxWzL3w/Kuramanime-OVLORD_BD-03-360p-Neo.mp4?lud=1743502420&pid=5335&sid=27385&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(45, 'Peraturan  Kematian', 4, '{"720p":"https://kaede.my.id/kdrive/PwpOyuXegcQ/Kuramanime-OVLORD_BD-04-720p-Neo.mp4?lud=1743502420&pid=5336&sid=27392&cce=1","480p":"https://kaede.my.id/kdrive/4GjvX6s2BhP/Kuramanime-OVLORD_BD-04-480p-Neo.mp4?lud=1743502420&pid=5336&sid=27391&cce=1","360p":"https://kaede.my.id/kdrive/xdpzrH4FiNv/Kuramanime-OVLORD_BD-04-360p-Neo.mp4?lud=1743502420&pid=5336&sid=27390&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(46, 'Dua Petualang', 5, '{"720p":"https://momo.my.id/kdrive/9w6Bzuxvay9/Kuramanime-OVLORD_BD-05-720p-Neo.mp4?lud=1743502420&pid=5337&sid=27397&cce=1","480p":"https://momo.my.id/kdrive/UpNNxhruKPP/Kuramanime-OVLORD_BD-05-480p-Neo.mp4?lud=1743502420&pid=5337&sid=27396&cce=1","360p":"https://momo.my.id/kdrive/tsvZdh7d4tp/Kuramanime-OVLORD_BD-05-360p-Neo.mp4?lud=1743502420&pid=5337&sid=27395&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(47, 'Perjalanan', 6, '{"720p":"https://tinasha.my.id/kdrive/W6bpDEbMKA9/Kuramanime-OVLORD_BD-06-720p-Neo.mp4?lud=1743502420&pid=5338&sid=27402&cce=1","480p":"https://tinasha.my.id/kdrive/VMFwaqn7TLF/Kuramanime-OVLORD_BD-06-480p-Neo.mp4?lud=1743502420&pid=5338&sid=27401&cce=1","360p":"https://tinasha.my.id/kdrive/h8I82QTmOSF/Kuramanime-OVLORD_BD-06-360p-Neo.mp4?lud=1743502420&pid=5338&sid=27400&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(48, 'Raja Wise Of the Forest', 7, '{"720p":"https://makima.my.id/kdrive/lRVtzYzWlon/Kuramanime-OVLORD_BD-07-720p-Neo.mp4?lud=1743502420&pid=5339&sid=27407&cce=1","480p":"https://makima.my.id/kdrive/izFY832GHz8/Kuramanime-OVLORD_BD-07-480p-Neo.mp4?lud=1743502420&pid=5339&sid=27406&cce=1","360p":"https://makima.my.id/kdrive/YYgAmGxibhU/Kuramanime-OVLORD_BD-07-360p-Neo.mp4?lud=1743502420&pid=5339&sid=27405&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(49, 'Pedang Kembar Dari Menyayat Kematian', 8, '{"720p":"https://waguri.my.id/kdrive/B26xsDpEp4x/Kuramanime-OVLORD_BD-08-720p-Neo.mp4?lud=1743502420&pid=5340&sid=27412&cce=1","480p":"https://waguri.my.id/kdrive/Fs1G1wfDZmy/Kuramanime-OVLORD_BD-08-480p-Neo.mp4?lud=1743502420&pid=5340&sid=27411&cce=1","360p":"https://waguri.my.id/kdrive/BJDu0KnztlA/Kuramanime-OVLORD_BD-08-360p-Neo.mp4?lud=1743502420&pid=5340&sid=27410&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(50, 'Prajurit Kegelapan', 9, '{"720p":"https://chinatsu.my.id/kdrive/HHU18NE9cyp/Kuramanime-OVLORD_BD-09-720p-Neo.mp4?lud=1743502420&pid=5341&sid=27417&cce=1","480p":"https://chinatsu.my.id/kdrive/wZ7RuU8RLKX/Kuramanime-OVLORD_BD-09-480p-Neo.mp4?lud=1743502420&pid=5341&sid=27416&cce=1","360p":"https://chinatsu.my.id/kdrive/kAyFUmdwyOG/Kuramanime-OVLORD_BD-09-360p-Neo.mp4?lud=1743502420&pid=5341&sid=27415&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(51, 'Vampir Shaltear Bloodfallen', 10, '{"720p":"https://shinoaki.my.id/kdrive/T9cRtO8VftX/Kuramanime-OVLORD_BD-10-720p-Neo.mp4?lud=1743502421&pid=5342&sid=27422&cce=1","480p":"https://shinoaki.my.id/kdrive/qZCm9bOFMYW/Kuramanime-OVLORD_BD-10-480p-Neo.mp4?lud=1743502421&pid=5342&sid=27421&cce=1","360p":"https://shinoaki.my.id/kdrive/9xWEXv3KUTk/Kuramanime-OVLORD_BD-10-360p-Neo.mp4?lud=1743502421&pid=5342&sid=27420&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(52, 'Kebingungan Dan Pemahaman', 11, '{"720p":"https://kanae.my.id/kdrive/gvJj7hYxzhG/Kuramanime-OVLORD_BD-11-720p-Neo.mp4?lud=1743502421&pid=5343&sid=27427&cce=1","480p":"https://kanae.my.id/kdrive/XNN8Aj3mfsv/Kuramanime-OVLORD_BD-11-480p-Neo.mp4?lud=1743502421&pid=5343&sid=27426&cce=1","360p":"https://kanae.my.id/kdrive/V9aCME4ehyt/Kuramanime-OVLORD_BD-11-360p-Neo.mp4?lud=1743502421&pid=5343&sid=27425&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(53, 'Valkyrie Berdarah', 12, '{"720p":"https://kitasan.my.id/kdrive/EgdBRNLvJIE/Kuramanime-OVLORD_BD-12-720p-Neo.mp4?lud=1743502421&pid=5344&sid=27432&cce=1","480p":"https://kitasan.my.id/kdrive/kOzy0aEq84B/Kuramanime-OVLORD_BD-12-480p-Neo.mp4?lud=1743502421&pid=5344&sid=27431&cce=1","360p":"https://kitasan.my.id/kdrive/RPbWpudVvYC/Kuramanime-OVLORD_BD-12-360p-Neo.mp4?lud=1743502421&pid=5344&sid=27430&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2),
	(54, 'Player vs non-Player Karakter', 13, '{"720p":"https://leshea.my.id/kdrive/eEKvXXqI8eY/Kuramanime-OVLORD_BD-13_END-720p-Neo.mp4?lud=1743502421&pid=5345&sid=27437&cce=1","480p":"https://leshea.my.id/kdrive/VVrP3lUVJkc/Kuramanime-OVLORD_BD-13_END-480p-Neo.mp4?lud=1743502421&pid=5345&sid=27436&cce=1","360p":"https://leshea.my.id/kdrive/WXBnnEHjRte/Kuramanime-OVLORD_BD-13_END-360p-Neo.mp4?lud=1743502421&pid=5345&sid=27435&cce=1"}', '2025-11-04 06:09:18', '2025-11-04 06:09:18', 2);

-- Dumping structure for table anime.jadwal_anime
DROP TABLE IF EXISTS `jadwal_anime`;
CREATE TABLE IF NOT EXISTS `jadwal_anime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hari` varchar(255) NOT NULL,
  `waktu_rilis` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `anime_key` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `anime_key` (`anime_key`),
  CONSTRAINT `jadwal_anime_ibfk_1` FOREIGN KEY (`anime_key`) REFERENCES `anime` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table anime.jadwal_anime: ~1 rows (approximately)
REPLACE INTO `jadwal_anime` (`id`, `hari`, `waktu_rilis`, `createdAt`, `updatedAt`, `anime_key`) VALUES
	(1, 'Minggu', '2025-11-06 22:00:00', '2025-11-06 07:16:34', '2025-11-06 07:16:34', 1);

-- Dumping structure for table anime.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT 'default.png',
  `role` varchar(255) DEFAULT 'users',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table anime.users: ~2 rows (approximately)
REPLACE INTO `users` (`id`, `uuid`, `username`, `email`, `password`, `profile`, `role`, `createdAt`, `updatedAt`) VALUES
	(1, '2f4feffe-4f4c-4bef-8f80-82769bb54aac', 'admin', 'admin@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$SFRfLE3ajGwO7QrflBE54Q$mZHkSBLr8wEHiNaDKhdCNXO8rrhhO9qxsnWul45BVfI', 'default.png', 'admin', '2025-11-02 15:59:33', '2025-11-02 15:59:33'),
	(2, '3ce71629-d72d-489b-a7e3-5e025a423841', 'kingmrx', 'kingmrx@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$aYWPardCKs8O+1Leh/hg4Q$dK230sHrBbNVyhQYYIjFBI0tuLumWT7m2hDeXC3u7hk', 'default.png', 'users', '2025-11-02 15:59:47', '2025-11-02 15:59:47'),
	(3, '3f42a3f1-f8df-42b7-b2b8-03dd95a9e240', 'king111', 'kingmrx111@gmail.com', '$argon2id$v=19$m=65536,t=3,p=4$qaNreCZxSyZhUX8P8E4elA$8Hatr5kVlAZJGNdAU+XlM1VnsTxG2KqE540gL81aJNk', 'default.png', 'users', '2025-11-05 05:42:51', '2025-11-05 05:42:51');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
