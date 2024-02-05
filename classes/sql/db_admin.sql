-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 29, 2024 at 10:29 PM
-- Server version: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- PHP Version: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `regupta_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_status`) VALUES
(1, 'Computer Science ', 'Y'),
(2, 'Health Informatics', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `job_position`
--

CREATE TABLE `job_position` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `skill_set` text NOT NULL,
  `hourly_rate` double NOT NULL,
  `application_inst` text NOT NULL,
  `contact_info` varchar(200) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `status` enum('Open','Closed') NOT NULL DEFAULT 'Open',
  `closed_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_position`
--

INSERT INTO `job_position` (`id`, `title`, `description`, `skill_set`, `hourly_rate`, `application_inst`, `contact_info`, `dept_id`, `status`, `closed_at`, `updated_at`, `created_at`) VALUES
(1, 'Teacher Assistant', 'Assisting Prof. for resolving student\'s issues', 'Communication, Analytical, and software engineering', 30, 'App_intruction', '317-123-1234', 1, 'Open', '2024-01-29 04:24:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Library Assistant', 'Assisting Library for resolving student\'s issues', 'Communication, Analytical, and software engineering', 35, 'App_intruction', '317-123-1234', 1, 'Open', '2024-01-29 12:17:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Assistant Prof.', 'Seeking a dynamic and accomplished Assistant Professor with a Ph.D.', 'Expertise in academic instruction, curriculum development', 45, 'App Inst', '3172225555', 1, 'Open', NULL, NULL, '2024-01-29 16:33:29'),
(4, 'Professor', '\r\nresponsibilities, qualifications, and expectations for the role', 'expertise in software development, algorithm design, data structures, machine learning, and a strong record in research and teaching', 50, 'Submit application including CV, cover letter, teaching and research statements, and contact information', '3172349876', 1, 'Open', NULL, NULL, '2024-01-29 16:35:00'),
(5, 'Professor', 'Research', 'communication, knowledge', 50, ' Interested candidates for the Professor position should submit a cover letter, curriculum vitae, teaching philosophy, research statement, and contact information', ' 3171112222', 2, 'Open', NULL, NULL, '2024-01-29 18:38:39');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(80) NOT NULL,
  `role_status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`, `role_status`) VALUES
(1, 'Faculty', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name_email` varchar(100) NOT NULL,
  `user_pwd` varchar(100) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `user_status` varchar(1) NOT NULL,
  `user_dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name_email`, `user_pwd`, `user_name`, `user_role_id`, `user_status`, `user_dept_id`) VALUES
(1, 'reshu@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'Reshu', 1, 'Y', 1),
(2, 'jay@gmail.com', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Jay', 1, 'Y', 2),
(3, 'Navdeep@gmail.com', '19865795547116ae27f09115e72c74d2c517d0b2', 'Navdeep', 1, 'Y', 2),
(4

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `job_position`
--
ALTER TABLE `job_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_job_dept_id` (`dept_id`) USING BTREE;

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_user_role_id` (`user_role_id`),
  ADD KEY `fk_user_dept_id_index` (`user_dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `job_position`
--
ALTER TABLE `job_position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `job_position`
--
ALTER TABLE `job_position`
  ADD CONSTRAINT `fk_user_dept_id` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_dept_id_index` FOREIGN KEY (`user_dept_id`) REFERENCES `department` (`dept_id`),
  ADD CONSTRAINT `fk_user_role_id` FOREIGN KEY (`user_role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
