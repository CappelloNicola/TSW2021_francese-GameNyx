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
-- Table structure for table `videogioco`
--

DROP TABLE IF EXISTS `videogioco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videogioco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(150) NOT NULL,
  `descrizione` varchar(800) NOT NULL,
  `casaProduttrice` varchar(100) NOT NULL,
  `piattaforma` varchar(100) NOT NULL,
  `genere` varchar(50) NOT NULL,
  `dataPubblicazione` date NOT NULL,
  `prezzo` decimal(5,2) NOT NULL,
  `lingua` varchar(100) NOT NULL,
  `sottotitoli` varchar(100) DEFAULT 'Non presenti',
  `numeroValutazioni` int DEFAULT '0',
  `mediaValutazioni` decimal(2,1) DEFAULT '0.0',
  `iva` decimal(3,1) NOT NULL,
  `numeroVendite` int DEFAULT '0',
  `quantitaNegozio` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titolo` (`titolo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogioco`
--

LOCK TABLES `videogioco` WRITE;
/*!40000 ALTER TABLE `videogioco` DISABLE KEYS */;
INSERT INTO `videogioco` VALUES (1,'Final Fantasy VIII Remastered','Versione rimasterizzata di Final Fantasy VIII','Square Enix','Ps4','Rpg','2019-09-03',20.98,'Italiano','Italiano',0,0.0,15.0,0,10),(2,'Red Dead Redemption 2','Attesissimo seguito di Red Dead Redemption','Rockstar Games','Xbox One','Azione','2018-10-26',28.99,'Inglese','Italiano',0,0.0,15.0,0,10),(3,'Assassin\'s Creed 2','Il secondo capitolo della saga di Assassin\'s Creed','Ubisoft Montreal','Xbox 360','Azione','2009-11-20',10.13,'Italiano, Inglese','Italiano, Inglese',0,0.0,13.0,0,10),(4,'The Last of Us','Capolavoro per Ps3','Naughty Dog','Ps3','Azione','2021-06-17',20.00,'italiano, inglese','Italiano, Inglese',0,0.0,13.0,0,10);
/*!40000 ALTER TABLE `videogioco` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-22 10:41:04
