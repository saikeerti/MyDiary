-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2019 at 04:23 PM
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
(4, '0', 'Veasna', 'Kandal', '2016-11-06 12:31:26', NULL),
(7, '', 'work', 'qweedited', '2019-03-29 08:13:02', '2019-03-29 02:43:10'),
(8, '6', 'somethin', 'somethin', '2019-03-29 12:05:13', NULL),
(9, '', 'sdoubf', 'sdlf\r\n', '2019-03-29 12:57:26', NULL),
(12, '1', 'th', 'ftgjkl', '2019-03-29 13:10:51', '2019-03-29 09:50:18'),
(13, '7', 'work', 'thyiokol', '2019-03-29 14:20:52', '2019-03-29 09:55:57'),
(14, '11', 'keer note', 'qwerrtyyyyuii', '2019-03-29 14:48:45', '2019-03-29 09:20:04'),
(15, '9', 'work', 'tyuhio', '2019-03-29 15:21:31', '2019-03-29 09:51:43'),
(16, '5', 'work', 'wefrfgolp', '2019-03-29 15:23:14', '2019-03-29 09:53:24'),
(18, '12', 'work', 'mondayuioo', '2019-03-29 15:41:49', '2019-03-29 10:12:00');

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

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `user_id`, `title`, `slug`, `body`, `post_image`, `created_at`) VALUES
(1, 1, 3, 'qqewe', 'qqewe', '<p>wsedrgtrfyuji</p>\r\n', 'noimage.jpg', '2019-03-29 06:28:05'),
(2, 1, 6, 'qw', 'qw', 'sdf', 'noimage.jpg', '2019-03-29 10:34:16');

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
(7, 6, 'work', '2019-01-20', 0, '2019-03-29 08:17:06', '2019-03-29 07:37:36'),
(8, NULL, 'think', '2019-03-28', 0, '2019-03-29 08:19:27', NULL),
(10, 1, 'bfghjkhjk', '2019-12-31', 0, '2019-03-29 13:35:09', '2019-03-29 09:50:31'),
(12, 11, 'sleeui', '2019-03-15', 0, '2019-03-29 14:50:17', '2019-03-29 09:20:25'),
(13, 1, 'eat', '2019-03-14', 0, '2019-03-29 15:20:44', NULL);

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
(1, 'Sai', 'vizzzu48@gmail.com', 'qwerqwer', '962012d09b8170d912f0669f6d7d9d07', '2019-03-29 06:13:15'),
(2, 'q', 'q@gmail.com', 'q', 'f1290186a5d0b1ceab27f4e77c0c5d68', '2019-03-29 06:25:10'),
(3, 'Sai', 'rkpk990@gmail.com', 'sai', '76d80224611fc919a5d54f0ff9fba446', '2019-03-29 06:25:30'),
(4, 'qwd', 'ssai@gmail.com', 'Keerti', '202cb962ac59075b964b07152d234b70', '2019-03-29 06:28:38'),
(5, 'preeti', 'as@gmail.com', 'preeti', '48d9d2bbfdb0d128464d3d7ecfa626b4', '2019-03-29 07:38:49'),
(6, 'sa', 'sa@g.c', 'Sa', 'e10adc3949ba59abbe56e057f20f883e', '2019-03-29 10:33:23'),
(7, 'choco', 'choco@gmail.com', 'choco', 'efd18c35cc5f1ef7280a0a8bee5fbbd3', '2019-03-29 13:20:27'),
(8, 'joe', 'joe@gmail.com', 'joe', '8ff32489f92f33416694be8fdc2d4c22', '2019-03-29 13:27:49'),
(9, 'ramu', 'ramu@gmail.com', 'ramu', '58ecfdc7967e35bac8738978c0070a2c', '2019-03-29 13:29:27'),
(10, 'kalp', 'kalp@gmail.com', 'kalp', 'bdbc6fc9d9c3867b23329b69c22b6751', '2019-03-29 13:47:51'),
(11, 'keer', 'keer@gmail.com', 'keer', 'd54a0cf8e23594dbbd148ec371fdfb11', '2019-03-29 13:48:27'),
(12, 'mon', 'mon@gmail.com', 'mon', '197639b278057c519189add5413712e3', '2019-03-29 14:41:29');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
