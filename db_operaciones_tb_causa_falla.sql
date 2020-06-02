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
-- Table structure for table `tb_causa_falla`
--

DROP TABLE IF EXISTS `tb_causa_falla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_causa_falla` (
  `causa_falla_id` int(11) NOT NULL AUTO_INCREMENT,
  `causa_falla_desc` varchar(45) NOT NULL,
  `causa_falla_cod` varchar(45) NOT NULL,
  `caterogia_falla_id` int(11) NOT NULL,
  PRIMARY KEY (`causa_falla_id`),
  KEY `FK_REFERENCE_4` (`caterogia_falla_id`),
  CONSTRAINT `FK_REFERENCE_4` FOREIGN KEY (`caterogia_falla_id`) REFERENCES `tb_categoria_falla` (`caterogia_falla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_causa_falla`
--

LOCK TABLES `tb_causa_falla` WRITE;
/*!40000 ALTER TABLE `tb_causa_falla` DISABLE KEYS */;
INSERT INTO `tb_causa_falla` VALUES (1,'Corto MCB','CF001',2),(2,'Falla fase MCC','CF002',2),(3,'Ajuste','CF003',1),(4,'Lubricacion','CF004',1),(5,'Mala operacion','CF005',3),(6,'Alta vibracion','CF006',1),(7,'ESD','CF007',2),(8,'Sin aire para instrumento','CF008',4),(9,'Instrumento fuera de rango','CF009',4);
/*!40000 ALTER TABLE `tb_causa_falla` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-02 11:16:12
