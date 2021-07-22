-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: gamenyxdb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `acquisto`
--

DROP TABLE IF EXISTS `acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acquisto` (
  `numeroOrdine` int NOT NULL AUTO_INCREMENT,
  `prezzo` decimal(6,2) NOT NULL,
  `stato` varchar(20) DEFAULT 'ordinato',
  `indirizzo` varchar(100) NOT NULL,
  `dataOrdine` date NOT NULL,
  `utente` varchar(30) DEFAULT NULL,
  `numeroCivico` int NOT NULL,
  `cap` int NOT NULL,
  `citta` varchar(100) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  PRIMARY KEY (`numeroOrdine`),
  KEY `FK_utente` (`utente`),
  CONSTRAINT `FK_utente` FOREIGN KEY (`utente`) REFERENCES `utente` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `acquisto_chk_1` CHECK ((`stato` in (_utf8mb4'ordinato',_utf8mb4'in consegna',_utf8mb4'consegnato')))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acquisto`
--

LOCK TABLES `acquisto` WRITE;
/*!40000 ALTER TABLE `acquisto` DISABLE KEYS */;
INSERT INTO `acquisto` VALUES (6,48.24,'ordinato','Ammaturo','2021-05-18','niky-hat',0,0,'',''),(7,44.77,'ordinato','Campitelli','2021-05-18','niky-hat',0,0,'',''),(9,280.86,'ordinato','','2021-07-07','Claudio',0,0,'',''),(10,107.10,'ordinato','','2021-07-07','Claudio',0,0,'',''),(11,280.86,'ordinato','','2021-07-07','Claudio',0,0,'',''),(12,335.40,'ordinato','','2021-07-07','Claudio',0,0,'',''),(13,2677.50,'ordinato','','2021-07-07','Claudio',0,0,'',''),(14,57.20,'ordinato','','2021-07-08',NULL,0,0,'',''),(15,160.65,'ordinato','','2021-07-13','Claudio',0,0,'',''),(16,334.41,'ordinato','','2021-07-15','Claudio',0,0,'',''),(17,28.73,'ordinato','via annunziata','2021-07-17','Claudio',12,84056,'Scafati','SA');
/*!40000 ALTER TABLE `acquisto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-22 20:05:50
