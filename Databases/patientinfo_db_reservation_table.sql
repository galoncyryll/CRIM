-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: patientinfo_db
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `reservation_table`
--

DROP TABLE IF EXISTS `reservation_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_table` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `reserve_date` date DEFAULT NULL,
  `seat_name` varchar(45) DEFAULT NULL,
  `reserve_time` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_table`
--

LOCK TABLES `reservation_table` WRITE;
/*!40000 ALTER TABLE `reservation_table` DISABLE KEYS */;
INSERT INTO `reservation_table` VALUES (1,'13-10359','2017-02-04','Module 1','07:00-08:00','ACTIVE'),(2,'13-10359','2017-02-04','Module 2','08:00-09:00','ACTIVE'),(6,'13-10357','2017-02-04','Module 1','09:00-10:00','ACTIVE'),(11,'13-10355','2017-02-09','Module 2','08:00-09:00','ACTIVE'),(21,'admin','2017-02-04','Module 1','08:00-09:00','ACTIVE'),(25,'13-10359','2017-02-14','Module 1','07:00-08:00','ACTIVE'),(27,'admin2','2017-02-15','Module 2','07:00-08:00','ACTIVE'),(28,'admin2','2017-02-15','Module 1','08:00-09:00','ACTIVE'),(29,'admin','2017-02-15','Module 1','08:00-09:00','ACTIVE'),(31,'admin2','2017-02-15','Module 1','09:00-10:00','ACTIVE'),(32,'admin','2017-03-24','Module 2','08:00-09:00','ACTIVE'),(33,'admin','2017-03-14','Module 6','11:00-12:00','ACTIVE'),(34,'admin','2017-03-01','Module 4','09:00-10:00','ACTIVE'),(35,'admin','2017-03-01','Module 2','07:00-08:00','ACTIVE');
/*!40000 ALTER TABLE `reservation_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-16 10:58:57
