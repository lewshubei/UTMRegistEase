-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 09, 2025 at 04:25 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utmregistease`
--

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `day1` varchar(255) DEFAULT NULL,
  `day2` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `program` varchar(255) DEFAULT NULL,
  `section` varchar(255) DEFAULT NULL,
  `time1` varchar(255) DEFAULT NULL,
  `time2` varchar(255) DEFAULT NULL,
  `venue1` varchar(255) DEFAULT NULL,
  `venue2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `code`, `day1`, `day2`, `name`, `program`, `section`, `time1`, `time2`, `venue1`, `venue2`) VALUES
(0, 'SECJ2203', 'TUE', 'WED', 'WEB PROGRAMMING', 'SECJH', '02', '08:00-11:00', '02:00-04:00', 'MPK8', 'MPK10'),
(1, 'SECR2204', 'MON', NULL, 'DATA STRUCTURES', 'SECRH', '01', '10:00-12:00', NULL, 'MPK7', NULL),
(2, 'SECV3201', 'WED', 'FRI', 'SOFTWARE ENGINEERING', 'SECVH', '03', '09:00-11:00', '01:00-03:00', 'MPK5', 'MPK4'),
(3, 'SECP2101', 'TUE', NULL, 'OBJECT-ORIENTED PROGRAMMING', 'SECPH', '04', '11:00-01:00', NULL, 'MPK3', NULL),
(4, 'SECB3202', 'THU', 'FRI', 'DATABASE SYSTEMS', 'SECBH', '02', '08:00-10:00', '04:00-06:00', 'MPK1', 'MPK8'),
(5, 'SECJ2202', 'TUE', NULL, 'COMPUTER NETWORKS', 'SECJH', '01', '09:00-11:00', NULL, 'MPK9', NULL),
(6, 'SECV4203', 'MON', 'THU', 'MACHINE LEARNING', 'SECVH', '05', '08:00-10:00', '03:00-05:00', 'MPK6', 'MPK5'),
(7, 'SECR3203', 'TUE', NULL, 'ARTIFICIAL INTELLIGENCE', 'SECRH', '03', '10:00-12:00', NULL, 'MPK4', NULL),
(8, 'SECB3104', 'WED', 'THU', 'COMPUTER GRAPHICS', 'SECBH', '02', '11:00-01:00', '02:00-04:00', 'MPK2', 'MPK1'),
(9, 'SECP4101', 'FRI', NULL, 'CYBER SECURITY', 'SECPH', '04', '03:00-05:00', NULL, 'MPK8', NULL),
(10, 'SECR1101', 'TUE', NULL, 'INTRODUCTION TO PROGRAMMING', 'SECRH', '01', '08:00-10:00', NULL, 'MPK7', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
