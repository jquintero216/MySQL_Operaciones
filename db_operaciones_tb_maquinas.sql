-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_operaciones
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `tb_maquinas`
--

DROP TABLE IF EXISTS `tb_maquinas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_maquinas` (
  `maquinas_id` int(11) NOT NULL AUTO_INCREMENT,
  `maquinas_desc` varchar(45) NOT NULL,
  `maquinas_cod` varchar(45) DEFAULT NULL,
  `plantas_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`maquinas_id`),
  KEY `FK_REFERENCE_10` (`plantas_id`),
  CONSTRAINT `FK_REFERENCE_10` FOREIGN KEY (`plantas_id`) REFERENCES `tb_plantas` (`plantas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_maquinas`
--

LOCK TABLES `tb_maquinas` WRITE;
/*!40000 ALTER TABLE `tb_maquinas` DISABLE KEYS */;
INSERT INTO `tb_maquinas` VALUES (1,'Centrifuga 1','CF01',4),(2,'Centrifuga 2','CF02',5),(3,'Ciclon 1200W','XL01',1),(4,'Horno 1500W','FC01',1),(5,'Chimenea 1','ZT02',1),(6,'Chimenea 2','ZT03',1),(7,'Decantador 1','DK09',4),(8,'Decantador 2','DK10',4),(9,'Decantador 3','DK11',5),(10,'Decantador 4','DK08',5);
/*!40000 ALTER TABLE `tb_maquinas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-02 11:16:13
