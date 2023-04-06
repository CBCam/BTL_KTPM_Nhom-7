CREATE DATABASE  IF NOT EXISTS `it01saledbv1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `it01saledbv1`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: it01saledbv1
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'THỰC ĐƠN'),(2,'MÓN ĂN KÈM'),(3,'THỨC UỐNG');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Good','2022-12-14 16:00:44',1,1),(2,'Nice','2022-12-14 16:00:44',1,1),(3,'Tot','2022-12-14 16:55:06',2,1),(4,'Tuyet\n','2022-12-14 17:07:11',2,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_tag`
--

DROP TABLE IF EXISTS `prod_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_tag` (
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `tag_id` (`tag_id`),
  CONSTRAINT `prod_tag_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `prod_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_tag`
--

LOCK TABLES `prod_tag` WRITE;
/*!40000 ALTER TABLE `prod_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` float DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Gà Rán (1 miếng)','Gà chiên giòn không tẩm sốt',35000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676187503/1_moi2kn.png',1,1),(2,'Gà Rán (3 miếng)','Gà chiên giòn không tẩm sốt',101000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/2_m8z0pz.png',1,1),(3,'Gà Rán (6 miếng)','Gà chiên giòn không tẩm sốt',195000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/2_m8z0pz.png',1,1),(4,'Gà Sốt HS (1 miếng)','Gà chiên giòn tẩm sốt mật ong cay',40000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/4_nm2fdl.png',1,1),(5,'Gà Sốt HS (3 miếng)','Gà chiên giòn tẩm sốt mật ong cay',112000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/5_esmohp.png',1,1),(6,'Gà Sốt HS (6 miếng)','Gà chiên giòn tẩm sốt mật ong cay',217000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/5_esmohp.png',1,1),(7,'Gà Sốt Phô Mai (1 miếng)','Gà chiên giòn tẩm sốt phô mai',40000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/6_uccm9q.png',1,1),(8,'Gà Sốt Phô Mai (3 miếng)','Gà chiên giòn tẩm sốt phô mai',112000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/7_tbupvv.png',1,1),(9,'Gà Sốt Phô Mai (6 miếng)','Gà chiên giòn tẩm sốt phô mai',217000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/7_tbupvv.png',1,1),(10,'Burger CB','1 gà giòn không xương cỡ lớn, Phô mai miếng. Trứng',49000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188392/8_bwromj.png',1,1),(11,'Burger Bò','Bò, Phô mai miếng',33000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188393/9_kywdjd.png',1,1),(12,'Burger Bò Teriyaki','Bò, Sốt Teriyaki, Phô mai miếng',43000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189243/11_a8dlsk.png',1,1),(13,'Burger Phô Mai','Bò, Phô mai miếng',43000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188393/10_daxmlm.png',1,1),(14,'Mì Ý Thịt Bò','Bò bằm, Bò miếng cỡ lớn',41000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188394/13_ksrzdk.png',1,1),(15,'Mì Ý Bò Bằm Sốt Phô Mai','Bò bằm, Sốt phô mai',31000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188393/12_wd3m33.png',1,1),(16,'Khoai Tây Chiên','Khoai tây chiên giòn',29000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189276/16_apjoig.png',1,2),(17,'Bắp Cải Trộn','Salad',39000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189781/18_ph4xrh.jpg',1,2),(18,'Cá Nugget (3 miếng)','Cá lăn bột chiên giòn',28000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189275/17_vpazjv.png',1,2),(19,'Cá Nugget (5 miếng)','Cá lăn bột chiên giòn',35000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189275/17_vpazjv.png',1,2),(20,'Khoai Tây Lắc Phô Mai','Khoai tây chiên giòn lắc bột phô mai',39000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189273/15_mbcyer.png',1,2),(21,'Milo','Thức Uống',15000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188395/21_mpec6f.jpg',1,3),(22,'CocaCola','Thức Uống',20000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188395/20_jl7fay.png',1,3),(23,'Pepsi','Thức Uống',20000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188395/22_kbn2ed.png',1,3),(24,'Sprite','Thức Uống',20000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188395/24_phas8g.jpg',1,3),(25,'Fanta','Thức Uống',20000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188395/25_cddp9s.jpg',1,3),(26,'CocaZero','Thức Uống',20000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676189436/26_pbduii.jpg',1,3),(27,'Nước Suối','Thức Uống',10000,'https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676188395/23_abegwq.jpg',1,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `receipt_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt`
--

LOCK TABLES `receipt` WRITE;
/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
INSERT INTO `receipt` VALUES (1,'2022-12-05 13:53:36',2),(2,'2022-12-07 16:44:21',2),(3,'2022-12-07 16:51:02',2);
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipt_details`
--

DROP TABLE IF EXISTS `receipt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipt_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `receipt_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receipt_id` (`receipt_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `receipt_details_ibfk_1` FOREIGN KEY (`receipt_id`) REFERENCES `receipt` (`id`),
  CONSTRAINT `receipt_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipt_details`
--

LOCK TABLES `receipt_details` WRITE;
/*!40000 ALTER TABLE `receipt_details` DISABLE KEYS */;
INSERT INTO `receipt_details` VALUES (1,1,24000000,1,1),(2,2,34000000,1,2),(3,1,28000000,1,3),(4,3,24000000,2,1),(5,1,34000000,2,2),(6,1,28000000,2,3),(7,3,32000000,2,5),(8,1,24000000,3,1),(9,2,34000000,3,2),(10,1,28000000,3,3),(11,2,28000000,3,4),(12,1,32000000,3,5);
/*!40000 ALTER TABLE `receipt_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `user_role` enum('USER','ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'huong','admin','b\'\\xe1\\n\\xdc9I\\xbaY\\xab\\xbeV\\xe0W\\xf2\\x0f\\x88>\'','https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676190321/ava_fksfms.png',1,'ADMIN'),(2,'huong','admin','e10adc3949ba59abbe56e057f20f883e','https://res.cloudinary.com/dzo5vlw1o/image/upload/v1676190321/ava_fksfms.png',1,'ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'it01saledbv1'
--

--
-- Dumping routines for database 'it01saledbv1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23 17:00:15
