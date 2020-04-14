-- MySQL dump 10.13  Distrib 8.0.17, for Linux (x86_64)
--
-- Host: localhost    Database: supermercado
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caixer`
--

DROP TABLE IF EXISTS `caixer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caixer` (
  `id_caixer` int(5) NOT NULL AUTO_INCREMENT,
  `dni_client` varchar(9) NOT NULL,
  `nom_caixer` varchar(15) NOT NULL,
  `cognom_caixer` varchar(15) NOT NULL,
  `ntelef_caixer` varchar(9) NOT NULL,
  PRIMARY KEY (`id_caixer`),
  KEY `dni_client` (`dni_client`),
  CONSTRAINT `caixer_ibfk_1` FOREIGN KEY (`dni_client`) REFERENCES `clients` (`dni_client`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixer`
--

LOCK TABLES `caixer` WRITE;
/*!40000 ALTER TABLE `caixer` DISABLE KEYS */;
INSERT INTO `caixer` VALUES (23,'12366677E','Lluc','Avellan','932541525'),(34,'11363547X','Pau','Barber','938742595'),(54,'14366677W','Fran','Català','932457825'),(123,'12366677Z','Roser','Avellan','934524565');
/*!40000 ALTER TABLE `caixer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `dni_client` varchar(9) NOT NULL,
  `nom_client` varchar(15) NOT NULL,
  `cognom_cli` varchar(15) NOT NULL,
  `ntelf_cli` varchar(9) NOT NULL,
  `tipus_client` varchar(15) NOT NULL,
  PRIMARY KEY (`dni_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES ('11363547X','Pau','Barber','938742595','Normal'),('12366677E','Lluc','Avellan','932541525','Preferent'),('12366677Z','Roser','Avellan','934524565','Normal'),('14366677W','Fran','Català','932457825','Normal'),('25366677S','David','Campos','934152545','Preferent');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` bigint(20) NOT NULL AUTO_INCREMENT,
  `dni_client` varchar(9) NOT NULL,
  `data_compra` datetime NOT NULL,
  `id_Caixer` int(5) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `dni_client` (`dni_client`),
  KEY `id_Caixer` (`id_Caixer`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`dni_client`) REFERENCES `clients` (`dni_client`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`id_Caixer`) REFERENCES `caixer` (`id_caixer`)
) ENGINE=InnoDB AUTO_INCREMENT=3456433534340 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (3456433534333,'25366677S','2008-12-12 14:45:00',123),(3456433534334,'25366677S','2008-12-12 14:50:00',54),(3456433534335,'14366677W','2008-12-12 16:55:00',54),(3456433534336,'11363547X','2008-12-13 17:45:00',123),(3456433534337,'12366677E','2008-12-13 17:46:00',54),(3456433534338,'12366677Z','2008-12-13 13:00:00',123),(3456433534339,'12366677Z','2008-12-13 13:50:00',123);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linia_compra`
--

DROP TABLE IF EXISTS `linia_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linia_compra` (
  `id_compra` bigint(20) NOT NULL,
  `id_linia` int(10) NOT NULL,
  `id_producte` int(5) NOT NULL AUTO_INCREMENT,
  `unitats_compra` int(5) NOT NULL,
  `total_linia` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_compra`,`id_linia`),
  KEY `id_producte` (`id_producte`),
  CONSTRAINT `linia_compra_ibfk_1` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `linia_compra_ibfk_2` FOREIGN KEY (`id_producte`) REFERENCES `productes` (`id_producte`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linia_compra`
--

LOCK TABLES `linia_compra` WRITE;
/*!40000 ALTER TABLE `linia_compra` DISABLE KEYS */;
INSERT INTO `linia_compra` VALUES (3456433534333,1,2,2,' '),(3456433534333,2,3,1,' '),(3456433534333,3,4,2,' '),(3456433534334,1,1,1,' '),(3456433534335,1,1,2,' '),(3456433534336,1,3,1,' '),(3456433534337,1,3,2,' '),(3456433534337,2,2,1,' '),(3456433534337,3,4,2,' '),(3456433534337,4,6,2,' '),(3456433534338,1,7,1,' ');
/*!40000 ALTER TABLE `linia_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productes`
--

DROP TABLE IF EXISTS `productes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productes` (
  `id_producte` int(5) NOT NULL AUTO_INCREMENT,
  `precio` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_producte`,`precio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productes`
--

LOCK TABLES `productes` WRITE;
/*!40000 ALTER TABLE `productes` DISABLE KEYS */;
INSERT INTO `productes` VALUES (1,'2500'),(1,'4000'),(2,'1000'),(2,'9000'),(3,'1500'),(3,'2000'),(3,'7500'),(4,'2700'),(4,'5000'),(6,'3000'),(7,'5600');
/*!40000 ALTER TABLE `productes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-15 14:16:59
