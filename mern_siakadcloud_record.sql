-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 21, 2026 at 03:03 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mern_siakadcloud_record`
--

-- --------------------------------------------------------

--
-- Table structure for table `AcademyYear`
--

CREATE TABLE `AcademyYear` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateStart` datetime(3) NOT NULL,
  `dateEnd` datetime(3) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `AcademyYear`
--

INSERT INTO `AcademyYear` (`id`, `name`, `dateStart`, `dateEnd`, `status`, `createdAt`, `updatedAt`) VALUES
('47cf954f-224d-4ff5-8e8e-ef805027e407', 'adsad', '2025-12-15 00:00:00.000', '2025-12-15 00:00:00.000', 1, '2025-12-15 06:39:41.327', '2025-12-15 06:39:41.327'),
('841d5076-0898-4caf-945e-1fa7e224ec0b', 'Tahun Akademik 2025/2026', '2025-07-01 00:00:00.000', '2026-06-30 00:00:00.000', 1, '2025-11-04 14:01:48.446', '2025-11-04 14:01:48.446');

-- --------------------------------------------------------

--
-- Table structure for table `Class`
--

CREATE TABLE `Class` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `majorId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `yearId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Class`
--

INSERT INTO `Class` (`id`, `name`, `majorId`, `yearId`, `createdAt`, `updatedAt`) VALUES
('44fc36cd-4c7e-4b10-aa64-75ec60f9b3ba', 'TI 1D', 'd2192e14-40e2-4ee2-8002-32c9212f7bff', '47cf954f-224d-4ff5-8e8e-ef805027e407', '2025-12-21 15:05:35.088', '2025-12-21 15:30:25.336'),
('55f546d2-7e5a-428f-8e26-9c79d0613863', 'TI B', '68424e8e-5b89-4b70-bdbd-1067115ef6ce', '841d5076-0898-4caf-945e-1fa7e224ec0b', '2025-11-06 13:52:49.075', '2025-12-21 14:56:47.565');

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lectureId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`id`, `name`, `code`, `lectureId`, `credits`, `createdAt`, `updatedAt`) VALUES
('67deff56-8326-4ef0-ab09-eb0e3546f8ef', 'Aljabar Linear', '2018178', '2d035510-07a4-49bb-9474-b7f975e4d2af', 4, '2025-11-07 17:52:56.702', '2025-11-07 17:52:56.702'),
('7a099f53-1a41-4189-9b86-870b5d0de0bf', 'sistem operasi', 'SO', '2d035510-07a4-49bb-9474-b7f975e4d2af', 4, '2026-01-21 13:44:48.530', '2026-01-21 13:44:48.530'),
('986ba105-b339-4cf7-a21d-6296c1dc3082', 'Pemrograman Mobile', '2018178', '2d035510-07a4-49bb-9474-b7f975e4d2af', 4, '2025-11-07 18:37:38.567', '2025-11-07 18:37:38.567'),
('c2aba9cc-be3e-416c-b525-31cbc28ae9ca', 'Pemrograman Web', '2018179', '2d035510-07a4-49bb-9474-b7f975e4d2af', 4, '2025-11-10 14:00:07.571', '2025-11-10 14:00:07.571'),
('ef27a82f-ee77-41fe-9939-e7474b05ac1b', 'testing live 2', '8283995', '2d035510-07a4-49bb-9474-b7f975e4d2af', 8, '2025-12-23 06:17:47.430', '2026-01-07 05:51:10.631');

-- --------------------------------------------------------

--
-- Table structure for table `Faculty`
--

CREATE TABLE `Faculty` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Faculty`
--

INSERT INTO `Faculty` (`id`, `name`, `code`, `createdAt`, `updatedAt`) VALUES
('035e3b9a-ac95-4385-a784-924b78adcf0e', 'Fakultas Teknik', 'FT', '2025-11-03 15:25:13.460', '2025-12-13 13:21:37.919'),
('2f0c9a2e-75c4-403f-96cf-e3529584e698', 'Fakultas Olahraga', 'FK', '2025-11-03 16:04:02.754', '2025-11-03 16:04:02.754'),
('3fe5fc71-35ae-4d2e-860c-9d6620e15e3c', 'testing tambah', 'TT', '2026-01-07 05:19:59.712', '2026-01-07 05:19:59.712'),
('75ae57ed-3a79-44c8-a7ec-971751530e2a', 'Fakultas Olahraga', 'FK', '2025-11-06 05:01:12.226', '2025-11-06 05:01:12.226'),
('7bdfad2e-0739-4308-866d-7495a66bdffa', 'Fakultas Testing Bro', 'FTB', '2025-12-13 16:09:39.490', '2025-12-13 16:09:39.490'),
('ad26cfd1-09d4-4c14-938e-ecca174e1068', 'fakuiltas live coding', 'FLC', '2026-01-03 06:57:14.545', '2026-01-03 06:57:14.545'),
('ed91151f-19e5-4a03-854c-c32e40d09677', 'Fakultas Kedokteran', 'FK', '2025-11-03 15:25:03.457', '2025-11-03 15:25:03.457');

-- --------------------------------------------------------

--
-- Table structure for table `Lecture`
--

CREATE TABLE `Lecture` (
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
-- Dumping data for table `Lecture`
--

INSERT INTO `Lecture` (`id`, `name`, `email`, `password`, `role`, `lectureNumber`, `position`, `majorId`, `createdAt`, `updatedAt`) VALUES
('194c222d-a89f-4b3d-902d-aed3e468c01c', 'akunbarudosen', 'akunbarudosen@gmail.com', '$2b$10$cmMA8xQUbcSdfpKKdZmavOIQf5tiAtYlxy0CxtwU2THVx1/xtZNaS', 'lecture', 38838, 'dosen', '68424e8e-5b89-4b70-bdbd-1067115ef6ce', '2026-01-08 08:46:18.801', '2026-01-08 08:47:35.431'),
('2d035510-07a4-49bb-9474-b7f975e4d2af', 'Komeng updated', 'komeng@gmail.com', '$2b$10$cmMA8xQUbcSdfpKKdZmavOIQf5tiAtYlxy0CxtwU2THVx1/xtZNaS', 'lecture', 2637821, 'KPS', 'd2192e14-40e2-4ee2-8002-32c9212f7bff', '2025-11-07 16:49:00.644', '2025-12-17 06:11:08.102');

-- --------------------------------------------------------

--
-- Table structure for table `Major`
--

CREATE TABLE `Major` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facultyId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Major`
--

INSERT INTO `Major` (`id`, `name`, `code`, `facultyId`, `createdAt`, `updatedAt`) VALUES
('68424e8e-5b89-4b70-bdbd-1067115ef6ce', 'Teknik Industri', '2218177', '035e3b9a-ac95-4385-a784-924b78adcf0e', '2025-11-04 12:56:22.958', '2025-11-04 12:56:22.958'),
('8c22b922-4b95-4442-8db5-1a0ad2e0d9a7', 'testing123', '123123', '2f0c9a2e-75c4-403f-96cf-e3529584e698', '2025-12-13 16:38:22.677', '2025-12-13 16:38:22.677'),
('d2192e14-40e2-4ee2-8002-32c9212f7bff', 'Teknik Informatika', '2218177', '035e3b9a-ac95-4385-a784-924b78adcf0e', '2025-11-06 13:53:13.119', '2025-11-06 13:53:13.119');

-- --------------------------------------------------------

--
-- Table structure for table `Payment`
--

CREATE TABLE `Payment` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Payment`
--

INSERT INTO `Payment` (`id`, `studentId`, `code`, `status`, `createdAt`, `updatedAt`) VALUES
('3967b936-7226-49c6-84cf-830f88e529c0', '74236916-6920-44c9-baa0-14075b30e76f', 'PAY202512245663', 'UNPAID', '2025-12-24 16:05:30.649', '2026-01-19 16:53:12.338'),
('63f7fd0a-6abd-4de3-8660-c0c70db7b971', '74236916-6920-44c9-baa0-14075b30e76f', 'PAY20250807', 'PAID', '2025-11-11 13:09:56.832', '2026-01-07 06:05:36.067'),
('cccdfa39-0c7c-418e-be7a-fde1c6791a20', 'a5642bc2-bec1-4dea-8382-875b4c35acd6', 'PAY20250807', 'PAID', '2025-11-08 16:09:02.785', '2025-12-25 05:39:45.543');

-- --------------------------------------------------------

--
-- Table structure for table `Schedule`
--

CREATE TABLE `Schedule` (
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
-- Dumping data for table `Schedule`
--

INSERT INTO `Schedule` (`id`, `timeStart`, `timeEnd`, `day`, `classId`, `courseId`, `createdAt`, `updatedAt`) VALUES
('0af0f1ce-91a0-4f17-b3d4-e5a6e8d901bd', '2025-11-10 08:00:00.000', '2025-11-10 10:00:00.000', 'Tuesday', '55f546d2-7e5a-428f-8e26-9c79d0613863', 'c2aba9cc-be3e-416c-b525-31cbc28ae9ca', '2025-11-10 16:03:32.806', '2025-11-10 16:04:41.642'),
('99ed7a58-d3d3-4fc3-8223-c517933f50e3', '2025-12-29 05:49:00.000', '2025-12-24 06:00:00.000', 'Senin', '44fc36cd-4c7e-4b10-aa64-75ec60f9b3ba', '67deff56-8326-4ef0-ab09-eb0e3546f8ef', '2025-12-24 05:49:34.021', '2025-12-24 05:49:34.021'),
('b5cf18f5-9212-4b34-87cf-afa855710587', '2025-12-30 06:00:00.000', '2025-12-30 09:00:00.000', 'Selasa', '55f546d2-7e5a-428f-8e26-9c79d0613863', '986ba105-b339-4cf7-a21d-6296c1dc3082', '2025-12-24 05:57:20.514', '2025-12-24 06:08:31.841');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'student',
  `studentNumber` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` int NOT NULL,
  `classOf` int NOT NULL,
  `tfGroupId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `classId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`id`, `name`, `email`, `password`, `role`, `studentNumber`, `semester`, `classOf`, `tfGroupId`, `classId`, `createdAt`, `updatedAt`) VALUES
('74236916-6920-44c9-baa0-14075b30e76f', 'student3 updated', 'student3@yahoo.com', '$2b$10$7mCWwKZsHOxZnPsQjHSMOOAASEgV35TyxJfXLLUkuHQ8PC4MZbkzm', 'student', '202511086170605', 5, 2024, 'ea3af5c0-1272-4f67-8dda-f88544391d19', '44fc36cd-4c7e-4b10-aa64-75ec60f9b3ba', '2025-11-08 15:32:51.346', '2025-12-22 15:59:18.152'),
('827ccee5-cf75-4957-9bc4-77b765deab63', 'testing2', 'testing2@gmail.com', '$2b$10$G9gLU0FWhaGlWISdYEgg7.p05AbzlLKdS2R8g/30v1aUyZDW/slPS', 'student', '202601218879413', 4, 2026, 'ea3af5c0-1272-4f67-8dda-f88544391d19', '44fc36cd-4c7e-4b10-aa64-75ec60f9b3ba', '2026-01-21 13:51:04.158', '2026-01-21 13:51:31.648'),
('a5642bc2-bec1-4dea-8382-875b4c35acd6', 'student2', 'student2@gmail.com', NULL, 'student', '202511073055274', 4, 2023, '0db8d652-d680-4570-a70a-372214e8cf80', '55f546d2-7e5a-428f-8e26-9c79d0613863', '2025-11-07 16:23:18.825', '2025-11-07 16:23:18.825');

-- --------------------------------------------------------

--
-- Table structure for table `StudyPlan`
--

CREATE TABLE `StudyPlan` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gpa` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `StudyPlan`
--

INSERT INTO `StudyPlan` (`id`, `studentId`, `status`, `gpa`, `createdAt`, `updatedAt`) VALUES
('84d7497f-f7f3-47d2-aa2d-c5082ab3f122', '74236916-6920-44c9-baa0-14075b30e76f', 'ONPROCESS', NULL, '2026-01-21 14:40:01.789', '2026-01-21 14:40:01.789'),
('bc21df15-cd9c-479d-bd7f-276fe513640c', '74236916-6920-44c9-baa0-14075b30e76f', 'ACCEPTED', NULL, '2025-11-17 06:31:27.414', '2026-01-12 05:33:49.466');

-- --------------------------------------------------------

--
-- Table structure for table `StudyPlanCourse`
--

CREATE TABLE `StudyPlanCourse` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int DEFAULT NULL,
  `studyPlanId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `courseId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance11` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance12` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance13` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance14` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance15` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attendance16` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task1` int DEFAULT NULL,
  `task2` int DEFAULT NULL,
  `task3` int DEFAULT NULL,
  `task4` int DEFAULT NULL,
  `uts` int DEFAULT NULL,
  `uas` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `StudyPlanCourse`
--

INSERT INTO `StudyPlanCourse` (`id`, `score`, `studyPlanId`, `courseId`, `attendance1`, `attendance2`, `attendance3`, `attendance4`, `attendance5`, `attendance6`, `attendance7`, `attendance8`, `attendance9`, `attendance10`, `attendance11`, `attendance12`, `attendance13`, `attendance14`, `attendance15`, `attendance16`, `task1`, `task2`, `task3`, `task4`, `uts`, `uas`, `createdAt`, `updatedAt`) VALUES
('10ae0b00-9b69-41f8-a575-e838672d0295', 100, 'bc21df15-cd9c-479d-bd7f-276fe513640c', '986ba105-b339-4cf7-a21d-6296c1dc3082', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 08:23:25.955', '2025-11-18 14:21:06.796'),
('3fe2ef07-25da-44bd-9aed-d6405513dfa0', NULL, '84d7497f-f7f3-47d2-aa2d-c5082ab3f122', '67deff56-8326-4ef0-ab09-eb0e3546f8ef', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-21 14:40:01.836', '2026-01-21 14:40:01.836');

-- --------------------------------------------------------

--
-- Table structure for table `TfGroup`
--

CREATE TABLE `TfGroup` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TfGroup`
--

INSERT INTO `TfGroup` (`id`, `group`, `amount`, `createdAt`, `updatedAt`) VALUES
('0db8d652-d680-4570-a70a-372214e8cf80', 'Golongan 2', 4000000, '2025-11-06 16:06:00.279', '2025-11-06 16:06:00.279'),
('ea3af5c0-1272-4f67-8dda-f88544391d19', 'Golongan 1', 2000000, '2025-11-06 16:05:49.197', '2025-11-06 16:05:49.197');

-- --------------------------------------------------------

--
-- Table structure for table `TimeLine`
--

CREATE TABLE `TimeLine` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TimeLine`
--

INSERT INTO `TimeLine` (`id`, `name`, `date`, `createdAt`, `updatedAt`) VALUES
('61136adb-6d5f-4d0e-8910-b463ce224fcb', 'UTS', '2025-11-14 00:00:00.000', '2025-11-12 05:48:36.270', '2025-11-12 05:48:36.270'),
('719084f5-7096-442e-be4f-d0345c1291b6', 'UAS susulan', '2026-02-14 00:00:00.000', '2026-01-20 03:33:06.259', '2026-01-20 03:33:06.259'),
('a92babd0-9df4-4d03-82d7-3bfbf2b2c0aa', 'Ujian Tengah Semester', '2025-11-12 00:00:00.000', '2025-11-09 09:00:33.411', '2025-11-09 09:00:33.411');

-- --------------------------------------------------------

--
-- Table structure for table `TuitionFee`
--

CREATE TABLE `TuitionFee` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `studentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `TuitionFee`
--

INSERT INTO `TuitionFee` (`id`, `studentId`, `status`, `createdAt`, `updatedAt`) VALUES
('41607b2b-327e-497d-aeae-37ba985916cd', '74236916-6920-44c9-baa0-14075b30e76f', 'Lunas', '2025-12-22 17:20:08.269', '2025-12-22 17:39:42.441'),
('4342ede3-7f54-451b-b2a1-1d74de39d421', 'a5642bc2-bec1-4dea-8382-875b4c35acd6', 'Belum Lunas', '2025-11-08 15:32:28.855', '2025-11-08 15:32:28.855');

-- --------------------------------------------------------

--
-- Table structure for table `UserSiakad`
--

CREATE TABLE `UserSiakad` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `UserSiakad`
--

INSERT INTO `UserSiakad` (`id`, `name`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
('0b53cd99-6fca-45ce-8cef-87be0eae81cb', 'testingnew update', 'testingnewupdate@gmail.com', '$2b$10$3OXios6sucMH6NrMk/g7BepK4ahBbVm4mN0ahF.gTAUHSBbz..r/K', 'lecture', '2025-12-25 06:04:50.839', '2025-12-25 06:06:23.167'),
('185ed975-6a2f-484f-97f0-dcbdbb5db11d', 'Admin2', 'admin2@gmail.com', '$2b$10$fp45iBOIcphdvib1Nvg4LOOiXuYXHLm5SQCrc0odZEOluKVybl0ni', 'admin', '2025-12-12 15:01:30.282', '2025-12-12 15:01:30.282'),
('3d2642de-80d9-44e8-9fe4-71e3bf8968ad', 'testinglivecoding', 'testinglivecoding@gmail.com', '$2b$10$kuWnEZoTl3TCgbpNcxg/iuMYSsmvlOMoovQpbhc9lEIvUpW/jqw/m', 'admin', '2026-01-07 21:47:49.913', '2026-01-07 21:47:49.913'),
('6b5f2ddd-26d3-4fbf-bb37-5038b7260e5c', 'Udin3', 'udin3@gmail.com', '$2b$10$8h9qiyBbr2IKUwRESqH2gukeY6zgYzGSJccEQLgb.rEJPszjz19B.', 'student', '2025-11-08 14:20:43.221', '2025-11-08 14:20:43.221'),
('97252897-a54d-472c-af27-7e97689785e3', 'hafid', 'ahmadhafid@gmail.com', '$2b$10$v2emTn4r.javRdc4hOmHRevttlfnGTEi5D6JhkDp38B6T.DZY.U2i', 'admin', '2025-11-02 07:01:05.236', '2025-11-02 07:01:05.236'),
('979e215b-31af-4d9c-955c-1afe8418b373', 'testing123', 'testing123@gmail.com', '$2b$10$7JFNqoh2JUTZ39QB1KAOWe8pExC3MGYPzzA15EuPx8mzgoX/nMooq', 'admin', '2025-12-13 04:09:32.615', '2025-12-13 04:09:32.615'),
('beaad75d-9dad-44aa-a231-9dd3fffa1160', 'Udin2', 'udin2@gmail.com', '$2b$10$UiMZzEV30/ZydQ7ttUegKujwW9M6WikDlb9eaFkF8DUtETQaU62yC', 'student', '2025-11-08 14:20:34.464', '2025-11-08 14:20:34.464'),
('bec2844f-0862-41ba-bd0d-56bf7e50ae23', 'hafid', 'hafid2@gmail.com', '$2b$10$a7TSu/Pc84SKOeYnNdA5AO5mAKOJf.3JJbrQJNBVx6uvSA9ygUTNW', 'admin', '2025-11-02 06:58:58.486', '2025-11-02 06:58:58.486');

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
('668a7037-59c4-4fc0-bea0-fc0342ca0c48', '2626863cd70470b44f6effe004d13507895a29d39fefb986175419db5e0f4534', '2025-11-01 11:14:06.467', '20251101111406_init', NULL, NULL, '2025-11-01 11:14:06.319', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `AcademyYear`
--
ALTER TABLE `AcademyYear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Class`
--
ALTER TABLE `Class`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Class_majorId_fkey` (`majorId`),
  ADD KEY `Class_yearId_fkey` (`yearId`);

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Course_lectureId_fkey` (`lectureId`);

--
-- Indexes for table `Faculty`
--
ALTER TABLE `Faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Lecture`
--
ALTER TABLE `Lecture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Lecture_majorId_fkey` (`majorId`);

--
-- Indexes for table `Major`
--
ALTER TABLE `Major`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Major_facultyId_fkey` (`facultyId`);

--
-- Indexes for table `Payment`
--
ALTER TABLE `Payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Payment_studentId_fkey` (`studentId`);

--
-- Indexes for table `Schedule`
--
ALTER TABLE `Schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Schedule_classId_fkey` (`classId`),
  ADD KEY `Schedule_courseId_fkey` (`courseId`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Student_studentNumber_key` (`studentNumber`),
  ADD KEY `Student_tfGroupId_fkey` (`tfGroupId`),
  ADD KEY `Student_classId_fkey` (`classId`);

--
-- Indexes for table `StudyPlan`
--
ALTER TABLE `StudyPlan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StudyPlan_studentId_fkey` (`studentId`);

--
-- Indexes for table `StudyPlanCourse`
--
ALTER TABLE `StudyPlanCourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `StudyPlanCourse_studyPlanId_fkey` (`studyPlanId`),
  ADD KEY `StudyPlanCourse_courseId_fkey` (`courseId`);

--
-- Indexes for table `TfGroup`
--
ALTER TABLE `TfGroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TimeLine`
--
ALTER TABLE `TimeLine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `TuitionFee`
--
ALTER TABLE `TuitionFee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TuitionFee_studentId_fkey` (`studentId`);

--
-- Indexes for table `UserSiakad`
--
ALTER TABLE `UserSiakad`
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
-- Constraints for table `Class`
--
ALTER TABLE `Class`
  ADD CONSTRAINT `Class_majorId_fkey` FOREIGN KEY (`majorId`) REFERENCES `Major` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Class_yearId_fkey` FOREIGN KEY (`yearId`) REFERENCES `AcademyYear` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Course`
--
ALTER TABLE `Course`
  ADD CONSTRAINT `Course_lectureId_fkey` FOREIGN KEY (`lectureId`) REFERENCES `Lecture` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Lecture`
--
ALTER TABLE `Lecture`
  ADD CONSTRAINT `Lecture_majorId_fkey` FOREIGN KEY (`majorId`) REFERENCES `Major` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Major`
--
ALTER TABLE `Major`
  ADD CONSTRAINT `Major_facultyId_fkey` FOREIGN KEY (`facultyId`) REFERENCES `Faculty` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Payment`
--
ALTER TABLE `Payment`
  ADD CONSTRAINT `Payment_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `Student` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Schedule`
--
ALTER TABLE `Schedule`
  ADD CONSTRAINT `Schedule_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `Class` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Schedule_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `Student_classId_fkey` FOREIGN KEY (`classId`) REFERENCES `Class` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_tfGroupId_fkey` FOREIGN KEY (`tfGroupId`) REFERENCES `TfGroup` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `StudyPlan`
--
ALTER TABLE `StudyPlan`
  ADD CONSTRAINT `StudyPlan_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `Student` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `StudyPlanCourse`
--
ALTER TABLE `StudyPlanCourse`
  ADD CONSTRAINT `StudyPlanCourse_courseId_fkey` FOREIGN KEY (`courseId`) REFERENCES `Course` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `StudyPlanCourse_studyPlanId_fkey` FOREIGN KEY (`studyPlanId`) REFERENCES `StudyPlan` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `TuitionFee`
--
ALTER TABLE `TuitionFee`
  ADD CONSTRAINT `TuitionFee_studentId_fkey` FOREIGN KEY (`studentId`) REFERENCES `Student` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
