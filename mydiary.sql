-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2019 at 06:12 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydiary`
--

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `notename` varchar(50) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `notename`, `content`, `created_at`, `updated_at`) VALUES
(1, '1', 'Learn', 'CodeIgniter ', '2019-03-29 16:55:06', '2019-03-29 11:25:45'),
(2, '2', 'Minutes of Meeting', 'Attendees:Joe,choco', '2019-03-29 16:58:40', NULL),
(3, '2', 'Tutorials Point', 'Completed 12 PHP Turorials', '2019-03-29 17:02:35', '2019-03-29 11:32:44'),
(5, '3', 'Diet food', 'Oat meal-morning', '2019-03-29 17:36:05', NULL),
(6, '4', 'Training', 'Core Training\r\n', '2019-03-29 17:41:58', NULL),
(7, '1', 'Learn', 'CodeIgniter', '2019-03-29 19:58:36', '2019-03-29 14:29:15'),
(8, '5', 'Job', 'Job Role - Web Developer', '2019-03-29 20:40:18', '2019-03-29 15:10:28'),
(10, '6', 'learn', 'php, html, sql and javascript', '2019-03-29 20:46:00', '2019-03-29 15:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `todoname` varchar(50) DEFAULT NULL,
  `bydate` date DEFAULT NULL,
  `done` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`id`, `user_id`, `todoname`, `bydate`, `done`, `created_at`, `updated_at`) VALUES
(2, 1, 'Visit Library', '2019-03-30', 0, '2019-03-29 16:57:08', NULL),
(3, 2, 'Connect skype meeting', '2019-03-16', 0, '2019-03-29 17:03:40', NULL),
(4, 2, 'Watch PHP tutorial', '2019-03-27', 0, '2019-03-29 17:04:16', NULL),
(6, 3, 'excercise', '2019-03-08', 0, '2019-03-29 17:36:27', NULL),
(7, 4, 'Clean Desk', '2019-03-22', 0, '2019-03-29 17:42:22', NULL),
(8, 5, 'prepare', '2019-03-07', 0, '2019-03-29 20:41:02', NULL),
(9, 5, 'take test', '2019-03-29', 0, '2019-03-29 20:41:13', '2019-03-29 15:11:21'),
(11, 6, 'walk', '2019-03-15', 0, '2019-03-29 20:46:52', NULL),
(12, 6, 'gym', '2019-03-15', 0, '2019-03-29 20:47:07', '2019-03-29 15:17:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `register_date`) VALUES
(1, 'keerti', 'keerti@gmail.com', 'keerti', 'e363f1a5fed7532ef4d84afede1ade7e', '2019-03-29 15:54:03'),
(2, 'preeti', 'preeti@gmail.com', 'preeti', '48d9d2bbfdb0d128464d3d7ecfa626b4', '2019-03-29 15:57:55'),
(3, 'choco', 'choco@gmail.com', 'choco', 'efd18c35cc5f1ef7280a0a8bee5fbbd3', '2019-03-29 16:35:14'),
(4, 'joe', 'joe@gmail.com', 'joe', '8ff32489f92f33416694be8fdc2d4c22', '2019-03-29 16:41:16'),
(5, 'sai', 'sai@gmail.com', 'sai', 'a29bac723ca2d59ed78a2d715e17e92f', '2019-03-29 19:39:40'),
(6, 'john', 'john@gmail.com', 'john', '527bd5b5d689e2c32ae974c6229ff785', '2019-03-29 19:45:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
