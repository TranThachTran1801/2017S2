-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: badao
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accidpoint`
--

DROP TABLE IF EXISTS `accidpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accidpoint` (
  `accid` varchar(10) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`accid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accidpoint`
--

LOCK TABLES `accidpoint` WRITE;
/*!40000 ALTER TABLE `accidpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `accidpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `accid` varchar(10) NOT NULL,
  `accname` varchar(20) NOT NULL,
  `accpassword` varchar(100) NOT NULL,
  `accemail` varchar(1000) NOT NULL,
  `accaddress` varchar(1000) DEFAULT NULL,
  `accactivate` varchar(20) NOT NULL,
  `accrole` varchar(20) NOT NULL,
  `accdate` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`accid`),
  UNIQUE KEY `accounts_username_uindex` (`accname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('AD001','admin','0192023a7bbd73250516f069df18b500','admin@emcb.com','HCMIU','ACTIVATED','ADMINISTRATOR','2016-07-01'),('CU001','user','6ad14ba9986e3615423dfca256d04e3f','ecommercebook2016@gmail.com','AMAZON','ACTIVATED','CUSTOMER','2016-07-01'),('CU002','thaitrungtin','e10adc3949ba59abbe56e057f20f883e','tin.thai2705@gmail.com','','ACTIVATED','CUSTOMER','2017-05-23'),('ST001','staff','de9bf5643eabf80f4a56fda3bbb84483','staff@emcb.com','ALIBABA','ACTIVATED','STAFF','2016-07-01');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `ID_category` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  PRIMARY KEY (`ID_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'shose'),(2,'pants'),(3,'shirt');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `ID_comment` int(11) NOT NULL AUTO_INCREMENT,
  `ID_product` int(11) NOT NULL,
  `accid` varchar(45) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`ID_comment`,`ID_product`,`accid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,2,'CU001','adsfads'),(2,2,'CU001','adsfads'),(3,2,'CU001','1231232132'),(4,2,'CU001','123213'),(5,2,'CU001','hello'),(6,2,'CU001','hello'),(7,2,'CU001','dung cho dien'),(8,2,'CU001','lozzzd ung'),(9,2,'CU001','san pham nay nhu con cac ay'),(10,3,'CU001','123123');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listproduct`
--

DROP TABLE IF EXISTS `listproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listproduct` (
  `ID_list` int(11) NOT NULL AUTO_INCREMENT,
  `ID_order` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `quanlity` int(11) NOT NULL,
  PRIMARY KEY (`ID_list`,`ID_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listproduct`
--

LOCK TABLES `listproduct` WRITE;
/*!40000 ALTER TABLE `listproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `listproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `ID_manufacturer` int(11) NOT NULL,
  `manufacturerName` text NOT NULL,
  PRIMARY KEY (`ID_manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Adidas Originals'),(2,'Nike'),(3,'Rick Owens'),(4,'Saint Laurent');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myproduct`
--

DROP TABLE IF EXISTS `myproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myproduct` (
  `ID_product` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double(8,4) NOT NULL,
  `ID_range` int(11) NOT NULL,
  `ID_manufacturer` int(11) NOT NULL,
  `ID_status` int(11) NOT NULL,
  `ID_category` int(11) NOT NULL,
  `ID_SQ` int(11) NOT NULL,
  PRIMARY KEY (`ID_product`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myproduct`
--

LOCK TABLES `myproduct` WRITE;
/*!40000 ALTER TABLE `myproduct` DISABLE KEYS */;
INSERT INTO `myproduct` VALUES (1,'NIKE AIR MAX RETRO ATMOS','NIKE AM in grey',1100.0000,1,3,1,1,1),(2,'NIKE AIR MAX 1 ULTRA 2.0','NIKE AM in red',1500.0000,1,3,2,1,2),(3,'NIKE AIR MAX 1 MASTER','Multicolor',900.0000,1,3,1,1,3),(4,'NIKE AIR MAX 1 ANNIVERSARY','Celebrating Anniversary',45.0000,1,3,2,1,4),(5,'ADIDAS LIGHTER PANTS','pants in lighter black',10.0000,1,1,1,2,5),(6,'ADIDAS WEATHER SHORT','short in black',10.0000,1,1,1,2,6),(7,'ADIDAS GRAPHICS SHORT','short in HD graphics',15.0000,1,1,1,2,7),(8,'ADIDAS GRAPHICS TEE','tee in HD Graphics',7.0000,1,1,1,3,8),(9,'ADIDAS TREE FOIL TEE','tee in Yellow',15.0000,1,1,1,3,9),(10,'ADIDAS GRAPHICS TEE','tee in blue',16.0000,1,1,1,3,10);
/*!40000 ALTER TABLE `myproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `ID_order` int(11) NOT NULL AUTO_INCREMENT,
  `accid` varchar(10) NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `totalPrice` double(9,4) NOT NULL,
  PRIMARY KEY (`ID_order`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (11,'CU001',22,5,2017,907.0000),(12,'CU002',23,5,2017,3600.0000),(13,'CU002',23,5,2017,1100.0000),(14,'CU002',23,5,2017,10.0000);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `productid` varchar(10) NOT NULL,
  `productname` varchar(1000) NOT NULL,
  `productprice` double NOT NULL DEFAULT '0',
  `supplierid` varchar(10) NOT NULL,
  `info` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('P001','shoe',120000,'S001',''),('P002','bag',125236,'S001',''),('P003','balo',85265,'S002',''),('P004','nike',8563.5,'S002',''),('P005','rest',85.236,'S003',''),('P006','jewe',800,'S003',''),('P007','croco',500,'S002',''),('P008','chester',300,'S001',''),('P009','rolex',300000,'S003','');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_picture`
--

DROP TABLE IF EXISTS `product_has_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_has_picture` (
  `ID_picture` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`ID_picture`,`ID_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_picture`
--

LOCK TABLES `product_has_picture` WRITE;
/*!40000 ALTER TABLE `product_has_picture` DISABLE KEYS */;
INSERT INTO `product_has_picture` VALUES (1,1,'.\\Database\\1\\1.jpg'),(2,1,'.\\Database\\1\\2.jpg'),(3,1,'.\\Database\\1\\3.jpg'),(4,1,'.\\Database\\1\\4.jpg'),(5,2,'.\\Database\\2\\1.jpg'),(6,2,'.\\Database\\2\\2.jpg'),(7,2,'.\\Database\\2\\3.jpg'),(8,2,'.\\Database\\2\\4.jpg'),(9,3,'.\\Database\\3\\1.jpg'),(10,3,'.\\Database\\3\\2.jpg'),(11,3,'.\\Database\\3\\3.jpg'),(12,3,'.\\Database\\3\\4.jpg'),(13,4,'.\\Database\\4\\1.jpg'),(14,4,'.\\Database\\4\\2.jpg'),(15,4,'.\\Database\\4\\3.jpg'),(16,4,'.\\Database\\4\\4.jpg'),(17,5,'.\\Database\\5\\1.jpg'),(18,5,'.\\Database\\5\\2.jpg'),(19,5,'.\\Database\\5\\3.jpg'),(20,5,'.\\Database\\5\\4.jpg'),(21,6,'.\\Database\\6\\1.jpg'),(22,6,'.\\Database\\6\\2.jpg'),(23,6,'.\\Database\\6\\3.jpg'),(24,6,'.\\Database\\6\\4.jpg'),(25,7,'.\\Database\\7\\1.jpg'),(26,7,'.\\Database\\7\\2.jpg'),(27,7,'.\\Database\\7\\3.jpg'),(28,7,'.\\Database\\7\\4.jpg'),(29,8,'.\\Database\\8\\1.jpg'),(30,8,'.\\Database\\8\\2.jpg'),(31,8,'.\\Database\\8\\3.jpg'),(32,8,'.\\Database\\8\\4.jpg'),(33,9,'.\\Database\\9\\1.jpg'),(34,9,'.\\Database\\9\\2.jpg'),(35,9,'.\\Database\\9\\3.jpg'),(36,9,'.\\Database\\9\\4.jpg');
/*!40000 ALTER TABLE `product_has_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productlist`
--

DROP TABLE IF EXISTS `productlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productlist` (
  `ID_list` int(11) NOT NULL AUTO_INCREMENT,
  `ID_order` int(11) NOT NULL,
  `ID_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(9,4) NOT NULL,
  `totalPrice` double(9,4) NOT NULL,
  PRIMARY KEY (`ID_list`,`ID_order`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productlist`
--

LOCK TABLES `productlist` WRITE;
/*!40000 ALTER TABLE `productlist` DISABLE KEYS */;
INSERT INTO `productlist` VALUES (1,11,3,1,900.0000,900.0000),(2,11,8,1,7.0000,7.0000),(3,12,3,4,900.0000,3600.0000),(4,13,1,1,1100.0000,1100.0000),(5,14,5,1,10.0000,10.0000);
/*!40000 ALTER TABLE `productlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `range`
--

DROP TABLE IF EXISTS `range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range` (
  `ID_range` int(11) NOT NULL AUTO_INCREMENT,
  `low` int(11) NOT NULL,
  `high` int(11) NOT NULL,
  PRIMARY KEY (`ID_range`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `range`
--

LOCK TABLES `range` WRITE;
/*!40000 ALTER TABLE `range` DISABLE KEYS */;
INSERT INTO `range` VALUES (1,0,1500),(2,1600,3000),(3,3000,5000),(4,5000,7000);
/*!40000 ALTER TABLE `range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rating` (
  `ID_rating` int(11) NOT NULL AUTO_INCREMENT,
  `ID_product` int(11) NOT NULL,
  `accid` varchar(45) NOT NULL,
  `rating` int(11) NOT NULL,
  PRIMARY KEY (`ID_rating`,`ID_product`,`accid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
INSERT INTO `rating` VALUES (2,3,'CU001',3);
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ID_role` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` text NOT NULL,
  PRIMARY KEY (`ID_role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shose`
--

DROP TABLE IF EXISTS `shose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shose` (
  `ID_shose` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` double(9,2) NOT NULL,
  `ID_status` int(11) NOT NULL,
  `ID_manufacturer` int(11) NOT NULL,
  `ID_range` int(11) NOT NULL,
  PRIMARY KEY (`ID_shose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shose`
--

LOCK TABLES `shose` WRITE;
/*!40000 ALTER TABLE `shose` DISABLE KEYS */;
INSERT INTO `shose` VALUES (1,'NIKE AIR MAX RETRO ATMOS','NIKE AM in grey',1100.00,1,3,1),(2,'NIKE AIR MAX 1 ULTRA 2.0','NIKE AM in red',1500.00,2,3,1),(3,'NIKE AIR MAX 1 MASTER','Multicolor',900.00,1,3,1),(4,'NIKE AIR MAX 1 ANNIVERSARY','Celebrating Anniversary',45.00,3,1,1);
/*!40000 ALTER TABLE `shose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoselist`
--

DROP TABLE IF EXISTS `shoselist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shoselist` (
  `ID_shoppingcart` int(11) NOT NULL,
  `ID_account` int(11) NOT NULL,
  `ID_shose` int(11) NOT NULL,
  `quanlity` int(11) NOT NULL,
  PRIMARY KEY (`ID_shoppingcart`,`ID_account`,`ID_shose`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoselist`
--

LOCK TABLES `shoselist` WRITE;
/*!40000 ALTER TABLE `shoselist` DISABLE KEYS */;
INSERT INTO `shoselist` VALUES (1,1,1,4),(1,1,2,4);
/*!40000 ALTER TABLE `shoselist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sq`
--

DROP TABLE IF EXISTS `sq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sq` (
  `ID_SQ` int(10) NOT NULL,
  `size` varchar(45) NOT NULL,
  `quanlity` int(11) NOT NULL,
  PRIMARY KEY (`ID_SQ`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sq`
--

LOCK TABLES `sq` WRITE;
/*!40000 ALTER TABLE `sq` DISABLE KEYS */;
INSERT INTO `sq` VALUES (1,'32',10),(1,'34',11);
/*!40000 ALTER TABLE `sq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `ID_status` int(11) NOT NULL,
  `status` text NOT NULL,
  `discount` double(2,2) NOT NULL,
  PRIMARY KEY (`ID_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Sale',0.50),(2,'Sold out',0.00),(3,'New Arrival',0.00),(4,'Normal',0.00),(5,'In-Stock',0.00);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `supplierid` varchar(10) NOT NULL,
  `suppliername` varchar(100) NOT NULL,
  `supplieraddress` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('S001','WAE','HCM City');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supply` (
  `product` varchar(10000) NOT NULL,
  `supplierid` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES ('{\"name\":\"phone\",\"supplierId\":\"S001\",\"products\":[{\"productId\":\"P010\",\"productName\":\"Iphone 6s\",\"productPrice\":250.0,\"supplierId\":\"S001\",\"info\":\"\"},{\"productId\":\"P011\",\"productName\":\"Samsung Galaxy J7 Prime\",\"productPrice\":850.0,\"supplierId\":\"S001\",\"info\":\"\"},{\"productId\":\"P012\",\"productName\":\"Oppo F1s\",\"productPrice\":450.0,\"supplierId\":\"S001\",\"info\":\"\"},{\"productId\":\"P013\",\"productName\":\"Microsoft Lumia 950\",\"productPrice\":350.0,\"supplierId\":\"S001\",\"info\":\"\"},{\"productId\":\"P014\",\"productName\":\"HTC One M9\",\"productPrice\":250.0,\"supplierId\":\"S001\",\"info\":\"\"},{\"productId\":\"P015\",\"productName\":\"Asus Zenphone 5\",\"productPrice\":2250.0,\"supplierId\":\"S001\",\"info\":\"\"}]}','S001','phone');
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-29 15:25:09
