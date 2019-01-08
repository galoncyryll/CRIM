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
-- Table structure for table `patient_records`
--

DROP TABLE IF EXISTS `patient_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_records` (
  `patient_number` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(45) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `mi` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `birthdate` varchar(45) NOT NULL,
  `age` varchar(45) NOT NULL,
  `contact` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`patient_number`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_records`
--

LOCK TABLES `patient_records` WRITE;
/*!40000 ALTER TABLE `patient_records` DISABLE KEYS */;
INSERT INTO `patient_records` VALUES (1,'Reyes','Kort','A','Male','09/27/1996','22','0927123123','Makati'),(10,'Prochina','Daniel Jericho','o','Male','01/17/1996','22','09178462691','Blk 50 Lot 6 Bayabas St Rizal Makati City'),(11,'Bondoc','Karl Kenzo','Cruz','Male','01/17/1996','22','09273474881','Taguig City'),(12,'Roa','Wahu','C','Male','03/23/1996','20','09151326994','Taguig City'),(14,'Han','Ben','A','Male','09/22/1989','17','09275771234','Makati'),(15,'James','Lebron','K','Male','12/25/1989','27','09275776321','Cavaliers'),(16,'Bryant','Kobe','S','Male','04/12/1898','34','0912321456','Los Angeles'),(17,'Bondoc','Karl Kenzo','Cruz','Male','01/17/1996','22','09273474881','Taguig City'),(18,'Prochina','Daniel Jericho','B','Male','01/17/1996','20','09178462691','Blk 50 Lot 6 Bayabas St Rizal Makati City'),(19,'Reyes','Kort','A','Male','09/27/1996','20','0927123123','Makati'),(20,'Reyes','Kort','A','Male','09/27/1996','20','0927123123','Makati'),(24,'','','','','','','',''),(25,'','','','','','','','');
/*!40000 ALTER TABLE `patient_records` ENABLE KEYS */;
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
