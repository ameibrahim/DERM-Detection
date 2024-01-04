-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2023 at 08:54 AM
-- Server version: 10.5.20-MariaDB-cll-lve-log
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aiiovdft_health`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@health.aiiot.website', 'admin43210');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` varchar(255) NOT NULL,
  `patient_email` varchar(100) DEFAULT NULL,
  `patient_phone` varchar(100) DEFAULT NULL,
  `doctor_id` varchar(255) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `service_type` varchar(255) NOT NULL,
  `service_description` text DEFAULT NULL,
  `appointment_status` enum('pending','confirmed','cancelled') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `patient_email`, `patient_phone`, `doctor_id`, `appointment_date`, `appointment_time`, `service_type`, `service_description`, `appointment_status`, `created_at`) VALUES
(1, 'jsmith', NULL, NULL, 'Faith Linda', '2023-05-16', '12:05:00', 'checkup', 'routine checkup', 'confirmed', '2023-05-04 02:36:33'),
(2, 'P002', NULL, NULL, 'Mnono Mfupi', '2023-05-11', '11:00:00', 'consultation', 'follow-up consultation', 'confirmed', '2023-05-04 02:36:33'),
(3, 'P003', NULL, NULL, 'Clf Lyno', '2023-05-12', '14:30:00', 'procedure', 'tooth extraction', 'pending', '2023-05-04 02:36:33'),
(4, 'P004', NULL, NULL, 'Beva kosana', '2023-05-13', '16:00:00', 'checkup', 'annual checkup', 'confirmed', '2023-05-04 02:36:33'),
(5, 'P005', NULL, NULL, 'D002', '2023-05-14', '10:00:00', 'consultation', 'new patient consultation', 'cancelled', '2023-05-04 02:36:33'),
(8, 'vmercel@outlook.fr', NULL, NULL, 'Ibrahim Ame', '2023-05-10', '12:22:00', 'General Medicine', 'Text has been added here', '', '2023-05-22 09:19:06'),
(31, 'Vubangsi Mercel', 'vmercel@gmail.com', '17407463082', 'Mercel ', '2023-06-14', '17:41:00', 'Physical Therapy', 'appointment edited on June 4, 2023', 'confirmed', '2023-06-04 16:37:59'),
(38, 'Max', 'mercel.vubangsi@outlook.com', '0542 852 09 85', 'Mercel Vubangsi', '2023-06-16', '10:50:00', 'General Medicine', 'patient coming for general checkup', 'confirmed', '2023-06-14 05:49:51'),
(39, 'Max', 'mercel.vubangsi@outlook.com', '0542 852 09 85', 'Mercel Vubangsi', '2023-06-16', '10:50:00', 'General Medicine', NULL, '', '2023-06-14 05:49:57'),
(40, 'Louisa Aiyeyika', 'ebunaiyeyika@gmail.com', '08126661692', 'Ibrahim Ame', '2023-06-20', '16:05:00', 'Dentistry', NULL, 'pending', '2023-06-15 11:06:32'),
(41, 'Louisa Aiyeyika', 'ebunaiyeyika@gmail.com', '08126661692', 'Ibrahim Ame', '2023-06-20', '16:05:00', 'Dentistry', NULL, '', '2023-06-15 11:06:42'),
(42, 'Louisa Aiyeyika', 'ebunaiyeyika@gmail.com', '08126661692', 'Mahmoud Abduswamad', '2023-06-20', '09:25:00', 'General Medicine', NULL, 'pending', '2023-06-15 14:23:51'),
(43, 'Louisa Aiyeyika', 'ebunaiyeyika@gmail.com', '08126661692', 'Mahmoud Abduswamad', '2023-06-20', '09:25:00', 'General Medicine', NULL, '', '2023-06-15 14:24:00');

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `id` int(6) UNSIGNED NOT NULL,
  `device_id` varchar(50) NOT NULL,
  `user` varchar(30) NOT NULL,
  `mqttserver` varchar(50) NOT NULL,
  `mqttuser` varchar(30) NOT NULL,
  `mqttpass` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`id`, `device_id`, `user`, `mqttserver`, `mqttuser`, `mqttpass`) VALUES
(1, '0123ab', 'jsmith', 'mqtt.example.com', 'jsmith', 'password'),
(2, '', 'jdoe', 'mqtt.example.com', 'jdoe', 'password'),
(3, '', '20215449', 'mqtt.example.com', '20215449', 'Marvel16');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(2) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `specialty` varchar(250) NOT NULL DEFAULT 'General Medicine',
  `license` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `username`, `password`, `firstname`, `lastname`, `email`, `age`, `phone`, `specialty`, `license`, `gender`, `address`) VALUES
(1, 'ibrahim', 'hello123', 'Ibrahim', 'Ame', 'ame.ibrahim@yahoo.com', 55, '0777777777', 'General Medicine', '834738773', 'Male', '456 Road'),
(2, 'teyei', 'hello123', 'Teyei', '', 'teyei@gmail.com', 20, '0947583754', 'Physical Therapy', '7475836', 'Female', '456 Road Road'),
(3, 'mahmoud', 'hello123', 'Mahmoud', 'Abduswamad', 'moudi@gmail.com', 20, '03848465836', 'Ophthalmology', '57484637', 'Male', '475 Road Road'),
(9, 'vmercel', 'marvel', 'Mercel', 'Vubangsi', 'vmercel@gmail.com', 41, '+905338294913', 'General Medicine', 'XYZ Certified MD', 'Male', '3549 85th Ave, Apt 101 Lanham '),
(10, 'fadi', 'fadi123', 'Fadi', 'Al-Turjman', 'fadi.alturjman@neu.edu.tr', 40, '+905428520985', 'General Medicine', 'XYZ2 Certified MD', 'Male', 'Near East Boulevard, NEU, 9913');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `calendar_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_allday` tinyint(1) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `calendar_id`, `title`, `start_time`, `end_time`, `is_allday`, `category`, `user`) VALUES
(1, 1, 'Weekly Checkup', '2022-01-01 09:00:00', '2022-01-01 10:00:00', 0, 'health', 'jdoe'),
(2, 2, 'Dr. Ambedkar - Orthopaedic', '2022-01-02 13:00:00', '2022-01-02 19:00:00', 0, 'health', '20215449'),
(3, 3, 'Operation - ICU', '2022-10-08 00:00:00', '2022-10-08 23:59:59', 1, 'health', 'jsmith'),
(4, 1, 'Team Meeting', '2022-01-03 14:00:00', '2022-01-03 15:00:00', 0, 'work', 'jsmith');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `coordinates` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`coordinates`))
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `user`, `coordinates`) VALUES
(1, 'doctor', '[{\"latitude\":\"35.226817\",\"longitude\":\"33.3196919\"}]'),
(2, 'admin', '[{\"latitude\": 37.7749, \"longitude\": -122.4194}, {\"latitude\": 37.7750, \"longitude\": -122.4195}, {\"latitude\": 37.7751, \"longitude\": -122.4196}]'),
(3, 'patient', '[{\"latitude\": 51.5074, \"longitude\": -0.1278}, {\"latitude\": 51.5075, \"longitude\": -0.1279}, {\"latitude\": 51.5076, \"longitude\": -0.1280}, {\"latitude\": 51.5077, \"longitude\": -0.1281}]'),
(24, 'jsmith', '[{\"latitude\":35.2223232,\"longitude\":33.3348864},{\"latitude\":\"35.2268024\",\"longitude\":\"33.3196853\"},{\"latitude\":35.2223232,\"longitude\":33.3348864},{\"latitude\":35.2223232,\"longitude\":33.3348864},{\"latitude\":35.2223232,\"longitude\":33.3348864},{\"latitude\":35.2223232,\"longitude\":33.3381632},{\"latitude\":35.2223232,\"longitude\":33.3381632},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":\"35.2268014\",\"longitude\":\"33.3196863\"},{\"latitude\":35.2223232,\"longitude\":33.3381632},{\"latitude\":35.2223232,\"longitude\":33.3381632},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":36.9837,\"longitude\":35.3298},{\"latitude\":\"35.1856749\",\"longitude\":\"33.3512043\"},{\"latitude\":\"35.2266126\",\"longitude\":\"33.3195792\"}]'),
(28, 'momo', '[{\"latitude\":\"35.2211007\",\"longitude\":\"33.3260151\"},{\"latitude\":\"35.2211008\",\"longitude\":\"33.3260164\"}]'),
(25, 'vubang', '[{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"}]'),
(26, 'lau', '[{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"},{\"latitude\":\"35.12457\",\"longitude\":\"33.12547\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `patienntTemp`
--

CREATE TABLE `patienntTemp` (
  `userName` varchar(40) NOT NULL,
  `Temp` varchar(255) NOT NULL DEFAULT ' 37 37 37 37 37 37 37 37 37 37 37 37 37 37 37 37 37 37 37 37'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patienntTemp`
--

INSERT INTO `patienntTemp` (`userName`, `Temp`) VALUES
('jsmith', '29.30 29.79 29.30 29.79 29.79 29.30 29.30 29.30 29.30 29.30 29.30 29.30 29.30 29.30 29.30 29.30 29.30 29.79 29.30 29.30 29.30');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `Age` int(11) NOT NULL,
  `Ambulation` tinyint(1) NOT NULL DEFAULT 0,
  `BMI` decimal(4,1) NOT NULL,
  `Chills` tinyint(1) NOT NULL DEFAULT 0,
  `Contacts` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Email` varchar(255) NOT NULL,
  `DBP` int(11) NOT NULL,
  `DecreasedMood` tinyint(1) NOT NULL DEFAULT 0,
  `FiO2` int(11) NOT NULL,
  `GeneralizedFatigue` tinyint(1) NOT NULL DEFAULT 0,
  `HeartRate` int(11) NOT NULL,
  `HistoryFever` varchar(255) NOT NULL,
  `RR` int(11) NOT NULL,
  `RecentHospitalStay` date NOT NULL,
  `SBP` int(11) NOT NULL,
  `SpO2` int(11) NOT NULL,
  `Temp` double NOT NULL,
  `WeightGain` int(11) NOT NULL DEFAULT 0,
  `WeightLoss` int(11) NOT NULL DEFAULT 0,
  `BGroup` varchar(255) NOT NULL,
  `Sex` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `latitude` varchar(100) NOT NULL DEFAULT '35.2157696',
  `longitude` varchar(100) NOT NULL DEFAULT '33.34144',
  `ecg` varchar(50) NOT NULL DEFAULT '0',
  `status` varchar(250) NOT NULL DEFAULT 'patient',
  `user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`ID`, `Name`, `Address`, `Age`, `Ambulation`, `BMI`, `Chills`, `Contacts`, `DOB`, `Email`, `DBP`, `DecreasedMood`, `FiO2`, `GeneralizedFatigue`, `HeartRate`, `HistoryFever`, `RR`, `RecentHospitalStay`, `SBP`, `SpO2`, `Temp`, `WeightGain`, `WeightLoss`, `BGroup`, `Sex`, `pass`, `latitude`, `longitude`, `ecg`, `status`, `user`) VALUES
(1, 'John Smith', '123 Main Street', 35, 0, 24.5, 0, '123-456-7890', '1986-01-01', 'vmercel@gmail.com', 68, 0, 90, 0, 0, 'Never', 78, '0000-00-00', 230, 0, 30, 0, 0, 'O+', 'Male', 'password', '1001', '1002', '1,1024,1024,1024,1024,1024,1024,1024,1024,1024,102', 'patient', 'jsmith'),
(2, 'Jane Doe', '456 Park Avenue', 28, 0, 21.0, 0, '098-765-4321', '1993-02-14', 'janedoe@example.com', 75, 0, 95, 0, 85, 'Once', 15, '0000-00-00', 115, 96, 98, 0, 0, 'A-', 'Female', 'password', '12.3456', '-78.9012', '0', 'patient', 'jdoe'),
(3, 'Vubangsi Mercel', 'Department of Computer Science,', 0, 0, 19.0, 0, '17407463080', '2022-12-16', 'vmercel@gmail.com', 69, 0, 55, 0, 83, 'Never', 12, '0000-00-00', 101, 97, 98, 0, 0, 'A', 'Male', 'Marvel16', '1001', '1002', '0', 'patient', '20215449'),
(4, 'Ntumbi Laura', 'C/O Ntumbi Rex N. J.,', 1, 0, 21.0, 0, '17407463082', '2022-12-27', 'vmercel@yahoo.com', 60, 0, 55, 0, 99, 'Never', 12, '0000-00-00', 99, 97, 95, 0, 0, 'A', 'Female', 'Marvel@16', '35.12457', '33.12547', '0', 'patient', 'lau'),
(5, 'Venan Noela', 'C/O Ntumbi Rex N. J.,', 0, 0, 21.0, 0, '17407463081', '2022-12-04', 'vmercel@gmail.com', 77, 0, 78, 0, 96, 'Never', 12, '0000-00-00', 97, 94, 96, 0, 0, 'A', 'Female', 'Marvel16', '12.3456', '-78.9012', '0', 'patient', 'noela'),
(6, 'fadi', 'Near East University, Innovation and Information Technologies Center Faculty of Engineering Tel: +90 (392) 223 66 24', 42, 0, 0.0, 0, '4567880000', '1980-01-01', 'alturjman@outlook.com', 69, 0, 63, 0, 85, 'Never', 14, '0000-00-00', 0, 91, 95, 0, 0, 'A-', 'Male', 'Fadi1234', '1001', '1002', '0', 'admin', 'fadi'),
(7, 'mehmet Ilker Gelisen', 'Faculty6 of Pharmacy', 69, 0, 21.0, 0, '905338559367', '1953-03-11', 'ilker.gelisen@neu.edu.tr', 69, 0, 64, 0, 61, 'Never', 12, '0000-00-00', 113, 95, 96, 0, 0, 'ARh+', 'Male', 'Ankara765%', '12.3456', '-78.9012', '0', 'patient', 'ilker.gelisen@neu.edu.tr'),
(8, 'Keyna Inamugisha', 'agaoglu 2, gumus sokak', 22, 0, 21.0, 0, '5338857918', '2000-04-19', 'kinamugisha@gmail.com', 76, 0, 88, 0, 98, 'Never', 12, '0000-00-00', 113, 92, 97, 0, 0, 'O+', 'Female', 'KeynaLaure1', '1001', '1002', '0', 'patient', 'keyna'),
(9, 'mohamad darwish', 'Nicosia', 23, 0, 20.0, 0, '5391041078', '1999-05-27', 'mohameddarwaish@gmail.com', 64, 0, 51, 0, 67, 'Never', 12, '0000-00-00', 111, 99, 96, 0, 0, 'A', 'Male', 'Hamoda2799', '12.3456', '-78.9012', '0', 'patient', 'mohamad'),
(10, 'vubangsi', 'lefkosa', 0, 0, 22.0, 0, '5338294913', '2023-03-29', '05338294913', 73, 0, 94, 0, 63, 'Never', 15, '0000-00-00', 90, 92, 97, 0, 0, 'O+', 'Male', 'abc', '12.3456', '-78.9012', '0', 'patient', 'vubang'),
(11, 'Ibrahim Ame', '490 NEU', 0, 0, 18.0, 0, '744444444', '2022-09-07', 'ame.ibrahim@yahoo.com', 62, 0, 65, 0, 92, 'Never', 13, '0000-00-00', 103, 98, 97, 0, 0, 'B-', 'Male', 'IbrahimAme123', '1001', '1002', '0', 'patient', 'ibrahimame'),
(15, 'dgfd', 'lefcosa', 24, 0, 23.0, 0, '5391041078', '1999-02-22', 'mohamad@technoportcy.com', 68, 0, 63, 0, 93, 'Never', 13, '0000-00-00', 101, 100, 96, 0, 0, 'O ', 'female', '00000', '12.3456', '-78.9012', '0', 'patient', 'mohamad@technoportcy.com'),
(16, 'mohamad darwish', 'lefcosa', 23, 0, 19.0, 0, '5391041078', '1999-05-27', 'mohamad@technoportcy.com', 70, 0, 78, 0, 63, 'Never', 15, '0000-00-00', 119, 98, 95, 0, 0, 'A ', 'male', '00000', '35.02124', '33.25457', '0', 'patient', 'mohamad99'),
(17, 'mohamad darwish', 'lefcosa', 23, 0, 19.0, 0, '5391041078', '1999-05-27', 'mohamad@technoportcy.com', 79, 0, 98, 0, 83, 'Never', 12, '0000-00-00', 118, 91, 98, 0, 0, 'A ', 'male', '00000', '35.02124', '33.25457', '0', 'patient', 'mohamad99'),
(18, 'Mohamaddarwish', 'Lefcosa', 23, 0, 24.0, 0, '0', '1999-05-27', 'mohamad99darwish@gmail.com', 69, 0, 52, 0, 74, 'Never', 15, '0000-00-00', 105, 94, 98, 0, 0, 'A ', 'male', '00000', '35.02124', '33.25457', '0', 'patient', 'Mohamad99'),
(19, 'mohamad darwish', 'lefcosa', 24, 0, 18.0, 0, '5391041078', '1999-02-07', '20222992@std.neu.edu.tr', 79, 0, 77, 0, 90, 'Never', 15, '0000-00-00', 107, 93, 97, 0, 0, 'A ', 'male', '0000000000', '12.3456', '-78.9012', '0', 'patient', '20222992'),
(20, 'Louisa Aiyeyika', 'Lefkosa Northen Cyprus', 34, 0, 24.0, 0, '5488574511', '1989-03-30', 'ebunaiyeyika@gmail.com', 68, 0, 82, 0, 87, 'Never', 15, '0000-00-00', 97, 96, 95, 0, 0, 'O+', 'Female', '2234Louisa', '1001', '1002', '0', 'patient', 'louisafowo'),
(21, 'Louisa Aiyeyika', 'Lefkosa Northen Cyprus', 34, 0, 22.0, 0, '5488574511', '1989-03-30', 'ebunaiyeyika@gmail.com', 74, 0, 89, 0, 63, 'Never', 15, '0000-00-00', 112, 97, 97, 0, 0, 'O+', 'Female', 'L22o34ui4322sa', '12.3456', '-78.9012', '0', 'patient', '20213962'),
(22, 'Mansur', 'Department Computer Engineering', 54, 0, 20.0, 0, '53911971', '1969-04-12', 'mansurtsafe@yahoo.com', 65, 0, 83, 0, 91, 'Never', 14, '0000-00-00', 116, 93, 98, 0, 0, 'AB', 'Male', 'Mm20225534', '12.3456', '-78.9012', '0', 'doctor', 'Mohammed'),
(23, 'Fatemeh Kalkaba', 'Lefkosa', 24, 0, 23.0, 0, '905330000000', '1999-01-01', '20226155@std.neu.edu.tr', 61, 0, 67, 0, 96, 'Never', 12, '0000-00-00', 107, 99, 96, 0, 0, 'O+', 'Female', 'Fate1234', '1001', '1002', '0', 'patient', 'fatemeh'),
(24, 'name', 'lefcosa', 24, 0, 0.0, 0, '5391041074', '1999-02-22', 'name@technoportcy.com', 79, 0, 61, 0, 61, 'Never', 12, '0000-00-00', 0, 96, 96, 0, 0, 'O ', 'female', '00000', '35.2211008', '33.3260164', '0', 'patient', 'momo'),
(25, 'health momo', 'lefcosa', 24, 0, 23.0, 0, '5391041074', '1999-02-22', 'health@health.com', 77, 0, 99, 0, 64, 'Never', 12, '0000-00-00', 94, 93, 99, 0, 0, 'O ', 'male', '121221', '12.3456', '-78.9012', '0', 'patient', 'health'),
(26, 'jsmith1', 'lefcosa', 24, 0, 23.0, 0, '5391041078', '1999-02-22', 'mohamad@technoportcy.com', 65, 0, 53, 0, 79, 'Never', 15, '0000-00-00', 107, 99, 98, 0, 0, 'O ', 'female', 'password', '12.3456', '-78.9012', '0', 'doctor', 'mohamad@technoportcy.com'),
(27, 'MOHAMD darwish', 'nicosia', 23, 0, 20.0, 0, '5391041078', '1999-11-11', 'mohamad@technoportcy.com', 66, 0, 64, 0, 72, 'Never', 12, '0000-00-00', 95, 98, 96, 0, 0, 'A', 'Male', 'Xg?qkj:aBB2%', '12.3456', '-78.9012', '0', 'patient', 'mm12'),
(28, 'Mohamad Darwish', 'Bicosia', 27, 0, 24.0, 0, '508042344', '1996-05-25', 'Xmood360@gmail.com', 75, 0, 61, 0, 92, 'Never', 15, '0000-00-00', 99, 94, 96, 0, 0, 'A', 'Male', 'Darwich2344', '35.02124', '33.25457', '0', 'patient', 'Darwich'),
(29, 'max', 'lefkosa', 22, 0, 22.0, 0, '9876', '2001-01-01', 'abc@mail.com', 79, 0, 95, 0, 66, 'Never', 14, '0000-00-00', 101, 98, 96, 0, 0, 'O ', 'Male', 'Maxwel123', '35.02124', '33.25457', '0', 'patient', 'max'),
(31, 'dgfd', 'lefcosa', 24, 0, 22.0, 0, '5391041078', '1999-02-22', 'mohamad@technoportcy.com', 61, 0, 59, 0, 73, 'Never', 15, '0000-00-00', 98, 94, 98, 0, 0, 'O ', 'female', '00000', '35.2157696', '33.34144', '0', 'patient', 'mohamad@technoportcy.com'),
(32, 'cPanel', 'lefkosa', 24, 0, 0.0, 0, '5391041078', '1999-02-22', 'cPanel@technoportcy.com', 68, 0, 90, 0, 72, 'Never', 15, '0000-00-00', 0, 93, 97, 0, 0, 'O ', 'female', '00000', '35.2157696', '33.34144', '0', 'patient', 'panel'),
(33, 'cPane04', 'KKTC, lefkosa', 29, 0, 18.0, 0, '54888343564', '1994-03-26', 'panel04@health.com', 66, 0, 92, 0, 100, 'Never', 16, '0000-00-00', 105, 91, 98, 0, 0, 'AB', 'AB ', '123456', '35.2157696', '33.34144', '0', 'patient', 'panel04'),
(34, 'cPane04', 'lefkosa', 29, 0, 22.0, 0, '54888343564', '1994-03-26', 'panel04@health.com', 68, 0, 84, 0, 92, 'Never', 12, '0000-00-00', 92, 94, 97, 0, 0, 'AB', 'AB ', '123456', '35.2157696', '33.34144', '0', 'patient', 'panel04'),
(35, 'cPane042', 'lefkosa', 29, 0, 18.0, 0, '54888343564', '1994-03-26', 'panel042@health.com', 73, 0, 78, 0, 81, 'Never', 12, '0000-00-00', 98, 95, 95, 0, 0, 'AB', 'AB ', '123456', '35.2157696', '33.34144', '0', 'patient', 'panel042'),
(36, 'dgfd', 'lefcosa', 24, 0, 19.0, 0, '5391041078', '1999-02-22', 'mohamad@technoportcy.com', 78, 0, 57, 0, 70, 'Never', 15, '0000-00-00', 97, 98, 97, 0, 0, 'O ', 'female', '00000', '35.2157696', '33.34144', '0', 'patient', 'mohamad@technoportcy.com'),
(38, 'Fadi Al-Turjman', 'Near East University, Innovation and Information Technologies Center Faculty of Engineering Tel:  90 (392) 223 66 24', 43, 0, 0.0, 0, '90', '1980-01-01', 'fadi.alturjman@neu.edu.tr', 76, 0, 70, 0, 82, 'Never', 12, '0000-00-00', 0, 93, 96, 0, 0, 'A ', 'Male', 'Fadi1234', '1001', '1002', '0', 'patient', 'fadi'),
(39, 'James McDowel', 'lefkosa', 51, 0, 0.0, 0, '5338767654', '1971-10-13', 'doctor@mail.com', 78, 0, 75, 0, 85, 'Never', 12, '0000-00-00', 0, 90, 95, 0, 0, 'A', 'Male', 'Doctor123', '1001', '1002', '0', 'doctor', 'doctor'),
(40, 'Jeremy Loyd', '4938 85th Ave Apt 101, Lanham, Maryland', 23, 0, 19.0, 0, '5337656567', '2000-05-04', 'patient@mail.com', 61, 0, 79, 0, 74, 'Never', 12, '0000-00-00', 102, 91, 97, 0, 0, 'O+', 'Male', 'Patient123', '1001', '1002', '0', 'patient', 'patient'),
(41, 'Super Administrator', 'Lefkosa', 24, 0, 18.0, 0, '905338294913', '1999-01-01', 'vmercel@outlook.fr', 74, 0, 71, 0, 71, 'Never', 12, '0000-00-00', 111, 93, 95, 0, 0, 'AB', 'Male', 'Admin123', '1001', '1002', '0', 'admin', 'admin'),
(42, 'vubangsi darian', 'lefkosa', 23, 0, 23.0, 0, '8575757585', '2000-01-01', 'abcd@efg.com', 79, 0, 74, 0, 80, 'Never', 14, '0000-00-00', 99, 95, 98, 0, 0, 'O ', 'Male', 'Marvel@1985', '35.02124', '33.25457', '0', 'patient', 'darian'),
(43, 'MOHAMD DAR', 'nicosia', 24, 0, 23.0, 0, '5391041078', '1999-05-27', 'mohamad@technoportcy.com', 65, 0, 88, 0, 60, 'Never', 13, '0000-00-00', 104, 96, 96, 0, 0, 'A', 'Male', '123456789', '35.02124', '33.25457', '0', 'patient', 'MOHAMAD99'),
(44, 'm', 'KKTC, lefkosa', 29, 0, 20.0, 0, '54888343564', '1994-03-26', 'm@health.com', 73, 0, 95, 0, 89, 'Never', 12, '0000-00-00', 104, 96, 96, 0, 0, 'AB', 'female', 'Maryam@1', '35.2157696', '33.34144', '0', 'patient', 'm'),
(45, 'Ifeanyi Anyalebechi', 'Yenikent Gonyeli ', 18, 0, 22.0, 0, '5338719182', '2004-06-26', 'sanyalebechi4@gmail.com', 73, 0, 83, 0, 73, 'Never', 15, '0000-00-00', 116, 97, 95, 0, 0, 'O+', 'Male', 'Stanley002004$', '1001', '1002', '0', 'patient', 'Stanley'),
(46, 'Laith Tariq', 'PoBox 55072', 50, 0, 19.0, 0, '9647702446873', '1973-07-14', 'laithtariq@yahoo.com', 71, 0, 97, 0, 73, 'Never', 15, '0000-00-00', 109, 94, 95, 0, 0, 'A+', 'Male', '!2Strjooltynubh', '1001', '1002', '0', 'patient', 'yi1sra'),
(47, 'Hamdan Hamood', 'Northen Cyprus, Nicosia, KÃ¼Ã§Ã¼k KaymaklÄ±.', 24, 0, 21.0, 0, '9054886654', '1999-03-05', 'hamdanhamood8@gmail.com', 60, 0, 87, 0, 62, 'Never', 12, '0000-00-00', 105, 97, 96, 0, 0, 'O+', 'Male', 'Hamdan99', '1001', '1002', '0', 'patient', 'H. Hamood');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` varchar(50) NOT NULL,
  `patient_id` int(50) NOT NULL,
  `doctor_id` int(50) NOT NULL,
  `patient_name` varchar(50) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `report_type` varchar(50) NOT NULL,
  `doctor_email` varchar(50) NOT NULL,
  `status` varchar(30) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`report_id`, `patient_id`, `doctor_id`, `patient_name`, `filename`, `report_type`, `doctor_email`, `status`, `created_date`) VALUES
('15aasfal1licl30yj', 4, 39, 'Ntumbi Laura', 'Covid-Report@15aasfal1licl30yj.pdf', 'Covid-19-Report', 'doctor@mail.com', 'patient', '2023-06-01'),
('1bidsmyz9licljp89', 4, 0, 'Ntumbi Laura', 'Self-Report-Report@1bidsmyz9licljp89.pdf', 'Self-Health-Report', 'SELFREPORT', 'patient', '2023-06-01'),
('1jgzolsx9liwu5uui', 3, 39, 'Vubangsi Mercel', 'Covid-Report@1jgzolsx9liwu5uui.pdf', 'Covid-19-Report', 'doctor@mail.com', 'patient', '2023-06-15'),
('1zeeww42hln0b8soz', 1, 39, 'John Smith', 'High-Blood-Pressure-Report@1zeeww42hln0b8soz.pdf', 'High-Blood-Pressure-Report', 'doctor@mail.com', 'patient', '2023-09-26'),
('2at8a2pqtlij09yd2', 40, 0, 'Jeremy Loyd', 'Self-Report-Report@2at8a2pqtlij09yd2.pdf', 'Self-Health-Report', 'SELFREPORT', 'patient', '2023-06-05'),
('2cww25kr9liboi65i', 39, 39, 'James McDowel', 'High-Blood-Pressure-Report@2cww25kr9liboi65i.pdf', 'High-Blood-Pressure-Report', 'james@email.com', 'patient', '2023-05-31'),
('2vpvetcphliizcgmq', 1, 39, 'John Smith', 'High-Blood-Pressure-Report@2vpvetcphliizcgmq.pdf', 'High-Blood-Pressure-Report', 'doctor@mail.com', 'patient', '2023-06-05'),
('36v6uem7hlio4czsh', 1, 0, 'John Smith', 'Self-Report-Report@36v6uem7hlio4czsh.pdf', 'Self-Health-Report', 'SELFREPORT', 'patient', '2023-06-09'),
('3a4uzj3rplibanowp', 11, 0, 'Ibrahim Ame', 'Self-Report-Report@3a4uzj3rplibanowp.pdf', 'Self-Health-Report', 'SELFREPORT', 'patient', '2023-05-31'),
('3j6zopludlibplglv', 6, 39, 'fadi', 'Covid-Report@3j6zopludlibplglv.pdf', 'Covid-19-Report', 'james@email.com', 'doctor', '2023-05-31'),
('8y9xdywdliwtni2m', 3, 39, 'Vubangsi Mercel', 'Covid-Report@8y9xdywdliwtni2m.pdf', 'Covid-19-Report', 'doctor@mail.com', 'patient', '2023-06-15'),
('b3qrc3n1liwtt2gs', 3, 39, 'Vubangsi Mercel', 'Covid-Report@b3qrc3n1liwtt2gs.pdf', 'Covid-19-Report', 'doctor@mail.com', 'patient', '2023-06-15'),
('iufhl4r9licnq7z9', 40, 0, 'Jeremy Loyd', 'Self-Report-Report@iufhl4r9licnq7z9.pdf', 'Self-Health-Report', 'SELFREPORT', 'patient', '2023-06-01'),
('ncy48299lijj7jt9', 1, 39, 'John Smith', 'High-Blood-Pressure-Report@ncy48299lijj7jt9.pdf', 'High-Blood-Pressure-Report', 'doctor@mail.com', 'patient', '2023-06-06'),
('ukhl6v65liwnp9rw', 3, 39, 'Vubangsi Mercel', 'High-Blood-Pressure-Report@ukhl6v65liwnp9rw.pdf', 'High-Blood-Pressure-Report', 'doctor@mail.com', 'patient', '2023-06-15');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `user` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `date`, `user`, `start_time`, `end_time`, `description`) VALUES
(1, '2022-12-19', 'jsmith', '20:06:00', '20:12:00', 'this is just a new event'),
(2, '2022-12-22', 'jsmith', '21:04:00', '20:09:00', 'this is just a new event'),
(3, '2022-12-25', 'jsmith', '20:41:00', '14:46:00', 'this is just another description. it is just about the same as the previos one'),
(4, '2023-05-17', 'Mahmoud Abduswamad', '15:55:00', '04:55:00', 'Dentistry'),
(5, '2023-05-17', 'Mahmoud Abduswamad', '15:55:00', '04:55:00', 'Dentistry'),
(6, '2023-05-10', 'Ibrahim Ame', '12:22:00', '01:22:00', 'General Medicine'),
(7, '2023-05-10', 'Ibrahim Ame', '12:22:00', '01:22:00', 'General Medicine'),
(8, '2023-06-04', 'Ibrahim Ame', '08:47:00', '09:47:00', 'General Medicine'),
(9, '2023-06-04', 'Ibrahim Ame', '08:47:00', '09:47:00', 'General Medicine'),
(10, '2023-06-15', 'Ibrahim Ame', '13:20:00', '02:20:00', 'General Medicine'),
(11, '2023-06-15', 'Ibrahim Ame', '13:20:00', '02:20:00', 'General Medicine'),
(12, '2023-06-13', 'Mahmoud Abduswamad', '13:26:00', '02:26:00', 'Dentistry'),
(13, '2023-06-13', 'Mahmoud Abduswamad', '13:26:00', '02:26:00', 'Dentistry'),
(14, '2023-06-14', 'Teyei ', '13:35:00', '02:35:00', 'General Medicine'),
(15, '2023-06-14', 'Teyei ', '13:35:00', '02:35:00', 'General Medicine'),
(16, '2023-05-31', 'Ibrahim Ame', '13:01:00', '02:01:00', 'General Medicine'),
(17, '2023-05-31', 'Ibrahim Ame', '13:01:00', '02:01:00', 'General Medicine'),
(18, '2023-06-12', 'Ibrahim Ame', '16:03:00', '05:03:00', 'General Medicine'),
(19, '2023-06-12', 'Ibrahim Ame', '16:03:00', '05:03:00', 'General Medicine'),
(20, '2023-06-06', 'Mahmoud Abduswamad', '14:16:00', '03:16:00', 'Dentistry'),
(21, '2023-06-06', 'Mahmoud Abduswamad', '14:16:00', '03:16:00', 'Dentistry'),
(22, '2023-06-13', 'Teyei ', '14:18:00', '03:18:00', 'Ophthalmology'),
(23, '2023-06-13', 'Teyei ', '14:18:00', '03:18:00', 'Ophthalmology'),
(24, '2023-06-20', 'Fadi Al-Turjman', '18:39:00', '07:39:00', 'General Medicine'),
(25, '2023-06-20', 'Fadi Al-Turjman', '18:39:00', '07:39:00', 'General Medicine'),
(26, '2023-06-06', 'Mercel Vubangsi', '17:21:00', '06:21:00', 'Dentistry'),
(27, '2023-06-06', 'Mercel Vubangsi', '17:21:00', '06:21:00', 'Dentistry'),
(28, '2023-06-14', 'Mercel Vubangsi', '17:41:00', '06:41:00', 'Physical Therapy'),
(29, '2023-06-14', 'Mercel Vubangsi', '17:41:00', '06:41:00', 'Physical Therapy'),
(30, '2023-06-14', 'Mercel Vubangsi', '15:20:00', '04:20:00', 'General Medicine'),
(31, '2023-06-14', 'Mercel Vubangsi', '15:20:00', '04:20:00', 'General Medicine'),
(32, '2023-06-23', 'Ibrahim Ame', '08:44:00', '09:44:00', 'General Medicine'),
(33, '2023-06-23', 'Ibrahim Ame', '08:44:00', '09:44:00', 'General Medicine'),
(34, '2023-06-16', 'Mercel Vubangsi', '10:50:00', '11:50:00', 'General Medicine'),
(35, '2023-06-16', 'Mercel Vubangsi', '10:50:00', '11:50:00', 'General Medicine'),
(36, '2023-06-20', 'Ibrahim Ame', '16:05:00', '05:05:00', 'Dentistry'),
(37, '2023-06-20', 'Ibrahim Ame', '16:05:00', '05:05:00', 'Dentistry'),
(38, '2023-06-20', 'Mahmoud Abduswamad', '09:25:00', '10:25:00', 'General Medicine'),
(39, '2023-06-20', 'Mahmoud Abduswamad', '09:25:00', '10:25:00', 'General Medicine');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `specialty` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `specialty`) VALUES
(1, 'General Checkup', 'A routine checkup to assess your overall health', 'General Medicine'),
(2, 'Dental Cleaning', 'A cleaning of your teeth and gums to maintain oral health', 'Dentistry'),
(3, 'Eye Exam', 'A comprehensive eye exam to check your vision and eye health', 'Ophthalmology'),
(4, 'Physical Therapy', 'Therapy to help improve your movement, balance, and strength', 'Physical Therapy');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `geo_api` varchar(255) NOT NULL,
  `lat` float NOT NULL,
  `lon` float NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `user`, `pass`, `geo_api`, `lat`, `lon`, `token`, `status`) VALUES
(0, 'noela', 'Marvel16', '45d6937ff6b14b1a9bf1d4aa6f9a26a5', 37.4419, -122.142, 'token1', 'patient'),
(1, 'jsmith', 'password', '45d6937ff6b14b1a9bf1d4aa6f9a26a5', 37.4419, -122.142, 'token1', 'patient'),
(2, 'doc1', 'doc1', '45d6937ff6b14b1a9bf1d4aa6f9a26a5', 37.43, -122.14, 'token2', 'doctor'),
(3, 'admin', 'admin', '45d6937ff6b14b1a9bf1d4aa6f9a26a5', 37.45, -122.135, 'token3', 'admin'),
(5, 'fadi', 'fadi', '45d6937ff6b14b1a9bf1d4aa6f9a26a5', 37.45, -122.135, 'token3', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `license` (`license`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patienntTemp`
--
ALTER TABLE `patienntTemp`
  ADD PRIMARY KEY (`userName`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `devices`
--
ALTER TABLE `devices`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
