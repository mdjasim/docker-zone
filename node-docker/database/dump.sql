CREATE DATABASE  IF NOT EXISTS `FastEx` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `FastEx`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: FastEx
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `CustomerId` int NOT NULL AUTO_INCREMENT,
  `CustomerName` varchar(100) NOT NULL,
  `BusinessAddress` varchar(255) NOT NULL,
  `SellerId` int DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `LastModificationDate` varchar(45) DEFAULT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `Customer_Seller_idx` (`SellerId`),
  KEY `Customer_User_idx` (`UserId`),
  CONSTRAINT `Customer_Seller` FOREIGN KEY (`SellerId`) REFERENCES `Seller` (`SellerId`),
  CONSTRAINT `Customer_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetails`
--

DROP TABLE IF EXISTS `OrderDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderDetails` (
  `OrderDetailsId` bigint NOT NULL AUTO_INCREMENT,
  `OrderId` bigint DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `ProjectCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrderDetailsId`),
  KEY `OrderDeatils_OrderMaster_idx` (`OrderId`),
  KEY `OderDetails_Product_idx` (`ProductId`),
  CONSTRAINT `OderDetails_Product` FOREIGN KEY (`ProductId`) REFERENCES `ProductScreen` (`ProductId`),
  CONSTRAINT `OrderDeatils_OrderMaster` FOREIGN KEY (`OrderId`) REFERENCES `OrderMaster` (`OrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetails`
--

LOCK TABLES `OrderDetails` WRITE;
/*!40000 ALTER TABLE `OrderDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderMaster`
--

DROP TABLE IF EXISTS `OrderMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderMaster` (
  `OrderId` bigint NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `UserId` int NOT NULL,
  `CreationDate` datetime NOT NULL,
  `LastModificationDate` datetime NOT NULL,
  `Status` tinyint NOT NULL COMMENT 'Placed, Handled, Deleted',
  PRIMARY KEY (`OrderId`),
  KEY `Oder_Customer_idx` (`CustomerId`),
  KEY `Oder_User_idx` (`UserId`),
  CONSTRAINT `Oder_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `Oder_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderMaster`
--

LOCK TABLES `OrderMaster` WRITE;
/*!40000 ALTER TABLE `OrderMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductScreen`
--

DROP TABLE IF EXISTS `ProductScreen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductScreen` (
  `ProductId` int NOT NULL AUTO_INCREMENT,
  `ArticleNumber` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Specification` varchar(255) DEFAULT NULL,
  `SKU` varchar(50) DEFAULT NULL COMMENT 'Stock keeping Unit (e.g. Pcs, Sets, Dozen etc)',
  `EANCode` varchar(100) DEFAULT NULL COMMENT 'Barcode',
  `ImageURL` varchar(255) DEFAULT NULL,
  `CreationDate` datetime NOT NULL,
  `LastModificationDate` datetime NOT NULL,
  `IsActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductScreen`
--

LOCK TABLES `ProductScreen` WRITE;
/*!40000 ALTER TABLE `ProductScreen` DISABLE KEYS */;
INSERT INTO `ProductScreen` VALUES (1,'101350130010','Borrskruv 3,5 x 13 Fzb',NULL,NULL,'7340033222295',NULL,'2020-03-13 00:00:00','2020-03-13 00:00:00',NULL),(2,'101420090010','Borrskruv Combi 4,2 x 9,5 Fzb',NULL,NULL,'7340033210018',NULL,'2020-03-13 00:00:00','2020-03-13 00:00:00',NULL),(3,'101420130010','Borrskruv Combi 4,2 x 13 Fzb',NULL,NULL,'7340033210025',NULL,'2020-03-13 00:00:00','2020-03-13 00:00:00',NULL),(4,'102350953009','Blindnitskruv 3,5 x 9,5/1','Ral 3009 Mörkröd',NULL,'7340033231198',NULL,'2020-03-13 00:00:00','2020-03-13 00:00:00',NULL);
/*!40000 ALTER TABLE `ProductScreen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seller`
--

DROP TABLE IF EXISTS `Seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seller` (
  `SellerId` int NOT NULL AUTO_INCREMENT,
  `SellerName` varchar(100) NOT NULL,
  `SellerDesignation` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `ContactAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SellerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seller`
--

LOCK TABLES `Seller` WRITE;
/*!40000 ALTER TABLE `Seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `Seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `UserId` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `UserLoginId` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `UserType` tinyint DEFAULT NULL COMMENT '3 types of user: Fastex User; Customer User; Mobile User.',
  `CreatedBy` int NOT NULL,
  `CreationDate` datetime NOT NULL,
  `LastModificationDate` datetime NOT NULL,
  `IsActive` bit(1) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WithdrawDetails`
--

DROP TABLE IF EXISTS `WithdrawDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WithdrawDetails` (
  `WithdrawDetailsId` bigint NOT NULL AUTO_INCREMENT,
  `WithdrawId` bigint DEFAULT NULL,
  `ProductId` int DEFAULT NULL,
  `Quantity` double DEFAULT NULL,
  `ProjectCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`WithdrawDetailsId`),
  KEY `WithdrawMaster_WithdrawDetails_idx` (`WithdrawId`),
  KEY `WithdrawDetails_Product_idx` (`ProductId`),
  CONSTRAINT `WithdrawDetails_Product` FOREIGN KEY (`ProductId`) REFERENCES `ProductScreen` (`ProductId`),
  CONSTRAINT `WithdrawDetails_WithdrawMaster` FOREIGN KEY (`WithdrawId`) REFERENCES `WithdrawMaster` (`WithdrawId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WithdrawDetails`
--

LOCK TABLES `WithdrawDetails` WRITE;
/*!40000 ALTER TABLE `WithdrawDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `WithdrawDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WithdrawMaster`
--

DROP TABLE IF EXISTS `WithdrawMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WithdrawMaster` (
  `WithdrawId` bigint NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `UserId` int DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `LastModificationDate` datetime DEFAULT NULL,
  PRIMARY KEY (`WithdrawId`),
  KEY `WithdrawMaster_Customer_idx` (`CustomerId`),
  KEY `WithdrawMaster_User_idx` (`UserId`),
  CONSTRAINT `WithdrawMaster_Customer` FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`),
  CONSTRAINT `WithdrawMaster_User` FOREIGN KEY (`UserId`) REFERENCES `User` (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WithdrawMaster`
--

LOCK TABLES `WithdrawMaster` WRITE;
/*!40000 ALTER TABLE `WithdrawMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `WithdrawMaster` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-14  1:24:23
