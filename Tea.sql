-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Feb 09, 2025 at 02:51 AM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Tea`
--

-- --------------------------------------------------------

--
-- Table structure for table `flavors`
--

CREATE TABLE `flavors` (
  `flavor_id` int NOT NULL,
  `flavor_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `flavors`
--

INSERT INTO `flavors` (`flavor_id`, `flavor_name`) VALUES
(1, 'Malty'),
(2, 'Grassy'),
(3, 'Citrus'),
(4, 'Spicy'),
(5, 'Rich'),
(6, 'Floral'),
(7, 'Bright'),
(8, 'Umami'),
(9, 'Toasty'),
(10, 'Sweet'),
(11, 'Delicate'),
(12, 'Creamy');

-- --------------------------------------------------------

--
-- Table structure for table `teas`
--

CREATE TABLE `teas` (
  `tea_id` int NOT NULL,
  `tea_name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `caffeine` varchar(100) NOT NULL,
  `flavor_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `teas`
--

INSERT INTO `teas` (`tea_id`, `tea_name`, `type`, `caffeine`, `flavor_id`) VALUES
(1, 'Matcha', 'Green', 'High', 2),
(2, 'Sencha', 'Green', 'Medium', 2),
(3, 'Irish Breakfast', 'Black', 'High', 1),
(4, 'Earl Grey', 'Black', 'Medium', 3),
(5, 'Masala Chai', 'Black', 'Medium', 4),
(6, 'English Breakfast', 'Black', 'High', 5),
(7, 'Assam', 'Black', 'High', 1),
(8, 'Darjeeling', 'Black', 'Medium', 6),
(9, 'Ceylon', 'Black', 'Medium', 7),
(10, 'Gyokuro', 'Green', 'High', 8),
(11, 'Genmaicha', 'Green', 'Low', 9),
(12, 'Hojicha', 'Green', 'Low', 9),
(13, 'Jasmine', 'Green', 'Medium', 6),
(14, 'Dragon Well', 'Green', 'Medium', 10),
(15, 'Silver Needle', 'White', 'Low', 11),
(16, 'White Peony', 'White', 'Low', 6),
(17, 'Shou Mei', 'White', 'Medium', 6),
(18, 'Darjeeling', 'White', 'Low', 10),
(19, 'Bai Hao', 'White', 'Low', 10),
(20, 'Tie Guan Yin', 'Oolong', 'High', 12),
(21, 'Da Hong Pao', 'Oolong', 'High', 5),
(22, 'Milk Oolong', 'Oolong', 'Medium', 12),
(23, 'Wuyi Rock', 'Oolong', 'High', 5),
(24, 'Sheng Pu\'er (Raw)', 'Puer', 'High', 2),
(25, 'Shou Pu\'er (Ripe)', 'Puer', 'High', 5),
(26, 'Chamomile', 'Herbal', 'None', 11),
(27, 'Peppermint', 'Herbal', 'None', 7),
(28, 'Ginger', 'Herbal', 'None', 4),
(29, 'Lemon', 'Herbal', 'None', 7),
(30, 'Lavender', 'Herbal', 'None', 6),
(31, 'Rooibos', 'Herbal', 'None', 5),
(32, 'Hibiscus', 'Herbal', 'None', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flavors`
--
ALTER TABLE `flavors`
  ADD PRIMARY KEY (`flavor_id`);

--
-- Indexes for table `teas`
--
ALTER TABLE `teas`
  ADD PRIMARY KEY (`tea_id`),
  ADD KEY `flavor_id` (`flavor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flavors`
--
ALTER TABLE `flavors`
  MODIFY `flavor_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `teas`
--
ALTER TABLE `teas`
  MODIFY `tea_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teas`
--
ALTER TABLE `teas`
  ADD CONSTRAINT `teas_ibfk_1` FOREIGN KEY (`flavor_id`) REFERENCES `flavors` (`flavor_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
