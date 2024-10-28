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
CREATE DATABASE IF NOT EXISTS `myshop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `myshop`;

-- Dumping structure for table myshop.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.catagory
CREATE TABLE IF NOT EXISTS `catagory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.colour
CREATE TABLE IF NOT EXISTS `colour` (
  `id` int NOT NULL,
  `colour` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `mobile` varchar(10) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `point` double NOT NULL,
  PRIMARY KEY (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.damage_stock
CREATE TABLE IF NOT EXISTS `damage_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `status` varchar(45) NOT NULL,
  `stock_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_damage_stock_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_damage_stock_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total` double NOT NULL,
  `suplier_id` int NOT NULL,
  `payment_method_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_suplier1_idx` (`suplier_id`),
  KEY `fk_grn_payment_method1_idx` (`payment_method_id`),
  CONSTRAINT `fk_grn_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `fk_grn_suplier1` FOREIGN KEY (`suplier_id`) REFERENCES `suplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.grn_item
CREATE TABLE IF NOT EXISTS `grn_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `buying_price` double NOT NULL,
  `qty` double NOT NULL,
  `grn_id` int NOT NULL,
  `stock_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_item_grn1_idx` (`grn_id`),
  KEY `fk_grn_item_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_grn_item_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total` double NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `payment_method_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_customer1_idx` (`customer_mobile`),
  KEY `fk_invoice_payment_method1_idx` (`payment_method_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_mobile`) REFERENCES `customer` (`mobile`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` double NOT NULL,
  `invoice_id` int NOT NULL,
  `stock_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_item_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `metod` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `brand_id` int NOT NULL,
  `catagory_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_brand1_idx` (`brand_id`),
  KEY `fk_product_catagory1_idx` (`catagory_id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_product_catagory1` FOREIGN KEY (`catagory_id`) REFERENCES `catagory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.product_has_colour
CREATE TABLE IF NOT EXISTS `product_has_colour` (
  `product_id` int NOT NULL,
  `colour_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`colour_id`),
  KEY `fk_product_has_colour_colour1_idx` (`colour_id`),
  KEY `fk_product_has_colour_product1_idx` (`product_id`),
  CONSTRAINT `fk_product_has_colour_colour1` FOREIGN KEY (`colour_id`) REFERENCES `colour` (`id`),
  CONSTRAINT `fk_product_has_colour_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.product_has_size
CREATE TABLE IF NOT EXISTS `product_has_size` (
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`),
  KEY `fk_product_has_size_size1_idx` (`size_id`),
  KEY `fk_product_has_size_product1_idx` (`product_id`),
  CONSTRAINT `fk_product_has_size_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_product_has_size_size1` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.size
CREATE TABLE IF NOT EXISTS `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `selling_price` double NOT NULL,
  `qty` double NOT NULL,
  `status` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_product1_idx` (`product_id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.suplier
CREATE TABLE IF NOT EXISTS `suplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type_id` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  KEY `fk_user_status1_idx` (`status_id`),
  CONSTRAINT `fk_user_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

-- Dumping structure for table myshop.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
