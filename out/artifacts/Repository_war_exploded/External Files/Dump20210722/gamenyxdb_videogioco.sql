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
  `trailer` varchar(800) NOT NULL DEFAULT 'NO-URL',
  `numeroValutazioni` int DEFAULT '0',
  `mediaValutazioni` decimal(2,1) DEFAULT '0.0',
  `iva` decimal(3,1) NOT NULL,
  `numeroVendite` int DEFAULT '0',
  `quantitaNegozio` int NOT NULL,
  `inCatalogo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `titolo` (`titolo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videogioco`
--

LOCK TABLES `videogioco` WRITE;
/*!40000 ALTER TABLE `videogioco` DISABLE KEYS */;
INSERT INTO `videogioco` VALUES (1,'Final Fantasy VIII Remastered','Versione rimasterizzata di Final Fantasy VIII','Square Enix','Ps4','Rpg','2019-09-03',45.00,'Italiano, Francese','Italiano, Inglese','No-URL',0,0.0,19.0,23,12,1),(2,'Red Dead Redemption 2','Attesissimo seguito di Red Dead Redemption','Rockstar Games','Xbox One','Azione','2018-10-26',28.99,'Inglese','Italiano','https://www.youtube.com/embed/eaW0tYpxyp0',0,0.0,15.0,43,10,1),(3,'Assassin\'s Creed 2','Il secondo capitolo della saga di Assassin\'s Creed','Ubisoft Montreal','Xbox 360','Azione','2009-11-20',10.13,'Italiano, Inglese, Francese','Italiano, Inglese, Francese','NO-URL',0,0.0,13.0,12,10,1),(14,'Dark souls Remastered','Dark Souls è un videogioco action RPG con visuale in terza persona. Il giocatore deve esplorare varie ambientazioni in stile dark fantasy e utilizzare armi, magie e strategie per sopravvivere a trappole e nemici','FromSoftware','Ps4','Rpg','2010-05-16',30.00,'Inglese','Inglese','https://www.youtube.com/embed/KfjG9ZLGBHE',0,0.0,20.0,24,60,1),(18,'Risk of rain 2','Fuggi da un caotico pianeta alieno combattendo orde di mostri infuriati - con i tuoi amici o da solo. Combina il bottino in maniere sorprendenti e padroneggia ogni personaggio finché non diventerai quel che ti faceva tremare quando sei atterrato per la prima volta','Hopoo Games','Ps4','Azione','2020-08-11',24.99,'Italiano, Inglese','Italiano, Inglese','https://www.youtube.com/embed/KbCeDprQMqM',0,0.0,15.0,50,60,1),(19,'Control','Una presenza invasiva ha occupato il Federal Bureau of Control... e solo tu puoi fermarla. Lo scenario circostante sarà la tua arma migliore in un epico scontro con un nemico minaccioso in una serie di ambientazioni profonde e imprevedibili. Il contenimento è stato violato e ora lintera umanità è in pericolo. Riuscirai a riprendere il controllo?','Remedy Entertainment','Ps4','Azione','2020-08-27',39.99,'Inglese','Inglese','https://www.youtube.com/embed/w6bE11FrSFM',0,0.0,20.0,32,90,1),(22,'Grand Theft Auto 5','Grand Theft Auto V per PC offre ai giocatori la possibilità di esplorare il pluripremiato mondo di Los Santos e Blaine County in risoluzioni fino a 4k e oltre, e di giocare a 60 frame al secondo.','Rockstar Games','Ps4','Azione','2021-07-09',32.21,'Inglese','Italiano, Inglese','https://www.youtube.com/watch?v=QkkoHAzjnUs',0,0.0,12.0,0,32,1);
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

-- Dump completed on 2021-07-22 20:05:50
