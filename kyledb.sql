-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
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
CREATE DATABASE IF NOT EXISTS `assignment` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `assignment`;

-- Dumping structure for table assignment.login
CREATE TABLE IF NOT EXISTS `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `acctype` varchar(50) DEFAULT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table assignment.login: ~3 rows (approximately)
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`id`, `username`, `acctype`, `email_address`, `password`) VALUES
	(1, 'banan', 'customer', NULL, 'password'),
	(2, 'Manager', 'manager', 'manager@valspizza.ie', 'password'),
	(3, 'Larry', 'cook', 'larry@valspizza.ie', 'password');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;

-- Dumping structure for table assignment.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordercontent` varchar(50) NOT NULL DEFAULT '0',
  `total` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table assignment.orders: ~5 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `ordercontent`, `total`) VALUES
	(1, 'bbq_pizza-4', '10.0'),
	(2, 'ny_pizza-2', '5.00'),
	(3, 'banana pizza', '0'),
	(4, 'bbq_pizza_qty-3', '0'),
	(5, 'ny_pizza_qty-2,ny_pizza_qty-2', '0');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table assignment.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table assignment.product: ~9 rows (approximately)
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`id`, `name`, `price`) VALUES
	(1, 'Cheese Pizza', 5),
	(2, 'Pepperoni Pizza', 5.9),
	(3, 'Meatlover Pizza', 5.9),
	(4, 'Vegy Pizza', 5.9),
	(5, 'Chicken and Mushroom Pizza', 5.9),
	(6, 'Chips ', 2.5),
	(7, 'Drink Can ', 2),
	(8, 'Hot Cookies', 3),
	(9, 'Ice Cream', 5.5);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
