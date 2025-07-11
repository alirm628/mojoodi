-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2023 at 02:18 AM
-- Server version: 5.7.36-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rushtea1_mojoodi`
--

-- --------------------------------------------------------

--
-- Table structure for table `socks`
--

CREATE TABLE `socks` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_persian_ci NOT NULL,
  `code` text COLLATE utf8_persian_ci NOT NULL,
  `amount` text COLLATE utf8_persian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `socks`
--

INSERT INTO `socks` (`id`, `name`, `code`, `amount`) VALUES
(1, 'Ù‡ÙØª Ø±Ù†Ú¯ Ø²Ù†Ø§Ù†Ù‡', 'Ù†ÛŒÙ… Ø³Ø§Ù‚', '1'),
(2, 'Ù‡ÙØª Ø±Ù†Ú¯ Ø²Ù†Ø§Ù†Ù‡', 'Ù…Ú†ÛŒ', '1'),
(3, 'Ù‡ÙØª Ø±Ù†Ú¯ Ø²Ù†Ø§Ù†Ù‡', 'Ø³Ø§Ù‚ Ù…Ø¹Ù…ÙˆÙ„ÛŒ', '1'),
(4, 'Ø³Ø¨Ø² ÛŒØ´Ù…ÛŒ Ø²Ù†Ø§Ù†Ù‡', 'Ù…Ú†ÛŒ', '1'),
(5, 'Ú©Ø´ Ø§Ù†Ú¯Ù„ÛŒØ³ÛŒ Ù…Ø±Ø¯Ø§Ù†Ù‡ Ø³ÙÛŒØ¯ Ø³Ø§Ø¯Ù‡', 'Ø³Ø§Ù‚ Ù…Ø¹Ù…ÙˆÙ„ÛŒ', '1'),
(6, 'Ú©Ø´ Ø§Ù†Ú¯Ù„ÛŒØ³ÛŒ Ù…Ø±Ø¯Ø§Ù†Ù‡ Ù…Ø´Ú©ÛŒ Ø³Ø§Ø¯Ù‡', 'Ø³Ø§Ù‚ Ù…Ø¹Ù…ÙˆÙ„ÛŒ', '1'),
(7, 'Ù…Ø´Ú©ÛŒ Ù…Ø±Ø¯Ø§Ù†Ù‡ Ø³Ø§Ø¯Ù‡', 'Ø³Ø§Ù‚ Ù…Ø¹Ù…ÙˆÙ„ÛŒ', '1'),
(8, 'Ù…Ø´Ú©ÛŒ Ø³Ø§Ø¯Ù‡ Ø²Ù†Ø§Ù†Ù‡', 'Ù†ÛŒÙ… Ø³Ø§Ù‚', '1'),
(9, 'Ù…Ø´Ú©ÛŒ Ø³Ø§Ø¯Ù‡ Ø²Ù†Ø§Ù†Ù‡', 'Ù…Ú†ÛŒ', '1'),
(10, 'Ù…Ø´Ú©ÛŒ Ø³Ø§Ø¯Ù‡ Ø²Ù†Ø§Ù†Ù‡', 'Ø³Ø§Ù‚ Ù…Ø¹Ù…ÙˆÙ„ÛŒ', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `socks`
--
ALTER TABLE `socks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `socks`
--
ALTER TABLE `socks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
