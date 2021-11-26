-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.21 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for assignment
DROP DATABASE IF EXISTS `assignment`;
CREATE DATABASE IF NOT EXISTS `assignment` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `assignment`;

-- Dumping structure for table assignment.login
DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `acctype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'customer',
  `email_address` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table assignment.login: ~3 rows (approximately)
DELETE FROM `login`;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`id`, `username`, `acctype`, `email_address`, `password`) VALUES
	(2, 'Manager', 'manager', 'manager@valspizza.ie', 'password'),
	(3, 'Larry', 'cook', 'larry@valspizza.ie', 'password'),
	(15, 'babu', 'customer', 'babu', 'babu');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- Dumping structure for table assignment.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ordercontent` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Dumping data for table assignment.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `ordercontent`, `total`) VALUES
	(16, 'product-1-qty4,product-2-qty2,product-3-qty4,product-4-qty1,product-5-qty3', '0'),
	(17, 'product-3-qty3,product-2-qty1,product-1-qty4,product-5-qty1', '0'),
	(18, 'product-2-qty4', '0'),
	(19, '', '0'),
	(20, '', '0'),
	(21, 'product-4-qty4', '0'),
	(22, 'product-4-qty4', '0'),
	(23, 'product-4-qty4', '0'),
	(24, 'product-1-qty3', '0'),
	(25, 'product-1-qty3', '0'),
	(26, 'product-1-qty3', '0'),
	(27, '', '0');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table assignment.product
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table assignment.product: ~9 rows (approximately)
DELETE FROM `product`;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `price`, `quantity`) VALUES
	(1, 'Cheese Pizza', 5, 14),
	(2, 'Pepperoni Pizza', 5.9, 1),
	(3, 'Meatlover Pizza', 5.9, 3),
	(4, 'Veggie Pizza', 5.9, 4),
	(5, 'Chicken and Mushroom Pizza', 5.9, 4),
	(6, 'Chips ', 2.5, 0),
	(7, 'Drink Can ', 2, 0),
	(8, 'Hot Cookies', 3, 0),
	(9, 'Ice Cream', 5.5, 0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
