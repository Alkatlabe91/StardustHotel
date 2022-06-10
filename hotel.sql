-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20220523.649d9b34ea
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2022 at 09:39 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--
CREATE DATABASE IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hotel`;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `userid`, `roomid`, `name`, `surname`, `email`, `phone`, `checkin`, `checkout`, `days`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 15, 18, 'max', 'max', 'Max@max.com', '11111111', '2017-01-01 00:00:00', NULL, 3, 750, 'Cancelled', NULL, NULL),
(2, 15, 1, 'max', 'max', 'Max@max.com', '1111111111111111', '2017-01-01 00:00:00', NULL, 2, 180, 'Completed', NULL, NULL),
(17, 20, 22, 'aa', 'a', 'a@a.com', '999999999999', '2022-06-30 00:00:00', '2022-07-04 00:00:00', 4, 1600, 'Accepted', '2022-06-07 13:54:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `title`, `description`, `image`, `price`, `status`, `number`) VALUES
(1, 'Comfort Room', 'Room size: 28 sqm', '4e3cffeb173557c4fce21201fcacfda3.jpg', 90, 'New', 1),
(18, 'Superior Room', 'Room size: 26 sqm, Suitable for 2 guests, Twin beds', '51c8e5280a6f86aa92c3e1e915cb6713.jpg', 250, 'new', 2),
(19, 'Superior Plus Room', 'Room size: 26 sqm, undefined\r\nSuitable for 2 guests, King-size bed', 'b6048f5a3f3eacb6add165fb9bcc99bb.jpg', 219, 'new', 3),
(20, 'Deluxe King Room', 'Room size: 31-35 sqm, Up to 3 people, King-size bed', '3edd292d16131c111f2dd9fc9e415ba7.jpg', 320, 'new', 4),
(21, 'Corner Suite', 'Room size: 43 sqm, Suitable for 2 guests, King-size bed', '0ffeb09a4237d38ecaef1b470f66544c.jpg', 350, 'new', 5),
(22, 'Suite', 'Room size: 54 sqm, Up to 3 people, King-size bed', 'c3258ef94713138174ae4d2dd3676bcd.jpg', 400, 'new', 6),
(23, 'Presidential Suite', 'Room size: 130 sqm, Up to 3 people, King-size bed, Suitable for 2 guests', '3043ec51f827d5a2b3551c7abfb00de1.jpg', 550, 'new', 7),
(24, 'Disabled King Room', 'Room size: 26 sqm, Suitable for 2 guests, King-size bed', '0491ebe4c303d97902f7feb9acc6ff44.jpg', 110, 'new', 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `surname`, `image`, `status`, `created_at`, `updated_at`) VALUES
(14, 'admin@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$waYNTCYfQKD25Qo/UChHROPltIe7zABMRgOiAQranjHxVnpNwFAWi', 'admin', 'admin', '4bc3e89d45aa62b21cd97280d3f5c547.png', 'True', NULL, NULL),
(15, 'Max@max.com', '[\"ROLE_USER\"]\n', '$2y$13$hbEscHE..PNlLvN9b4NxW.CFDMWNxoHaIkbYLxkHGxg6D/52La2mi', 'max', 'max', 'd55fe609752c8149c7c6928e0c64913c.png', 'False', NULL, NULL),
(16, 'sam@sam.com', '[\"ROLE_USER\"]\n', '$2y$13$subtU6VYw866Qa2PASOYwuQS9neZUTcdn4dLC3Zdbi0W.tYRTsSqG', 'sam', 'sam', '5639e14aa1dba5a085a235b10e69cfaf.png', 'False', NULL, NULL),
(17, 'rami@r.com', '[]', '$2y$13$UiY7TT5nifuaILvgEn5OoOWNP4YAu/YLUmqLNisNWdNqS6YwgXfdC', 'rami', 'rami', '234a262cd114e67a0a8f4e122501638e.png', 'False', NULL, NULL),
(18, 'rafl@ralf.com', '[]', '$2y$13$IxlQECXeo/hOdyPgX5qShOd.GgbqQPit/j8CcjKKwew6YvrUbhc9u', 'ralf', 'ralf', '755faeb2ec7d9b11219facfc06edcf92.png', 'True', NULL, NULL),
(20, 'a@a.com', '[\"ROLE_MANGER\"]', '$2y$13$O1qApYRYEWdNMs3L8npapuPhWzXTL/wKt6iZpLk1k027ov9Z7bsUS', 'aa', 'a', '7db42dd9da27c9f67211cd80972613e3.png', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



