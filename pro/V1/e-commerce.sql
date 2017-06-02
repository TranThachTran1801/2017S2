-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ecmrproj
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
INSERT INTO `account` VALUES ('AD001','admin','0192023a7bbd73250516f069df18b500','admin@emcb.com','HCMIU','ACTIVATED','ADMINISTRATOR','2016-07-01'),('CU001','user','6ad14ba9986e3615423dfca256d04e3f','ecommercebook2016@gmail.com','AMAZON','ACTIVATED','CUSTOMER','2016-07-01'),('ST001','staff','de9bf5643eabf80f4a56fda3bbb84483','staff@emcb.com','ALIBABA','ACTIVATED','STAFF','2016-07-01');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderid` varchar(10) DEFAULT NULL,
  `customerid` varchar(10) DEFAULT NULL,
  `orderfullname` varchar(50) DEFAULT NULL,
  `orderaddress` varchar(1000) DEFAULT NULL,
  `orderphone` varchar(1000) DEFAULT NULL,
  `orderdate` varchar(20) DEFAULT NULL,
  `totalcost` varchar(100) DEFAULT NULL,
  `cardid` varchar(20) DEFAULT NULL,
  `orderform` varchar(1000) DEFAULT NULL,
  `ordertype` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
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

-- Dump completed on 2017-01-05 13:53:31
