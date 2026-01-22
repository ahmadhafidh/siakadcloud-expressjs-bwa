-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 21, 2026 at 11:06 PM
-- Server version: 8.0.36
-- PHP Version: 8.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bwa_siakadcloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `academyyear`
--

CREATE TABLE `academyyear` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateStart` datetime(3) NOT NULL,
  `dateEnd` datetime(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `academyyear`
--

INSERT INTO `academyyear` (`id`, `name`, `dateStart`, `dateEnd`, `status`, `createdAt`, `updatedAt`) VALUES
('009962c0-64d1-457f-848a-9528459d8dde', 'Test', '2025-12-01 00:00:00.000', '2025-12-01 00:00:00.000', 1, '2025-12-15 04:00:21.275', '2025-12-15 06:38:02.890'),
('3772d6eb-475e-4684-b3bf-9fddbbbadfd3', 'Tahun Akademik 2025/2026 Gasal', '2025-07-01 00:00:00.000', '2025-12-01 00:00:00.000', 1, '2025-08-13 03:01:16.732', '2025-09-16 08:28:34.160'),
('8612dfb9-b81f-4cc9-89e4-a6a1df53e4a9', 'Tahun Akademik 2026/2027 Gasal', '2026-07-01 00:00:00.000', '2026-12-01 00:00:00.000', 1, '2025-09-16 08:30:36.032', '2025-09-16 08:30:36.032'),
('9b4f2bb3-eb50-4903-afa2-2adcca49f626', 'Tahun Akademik 2026/2027 Genap', '2027-01-01 00:00:00.000', '2027-06-01 00:00:00.000', 1, '2025-09-16 08:31:10.518', '2025-12-14 14:44:12.952'),
('be758f68-5cba-4a5e-aadb-324e4bb3a8cc', 'Tahun Akademik 2025/2026 Genap', '2026-01-01 00:00:00.000', '2026-06-01 00:00:00.000', 1, '2025-09-16 08:29:21.155', '2025-09-16 08:29:26.079');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majorId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yearId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `name`, `majorId`, `yearId`, `createdAt`, `updatedAt`) VALUES
('26cbc3bf-4515-4c42-aa86-828cb9c6aee5', 'MTK B', '07754934-7ae8-4995-ab52-c3291fe910ae', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:33:49.449', '2025-09-16 08:33:49.449'),
('4cdd8374-6ff2-4bc0-983e-d813d33a5226', 'JPN C', '335894c8-685a-4797-8977-1ac025c140b8', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:35:09.522', '2025-09-16 08:35:09.522'),
('54bf7fc6-18c5-4ebb-8006-e9e8d188223b', 'JPN A', '3335cfe6-7640-4f39-a8f4-f2b66282fc0f', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:34:32.960', '2025-12-17 08:47:46.782'),
('5c60325c-c49b-4cf9-9e8b-bee7621b74c8', 'MTK A', '07754934-7ae8-4995-ab52-c3291fe910ae', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:33:32.470', '2025-09-16 08:33:32.470'),
('6f013b11-e4f7-4204-9b38-ba6ac6c77394', 'TI C', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-08-15 07:33:33.003', '2025-09-02 08:14:50.342'),
('724f06a2-7d45-4b7e-aa45-36da67cb677e', 'TI D', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:32:58.049', '2025-09-16 08:32:58.049'),
('a47b475b-af96-4bd6-980d-e5b255497dec', 'TI A ', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-08-13 03:03:57.128', '2025-09-16 08:32:04.389'),
('dd9693f3-96f3-4a32-b6bb-f3052a7896d9', 'JPN B', '335894c8-685a-4797-8977-1ac025c140b8', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:34:51.845', '2025-09-16 08:34:51.845'),
('ed7ad8f1-b2d0-4555-b234-81abcd9628ed', 'JPN D', '335894c8-685a-4797-8977-1ac025c140b8', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:35:23.967', '2025-09-16 08:35:23.967'),
('f5dd05cb-fb53-4d07-9bff-e9b25fbb088f', 'MTK C', '07754934-7ae8-4995-ab52-c3291fe910ae', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:34:00.705', '2025-09-16 08:34:00.705'),
('f62d49ac-da53-4846-8814-7d54cb8df938', 'MTK D', '07754934-7ae8-4995-ab52-c3291fe910ae', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-09-16 08:34:14.203', '2025-09-16 08:34:14.203'),
('fe951ed8-adb5-4c14-bcd2-d46492404727', 'TI B', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '3772d6eb-475e-4684-b3bf-9fddbbbadfd3', '2025-08-16 07:06:25.302', '2025-09-09 06:08:30.032');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lectureId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `code`, `lectureId`, `credits`, `createdAt`, `updatedAt`) VALUES
('62a81982-6c0c-4342-ab66-3eb12c5dcaa6', 'Basis Data Update', '2018178', '6a716286-fd76-4346-ba8c-93db3a16707c', 3, '2025-08-13 02:59:12.816', '2025-09-03 04:48:01.114'),
('c03431cf-4838-4ee9-8de7-cd434bc40c51', 'Sistem Operasi', '2018178', '258cc570-1394-4ae5-84ec-88da419f6321', 4, '2025-08-14 03:53:32.663', '2025-09-09 09:03:07.093'),
('c43570ab-ce1f-4339-86ac-840626a22b0a', 'Aljabar Linear', '1234567', 'c7d507a2-0111-499a-b6e0-e3cc6a8cea97', 1, '2025-09-03 04:44:36.824', '2025-09-17 03:06:24.489'),
('ebbba060-da95-4cdc-8f85-1de762babbd8', 'Pemrograman Dasar', '9875632', '6a716286-fd76-4346-ba8c-93db3a16707c', 4, '2025-08-13 02:58:55.524', '2025-09-17 05:45:58.758');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `name`, `code`, `createdAt`, `updatedAt`) VALUES
('23861ba1-6236-4172-ab37-f69fafa62194', 'Fakultas Ilmu Budaya', 'FIB', '2025-09-05 23:33:08.217', '2025-09-05 23:33:08.217'),
('4aa45579-7b18-4d88-9d9f-cfa9d2505d65', 'Fakultas Peternakan', 'FP', '2025-09-05 23:31:27.077', '2025-09-05 23:31:27.077'),
('5c41e5d4-e246-41d5-8ecb-d19833e2ab1e', 'Fakultas Bahasa Sastra', 'FBS', '2025-08-16 07:04:20.515', '2025-12-13 12:57:34.055'),
('61903064-0e18-428d-88c5-80088f295837', 'Fakultas Kedokteran Hewan', 'FKH', '2025-09-05 23:33:24.329', '2025-09-05 23:33:24.329'),
('686180bb-07e8-495a-be3e-ec76bec4614e', 'Fakultas Hukum', 'FH', '2025-09-01 09:10:43.780', '2025-09-01 09:10:43.780'),
('7d1a71a6-c16a-4dc3-8e60-4c17b83a99ba', 'Fakultas Pertanian', 'FP', '2025-09-05 23:31:17.798', '2025-09-05 23:31:17.798'),
('7de9feef-b0aa-4ad7-96d4-6c8d6f5bc2bb', 'Fakultas Kedokteran', 'FK', '2025-09-01 07:06:10.205', '2025-09-01 07:06:10.205'),
('7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', 'Fakultas Teknik', 'FT', '2025-08-13 02:57:36.040', '2025-08-13 02:57:36.040'),
('89b8383d-c1e9-4f9e-b890-339e3d1824b8', 'Fakultas Ilmu Sosial dan Ilmu Politik', 'FISDIP', '2025-09-05 23:32:41.326', '2025-09-05 23:32:41.326'),
('9bd00e84-b166-41b9-8185-9fb320a5fc79', 'Fakultas Matematika dan Ilmu Pengetahuan Alam', 'FMDIPA', '2025-09-05 23:32:09.860', '2025-09-05 23:32:09.860'),
('a403a9f4-2dce-45c4-aede-0989ba4c6c8b', 'Fakultas Perikanan dan Ilmu Kelautan', 'FPDIK', '2025-09-05 23:31:46.752', '2025-09-05 23:31:46.752'),
('bfd43826-01dc-4205-9ba9-317ba27a00cc', 'Fakultas Teknologi Pertanian', 'FTP', '2025-09-05 23:32:26.746', '2025-09-05 23:32:26.746'),
('c27a90fd-9494-4bca-bbbe-b557a2119f1d', 'Fakultas Ekonomi dan Bisnis', 'FEDB', '2025-09-05 23:30:47.388', '2025-09-05 23:30:47.388'),
('ce89d5c1-faa2-415b-9fc6-1211547eeb43', 'Fakultas Ilmu Administrasi', 'FIA', '2025-09-05 23:31:06.195', '2025-09-05 23:31:06.195'),
('e0c2c0be-2c0b-4f6a-be96-1c9b65ac29b0', 'Fakultas Psikologi', 'FP', '2025-09-01 07:28:59.423', '2025-09-01 07:28:59.423');

-- --------------------------------------------------------

--
-- Table structure for table `lecture`
--

CREATE TABLE `lecture` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lecture',
  `lectureNumber` int NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majorId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lecture`
--

INSERT INTO `lecture` (`id`, `name`, `email`, `password`, `role`, `lectureNumber`, `position`, `majorId`, `createdAt`, `updatedAt`) VALUES
('258cc570-1394-4ae5-84ec-88da419f6321', 'Rustal Elion', 'rustal@mail.com', NULL, 'lecture', 2637821, 'Dosen Reguler', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '2025-08-14 03:53:12.836', '2025-09-16 08:49:26.724'),
('3e5cd8e5-16c3-458b-a662-c28d031527b8', 'Almiria Bauduin', 'almiria@mail.com', NULL, 'lecture', 487209, 'Dosen Reguler', '07754934-7ae8-4995-ab52-c3291fe910ae', '2025-09-16 08:54:59.524', '2025-12-18 08:50:17.816'),
('5bee84c3-6d18-43a7-9704-eb1f6680095c', 'Azee Guraise', 'azee@mail.id', '$2b$10$dNba1Mutu.ZxYFc4lhUfqOccXHAQ5zdKzpMShKBQCOmllHV.8tBzi', 'lecture', 1959532, 'Kaprodi', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '2025-09-09 07:36:43.872', '2025-09-17 02:31:56.624'),
('6a716286-fd76-4346-ba8c-93db3a16707c', 'Naze Turbine', 'naze@mail.com', '$2b$10$h9YgZ4yIS8fYbqUHvw1jSuqeQR.ojeNkdEYhwnuU.u4Niv0RlrKnO', 'lecture', 2637821, 'Dosen Reguler', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '2025-08-13 02:58:13.087', '2025-09-16 08:53:03.495'),
('b247094a-3c86-4e91-befa-8191c4723fbb', 'Isurugi Camice', 'isurugi@mail.com', NULL, 'lecture', 58398765, 'Dosen Reguler', '07754934-7ae8-4995-ab52-c3291fe910ae', '2025-09-16 08:54:18.959', '2025-09-16 08:54:18.959'),
('c7d507a2-0111-499a-b6e0-e3cc6a8cea97', 'Julieta Juris', 'julieta@mail.com', '$2b$10$vc7HPeRO9dz0nYPJyZBTOutw3h50WpkYy9C9xCSDc8u6.55UqxQIG', 'lecture', 2637821, 'Dosen Reguler', 'e8f72067-772e-4fc3-b1ac-3b78d442aa2e', '2025-08-13 03:43:06.003', '2025-09-16 08:48:51.831'),
('d7fee19d-5609-4268-bd40-fdac28d16b75', 'Amida Arca', 'amida@mail.com', NULL, 'lecture', 5782469, 'Dosen Reguler', '07754934-7ae8-4995-ab52-c3291fe910ae', '2025-09-16 08:55:48.706', '2025-09-16 08:55:48.706'),
('e716515c-f872-4078-a4c7-f040691edfda', 'Carta Issue', 'carta@mail.com', NULL, 'lecture', 9485673, 'Kaprodi', '07754934-7ae8-4995-ab52-c3291fe910ae', '2025-09-16 08:53:32.467', '2025-09-16 08:53:32.467');

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facultyId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`id`, `name`, `code`, `facultyId`, `createdAt`, `updatedAt`) VALUES
('04829c54-81b2-4831-8bbd-5231c2f4b530', 'Teknologi Bioproses', 'TBS01', 'bfd43826-01dc-4205-9ba9-317ba27a00cc', '2025-09-06 00:34:38.134', '2025-09-06 00:34:38.134'),
('07754934-7ae8-4995-ab52-c3291fe910ae', 'Matematika', 'MTK01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:18:19.173', '2025-09-06 00:18:19.173'),
('0e226a10-9005-478e-9c57-c85de184eb69', 'Ilmu Politik', 'IPK01', '89b8383d-c1e9-4f9e-b890-339e3d1824b8', '2025-09-06 00:36:00.027', '2025-09-06 00:36:00.027'),
('16216958-e108-4f81-9d89-ee67f65c6925', 'Teknik Sipil', 'TSL01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:54:03.690', '2025-09-05 23:54:03.690'),
('19704494-cdef-4c15-9844-e7285220466b', 'Manajemen Sumberdaya Perairan', 'MSP01', 'a403a9f4-2dce-45c4-aede-0989ba4c6c8b', '2025-09-06 00:04:20.987', '2025-09-06 00:04:20.987'),
('1d426f3c-a710-4bc4-ade3-2f069c50a0b9', 'Teknologi Hasil Perikanan', 'THP01', 'a403a9f4-2dce-45c4-aede-0989ba4c6c8b', '2025-09-06 00:07:20.769', '2025-09-06 00:07:20.769'),
('24a94f3d-1076-4cda-92e2-040940da816a', 'Pemanfaatan Sumberdaya Perikanan', 'PSP01', 'a403a9f4-2dce-45c4-aede-0989ba4c6c8b', '2025-09-06 00:05:47.797', '2025-09-06 00:05:47.797'),
('29cbd9eb-1b98-4214-b438-f05d9a5c87ee', 'Ilmu Perpustakaan', 'IPN01', 'ce89d5c1-faa2-415b-9fc6-1211547eeb43', '2025-09-05 23:45:27.650', '2025-09-05 23:45:27.650'),
('2db45e95-5ee7-4a5a-b0dd-858fb0bba99a', 'Teknik Pengairan', 'TPN01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:54:54.430', '2025-09-05 23:54:54.430'),
('3335cfe6-7640-4f39-a8f4-f2b66282fc0f', 'Agribisnis', 'AGS01', '7d1a71a6-c16a-4dc3-8e60-4c17b83a99ba', '2025-09-05 23:49:30.798', '2025-12-14 14:32:44.170'),
('335894c8-685a-4797-8977-1ac025c140b8', 'Sastra Jepang', 'SJP01', '5c41e5d4-e246-41d5-8ecb-d19833e2ab1e', '2025-09-06 07:44:53.575', '2025-09-06 07:44:53.575'),
('3c0c78ec-dfac-4b7b-a9f5-3782f471fc6b', 'Kehutanan', 'KHN01', '7d1a71a6-c16a-4dc3-8e60-4c17b83a99ba', '2025-09-05 23:50:16.998', '2025-09-05 23:50:16.998'),
('43a09a97-9f78-4254-ac92-5b0a5ea5ed1a', 'Teknik Elektro', 'TEO01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-08-13 02:57:50.447', '2025-09-05 23:36:15.154'),
('4b1d35a6-0b5f-4dc9-956e-a4e91937285f', 'Teknik Geofisika', 'TGA01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:26:07.620', '2025-09-06 00:26:07.620'),
('532ef5ab-3933-464e-b63f-ba23677dbba5', 'Ilmu Hukum', 'IHM01', '686180bb-07e8-495a-be3e-ec76bec4614e', '2025-09-05 23:34:56.481', '2025-09-05 23:35:25.834'),
('667851c3-f03f-44b4-ae31-874879590d32', 'Kimia', 'KMA01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:16:49.943', '2025-09-06 00:16:49.943'),
('6a9ef78b-23cf-48b3-b718-498163b14f23', 'Psikologi', 'PSI01', '89b8383d-c1e9-4f9e-b890-339e3d1824b8', '2025-09-06 00:36:27.550', '2025-09-06 00:36:27.550'),
('6f55f253-046a-4b1b-94ae-8413a23047fe', 'Perencanaan Wilayah dan Kota', 'PWK01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:55:59.697', '2025-09-05 23:55:59.697'),
('71932097-8128-4e12-a848-d7363d97124d', 'Pariwisata', 'PWA01', 'ce89d5c1-faa2-415b-9fc6-1211547eeb43', '2025-09-05 23:48:33.649', '2025-09-05 23:48:33.649'),
('71bcb9c7-7818-4be9-8254-3a83ce79c769', 'Teknik Pertanian', 'TPN01', 'bfd43826-01dc-4205-9ba9-317ba27a00cc', '2025-09-06 00:35:06.964', '2025-09-06 00:35:06.964'),
('72da12de-24d7-4cb6-a0f1-710c9c936ad9', 'Bahasa Jerman', 'BJN01', '5c41e5d4-e246-41d5-8ecb-d19833e2ab1e', '2025-09-01 06:21:56.776', '2025-09-05 23:35:55.515'),
('7cf77b3f-77ef-44da-ada8-cc3e7c9b0ebb', 'Perpajakan', 'PPN01', 'ce89d5c1-faa2-415b-9fc6-1211547eeb43', '2025-09-05 23:45:07.542', '2025-09-05 23:45:07.542'),
('8a9695e6-2d04-4e68-b24a-a206867fde7c', 'Agrobisnis Perikanan', 'APN02', 'a403a9f4-2dce-45c4-aede-0989ba4c6c8b', '2025-09-06 00:00:27.266', '2025-09-06 00:00:50.665'),
('8af4fd9f-d211-4d35-ae5b-95177d195282', 'Ekonomi, Keuangan dan Perbankan', 'FKP01', 'c27a90fd-9494-4bca-bbbe-b557a2119f1d', '2025-09-05 23:43:19.377', '2025-09-05 23:43:19.377'),
('8d5d4b43-745c-4b35-9000-09cac1f69e47', 'Instrumentasi', 'ITI01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:30:04.137', '2025-09-06 00:30:04.137'),
('92503604-e6a2-4828-bc6e-ae5f9ca1899e', 'Teknik Mesin', 'TMN01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:54:28.566', '2025-09-05 23:54:28.566'),
('94fb7a27-d151-4707-ab35-98eaccdf1b96', 'Biologi', 'BIO01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:13:10.446', '2025-09-06 00:13:10.446'),
('955bc9a1-5072-4587-bd6a-26101247e6da', 'Manajemen', 'MJN01', 'c27a90fd-9494-4bca-bbbe-b557a2119f1d', '2025-09-05 23:41:24.016', '2025-09-05 23:41:24.016'),
('98626b20-97e5-4e87-930c-fed0b0fbaa14', 'Ilmu Komunikasi', 'IKM01', '89b8383d-c1e9-4f9e-b890-339e3d1824b8', '2025-09-06 00:35:44.613', '2025-09-06 00:35:44.613'),
('98dea616-be95-4d35-bb50-c720e24ed838', 'Akuntansi', 'ATS01', 'c27a90fd-9494-4bca-bbbe-b557a2119f1d', '2025-09-05 23:40:43.310', '2025-09-05 23:44:16.599'),
('9e0eafb6-cad7-4cdb-855a-2b483aadf131', 'Ilmu Administrasi Niaga/Bisnis', 'IAN02', 'ce89d5c1-faa2-415b-9fc6-1211547eeb43', '2025-09-05 23:44:53.259', '2025-09-05 23:44:53.259'),
('a45eb08d-6cb7-4d55-94b5-ab29e8c8bbd5', 'Arsitektur', 'ASR01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:56:17.887', '2025-09-05 23:56:17.887'),
('a8597379-0c5e-41e0-bd28-bae455b60b67', 'Bioteknologi', 'BTI01', 'bfd43826-01dc-4205-9ba9-317ba27a00cc', '2025-09-06 00:34:09.085', '2025-09-06 00:34:09.085'),
('aade8eb7-5b38-4303-830d-cec7fc6cd4da', 'Ekonomi Islam', 'EIM01', 'c27a90fd-9494-4bca-bbbe-b557a2119f1d', '2025-09-05 23:42:10.357', '2025-09-05 23:42:10.357'),
('acee37fb-861c-472d-bed5-954dff724516', 'Teknik Lingkungan', 'TLN01', 'bfd43826-01dc-4205-9ba9-317ba27a00cc', '2025-09-06 00:33:51.804', '2025-09-06 00:33:51.804'),
('b84caae6-4979-4da9-97e1-a403d3bb5750', 'Teknologi Industri Pertanian', 'TIP01', 'bfd43826-01dc-4205-9ba9-317ba27a00cc', '2025-09-06 00:33:38.554', '2025-09-06 00:33:38.554'),
('b9668a81-d688-48d5-a739-72a39113d0ce', 'Bahasa Inggris', 'BIG01', '5c41e5d4-e246-41d5-8ecb-d19833e2ab1e', '2025-08-16 07:06:12.593', '2025-09-05 23:35:11.389'),
('bd3fd29d-7f4e-4d98-a0bf-5c215c15ab0a', 'Hubungan Internasional', 'HII01', '89b8383d-c1e9-4f9e-b890-339e3d1824b8', '2025-09-06 00:35:31.362', '2025-09-06 00:35:31.362'),
('ca4c6ed8-44af-4f50-b4e9-9b854110543e', 'Peternakan', 'PTN01', '4aa45579-7b18-4d88-9d9f-cfa9d2505d65', '2025-09-05 23:50:35.883', '2025-09-05 23:50:35.883'),
('cebb63b6-9f95-48f8-bab4-ef9338fd909b', 'Teknik Industri', 'TII01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:55:13.839', '2025-09-05 23:55:13.839'),
('d1c82e7c-2421-4a87-b21c-bd85ebd308ee', 'Ilmu Aktuaria', 'IAA01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:31:08.353', '2025-09-06 00:31:08.353'),
('d728394e-a12c-4874-8a50-f38ec4006bae', 'Agroteknologi', 'AGI01', '7d1a71a6-c16a-4dc3-8e60-4c17b83a99ba', '2025-09-05 23:49:57.060', '2025-09-05 23:49:57.060'),
('e34f97c5-b5af-46d6-8b96-ea7cefb508af', 'Sastra Korea', 'SKA01', '5c41e5d4-e246-41d5-8ecb-d19833e2ab1e', '2025-09-06 12:55:27.787', '2025-09-06 12:55:27.787'),
('e84b7cf7-47f5-4f1e-92f1-8096cb5c05f0', 'Ekonomi Pembangunan', 'EPN01', 'c27a90fd-9494-4bca-bbbe-b557a2119f1d', '2025-09-05 23:41:11.019', '2025-09-05 23:41:11.019'),
('e8f72067-772e-4fc3-b1ac-3b78d442aa2e', 'Teknik Informatika', 'TIA01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-01 06:19:32.953', '2025-09-05 23:36:24.653'),
('eb552437-2911-4747-b469-82cd41d72d06', 'Kewirausahaan', 'KWU01', 'c27a90fd-9494-4bca-bbbe-b557a2119f1d', '2025-09-05 23:42:28.439', '2025-09-05 23:42:28.439'),
('ec85c5e9-c13a-4058-92e7-757a738b8bc5', 'Statistika', 'STK01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:23:24.310', '2025-09-06 00:23:24.310'),
('eff514e0-c9b5-4f64-918b-0e0233d2ad4c', 'Ilmu Administrasi Negara/Publik', 'IAN01', 'ce89d5c1-faa2-415b-9fc6-1211547eeb43', '2025-09-05 23:43:57.391', '2025-09-05 23:43:57.391'),
('f60aa12a-4da7-4cb5-9ede-864ac2d53307', 'Budidaya Perairan', 'BPN01', 'a403a9f4-2dce-45c4-aede-0989ba4c6c8b', '2025-09-06 00:01:17.366', '2025-09-06 00:01:17.366'),
('f8e704dd-cf7c-4976-a537-99e6d0077108', 'Fisika', 'FSK01', '9bd00e84-b166-41b9-8185-9fb320a5fc79', '2025-09-06 00:13:27.390', '2025-09-06 00:13:27.390'),
('fbda7cb9-07f8-4720-8bdf-d37966d76b7f', 'Ilmu dan Teknologi Pangan', 'ITP01', 'bfd43826-01dc-4205-9ba9-317ba27a00cc', '2025-09-06 00:33:08.632', '2025-09-06 00:33:08.632'),
('ff38699e-1492-4080-bd9c-03652578cfa5', 'Teknik Kimia', 'TKA01', '7ee3cb14-5b42-4e5b-b08b-56bb82e073a0', '2025-09-05 23:55:26.291', '2025-09-05 23:55:26.291');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `studentId`, `code`, `status`, `createdAt`, `updatedAt`) VALUES
('02379ea7-daa3-4a5b-8475-efcdaea1060a', 'ff60130a-7809-4eb3-ad12-d778cd0a851b', 'PAY202509109504', 'PAID', '2025-09-10 08:29:20.541', '2025-09-29 07:31:37.768'),
('61549f6c-587a-442d-9595-0c59b66ea5d1', 'ff60130a-7809-4eb3-ad12-d778cd0a851b', 'PAY202509294255', 'PAID', '2025-09-29 05:37:28.553', '2025-09-29 08:50:25.620'),
('9b257c64-20ad-4816-80b0-1c5025a3015e', 'c33201d7-1dbf-4f8c-ae8d-28a7f57ee226', 'PAY202509045166', 'PAID', '2025-09-04 05:25:21.932', '2025-09-12 13:08:41.459'),
('a1288475-8583-465e-a195-d85fd31c8575', '468ac504-ad73-44ee-918f-7a5e20e07882', 'PAY202509109849', 'PAID', '2025-09-10 08:34:31.395', '2025-10-31 14:41:24.289'),
('ce1906c4-e4c5-40ba-8df9-673ad47f1c75', '468ac504-ad73-44ee-918f-7a5e20e07882', 'PAY202509114767', 'UNPAID', '2025-09-11 08:01:21.392', '2025-11-10 14:35:03.623'),
('f053c04e-6eb6-4da4-ad48-19fe2c211a19', '35cf1cd4-ddec-428a-b848-31903785d6a1', 'PAY202509049182', 'UNPAID', '2025-09-04 05:25:11.192', '2025-12-24 15:52:02.556'),
('f939d331-76bc-416c-93ce-10b863ae88fe', 'ff60130a-7809-4eb3-ad12-d778cd0a851b', 'PAY202509273587', 'UNPAID', '2025-09-27 15:07:59.223', '2025-10-09 03:03:13.591');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timeStart` datetime(3) NOT NULL,
  `timeEnd` datetime(3) NOT NULL,
  `day` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`id`, `timeStart`, `timeEnd`, `day`, `classId`, `courseId`, `createdAt`, `updatedAt`) VALUES
('166f273c-e241-45db-9f64-55c9d835ea52', '2025-09-03 06:09:00.000', '2025-09-03 07:10:00.000', 'Rabu', 'fe951ed8-adb5-4c14-bcd2-d46492404727', '62a81982-6c0c-4342-ab66-3eb12c5dcaa6', '2025-09-03 06:10:07.232', '2025-09-09 10:01:40.457'),
('4f60f23b-f9b2-4edd-8269-094a5af411bb', '2025-09-13 02:37:00.000', '2025-09-13 03:38:00.000', 'Sabtu', '6f013b11-e4f7-4204-9b38-ba6ac6c77394', 'c03431cf-4838-4ee9-8de7-cd434bc40c51', '2025-09-10 02:38:16.330', '2025-09-10 02:38:16.330'),
('704990fd-d4aa-4086-bfb4-3ebb12874426', '2025-08-07 07:00:00.000', '2025-08-07 08:00:00.000', 'Kamis', 'a47b475b-af96-4bd6-980d-e5b255497dec', 'c03431cf-4838-4ee9-8de7-cd434bc40c51', '2025-08-14 02:23:51.064', '2025-12-24 05:54:58.044'),
('9fe5277d-9a7d-456d-bcb7-b1c6bad34569', '2025-08-07 08:00:00.000', '2025-08-07 10:00:00.000', 'Monday', '6f013b11-e4f7-4204-9b38-ba6ac6c77394', 'ebbba060-da95-4cdc-8f85-1de762babbd8', '2025-08-15 07:40:19.985', '2025-09-10 02:26:15.367'),
('cd3fcafd-dedb-40a1-a422-8a0fbbc070ca', '2025-09-18 05:00:00.000', '2025-09-18 07:00:00.000', 'Kamis', '724f06a2-7d45-4b7e-aa45-36da67cb677e', '62a81982-6c0c-4342-ab66-3eb12c5dcaa6', '2025-09-18 07:17:13.328', '2025-09-18 07:17:13.328'),
('d727ce7b-2ad8-4a09-be7d-b46fcb7a2f16', '2025-09-09 09:49:00.000', '2025-09-09 11:49:00.000', 'Selasa', 'a47b475b-af96-4bd6-980d-e5b255497dec', 'ebbba060-da95-4cdc-8f85-1de762babbd8', '2025-09-09 09:49:35.925', '2025-09-09 09:49:35.925'),
('e08b30fd-26a9-48dc-bfac-3f689b473277', '2025-09-12 01:00:00.000', '2025-09-12 04:00:00.000', 'Jumat', 'fe951ed8-adb5-4c14-bcd2-d46492404727', 'c03431cf-4838-4ee9-8de7-cd434bc40c51', '2025-09-09 10:02:13.857', '2025-09-10 02:32:47.657');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int NOT NULL,
  `classOf` int NOT NULL,
  `tfGroupId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `studentNumber`, `semester`, `classOf`, `tfGroupId`, `classId`, `createdAt`, `updatedAt`, `password`, `role`) VALUES
('02c706da-47af-45c1-9303-3a215d45f2cc', 'Atra Mixta', 'atra@mail.com', '202509168016594', 4, 2023, '72cf5c20-5bb3-4b24-bca5-b15533f796d1', '54bf7fc6-18c5-4ebb-8006-e9e8d188223b', '2025-09-16 08:46:15.032', '2025-09-17 02:23:41.454', '$2b$10$DcY3C1hrruJBH2NMPw5eve.4/77Q8ojKrReFELHphKGvn0LCRKBoK', 'student'),
('08b93d78-15ac-4550-9bce-2ecb2f979934', 'Fumitan Admoss', 'fumitan@mail.com', '202509165272794', 4, 2023, '52ec70af-462d-41e9-938a-b093b9c38494', '54bf7fc6-18c5-4ebb-8006-e9e8d188223b', '2025-09-16 08:45:46.044', '2025-09-16 08:45:46.044', NULL, 'student'),
('14ffc811-4ce5-43fc-b24b-cd80f0b4c55c', 'ahmad', 'ahmad@gmail.com', '202510302069436', 1, 1, '16e8c106-abc8-47d1-9a0d-6eb80fc0d971', 'a47b475b-af96-4bd6-980d-e5b255497dec', '2025-10-30 04:00:19.299', '2025-10-30 04:01:04.108', '$2b$10$ekUrLFKTw5JeREi3qODHHOHFeO95wZu9Tl9zFxnUnQ4Qnnd7aj/3O', 'student'),
('35cf1cd4-ddec-428a-b848-31903785d6a1', 'Biscuit Griffon', 'biscuit@mail.com', '202508161749804', 4, 2023, '16e8c106-abc8-47d1-9a0d-6eb80fc0d971', 'a47b475b-af96-4bd6-980d-e5b255497dec', '2025-08-16 07:07:51.349', '2025-09-16 08:41:17.035', NULL, 'student'),
('468ac504-ad73-44ee-918f-7a5e20e07882', 'Eugene Sevenstark', 'eugene@mail.com', '202508136187898', 3, 2023, '16e8c106-abc8-47d1-9a0d-6eb80fc0d971', 'a47b475b-af96-4bd6-980d-e5b255497dec', '2025-08-13 03:04:12.817', '2025-09-16 08:41:40.421', '$2b$10$h9YgZ4yIS8fYbqUHvw1jSuqeQR.ojeNkdEYhwnuU.u4Niv0RlrKnO', 'student'),
('8da68a3f-9bbf-486b-b729-a4877af00806', 'Kudelia Aina Bernstein', 'kudelina@mail.com', '202509165528371', 4, 2023, 'cafb5282-aaa0-45bc-a29d-f9419d2bb3fe', '54bf7fc6-18c5-4ebb-8006-e9e8d188223b', '2025-09-16 08:45:06.312', '2025-09-16 08:45:06.312', NULL, 'student'),
('8ecc93ad-324e-4019-9361-a56bdc70752c', 'Akihiro Altland', 'akihiro@mail.com', '202509163913742', 2, 2023, '72cf5c20-5bb3-4b24-bca5-b15533f796d1', 'fe951ed8-adb5-4c14-bcd2-d46492404727', '2025-09-16 08:42:26.893', '2025-09-16 08:42:26.893', NULL, 'student'),
('9dd2fc00-5c6c-4ed2-bbab-3cd5b994327e', 'Chad Chadan', 'chad@mail.com', '202509168877651', 4, 2023, '2d23857e-7dd0-47b1-ab77-6d5765156553', 'fe951ed8-adb5-4c14-bcd2-d46492404727', '2025-09-16 08:43:45.735', '2025-09-16 08:43:45.735', NULL, 'student'),
('aac88441-36d1-4f55-8540-f676f534987e', 'McGillis Fareed', 'mcgillis@mail.com', '202509162949540', 4, 2023, 'cafb5282-aaa0-45bc-a29d-f9419d2bb3fe', '54bf7fc6-18c5-4ebb-8006-e9e8d188223b', '2025-09-16 08:47:01.886', '2025-09-16 08:47:01.886', NULL, 'student'),
('b95777e2-b729-4ae6-b1b6-f567f7764b06', 'Yamagi Gilmerton', 'yamagi@mail.com', '202509162796599', 4, 2023, 'cafb5282-aaa0-45bc-a29d-f9419d2bb3fe', 'fe951ed8-adb5-4c14-bcd2-d46492404727', '2025-09-16 08:44:12.766', '2025-09-16 08:44:12.766', NULL, 'student'),
('c33201d7-1dbf-4f8c-ae8d-28a7f57ee226', 'Mikazuki Augus', 'mikazuki@mail.com', '202509039872905', 5, 2020, '8522fb6d-7ce5-4e6c-9663-2736f3af5443', 'a47b475b-af96-4bd6-980d-e5b255497dec', '2025-09-03 03:51:50.795', '2025-09-16 08:39:52.191', NULL, 'student'),
('d90deb36-c4d3-4ce1-82f5-4c3235f517f5', 'Norba Shino', 'norba@mail.com', '202509169065660', 4, 2023, '52ec70af-462d-41e9-938a-b093b9c38494', 'fe951ed8-adb5-4c14-bcd2-d46492404727', '2025-09-16 08:43:05.959', '2025-10-14 04:13:55.472', '$2b$10$E1L8tSDwJfjZf6HwmZ1rq.7mKHay65ui8lDVG4QuR/rlUW/B/D9te', 'student'),
('ff60130a-7809-4eb3-ad12-d778cd0a851b', 'Orga Itsuka', 'orga@mail.com', '202509097386981', 1, 2024, 'f62a23d8-2dcb-4d0a-bfe5-7e58f8e55a48', 'a47b475b-af96-4bd6-980d-e5b255497dec', '2025-09-09 07:39:46.816', '2025-09-16 08:40:52.062', '$2b$10$UsoMSXUo7wR14KtsN0C6kOsYpz2d/gZ9uKW4nXPa12W.3vy0JFoNu', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `studyplan`
--

CREATE TABLE `studyplan` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gpa` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studyplan`
--

INSERT INTO `studyplan` (`id`, `studentId`, `status`, `gpa`, `createdAt`, `updatedAt`) VALUES
('3e57af04-5f5c-4b05-a638-25327945180f', 'ff60130a-7809-4eb3-ad12-d778cd0a851b', 'APPROVED', NULL, '2025-09-15 02:42:25.783', '2025-09-17 03:28:12.890'),
('4d4e05dc-41ea-4c8a-b55e-9616dfb2494b', '468ac504-ad73-44ee-918f-7a5e20e07882', 'APPROVED', NULL, '2025-09-16 07:56:31.484', '2025-11-18 07:12:48.575'),
('7b174636-8a7a-4b62-9278-3cf9b8f01d3c', '02c706da-47af-45c1-9303-3a215d45f2cc', 'REJECTED', NULL, '2025-09-17 02:24:12.437', '2026-01-12 03:29:46.625'),
('d00c057b-a07d-4818-a21f-5f75c98eb4eb', '468ac504-ad73-44ee-918f-7a5e20e07882', NULL, NULL, '2025-12-16 08:20:13.083', '2025-12-16 08:20:13.083');

-- --------------------------------------------------------

--
-- Table structure for table `studyplancourse`
--

CREATE TABLE `studyplancourse` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int DEFAULT NULL,
  `studyPlanId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `attendance1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance11` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance12` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance13` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance14` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance15` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance16` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task1` int DEFAULT NULL,
  `task2` int DEFAULT NULL,
  `task3` int DEFAULT NULL,
  `task4` int DEFAULT NULL,
  `uas` int DEFAULT NULL,
  `uts` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studyplancourse`
--

INSERT INTO `studyplancourse` (`id`, `score`, `studyPlanId`, `courseId`, `createdAt`, `updatedAt`, `attendance1`, `attendance10`, `attendance11`, `attendance12`, `attendance13`, `attendance14`, `attendance15`, `attendance16`, `attendance2`, `attendance3`, `attendance4`, `attendance5`, `attendance6`, `attendance7`, `attendance8`, `attendance9`, `task1`, `task2`, `task3`, `task4`, `uas`, `uts`) VALUES
('0e0e5693-9ef0-4b4e-aa9b-33e3e1df4649', NULL, '4d4e05dc-41ea-4c8a-b55e-9616dfb2494b', 'c03431cf-4838-4ee9-8de7-cd434bc40c51', '2025-09-16 07:56:31.499', '2025-09-18 09:34:47.122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sakit', 'hadir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('217d410c-07f3-4413-a4fb-be5be679ebf0', 83, '4d4e05dc-41ea-4c8a-b55e-9616dfb2494b', 'ebbba060-da95-4cdc-8f85-1de762babbd8', '2025-09-16 07:56:31.499', '2026-01-12 05:25:01.778', 'alfa', 'hadir', 'hadir', 'hadir', 'Hadir', 'Hadir', 'Hadir', 'Hadir', 'hadir', 'alfa', 'hadir', 'hadir', 'hadir', 'hadir', 'hadir', 'hadir', 100, 100, 100, 100, 100, 70),
('5343d7cf-a0ee-457b-b656-3c0b27e0929e', NULL, '7b174636-8a7a-4b62-9278-3cf9b8f01d3c', '62a81982-6c0c-4342-ab66-3eb12c5dcaa6', '2025-09-17 02:24:12.454', '2025-09-17 02:24:12.454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('654d5fe0-f50e-4a42-b471-076ff2d26749', NULL, '4d4e05dc-41ea-4c8a-b55e-9616dfb2494b', 'c43570ab-ce1f-4339-86ac-840626a22b0a', '2025-09-16 07:56:31.499', '2025-09-18 09:34:47.122', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'izin', 'izin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('96a2f7f3-7de4-451a-b826-baea7adacaa1', 72, '3e57af04-5f5c-4b05-a638-25327945180f', 'ebbba060-da95-4cdc-8f85-1de762babbd8', '2025-09-15 02:42:25.798', '2025-10-31 14:45:12.915', 'alfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'izin', 'hadir', 'hadir', 'sakit', 'izin', 'izin', 'sakit', NULL, 80, 80, 80, 80, 80, 80),
('d8e596f7-781a-4c11-a7b1-eaf27a6ee59a', NULL, '7b174636-8a7a-4b62-9278-3cf9b8f01d3c', 'c43570ab-ce1f-4339-86ac-840626a22b0a', '2025-09-17 02:24:12.454', '2025-09-17 02:24:12.454', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tfgroup`
--

CREATE TABLE `tfgroup` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tfgroup`
--

INSERT INTO `tfgroup` (`id`, `group`, `amount`, `createdAt`, `updatedAt`) VALUES
('16e8c106-abc8-47d1-9a0d-6eb80fc0d971', 'Golongan 1 ', 1000000, '2025-08-13 03:00:54.066', '2025-12-16 06:03:16.581'),
('2d23857e-7dd0-47b1-ab77-6d5765156553', 'Golongan 7', 9000000, '2025-09-10 05:21:48.568', '2025-09-10 05:21:48.568'),
('4aa4a8db-2a0b-4a92-94d5-66c690dbfc57', 'Golongan 11', 12000000, '2025-12-16 07:06:19.316', '2025-12-16 07:06:19.316'),
('52ec70af-462d-41e9-938a-b093b9c38494', 'Golongan 4', 4000000, '2025-09-04 08:54:31.933', '2025-09-10 05:21:09.138'),
('72cf5c20-5bb3-4b24-bca5-b15533f796d1', 'Golongan 3', 3000000, '2025-09-04 08:54:19.468', '2025-09-10 05:21:04.531'),
('8522fb6d-7ce5-4e6c-9663-2736f3af5443', 'Golongan 6', 7000000, '2025-09-04 08:54:57.066', '2025-09-10 05:21:32.627'),
('8823518d-d7de-46d0-a096-5418d39f28c1', 'Golongan 8', 11000000, '2025-09-10 05:22:15.977', '2025-09-10 05:22:15.977'),
('bc75ad7a-07c0-46dc-aaec-3fcc391e15fe', 'Golongan 9', 13000000, '2025-09-10 05:22:28.764', '2025-09-10 05:22:28.764'),
('cafb5282-aaa0-45bc-a29d-f9419d2bb3fe', 'Golongan 10', 15000000, '2025-09-10 05:22:49.128', '2025-09-10 05:22:49.128'),
('f4de0b02-2fed-4b1d-bd9f-c6a159309283', 'Golongan 5', 5000000, '2025-09-04 08:54:44.159', '2025-09-10 05:21:20.305'),
('f62a23d8-2dcb-4d0a-bfe5-7e58f8e55a48', 'Golongan 2', 2000000, '2025-09-02 08:38:19.995', '2025-09-10 05:20:59.341');

-- --------------------------------------------------------

--
-- Table structure for table `timeline`
--

CREATE TABLE `timeline` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `timeline`
--

INSERT INTO `timeline` (`id`, `name`, `date`, `createdAt`, `updatedAt`) VALUES
('1234ef54-2965-4663-a2be-a66d2cfb66b0', 'Ujian Desember', '2025-12-01 00:00:00.000', '2025-09-18 05:02:53.834', '2025-09-18 05:02:53.834'),
('316df4eb-4f91-42f1-8189-4c26436c3ba8', 'Ujian Maret', '2026-03-01 00:00:00.000', '2025-09-20 03:59:46.706', '2025-09-20 03:59:46.706'),
('513ad168-e6f5-4585-9fdd-14f29d6128d2', 'Ujian November', '2025-11-01 00:00:00.000', '2025-09-18 04:39:02.886', '2025-09-18 04:39:02.886'),
('72fd71db-1bf7-439d-a40d-676503a5edac', 'Ujian Semester', '2025-09-05 00:00:00.000', '2025-08-23 09:36:51.214', '2025-09-04 04:03:16.996'),
('79a98667-9f73-4554-ae01-cd86e41df7b8', 'Ujian Oktober', '2025-10-01 00:00:00.000', '2025-09-17 08:02:57.426', '2025-09-17 08:02:57.426'),
('7a1cc604-e470-4e67-81da-7837acfc2c2b', 'Ujian Tengah Semester', '2025-08-25 00:00:00.000', '2025-08-19 02:43:27.597', '2025-08-19 02:43:27.597'),
('82d72cff-00c8-4e89-a82f-a5bb57af2df9', 'Kuis sebelum UAS', '2025-11-01 00:00:00.000', '2025-10-31 14:45:59.147', '2025-10-31 14:45:59.147'),
('a2f93cef-658e-468f-ac1e-786feca2acf0', 'Kuis sebelum UTS', '2025-10-17 00:00:00.000', '2025-10-14 04:06:56.521', '2025-10-14 04:09:44.811'),
('bfa751a0-d7b4-4fd7-a742-cec3260082ee', 'Ujian Februari', '2026-02-01 00:00:00.000', '2025-09-18 05:03:34.789', '2025-09-18 05:03:34.789'),
('db693c6e-3c84-4d43-b371-de957edaa209', 'Ujian Masuk', '2025-07-16 00:00:00.000', '2025-08-19 02:43:51.295', '2025-09-10 03:05:51.076'),
('eec465bc-6519-4eb7-9a92-a30d02ebb3bc', 'Ujian Januari', '2026-01-01 00:00:00.000', '2025-09-18 05:03:16.974', '2025-09-18 05:03:16.974');

-- --------------------------------------------------------

--
-- Table structure for table `tuitionfee`
--

CREATE TABLE `tuitionfee` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tuitionfee`
--

INSERT INTO `tuitionfee` (`id`, `studentId`, `status`, `createdAt`, `updatedAt`) VALUES
('19f88ed5-3ad7-4685-ba8c-343c1f32da66', '468ac504-ad73-44ee-918f-7a5e20e07882', 'Lunas', '2025-09-10 04:07:17.825', '2025-10-30 03:58:34.334'),
('5cb8345b-b2ee-496c-a59c-2f2d0ccd95a7', 'ff60130a-7809-4eb3-ad12-d778cd0a851b', 'Belum', '2025-09-10 04:06:49.847', '2025-09-10 04:06:49.847'),
('6a5c477f-7f07-4b88-bc4a-48b58a202a2e', 'c33201d7-1dbf-4f8c-ae8d-28a7f57ee226', 'Lunas', '2025-09-10 04:04:16.422', '2025-09-10 04:37:18.322'),
('e3e21e34-a556-4ae5-9603-bcaf1c56bc13', '35cf1cd4-ddec-428a-b848-31903785d6a1', 'Belum Lunas', '2025-09-03 02:48:27.474', '2025-09-03 02:48:27.474');

-- --------------------------------------------------------

--
-- Table structure for table `usersiakad`
--

CREATE TABLE `usersiakad` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usersiakad`
--

INSERT INTO `usersiakad` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('42e07d6f-814e-4096-9bc8-8ad429676eb3', 'admin', 'admin@gmail.com', '$2b$10$h9YgZ4yIS8fYbqUHvw1jSuqeQR.ojeNkdEYhwnuU.u4Niv0RlrKnO', 'admin', '2025-10-07 05:22:09.558', '2025-10-07 05:22:09.558'),
('47cbfdd7-a22b-4c27-9369-928bb57004e2', 'tester 1', 'test1@mail.com', '$2b$10$gx4xeYItJUK/rEMQjWCU6uXvkE2bL/IwZK/fkbO2pzhZpGqHOicza', 'admin', '2025-09-16 08:36:17.104', '2025-09-16 08:36:33.004'),
('50174008-d16e-42b1-88a3-0aadb9d8b809', 'tester 2', 'test2@gmail.com', '$2b$10$FeCmpcIps6VjhKrT895hPOKYXNVJUzsvMKs9pYvhVGPG/qVQdOHNq', 'admin', '2025-09-16 08:37:09.480', '2025-09-16 08:37:09.480'),
('e8cd81c9-88bc-4ccb-85f9-31a8bd91691b', 'tester 3', 'test3@mail.com', '$2b$10$FJcdeD7Rr9Y9AlV.v5jGe.assc4zALKlMuF5iJmPE6ucIcdIKZaWu', 'admin', '2025-09-17 02:30:16.082', '2025-09-17 02:30:16.082');

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('25a0b10d-cfe1-478a-a26e-ef55733e22e9', '1f9ad9fa107b5b7c79f68fcafae07381be0ba831c29c19c3656e527997a2e760', '2025-08-13 02:56:28.289', '20250813025628_init', NULL, NULL, '2025-08-13 02:56:28.126', 1),
('3decd940-15cb-4683-afaf-474b72b5f8c3', 'bacc2330af7dcd43b57c1e50fef0125ea2a76f4550d3916e46f5885157340ddd', '2025-08-13 03:38:02.849', '20250813033802_init', NULL, NULL, '2025-08-13 03:38:02.833', 1),
('8a5ea869-32ef-46b4-adfe-3239de08c613', '07fecf7f9d5f5fb30de3f3b768601665aff444ea96dfcaf7e08beb2dba201b68', '2025-08-13 13:46:47.053', '20250813134647_init', NULL, NULL, '2025-08-13 13:46:47.045', 1),
('e6b1f133-ff60-4576-bfb3-1bf251bae442', '199d1aa82d64553abdb3f4763d3d01ce5d7bc753bc3a6580c79c4a3297cee9ac', '2025-08-16 02:22:04.351', '20250816022204_init', NULL, NULL, '2025-08-16 02:22:04.344', 1),
('f54e8634-7f5e-4ee9-b8bc-a854296d4c63', '683c7207a0c4a3b6a0614040955e6abaced07c55cba034b231251a2954ed2d79', '2025-08-19 02:36:50.903', '20250819023650_init', NULL, NULL, '2025-08-19 02:36:50.899', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academyyear`
--
ALTER TABLE `academyyear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Class_majorId_fkey` (`majorId`),
  ADD KEY `Class_yearId_fkey` (`yearId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Course_lectureId_fkey` (`lectureId`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lecture`
--
ALTER TABLE `lecture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Lecture_majorId_fkey` (`majorId`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Major_facultyId_fkey` (`facultyId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Payment_studentId_fkey` (`studentId`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Schedule_classId_fkey` (`classId`),
  ADD KEY `Schedule_courseId_fkey` (`courseId`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Student_studentNumber_key` (`studentNumber`),
  ADD KEY `Student_tfGroupId_fkey` (`tfGroupId`),
  ADD KEY `Student_classId_fkey` (`classId`);

--
-- Indexes for table `studyplan`
--
ALTER TABLE `studyplan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StudyPlan_studentId_fkey` (`studentId`);

--
-- Indexes for table `studyplancourse`
--
ALTER TABLE `studyplancourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StudyPlanCourse_studyPlanId_fkey` (`studyPlanId`),
  ADD KEY `StudyPlanCourse_courseId_fkey` (`courseId`);

--
-- Indexes for table `tfgroup`
--
ALTER TABLE `tfgroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline`
--
ALTER TABLE `timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tuitionfee`
--
ALTER TABLE `tuitionfee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TuitionFee_studentId_fkey` (`studentId`);

--
-- Indexes for table `usersiakad`
--
ALTER TABLE `usersiakad`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UserSiakad_email_key` (`email`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `Class_majorId_fkey` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Class_yearId_fkey` FOREIGN KEY (`yearId`) REFERENCES `academyyear` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `Course_lectureId_fkey` FOREIGN KEY (`lectureId`) REFERENCES `lecture` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `lecture`
--
ALTER TABLE `lecture`
  ADD CONSTRAINT `Lecture_majorId_fkey` FOREIGN KEY (`majorId`) REFERENCES `major` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `major`
--
ALTER TABLE `major`
  ADD CONSTRAINT `Major_facultyId_fkey` FOREIGN KEY (`facultyId`) REFERENCES `faculty` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `Payment_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `Schedule_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Schedule_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `Student_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `class` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_tfGroupId_fkey` FOREIGN KEY (`tfGroupId`) REFERENCES `tfgroup` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `studyplan`
--
ALTER TABLE `studyplan`
  ADD CONSTRAINT `StudyPlan_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `studyplancourse`
--
ALTER TABLE `studyplancourse`
  ADD CONSTRAINT `StudyPlanCourse_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `StudyPlanCourse_studyPlanId_fkey` FOREIGN KEY (`studyPlanId`) REFERENCES `studyplan` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `tuitionfee`
--
ALTER TABLE `tuitionfee`
  ADD CONSTRAINT `TuitionFee_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
