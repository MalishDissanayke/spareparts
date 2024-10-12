-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: spare_parts
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electric_parts'),(2,'Metal_parts'),(3,'Rubber_parts'),(4,'Tranmission_parts'),(10,'Bonnet_parts'),(13,'Body_parts');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `CUST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (17,'kunal','kamra','9873635464','user3@gmail.com'),(18,'Nimal','patil','8934827482',NULL),(19,'Amal','goswami','0765444107','malishadr946@gmail.com'),(20,'wimal','shah','8678947353',NULL),(21,'Jimal','modi','7865346734','malisha.dissanayake@ebeyonds.com'),(22,'Lal','Dissanayake','0765444107',NULL),(23,'Malisha','Dissanayake','0765444196',NULL),(24,'Malisha','Dissanayake','0763444196',NULL),(25,'Malishaa','Dissanayawke','0765444159',NULL),(27,'Malisha','Dissanayake','0765444197',NULL),(28,'Malisha','Dissqanayake','0765244197',NULL),(29,'fwe4frw','wfefre','0165444107','killermkxxx@gmail.com'),(30,'ljlj','trt','0765144197',NULL),(31,'Malisha','Dissanayake','0765444190',NULL),(32,'Malisha','Dissanayake','0765744197',NULL),(33,'1Anni','Dissanayake','0765444897','malishadm122@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  `JOB_ID` int(11) DEFAULT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  UNIQUE KEY `PHONE_NUMBER` (`PHONE_NUMBER`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'pavan','patil','Male','pavan@gmail.com','9876567865',1,113),(5,'karan','nakum','Male','karan@gmail.com','89763546334',1,163),(6,'hrushikesh','rajankar','Male','rushi@gmail.com','9874657834',2,164),(7,'gopal','paraskar','Male','gopal@gmail.com','7894653125',2,165),(8,'Malisha','Dissanayake','Male','malishadr946@gmail.com','0765444197',1,166),(11,'Malidha','Dissanayake','Male','malishadr746@gmail.com','0765444107',1,169),(14,'Malisha','Dissanayake','Male','malishadr946@gmail.com','0765444193',1,172);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `job` (
  `JOB_ID` int(11) NOT NULL,
  `JOB_TITLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'Manager'),(2,'Cashier');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `location` (
  `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVINCE` varchar(100) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (113,'western','Thalawathugoda'),(159,'Western 1','Colombo 1'),(160,'western 2','Colombo 2'),(161,'central 1','Kandy 1'),(162,'central 2','kandy 2'),(163,'North 1','jaffna 1'),(164,'North 2','Jaffna2'),(165,'South 1','Galle 1'),(166,'South 2','Galle 2'),(167,'nagpur','kuhi'),(168,'nagpur','kuhi'),(169,'nagpur','bhiwapur'),(170,'nagpur','kuhi'),(171,'pune','kondhwa'),(172,'pune','kondhwa'),(173,'nagpur','kuhi');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `manager` (
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `LOCATION_ID` int(11) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  UNIQUE KEY `PHONE_NUMBER` (`PHONE_NUMBER`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_CODE` varchar(20) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(250) NOT NULL,
  `QTY_STOCK` int(50) DEFAULT NULL,
  `ON_HAND` int(250) NOT NULL,
  `PRICE` int(50) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `SUPPLIER_ID` int(11) DEFAULT NULL,
  `DATE_STOCK_IN` varchar(50) NOT NULL,
  `vmodel` varchar(45) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  KEY `SUPPLIER_ID` (`SUPPLIER_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`SUPPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1115 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (28,'1','wires','',1,1,300,4,19,'',NULL,NULL),(29,'1','wires','',1,1,300,4,19,'',NULL,NULL),(30,'1','wires','',1,1,300,4,19,'',NULL,NULL),(31,'1','wires','',1,1,300,4,19,'',NULL,NULL),(32,'1','wires','',1,1,300,4,19,'',NULL,NULL),(33,'1','wires','',1,1,300,4,19,'',NULL,NULL),(34,'1','wires','',1,1,300,4,19,'',NULL,NULL),(35,'1','wires','',1,1,300,4,19,'',NULL,NULL),(36,'1','wires','',1,1,300,4,19,'',NULL,NULL),(37,'1','wires','',1,1,300,4,19,'',NULL,NULL),(38,'1','wires','',1,1,300,4,19,'',NULL,NULL),(39,'1','wires','',1,1,300,4,19,'',NULL,NULL),(40,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(41,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(42,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(43,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(44,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(45,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(46,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(47,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(48,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(49,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(50,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(51,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(52,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(53,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(54,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(55,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(56,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(57,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(58,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(59,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(60,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(61,'2','headlights','',1,1,2500,1,17,'',NULL,NULL),(62,'3','starters','',1,1,500,1,18,'',NULL,NULL),(63,'3','starters','',1,1,500,1,18,'',NULL,NULL),(64,'3','starters','',1,1,500,1,18,'',NULL,NULL),(65,'3','starters','',1,1,500,1,18,'',NULL,NULL),(66,'3','starters','',1,1,500,1,18,'',NULL,NULL),(67,'3','starters','',1,1,500,1,18,'',NULL,NULL),(68,'3','starters','',1,1,500,1,18,'',NULL,NULL),(69,'3','starters','',1,1,500,1,18,'',NULL,NULL),(70,'3','starters','',1,1,500,1,18,'',NULL,NULL),(71,'3','starters','',1,1,500,1,18,'',NULL,NULL),(72,'3','starters','',1,1,500,1,18,'',NULL,NULL),(73,'3','starters','',1,1,500,1,18,'',NULL,NULL),(74,'3','starters','',1,1,500,1,18,'',NULL,NULL),(75,'3','starters','',1,1,500,1,18,'',NULL,NULL),(76,'3','starters','',1,1,500,1,18,'',NULL,NULL),(77,'3','starters','',1,1,500,1,18,'',NULL,NULL),(78,'3','starters','',1,1,500,1,18,'',NULL,NULL),(79,'3','starters','',1,1,500,1,18,'',NULL,NULL),(80,'3','starters','',1,1,500,1,18,'',NULL,NULL),(81,'3','starters','',1,1,500,1,18,'',NULL,NULL),(82,'3','starters','',1,1,500,1,18,'',NULL,NULL),(83,'3','starters','',1,1,500,1,18,'',NULL,NULL),(84,'3','starters','',1,1,500,1,18,'',NULL,NULL),(85,'3','starters','',1,1,500,1,18,'',NULL,NULL),(86,'3','starters','',1,1,500,1,18,'',NULL,NULL),(87,'3','starters','',1,1,500,1,18,'',NULL,NULL),(88,'3','starters','',1,1,500,1,18,'',NULL,NULL),(89,'3','starters','',1,1,500,1,18,'',NULL,NULL),(90,'3','starters','',1,1,500,1,18,'',NULL,NULL),(91,'3','starters','',1,1,500,1,18,'',NULL,NULL),(92,'3','starters','',1,1,500,1,18,'',NULL,NULL),(93,'3','starters','',1,1,500,1,18,'',NULL,NULL),(94,'3','starters','',1,1,500,1,18,'',NULL,NULL),(95,'3','starters','',1,1,500,1,18,'',NULL,NULL),(96,'3','starters','',1,1,500,1,18,'',NULL,NULL),(97,'3','starters','',1,1,500,1,18,'',NULL,NULL),(98,'3','starters','',1,1,500,1,18,'',NULL,NULL),(99,'3','starters','',1,1,500,1,18,'',NULL,NULL),(100,'3','starters','',1,1,500,1,18,'',NULL,NULL),(101,'3','starters','',1,1,500,1,18,'',NULL,NULL),(102,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(103,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(104,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(105,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(106,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(107,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(108,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(109,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(110,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(111,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(112,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(113,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(114,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(115,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(116,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(117,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(118,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(119,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(120,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(121,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(122,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(123,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(124,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(125,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(126,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(127,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(128,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(129,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(130,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(131,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(132,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(133,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(134,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(135,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(136,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(137,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(138,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(139,'4','fuel injection pipes','',1,1,700,3,17,'',NULL,NULL),(140,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(141,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(142,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(143,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(144,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(145,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(146,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(147,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(148,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(149,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(150,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(151,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(152,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(153,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(154,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(155,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(156,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(157,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(158,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(159,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(160,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(161,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(162,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(163,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(164,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(165,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(166,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(167,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(168,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(169,'5','gears','',1,1,3500,4,19,'',NULL,NULL),(170,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(171,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(172,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(173,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(174,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(175,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(176,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(177,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(178,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(179,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(180,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(181,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(182,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(183,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(184,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(185,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(186,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(187,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(188,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(189,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(190,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(191,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(192,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(193,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(194,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(195,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(196,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(197,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(198,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(199,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(200,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(201,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(202,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(203,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(204,'5','U-J cross','',1,1,1500,4,17,'',NULL,NULL),(205,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(206,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(207,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(208,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(209,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(210,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(211,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(212,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(213,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(214,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(215,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(216,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(217,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(218,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(219,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(220,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(221,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(222,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(223,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(224,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(225,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(226,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(227,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(228,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(229,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(230,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(231,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(232,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(233,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(234,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(235,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(236,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(237,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(238,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(239,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(240,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(241,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(242,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(243,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(244,'6','Engine mountings','',1,1,1200,3,19,'',NULL,NULL),(245,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(246,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(247,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(248,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(249,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(250,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(251,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(252,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(253,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(254,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(255,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(256,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(257,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(258,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(259,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(260,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(261,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(262,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(263,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(264,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(265,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(266,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(267,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(268,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(269,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(270,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(271,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(272,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(273,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(274,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(275,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(276,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(277,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(278,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(279,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(280,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(281,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(282,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(283,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(284,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(285,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(286,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(287,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(288,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(289,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(290,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(291,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(292,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(293,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(294,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(295,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(296,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(297,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(298,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(299,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(300,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(301,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(302,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(303,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(304,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(305,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(306,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(307,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(308,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(309,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(310,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(311,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(312,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(313,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(314,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(315,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(316,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(317,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(318,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(319,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(320,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(321,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(322,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(323,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(324,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(325,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(326,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(327,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(328,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(329,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(330,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(331,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(332,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(333,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(334,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(335,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(336,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(337,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(338,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(339,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(340,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(341,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(342,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(343,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(344,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(345,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(346,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(347,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(348,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(349,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(350,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(351,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(352,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(353,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(354,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(355,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(356,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(357,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(358,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(359,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(360,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(361,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(362,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(363,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(364,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(365,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(366,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(367,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(368,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(369,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(370,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(371,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(372,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(373,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(374,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(375,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(376,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(377,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(378,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(379,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(380,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(381,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(382,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(383,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(384,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(385,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(386,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(387,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(388,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(389,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(390,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(391,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(392,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(393,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(394,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(395,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(396,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(397,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(398,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(399,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(400,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(401,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(402,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(403,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(404,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(405,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(406,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(407,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(408,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(409,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(410,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(411,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(412,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(413,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(414,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(415,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(416,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(417,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(418,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(419,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(420,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(421,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(422,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(423,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(424,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(425,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(426,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(427,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(428,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(429,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(430,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(431,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(432,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(433,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(434,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(435,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(436,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(437,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(438,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(439,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(440,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(441,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(442,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(443,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(444,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(445,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(446,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(447,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(448,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(449,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(450,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(451,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(452,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(453,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(454,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(455,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(456,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(457,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(458,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(459,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(460,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(461,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(462,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(463,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(464,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(465,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(466,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(467,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(468,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(469,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(470,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(471,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(472,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(473,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(474,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(475,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(476,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(477,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(478,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(479,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(480,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(481,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(482,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(483,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(484,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(485,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(486,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(487,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(488,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(489,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(490,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(491,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(492,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(493,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(494,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(495,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(496,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(497,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(498,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(499,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(500,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(501,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(502,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(503,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(504,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(505,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(506,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(507,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(508,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(509,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(510,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(511,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(512,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(513,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(514,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(515,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(516,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(517,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(518,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(519,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(520,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(521,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(522,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(523,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(524,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(525,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(526,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(527,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(528,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(529,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(530,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(531,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(532,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(533,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(534,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(535,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(536,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(537,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(538,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(539,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(540,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(541,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(542,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(543,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(544,'7','Nuts','',1,1,150,2,18,'',NULL,NULL),(545,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(546,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(547,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(548,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(549,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(550,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(551,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(552,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(553,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(554,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(555,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(556,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(557,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(558,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(559,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(560,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(561,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(562,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(563,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(564,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(565,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(566,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(567,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(568,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(569,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(570,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(571,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(572,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(573,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(574,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(575,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(576,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(577,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(578,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(579,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(580,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(581,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(582,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(583,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(584,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(585,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(586,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(587,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(588,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(589,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(590,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(591,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(592,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(593,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(594,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(595,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(596,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(597,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(598,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(599,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(600,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(601,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(602,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(603,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(604,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(605,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(606,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(607,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(608,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(609,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(610,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(611,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(612,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(613,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(614,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(615,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(616,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(617,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(618,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(619,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(620,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(621,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(622,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(623,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(624,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(625,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(626,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(627,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(628,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(629,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(630,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(631,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(632,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(633,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(634,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(635,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(636,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(637,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(638,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(639,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(640,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(641,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(642,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(643,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(644,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(645,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(646,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(647,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(648,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(649,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(650,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(651,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(652,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(653,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(654,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(655,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(656,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(657,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(658,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(659,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(660,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(661,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(662,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(663,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(664,'8','T-bolts','',1,1,130,2,17,'',NULL,NULL),(665,'1','wire','',1,1,500,1,18,'',NULL,NULL),(666,'1','wire','',1,1,500,1,18,'',NULL,NULL),(667,'1','wire','',1,1,500,1,18,'',NULL,NULL),(668,'1','wire','',1,1,500,1,18,'',NULL,NULL),(669,'1','wire','',1,1,500,1,18,'',NULL,NULL),(670,'1','wire','',1,1,500,1,18,'',NULL,NULL),(671,'1','wire','',1,1,500,1,18,'',NULL,NULL),(672,'1','wire','',1,1,500,1,18,'',NULL,NULL),(673,'1','wire','',1,1,500,1,18,'',NULL,NULL),(674,'1','wire','',1,1,500,1,18,'',NULL,NULL),(675,'1','wire','',1,1,500,1,18,'',NULL,NULL),(676,'1','wire','',1,1,500,1,18,'',NULL,NULL),(677,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(678,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(679,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(680,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(681,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(682,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(683,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(684,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(685,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(686,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(687,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(688,'20','Iron wire','',1,1,500,1,18,'',NULL,NULL),(690,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(691,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(692,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(693,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(694,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(695,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(696,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(697,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(698,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(699,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(700,'21','Cake','',1,1,300,2,19,'',NULL,NULL),(701,'22','yut','',1,1,455,3,17,'',NULL,NULL),(702,'22','yut','',1,1,455,3,17,'',NULL,NULL),(703,'22','yut','',1,1,455,3,17,'',NULL,NULL),(704,'22','yut','',1,1,455,3,17,'',NULL,NULL),(705,'22','yut','',1,1,455,3,17,'',NULL,NULL),(706,'22','yut','',1,1,455,3,17,'',NULL,NULL),(707,'22','yut','',1,1,455,3,17,'',NULL,NULL),(708,'22','yut','',1,1,455,3,17,'',NULL,NULL),(709,'22','yut','',1,1,455,3,17,'',NULL,NULL),(710,'22','yut','',1,1,455,3,17,'',NULL,NULL),(711,'22','yut','',1,1,455,3,17,'',NULL,NULL),(712,'22','yut','',1,1,455,3,17,'',NULL,NULL),(713,'22','yut','',1,1,455,3,17,'',NULL,NULL),(714,'22','yut','',1,1,455,3,17,'',NULL,NULL),(715,'22','yut','',1,1,455,3,17,'',NULL,NULL),(716,'22','yut','',1,1,455,3,17,'',NULL,NULL),(717,'22','yut','',1,1,455,3,17,'',NULL,NULL),(718,'22','yut','',1,1,455,3,17,'',NULL,NULL),(719,'22','yut','',1,1,455,3,17,'',NULL,NULL),(720,'22','yut','',1,1,455,3,17,'',NULL,NULL),(721,'22','yut','',1,1,455,3,17,'',NULL,NULL),(722,'22','yut','',1,1,455,3,17,'',NULL,NULL),(723,'22','yut','',1,1,455,3,17,'',NULL,NULL),(724,'22','yut','',1,1,455,3,17,'',NULL,NULL),(725,'22','yut','',1,1,455,3,17,'',NULL,NULL),(726,'22','yut','',1,1,455,3,17,'',NULL,NULL),(727,'22','yut','',1,1,455,3,17,'',NULL,NULL),(728,'22','yut','',1,1,455,3,17,'',NULL,NULL),(729,'22','yut','',1,1,455,3,17,'',NULL,NULL),(730,'22','yut','',1,1,455,3,17,'',NULL,NULL),(731,'22','yut','',1,1,455,3,17,'',NULL,NULL),(732,'22','yut','',1,1,455,3,17,'',NULL,NULL),(733,'22','yut','',1,1,455,3,17,'',NULL,NULL),(734,'22','yut','',1,1,455,3,17,'',NULL,NULL),(735,'22','yut','',1,1,455,3,17,'',NULL,NULL),(736,'22','yut','',1,1,455,3,17,'',NULL,NULL),(737,'22','yut','',1,1,455,3,17,'',NULL,NULL),(738,'22','yut','',1,1,455,3,17,'',NULL,NULL),(739,'22','yut','',1,1,455,3,17,'',NULL,NULL),(740,'22','yut','',1,1,455,3,17,'',NULL,NULL),(741,'22','yut','',1,1,455,3,17,'',NULL,NULL),(742,'22','yut','',1,1,455,3,17,'',NULL,NULL),(743,'22','yut','',1,1,455,3,17,'',NULL,NULL),(744,'22','yut','',1,1,455,3,17,'',NULL,NULL),(745,'22','yut','',1,1,455,3,17,'',NULL,NULL),(746,'22','yut','',1,1,455,3,17,'',NULL,NULL),(747,'22','yut','',1,1,455,3,17,'',NULL,NULL),(748,'22','yut','',1,1,455,3,17,'',NULL,NULL),(749,'22','yut','',1,1,455,3,17,'',NULL,NULL),(750,'22','yut','',1,1,455,3,17,'',NULL,NULL),(751,'22','yut','',1,1,455,3,17,'',NULL,NULL),(752,'22','yut','',1,1,455,3,17,'',NULL,NULL),(753,'22','yut','',1,1,455,3,17,'',NULL,NULL),(754,'22','yut','',1,1,455,3,17,'',NULL,NULL),(755,'22','yut','',1,1,455,3,17,'',NULL,NULL),(756,'22','yut','',1,1,455,3,17,'',NULL,NULL),(757,'22','yut','',1,1,455,3,17,'',NULL,NULL),(758,'22','yut','',1,1,455,3,17,'',NULL,NULL),(759,'22','yut','',1,1,455,3,17,'',NULL,NULL),(760,'22','yut','',1,1,455,3,17,'',NULL,NULL),(761,'22','yut','',1,1,455,3,17,'',NULL,NULL),(762,'22','yut','',1,1,455,3,17,'',NULL,NULL),(763,'22','yut','',1,1,455,3,17,'',NULL,NULL),(764,'22','yut','',1,1,455,3,17,'',NULL,NULL),(765,'22','yut','',1,1,455,3,17,'',NULL,NULL),(766,'22','yut','',1,1,455,3,17,'',NULL,NULL),(767,'22','yut','',1,1,455,3,17,'',NULL,NULL),(768,'22','yut','',1,1,455,3,17,'',NULL,NULL),(769,'22','yut','',1,1,455,3,17,'',NULL,NULL),(770,'22','yut','',1,1,455,3,17,'',NULL,NULL),(771,'22','yut','',1,1,455,3,17,'',NULL,NULL),(772,'22','yut','',1,1,455,3,17,'',NULL,NULL),(773,'22','yut','',1,1,455,3,17,'',NULL,NULL),(774,'22','yut','',1,1,455,3,17,'',NULL,NULL),(775,'22','yut','',1,1,455,3,17,'',NULL,NULL),(776,'22','yut','',1,1,455,3,17,'',NULL,NULL),(777,'22','yut','',1,1,455,3,17,'',NULL,NULL),(778,'22','yut','',1,1,455,3,17,'',NULL,NULL),(779,'22','yut','',1,1,455,3,17,'',NULL,NULL),(780,'22','yut','',1,1,455,3,17,'',NULL,NULL),(781,'22','yut','',1,1,455,3,17,'',NULL,NULL),(782,'22','yut','',1,1,455,3,17,'',NULL,NULL),(783,'22','yut','',1,1,455,3,17,'',NULL,NULL),(784,'22','yut','',1,1,455,3,17,'',NULL,NULL),(785,'22','yut','',1,1,455,3,17,'',NULL,NULL),(786,'22','yut','',1,1,455,3,17,'',NULL,NULL),(787,'22','yut','',1,1,455,3,17,'',NULL,NULL),(788,'22','yut','',1,1,455,3,17,'',NULL,NULL),(789,'22','yut','',1,1,455,3,17,'',NULL,NULL),(790,'22','yut','',1,1,455,3,17,'',NULL,NULL),(791,'22','yut','',1,1,455,3,17,'',NULL,NULL),(792,'22','yut','',1,1,455,3,17,'',NULL,NULL),(793,'22','yut','',1,1,455,3,17,'',NULL,NULL),(794,'22','yut','',1,1,455,3,17,'',NULL,NULL),(795,'22','yut','',1,1,455,3,17,'',NULL,NULL),(796,'22','yut','',1,1,455,3,17,'',NULL,NULL),(797,'22','yut','',1,1,455,3,17,'',NULL,NULL),(798,'22','yut','',1,1,455,3,17,'',NULL,NULL),(799,'22','yut','',1,1,455,3,17,'',NULL,NULL),(800,'22','yut','',1,1,455,3,17,'',NULL,NULL),(801,'22','yut','',1,1,455,3,17,'',NULL,NULL),(802,'22','yut','',1,1,455,3,17,'',NULL,NULL),(803,'22','yut','',1,1,455,3,17,'',NULL,NULL),(804,'22','yut','',1,1,455,3,17,'',NULL,NULL),(805,'22','yut','',1,1,455,3,17,'',NULL,NULL),(806,'22','yut','',1,1,455,3,17,'',NULL,NULL),(807,'22','yut','',1,1,455,3,17,'',NULL,NULL),(808,'22','yut','',1,1,455,3,17,'',NULL,NULL),(809,'22','yut','',1,1,455,3,17,'',NULL,NULL),(810,'22','yut','',1,1,455,3,17,'',NULL,NULL),(811,'22','yut','',1,1,455,3,17,'',NULL,NULL),(812,'22','yut','',1,1,455,3,17,'',NULL,NULL),(813,'22','yut','',1,1,455,3,17,'',NULL,NULL),(814,'22','yut','',1,1,455,3,17,'',NULL,NULL),(815,'22','yut','',1,1,455,3,17,'',NULL,NULL),(816,'22','yut','',1,1,455,3,17,'',NULL,NULL),(817,'22','yut','',1,1,455,3,17,'',NULL,NULL),(818,'22','yut','',1,1,455,3,17,'',NULL,NULL),(819,'22','yut','',1,1,455,3,17,'',NULL,NULL),(820,'22','yut','',1,1,455,3,17,'',NULL,NULL),(821,'22','yut','',1,1,455,3,17,'',NULL,NULL),(822,'22','yut','',1,1,455,3,17,'',NULL,NULL),(823,'22','yut','',1,1,455,3,17,'',NULL,NULL),(824,'22','yut','',1,1,455,3,17,'',NULL,NULL),(825,'22','yut','',1,1,455,3,17,'',NULL,NULL),(826,'22','yut','',1,1,455,3,17,'',NULL,NULL),(827,'22','yut','',1,1,455,3,17,'',NULL,NULL),(828,'22','yut','',1,1,455,3,17,'',NULL,NULL),(829,'22','yut','',1,1,455,3,17,'',NULL,NULL),(830,'22','yut','',1,1,455,3,17,'',NULL,NULL),(831,'22','yut','',1,1,455,3,17,'',NULL,NULL),(832,'22','yut','',1,1,455,3,17,'',NULL,NULL),(833,'22','yut','',1,1,455,3,17,'',NULL,NULL),(834,'22','yut','',1,1,455,3,17,'',NULL,NULL),(835,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(836,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(837,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(838,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(839,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(840,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(841,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(842,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(843,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(844,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(845,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(846,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(847,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(848,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(849,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(850,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(851,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(852,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(853,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(854,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(855,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(856,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(857,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(858,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(859,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(860,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(861,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(862,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(863,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(864,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(865,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(866,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(867,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(868,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(869,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(870,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(871,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(872,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(873,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(874,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(875,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(876,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(877,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(878,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(879,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(880,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(881,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(882,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(883,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(884,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(885,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(886,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(887,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(888,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(889,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(890,'22','New minaral','',1,1,345,4,20,'',NULL,NULL),(891,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(892,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(893,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(894,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(895,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(896,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(897,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(898,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(899,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(900,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(901,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(902,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(903,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(904,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(905,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(906,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(907,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(908,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(909,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(910,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(911,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(912,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(913,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(914,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(915,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(916,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(917,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(918,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(919,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(920,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(921,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(922,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(923,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(924,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(925,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(926,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(927,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(928,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(929,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(930,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(931,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(932,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(933,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(934,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(935,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(936,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(937,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(938,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(939,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(940,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(941,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(942,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(943,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(944,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(945,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(946,'23','New minaral','',1,1,789,4,19,'',NULL,NULL),(947,'23','New new','',1,1,890,10,19,'','7890',1994),(948,'23','New new','',1,1,890,10,19,'','7890',1994),(949,'23','New new','',1,1,890,10,19,'','7890',1994),(950,'23','New new','',1,1,890,10,19,'','7890',1994),(951,'23','New new','',1,1,890,10,19,'','7890',1994),(952,'23','New new','',1,1,890,10,19,'','7890',1994),(953,'23','New new','',1,1,890,10,19,'','7890',1994),(954,'23','New new','',1,1,890,10,19,'','7890',1994),(955,'23','New new','',1,1,890,10,19,'','7890',1994),(956,'23','New new','',1,1,890,10,19,'','7890',1994),(957,'23','New new','',1,1,890,10,19,'','7890',1994),(958,'23','New new','',1,1,890,10,19,'','7890',1994),(959,'23','New new','',1,1,890,10,19,'','7890',1994),(960,'23','New new','',1,1,890,10,19,'','7890',1994),(961,'23','New new','',1,1,890,10,19,'','7890',1994),(962,'23','New new','',1,1,890,10,19,'','7890',1994),(963,'23','New new','',1,1,890,10,19,'','7890',1994),(964,'23','New new','',1,1,890,10,19,'','7890',1994),(965,'23','New new','',1,1,890,10,19,'','7890',1994),(966,'23','New new','',1,1,890,10,19,'','7890',1994),(967,'23','New new','',1,1,890,10,19,'','7890',1994),(968,'23','New new','',1,1,890,10,19,'','7890',1994),(969,'23','New new','',1,1,890,10,19,'','7890',1994),(970,'23','New new','',1,1,890,10,19,'','7890',1994),(971,'23','New new','',1,1,890,10,19,'','7890',1994),(972,'23','New new','',1,1,890,10,19,'','7890',1994),(973,'23','New new','',1,1,890,10,19,'','7890',1994),(974,'23','New new','',1,1,890,10,19,'','7890',1994),(975,'23','New new','',1,1,890,10,19,'','7890',1994),(976,'23','New new','',1,1,890,10,19,'','7890',1994),(977,'23','New new','',1,1,890,10,19,'','7890',1994),(978,'23','New new','',1,1,890,10,19,'','7890',1994),(979,'23','New new','',1,1,890,10,19,'','7890',1994),(980,'23','New new','',1,1,890,10,19,'','7890',1994),(981,'23','New new','',1,1,890,10,19,'','7890',1994),(982,'23','New new','',1,1,890,10,19,'','7890',1994),(983,'23','New new','',1,1,890,10,19,'','7890',1994),(984,'23','New new','',1,1,890,10,19,'','7890',1994),(985,'23','New new','',1,1,890,10,19,'','7890',1994),(986,'23','New new','',1,1,890,10,19,'','7890',1994),(987,'23','New new','',1,1,890,10,19,'','7890',1994),(988,'23','New new','',1,1,890,10,19,'','7890',1994),(989,'23','New new','',1,1,890,10,19,'','7890',1994),(990,'23','New new','',1,1,890,10,19,'','7890',1994),(991,'23','New new','',1,1,890,10,19,'','7890',1994),(992,'23','New new','',1,1,890,10,19,'','7890',1994),(993,'23','New new','',1,1,890,10,19,'','7890',1994),(994,'23','New new','',1,1,890,10,19,'','7890',1994),(995,'23','New new','',1,1,890,10,19,'','7890',1994),(996,'23','New new','',1,1,890,10,19,'','7890',1994),(997,'23','New new','',1,1,890,10,19,'','7890',1994),(998,'23','New new','',1,1,890,10,19,'','7890',1994),(999,'23','New new','',1,1,890,10,19,'','7890',1994),(1000,'23','New new','',1,1,890,10,19,'','7890',1994),(1001,'23','New new','',1,1,890,10,19,'','7890',1994),(1002,'23','New new','',1,1,890,10,19,'','7890',1994),(1003,'23','New new','',1,1,890,10,19,'','7890',1994),(1004,'23','New new','',1,1,890,10,19,'','7890',1994),(1005,'23','New new','',1,1,890,10,19,'','7890',1994),(1006,'23','New new','',1,1,890,10,19,'','7890',1994),(1007,'23','New new','',1,1,890,10,19,'','7890',1994),(1008,'23','New new','',1,1,890,10,19,'','7890',1994),(1009,'23','New new','',1,1,890,10,19,'','7890',1994),(1010,'23','New new','',1,1,890,10,19,'','7890',1994),(1011,'23','New new','',1,1,890,10,19,'','7890',1994),(1012,'23','New new','',1,1,890,10,19,'','7890',1994),(1013,'23','New new','',1,1,890,10,19,'','7890',1994),(1014,'25','New ew','',1,1,567,1,19,'','456',1994),(1015,'25','New ew','',1,1,567,1,19,'','456',1994),(1016,'25','New ew','',1,1,567,1,19,'','456',1994),(1017,'25','New ew','',1,1,567,1,19,'','456',1994),(1018,'25','New ew','',1,1,567,1,19,'','456',1994),(1019,'25','New ew','',1,1,567,1,19,'','456',1994),(1020,'25','New ew','',1,1,567,1,19,'','456',1994),(1021,'25','New ew','',1,1,567,1,19,'','456',1994),(1022,'25','New ew','',1,1,567,1,19,'','456',1994),(1023,'25','New ew','',1,1,567,1,19,'','456',1994),(1024,'25','New ew','',1,1,567,1,19,'','456',1994),(1025,'25','New ew','',1,1,567,1,19,'','456',1994),(1026,'25','New ew','',1,1,567,1,19,'','456',1994),(1027,'25','New ew','',1,1,567,1,19,'','456',1994),(1028,'25','New ew','',1,1,567,1,19,'','456',1994),(1029,'25','New ew','',1,1,567,1,19,'','456',1994),(1030,'25','New ew','',1,1,567,1,19,'','456',1994),(1031,'25','New ew','',1,1,567,1,19,'','456',1994),(1032,'25','New ew','',1,1,567,1,19,'','456',1994),(1033,'25','New ew','',1,1,567,1,19,'','456',1994),(1034,'25','New ew','',1,1,567,1,19,'','456',1994),(1035,'25','New ew','',1,1,567,1,19,'','456',1994),(1036,'25','New ew','',1,1,567,1,19,'','456',1994),(1037,'25','New ew','',1,1,567,1,19,'','456',1994),(1038,'25','New ew','',1,1,567,1,19,'','456',1994),(1039,'25','New ew','',1,1,567,1,19,'','456',1994),(1040,'25','New ew','',1,1,567,1,19,'','456',1994),(1041,'25','New ew','',1,1,567,1,19,'','456',1994),(1042,'25','New ew','',1,1,567,1,19,'','456',1994),(1043,'25','New ew','',1,1,567,1,19,'','456',1994),(1044,'25','New ew','',1,1,567,1,19,'','456',1994),(1045,'25','New ew','',1,1,567,1,19,'','456',1994),(1046,'25','New ew','',1,1,567,1,19,'','456',1994),(1047,'25','New ew','',1,1,567,1,19,'','456',1994),(1048,'25','New ew','',1,1,567,1,19,'','456',1994),(1049,'25','New ew','',1,1,567,1,19,'','456',1994),(1050,'25','New ew','',1,1,567,1,19,'','456',1994),(1051,'25','New ew','',1,1,567,1,19,'','456',1994),(1052,'25','New ew','',1,1,567,1,19,'','456',1994),(1053,'25','New ew','',1,1,567,1,19,'','456',1994),(1054,'25','New ew','',1,1,567,1,19,'','456',1994),(1055,'25','New ew','',1,1,567,1,19,'','456',1994),(1056,'25','New ew','',1,1,567,1,19,'','456',1994),(1057,'25','New ew','',1,1,567,1,19,'','456',1994),(1058,'25','New ew','',1,1,567,1,19,'','456',1994),(1059,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1060,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1061,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1062,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1063,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1064,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1065,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1066,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1067,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1068,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1069,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1070,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1071,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1072,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1073,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1074,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1075,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1076,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1077,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1078,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1079,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1080,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1081,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1082,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1083,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1084,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1085,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1086,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1087,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1088,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1089,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1090,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1091,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1092,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1093,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1094,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1095,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1096,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1097,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1098,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1099,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1100,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1101,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1102,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1103,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1104,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1105,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1106,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1107,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1108,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1109,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1110,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1111,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1112,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1113,'56','ferf','',1,1,123,10,19,'','gtrg',1990),(1114,'56','ferf','',1,1,123,10,19,'','gtrg',1990);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `supplier` (
  `SUPPLIER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` varchar(50) DEFAULT NULL,
  `LOCATION_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`SUPPLIER_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (17,'TATA',159,'9873647484'),(18,'TOYOTA',160,'9873654783'),(19,'Mahindra',161,'8765904753'),(20,'Suziki',162,'8973645632');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction` (
  `TRANS_ID` int(50) NOT NULL AUTO_INCREMENT,
  `CUST_ID` int(11) DEFAULT NULL,
  `NUMOFITEMS` varchar(250) NOT NULL,
  `SUBTOTAL` varchar(50) NOT NULL,
  `LESSVAT` varchar(50) NOT NULL,
  `NETVAT` varchar(50) NOT NULL,
  `ADDVAT` varchar(50) NOT NULL,
  `GRANDTOTAL` varchar(250) NOT NULL,
  `CASH` varchar(250) NOT NULL,
  `DATE` varchar(50) NOT NULL,
  `TRANS_D_ID` varchar(250) NOT NULL,
  PRIMARY KEY (`TRANS_ID`),
  KEY `TRANS_DETAIL_ID` (`TRANS_D_ID`),
  KEY `CUST_ID` (`CUST_ID`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`),
  CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`TRANS_D_ID`) REFERENCES `transaction_details` (`TRANS_D_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (13,20,'1','2,500.00','267.86','2,232.14','267.86','2,500.00','2500','2020-11-11 04:15 am','111141641'),(14,19,'2','','','','','2,800.00','2800','<br />\r\n<b>Notice</b>:  Undefined variable: today ','111151334'),(15,18,'2','','','','','10,500.00','10000','2024-06-13','061380532'),(16,18,'1','','','','','6,750.00','45000','2024-06-21','062141214'),(17,17,'1','','','','','1,500.00','6990','2024-06-21','062142149');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `transaction_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANS_D_ID` varchar(250) NOT NULL,
  `PRODUCTS` varchar(250) NOT NULL,
  `QTY` varchar(250) NOT NULL,
  `PRICE` varchar(250) NOT NULL,
  `EMPLOYEE` varchar(250) NOT NULL,
  `ROLE` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRANS_D_ID` (`TRANS_D_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES (21,'111141641','headlights','1','2500','pavan','Manager'),(22,'111151334','wires','1','300','pavan','Manager'),(23,'111151334','headlights','1','2500','pavan','Manager'),(24,'061380532','headlights','4','2500','Malisha','Manager'),(25,'061380532','starters','1','500','Malisha','Manager'),(26,'062141214','Nuts','45','150','Malisha','Manager'),(27,'062142149','wire','3','500','Malisha','Manager');
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `type` (
  `TYPE_ID` int(11) NOT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TYPE_ID` (`TYPE_ID`),
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`TYPE_ID`) REFERENCES `type` (`TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,8,'admin','e6b6afbd6d76bb5d2041542d7d2e3fac5bb05593',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'spare_parts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-29 13:42:49
