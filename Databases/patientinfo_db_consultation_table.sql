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
-- Table structure for table `consultation_table`
--

DROP TABLE IF EXISTS `consultation_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultation_table` (
  `consultation_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(45) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `tooth_number` varchar(45) NOT NULL,
  `disorder` varchar(45) DEFAULT NULL,
  `treatment` varchar(45) DEFAULT NULL,
  `prescriptions` longtext,
  `remarks` longtext,
  PRIMARY KEY (`consultation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation_table`
--

LOCK TABLES `consultation_table` WRITE;
/*!40000 ALTER TABLE `consultation_table` DISABLE KEYS */;
INSERT INTO `consultation_table` VALUES (61,'13-10359',10,'Prochina','Daniel Jericho','tooth11','disorder2','treatment1','meds meds',''),(62,'13-10359',10,'Prochina','Daniel Jericho','tooth14','disorder4','treatment4','med3 ','rem2'),(63,'admin',12,'Roa','Wahu','tooth25','disorder2','treatment4','','Rest'),(64,'admin',12,'Roa','Wahu','tooth32','disorder3','treatment5','PR','Water'),(65,'13-10359',15,'James','Lebron','tooth26','disorder4','treatment2','',''),(66,'admin',15,'James','Lebron','tooth3','disorder5','treatment4','',''),(67,'admin2',15,'James','Lebron','tooth18','disorder4','treatment5','',''),(68,'13-10359',1,'Reyes','Kort','tooth26','disorder4','treatment2','',''),(69,'admin2',10,'Prochina','Daniel Jericho','tooth7','disorder3','treatment3','',''),(70,'Prochina',61,'13-10359','10','tooth26','disorder4','treatment2','',''),(71,'13-10359',19,'Reyes','Kort','tooth26','disorder1','treatment1','',''),(72,'admin2',11,'Bondoc','Karl Kenzo','tooth7','disorder2','treatment1','sda','dad'),(73,'admin',16,'Bryant','Kobe','tooth9','disorder1','treatment1','',''),(74,'admin',16,'Bryant','Kobe','tooth9','disorder1','treatment1','','');
/*!40000 ALTER TABLE `consultation_table` ENABLE KEYS */;
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
