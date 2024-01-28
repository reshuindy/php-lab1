-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 28, 2024 at 05:01 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`dept_id`, `dept_name`, `dept_status`) VALUES
(1, 'Department 1', 'Y');

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
  `dept_id` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `status` enum('Open','Closed') NOT NULL DEFAULT 'Open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_position`
--

INSERT INTO `job_position` (`id`, `title`, `description`, `skill_set`, `hourly_rate`, `application_inst`, `contact_info`, `dept_id`, `created_at`, `updated_at`, `closed_at`, `status`) VALUES
(2, 'First Job Posting', 'First Job Posting Description', 'Teaching skills, Mathematics', 20, 'Please email me', 'emailme@jobposting.com', 1, '2024-01-27 20:22:59', '0000-00-00 00:00:00', '2024-01-27 10:44:27', 'Closed'),
(3, 'Software Eng', 'Design Front end and development', 'PHP , Mysql', 85, '1. Apply if you have at least BTech degree', '3177724768', 1, '2024-01-27 20:22:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'Open'),
(4, 'Third Job', 'Third Job Description', 'Third Job Skillset', 12.23, 'Instructions to apply for job ', 'contactme@email.net ', 1, '2024-01-27 21:52:53', NULL, '2024-01-28 03:58:46', 'Open'),
(5, 'Enterprise Architecture ', 'Enterprise Architecture  in lifescience big pharma company ', 'TOGAF , Solution Arch', 145, ' Must - TOGAF Certified ', ' 3177724768\r\n8666 Hay meadow CT APT # K', 1, '2024-01-27 22:12:16', NULL, NULL, 'Open');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(80) NOT NULL,
  `role_status` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL,
  `user_status` varchar(1) NOT NULL,
  `user_dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name_email`, `user_pwd`, `user_name`, `user_role_id`, `created_at`, `updated_at`, `user_status`, `user_dept_id`) VALUES
(1, 'regupta@iu.edu', 'df7aff118b26c12487265d26d71a9ab9d90aba8a', 'Reshu Gupta', 1, '2024-01-27 20:57:31', '2024-01-28 02:56:18', 'Y', 1),
(2, 'amit123@gmail.com', '8cb2237d0679ca88db6464eac60da96345513964', 'amit', 1, '2024-01-27 22:49:12', '2024-01-28 04:48:01', 'Y', 1);

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
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
