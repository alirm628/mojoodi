-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 09, 2023 at 02:19 AM
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
-- Table structure for table `kala`
--

CREATE TABLE `kala` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `code` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `amount` text CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kala`
--

INSERT INTO `kala` (`id`, `name`, `code`, `amount`) VALUES
(1, 'Ú©Ø´ Ù…Ø´Ú©ÛŒ', 'testt', '18 D'),
(2, 'Ú©Ø´ Ø³ÙÛŒØ¯', 'test2', '50 D '),
(3, 'Ú©Ø´ Ø¢Ø¨ÛŒ', 'ØªØ³Øª', '27 D / 1 TD'),
(4, 'Ú©Ø´', 'Ú©Ø´', '0'),
(5, 'Ú©Ø´', 'Ú©Ø´', '0'),
(6, 'Ú©Ø´', 'Ú©Ø´', '0'),
(7, 'Ú©Ø´', 'Ú©Ø´', '0'),
(8, 'Ú©Ø´', 'Ú©Ø´', '0'),
(9, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³ Ø³ÙÛŒØ¯', 'Û´Û°/Û·Û°', '3k /5 D'),
(10, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³ Ù…Ø´Ú©ÛŒ', 'Û´Û°/Û·Û°', '4k '),
(11, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³ Ø³ÙÛŒØ¯ ', 'Û²Û°/Û·Û°', '1 D'),
(12, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³ Ù…Ø´Ú©ÛŒ', 'Û²Û°/Û·Û°', '1 K'),
(13, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³ Ø³Ø±Ù…Ù‡ Ø§ÛŒ', 'Ø§ØªØ§Ù‚ Ú†ÙˆØ¨ÛŒ', '8 D'),
(14, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³ Ù†ÙˆÚ© Ù…Ø¯Ø§Ø¯ÛŒ', 'Û²Û°/Û·Û°', '8 D'),
(15, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³', 'Ø§', '0'),
(16, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³', 'Ø§', '0'),
(17, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³', 'Ø§', '0'),
(18, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³', 'Ø§', '0'),
(19, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³', 'Ø§', '0'),
(20, 'Ø§Ø³Ù¾Ù†Ø¯Ú©Ø³', 'Ø§', '0'),
(21, ' Û´Û° Ù†Ø® Ù…Ø´Ú©ÛŒ', 'E116-27', '2k 8D'),
(22, 'Ù†Ø® Ø³ÙÛŒØ¯ Û´Û°', '101-108', '2 k / 13 D'),
(23, ' Ù†Ø® Ø·ÙˆØ³ÛŒ Ù…Ù„Ø§Ù†Ú˜ Û´Û°', '412', '2 k / 8 D   ÛµØªØ§ ØªÙ‡ Ø¯ÙˆÚ©'),
(24, ' Ù†Ø® Ù‚Ù‡ÙˆÙ‡â€ŒØ§ÛŒ Û´Û°', 'E 413-1237', '1 k / 5D'),
(25, 'Ù†Ø® Ø¢Ø¨ÛŒ ÙÛŒØ±ÙˆØ²Ù‡â€ŒØ§ÛŒ Û´Û°', 'C114-2304', '2 k / 12D'),
(26, 'Ù†Ø® Ø¢Ø¨ÛŒ', 'A109-643', '3 k / 15 D'),
(27, 'Ù†Ø® Ø¢Ø¨ÛŒ Ù†ÙØªÛŒ', 'D411-1119', '1k / 11 D '),
(28, 'Ù†Ø® Ø¢Ø¨ÛŒ Û´Û°', 'B109-438', 'Û±Û°D'),
(29, 'Ù†Ø® Ø³Ø¨Ø² ÛŒØ´Ù…ÛŒ Û´Û°', 'C414-3297', '17 D'),
(30, 'Ù†Ø® Ø³Ø¨Ø² Ø²ÛŒØªÙˆÙ†ÛŒ', 'C112-981', '2 K / 14 D'),
(31, 'Ù†Ø® Ø³Ø¨Ø² Ù„Ø¬Ù†ÛŒ', 'D112-551', '3 K / 12 D'),
(32, 'Ù†Ø® Ø³Ø±Ù…Ù‡â€ŒØ§ÛŒ Û´Û°', 'X115-428', '11 TD'),
(33, 'Ù†Ø® Ø³Ø±Ù…Ù‡â€ŒØ§ÛŒ40', 'F115-858', '41 D'),
(34, 'Ù†Ø® Ø³Ø±Ù…Ù‡â€ŒØ§ÛŒ', 'Ø§', '0'),
(35, 'Ù†Ø® Ø³Ø±Ù…Ù‡â€ŒØ§ÛŒ Ù…Ù„Ø§Ù†Ú˜ Û´Û°', 'C115-1520', '3 K '),
(36, 'Ù†Ø® Ú©Ø±Ù… Û´Û°', 'A103-556', '51 D'),
(37, 'Ù†Ø® ØµÙˆØ±ØªÛŒ Û´Û°', 'A404-2364', '1 K / 9 D'),
(38, 'Ù†Ø® Ø²Ø±Ø´Ú©ÛŒ', 'G407-1720', '4 K / 11 D'),
(39, 'Ù…ÛŒÚ©Ø±Ùˆ Ù…Ø¯Ø§Ù„ Ø·ÙˆØ³ÛŒ', 'Ø§', '6 D'),
(40, 'Ù…ÛŒÚ©Ø±ÙˆÙ…Ø¯Ø§Ù„ Ø·ÙˆØ³ÛŒ Ù…Ù„Ø§Ù†Ú˜', 'Ø§', '4 D'),
(41, 'Ù†Ø® Ø°ØºØ§Ù„ÛŒ Ù…Ù„Ø§Ù†Ú˜ Û²Û¶', 'Û±Û´Û±Û´Û¸', '6 D'),
(42, 'Ù†Ø® Ø·ÙˆØ³ÛŒ Ù…Ù„Ø§Ù†Ú˜ ØªÛŒØ±Ù‡ Û²Û¶', '425', '7 D'),
(43, 'Ù†Ø® Ø¢Ø¨ÛŒ ÙØ§Ù†ØªØ²ÛŒ Û³Û°', 'Ø§', '4 TD'),
(44, 'Ù†Ø® Ø³Ø¨Ø² Ø³ÛŒØ¯ÛŒ Û³Û°', '3082', '9 D'),
(45, 'Ù†Ø® Ø¢Ø¨ÛŒ Ù†ÙØªÛŒ Û´Û°', 'G111-320', '3 TD'),
(46, 'Ù†Ø® ØµÙˆØ±ØªÛŒ Û²Û¶', 'A104-731', '2 D'),
(47, 'Ù†Ø® Ø¨Ù†ÙØ´ Û´Û°', 'D410-1763', '32 D'),
(48, 'Ù†Ø® Ø¨Ù†ÙØ´ Û´Û°', 'C110-1275', '16 D'),
(49, 'Ù†Ø® Ø²Ø±Ø¯ Ù¾Ø±ØªÙ‚Ø§Ù„ÛŒ Û´Û°', 'B405-1129', '1 K / 5 D'),
(50, 'Ù†Ø® Ø²Ø±Ø¯ Ù…ÙˆØ²ÛŒ Û²Û¶', 'A105-648', '6 D'),
(51, 'Ù†Ø® ÛŒØ§Ø³ÛŒ Û´Û°', 'A110-593', '3 D'),
(52, 'Ù†Ø® Ù†Ø§Ø±Ù†Ø¬ÛŒ Û²Û¶', 'S106-668', '0 D'),
(53, 'Ù†Ø® Ù†Ø§Ø±Ù†Ø¬ÛŒ Û³Û°', 'Ø§ÛŒØ±Ø§Ù† Ù†Ùˆ Ø¨Ø§ÙØª', '0D'),
(54, 'Ù†Ø® Ø³Ø±Ø®Ø§Ø¨ÛŒ(Ú¯Ù„Ø¨Ù‡ÛŒ) Û´Û°', 'B104-228', '6 D'),
(55, 'Ù†Ø® Ø³Ø±Ø®Ø§Ø¨ÛŒ Û´Û°', 'C104-1064', '2 k / 5 D'),
(56, 'Ù†Ø® Ø³Ø±Ø®Ø§Ø¨ÛŒ Ø³ÛŒØ± Û´Û°', 'C104-1516', '6 D'),
(57, 'Ù†Ø® Ø¢Ø¨ÛŒ Ù…Ù„Ø§Ù†Ú˜', 'Û±Û°Û¸Û²Û³', '4 D'),
(58, 'Ù†Ø® Ø³Ø¨Ø² Ù…Ù„Ø§Ù†Ú˜ Û´Û°', '10801', '1 D'),
(59, 'Ù†Ø® Ø³Ø¨Ø² ÙØ³ÙØ±ÛŒ Ø±ÙˆØ´Ù† Û³Û°', 'Ø§ÛŒØ±Ø§Ù† Ù†ÙˆØ¨Ø§ÙØª', '4 D'),
(60, 'Ù†Ø® ÙØ³ÙØ±ÛŒ ØªÛŒØ±Ù‡', 'E114-1894', '16 D'),
(61, 'Ù†Ø® Ù…Ø´Ú©ÛŒ Ù…Ù„Ø§Ù†Ú˜', 'B116-677', '96 D'),
(62, 'navyÙ†Ø® ', 'E415-1208', '6 D'),
(63, 'Ù†Ø® Ø§ÛŒÙ†Ø¬Ú©Ø´Ù† Ø³Ø¨Ø² Û³Û°', 'A414-2712', '3 D'),
(64, 'Ù†Ø® Ø§ÛŒÙ†Ø¬Ú©Ø´Ù† Ø³Ø±Ù…Ù‡ Ø§ÛŒ Û³Û°', 'E115-398', '6 D'),
(65, 'Ù†Ø® Ù‚Ø±Ù…Ø² Û´Û°', 'X407-1641', '4D'),
(66, 'Ù†Ø® Ø³Ø±Ù…Ù‡ Ø§ÛŒ Û²Û¶', 'C115-207', '9 D'),
(67, 'Ù†Ø® Ù†Ø³Ú©Ø§ÙÙ‡ Ø§ÛŒ Û´Û°', 'B113-947', '0 D'),
(68, 'Ù†Ø® Ù†ÙˆÚ© Ù…Ø¯Ø§Ø¯ÛŒ Û²Û¶', 'D108-1402', '12 D'),
(69, 'Ù†Ø® Ù†ÙˆÚ© Ù…Ø¯Ø§Ø¯ÛŒ Û´Û°', 'D108-1402', '3 D'),
(70, 'Ù†Ø® Ù†ÙˆÚ© Ù…Ø¯Ø§Ø¯ÛŒ ÛµÛ°', 'D108-1402', '1 K / 10 D'),
(71, 'Rainbow 40Ù†Ø® ', 'E17 Ù…Ø´Ú©ÛŒ', '1 K / 6 D'),
(72, 'Rainbow 40Ù†Ø® ', 'E5 Ø±ÙˆØ´Ù†', '31 D'),
(73, 'Ù†Ø® Ø³Ø±Ù…Ù‡â€ŒØ§ÛŒ ', 'C115-287', '3 D'),
(77, 'Ø±ÙˆÙ„ ÙÛŒØ´ Ù¾ÛŒØ±ÛŒÙ†ØªØ±', 'Û¸ Ø³Ø§Ù†ØªÛŒ', '15'),
(79, 'Ø³ÙˆØ²Ù† Ù¾Ø§ÛŒÙ‡ Ø¨Ù„Ù†Ø¯ Ù…Ø§Ø´ÛŒÙ† Ù„Ù…Ø³ÛŒ', 'HOFA 71.70 S04-2', '1900'),
(74, 'Ø³ÙˆØ²Ù† Ù¾Ø§ÛŒÙ‡ Ú©ÙˆØªØ§Ù‡ Ø³ÛŒÙ…Ù„Ø³', '70,41 N 0178', '750'),
(75, 'Ø³ÙˆØ²Ù† Ù¾Ø§ÛŒÙ‡ Ø¨Ù„Ù†Ø¯ Ø³ÛŒÙ…Ù„Ø³', '70,41 N 0174', '1630'),
(76, 'Ø´Ú©Ù„Ø§Øª Ø¨Ø§ÛŒÚ©ÛŒØª', 'Ø´ÙˆÙ†ÛŒØ²', 'Ù…Ø´Ú©ÛŒ Û¸ Ù‚Ø±Ù…Ø² Û´ '),
(78, 'ØªØ³Øª', 'ØªØ³Øª', '0'),
(80, 'Ø³ÙˆØ²Ù† Ù¾Ø§ÛŒÙ‡ Ú©ÙˆØªØ§Ù‡ Ù…Ø§Ø´ÛŒÙ† Ù„Ù…Ø³ÛŒ', 'HOFA 71.70 S04-4', '1000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kala`
--
ALTER TABLE `kala`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kala`
--
ALTER TABLE `kala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
