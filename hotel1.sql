-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 10, 2024 at 12:14 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel1`
--

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
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
  `updated_at` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `name`, `surname`, `email`, `phone`, `checkin`, `checkout`, `days`, `total`, `status`, `created_at`, `updated_at`, `userid`, `roomid`) VALUES
(22, 'Zaka', 'Zaka', 'Alaa@Alaa.com', '11111111111', '2022-06-24 00:00:00', '2022-06-27 00:00:00', 3, 270, 'Accepted', '2022-06-23 12:02:56', NULL, NULL, NULL),
(23, 'max', 'max', 'Max@max.com', '1111111111', '2022-06-09 00:00:00', '2023-01-17 00:00:00', 222, 19980, 'New', '2022-06-23 22:01:29', NULL, 15, 1),
(24, 'Nouar', 'Sebahe', 'Nouar@gmail.com', '0999555444', '2024-05-05 00:00:00', '2024-05-08 00:00:00', 3, 270, 'New', '2024-05-03 20:41:20', NULL, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

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
(1, 'Comfort Room', 'Room size: 28 sqm', '4e3cffeb173557c4fce21201fcacfda3.jpg', 90, 'Available', 1),
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
(14, 'admin@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$EHrUlmm8ibB2jI41TjOg3..OFZyEwDFh0bnzmmrIAziUJpR6w1Gsu', 'admin', 'admin', '395e9f3713c952a6993ca460f6b5f037.png', 'True', NULL, NULL),
(15, 'Max@max.com', '[\"ROLE_USER\"]\n', '$2y$13$3BuQM67WZgj43cGptNqVbOmq2ycPhqSBQyLAtFqUQm.u/Ai51yfcy', 'max', 'max', '1d9520f74af00d3d31214dc147f60922.png', 'False', NULL, NULL),
(16, 'sam@sam.com', '[\"ROLE_BALIE\"]', '$2y$13$dQ11V/cmvNjW5db6AGsWa.u.92SYfdAFVuIIDuJReE1rUXT4bmZg6', 'sam', 'sam', 'a9af16ed840150a7f8bbbb6a350d117f.png', 'False', NULL, NULL),
(22, 'Alaa@Alaa.com', '[]', '$2y$13$OwDnMsicoUR7R7PwbskU8.NHU01ljxbXA.3tggWfp9/Ml5ammr2Ge', 'Zaka', 'Zaka', '314fe893976a41b6f83d7167171baf27.png', NULL, NULL, NULL),
(23, 'Leo@gmail.com', '[]', '$2y$13$DBoqb1LILMzAWlpf2zUfLenfRYGc6soQ6zmjR2L3HfNjGwrmnmtbq', 'leo', 'leo', 'f24bd03978d95529cac408ea399ff8ef.png', NULL, NULL, NULL),
(24, 'king@gmail.com', '[]', '$2y$13$Dvw6vskiTudW/FWcZldisOqjNdBIptFGYOb4NbDHdoqw/Wl2S1cLi', 'king', 'king', '73d279d381bc4c83525a2f6d75b35715.png', NULL, NULL, NULL),
(25, 'Nouar@gmail.com', '[]', '$2y$13$98gfL/OH1Q3OG6ZjF.KVDeomS.Jn0g2HvKmkp4LOhThApuvrS1OhW', 'Nouar', 'Sebahe', '4834b46bc94cf7311528e8cf107821fb.png', NULL, NULL, NULL),
(26, 'test@gmail.com', '[]', '$2y$13$DYcZMP5IzdQa.fEii/1K0.RAmN0w8Cph7/OSBLmYEj9BfaWI5CUde', 'test', 'test', NULL, NULL, NULL, NULL),
(27, 'alaa@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$DHJ/UCIsNx62YHW9pZ9aUOzXbCQGTNCIC1fHS9E.7/SEW6UMC9oTS', 'alaa', 'alaa', NULL, NULL, NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
