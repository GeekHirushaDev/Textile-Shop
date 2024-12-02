-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.39 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for myshop
CREATE DATABASE IF NOT EXISTS `myshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myshop`;

-- Dumping structure for table myshop.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.brand: ~3 rows (approximately)
INSERT INTO `brand` (`id`, `name`) VALUES
	(1, 'adidas'),
	(2, 'Nike'),
	(3, 'Cocodile');

-- Dumping structure for table myshop.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `main_category_id` int NOT NULL,
  `sub_category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_main_category1_idx` (`main_category_id`),
  KEY `fk_category_sub_category1_idx` (`sub_category_id`),
  CONSTRAINT `fk_category_main_category1` FOREIGN KEY (`main_category_id`) REFERENCES `main_category` (`id`),
  CONSTRAINT `fk_category_sub_category1` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.category: ~2 rows (approximately)
INSERT INTO `category` (`id`, `main_category_id`, `sub_category_id`) VALUES
	(1, 1, 1),
	(2, 1, 3);

-- Dumping structure for table myshop.colour
CREATE TABLE IF NOT EXISTS `colour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.colour: ~3 rows (approximately)
INSERT INTO `colour` (`id`, `name`) VALUES
	(1, 'Red'),
	(2, 'Black'),
	(3, 'Yellow');

-- Dumping structure for table myshop.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `mobile` varchar(10) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) NOT NULL,
  `points` double NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.customer: ~0 rows (approximately)

-- Dumping structure for table myshop.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `payment` double NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `payment_method_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_customer1_idx` (`customer_mobile`),
  KEY `fk_invoice_payment_method1_idx` (`payment_method_id`),
  KEY `fk_invoice_user1_idx` (`user_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.invoice: ~0 rows (approximately)

-- Dumping structure for table myshop.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` double NOT NULL,
  `invoice_id` int NOT NULL,
  `stock_barcode` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_item_stock1_idx` (`stock_barcode`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_item_stock1` FOREIGN KEY (`stock_barcode`) REFERENCES `stock` (`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.invoice_item: ~0 rows (approximately)

-- Dumping structure for table myshop.main_category
CREATE TABLE IF NOT EXISTS `main_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.main_category: ~3 rows (approximately)
INSERT INTO `main_category` (`id`, `c_name`) VALUES
	(1, 'T-Shirt'),
	(2, 'Shoes'),
	(3, 'Watches');

-- Dumping structure for table myshop.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `method` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.payment_method: ~0 rows (approximately)

-- Dumping structure for table myshop.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand1_idx` (`brand_id`),
  KEY `fk_product_category1_idx` (`category_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.product: ~2 rows (approximately)
INSERT INTO `product` (`id`, `name`, `brand_id`, `category_id`) VALUES
	(1, 'Mens L Size T Shirt ', 1, 1),
	(2, 'Ladies T-Shirt', 2, 2);

-- Dumping structure for table myshop.size
CREATE TABLE IF NOT EXISTS `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.size: ~4 rows (approximately)
INSERT INTO `size` (`id`, `name`) VALUES
	(1, 'Small'),
	(2, 'Large'),
	(3, 'XLarge'),
	(4, 'XXLarge');

-- Dumping structure for table myshop.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `barcode` int NOT NULL,
  `product_id` int NOT NULL,
  `colour_id` int NOT NULL,
  `size_id` int NOT NULL,
  `selling_price` double NOT NULL,
  `available_qty` int NOT NULL,
  PRIMARY KEY (`barcode`),
  KEY `fk_stock_product1_idx` (`product_id`),
  KEY `fk_stock_size1_idx` (`size_id`),
  KEY `fk_stock_colour1_idx` (`colour_id`),
  CONSTRAINT `fk_stock_colour1` FOREIGN KEY (`colour_id`) REFERENCES `colour` (`id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_stock_size1` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.stock: ~2 rows (approximately)
INSERT INTO `stock` (`barcode`, `product_id`, `colour_id`, `size_id`, `selling_price`, `available_qty`) VALUES
	(1234, 1, 1, 2, 2000, 5),
	(1235, 2, 2, 1, 2350, 10);

-- Dumping structure for table myshop.sub_category
CREATE TABLE IF NOT EXISTS `sub_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.sub_category: ~4 rows (approximately)
INSERT INTO `sub_category` (`id`, `name`) VALUES
	(1, 'Mens T-Shirts'),
	(2, 'Kids T-Shirts'),
	(3, 'Ladies Tshirts'),
	(4, 'Mens Watches');

-- Dumping structure for table myshop.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type_id` int NOT NULL,
  `user_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  KEY `fk_user_user_status1_idx` (`user_status_id`),
  CONSTRAINT `fk_user_user_status1` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.user: ~1 rows (approximately)
INSERT INTO `user` (`id`, `fname`, `lname`, `mobile`, `username`, `password`, `user_type_id`, `user_status_id`) VALUES
	(1, 'Hirusha', 'Dayarathna', '0726733332', 'hirusha', 'pass', 1, 1);

-- Dumping structure for table myshop.user_status
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.user_status: ~2 rows (approximately)
INSERT INTO `user_status` (`id`, `status`) VALUES
	(1, 'Active'),
	(2, 'Deactive');

-- Dumping structure for table myshop.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table myshop.user_type: ~2 rows (approximately)
INSERT INTO `user_type` (`id`, `type`) VALUES
	(1, 'Admin'),
	(2, 'Cachier');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
