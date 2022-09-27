-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: iroom
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `alarma`
--

DROP TABLE IF EXISTS `alarma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sensorId` int NOT NULL,
  `criticidad` int NOT NULL,
  `tipo` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `texto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaActivacion` date DEFAULT NULL,
  `fechaAck` date DEFAULT NULL,
  `fechaCese` date DEFAULT NULL,
  `tipoCese` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensorId` (`sensorId`),
  CONSTRAINT `alarma_ibfk_1` FOREIGN KEY (`sensorId`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarma`
--

LOCK TABLES `alarma` WRITE;
/*!40000 ALTER TABLE `alarma` DISABLE KEYS */;
INSERT INTO `alarma` VALUES (1,1,10,'tipo 4','primera alarma','activada','2021-01-01','2021-02-01','2021-03-01','error'),(2,23,20,'tipo2','segunda alarma','activada','2021-03-01','2021-04-01','2021-05-01','error');
/*!40000 ALTER TABLE `alarma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturaImagen`
--

DROP TABLE IF EXISTS `capturaImagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capturaImagen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `tamanoX` int NOT NULL,
  `tamanoY` int NOT NULL,
  `resolucion` varchar(5) COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `parametroId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parametroId` (`parametroId`),
  CONSTRAINT `capturaImagen_ibfk_1` FOREIGN KEY (`parametroId`) REFERENCES `parametro` (`id`),
  CONSTRAINT `capturaImagen_ibfk_2` FOREIGN KEY (`parametroId`) REFERENCES `sensor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturaImagen`
--

LOCK TABLES `capturaImagen` WRITE;
/*!40000 ALTER TABLE `capturaImagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `capturaImagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capturaValor`
--

DROP TABLE IF EXISTS `capturaValor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capturaValor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` int NOT NULL,
  `sensorId` int NOT NULL,
  `fecha` date NOT NULL,
  `parametroId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensorId` (`sensorId`),
  KEY `parametroId` (`parametroId`),
  CONSTRAINT `capturaValor_ibfk_1` FOREIGN KEY (`sensorId`) REFERENCES `sensor` (`id`),
  CONSTRAINT `capturaValor_ibfk_2` FOREIGN KEY (`parametroId`) REFERENCES `parametro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capturaValor`
--

LOCK TABLES `capturaValor` WRITE;
/*!40000 ALTER TABLE `capturaValor` DISABLE KEYS */;
INSERT INTO `capturaValor` VALUES (1,2,2,'2021-11-20',2),(2,3,3,'2021-11-21',3),(3,3,23,'2021-02-01',3),(4,4,23,'2021-02-15',3),(5,5,23,'2021-03-01',3);
/*!40000 ALTER TABLE `capturaValor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriaEquipo`
--

DROP TABLE IF EXISTS `categoriaEquipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriaEquipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriaEquipo`
--

LOCK TABLES `categoriaEquipo` WRITE;
/*!40000 ALTER TABLE `categoriaEquipo` DISABLE KEYS */;
INSERT INTO `categoriaEquipo` VALUES (15,'equipo_1','equipo primero\r');
/*!40000 ALTER TABLE `categoriaEquipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concentrador`
--

DROP TABLE IF EXISTS `concentrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `concentrador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `clave_externa` int NOT NULL,
  `gisLatitud` int NOT NULL,
  `gisLongitud` int NOT NULL,
  `macAddress` varchar(17) COLLATE utf8_spanish_ci NOT NULL,
  `numeroSerie` int NOT NULL,
  `categoriaEqId` int NOT NULL,
  `ipAddress` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `ipPort` int NOT NULL,
  `accessURL` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriaEqId` (`categoriaEqId`),
  CONSTRAINT `concentrador_ibfk_1` FOREIGN KEY (`categoriaEqId`) REFERENCES `categoriaEquipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concentrador`
--

LOCK TABLES `concentrador` WRITE;
/*!40000 ALTER TABLE `concentrador` DISABLE KEYS */;
INSERT INTO `concentrador` VALUES (2,'concentrador_1','primer concentrador',2,30,20,'00:0c:29:7f:af:ee',234,1,'127.0.0.0',80,'https:/hola');
/*!40000 ALTER TABLE `concentrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoriaEqId` int NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `periodicidad` int NOT NULL,
  `unidades` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `umbralUp1` int NOT NULL,
  `umbralUp2` int NOT NULL,
  `umbralUp3` int NOT NULL,
  `umbralUp4` int NOT NULL,
  `umbralDown1` int NOT NULL,
  `umbralDown2` int NOT NULL,
  `umbralDown3` int NOT NULL,
  `umbralDown4` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoriaEqId` (`categoriaEqId`),
  CONSTRAINT `parametro_ibfk_1` FOREIGN KEY (`categoriaEqId`) REFERENCES `categoriaEquipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
INSERT INTO `parametro` VALUES (3,1,'parametro_1','primer parametro',1,'uds',10,20,30,40,1,2,3,4);
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `clave_externa` int NOT NULL,
  `gisLatitud` int NOT NULL,
  `gisLongitud` int NOT NULL,
  `num` int NOT NULL,
  `macAddress` varchar(17) COLLATE utf8_spanish_ci NOT NULL,
  `numeroSerie` int NOT NULL,
  `concentradorId` int NOT NULL,
  `categoriaEqId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `concentradorId` (`concentradorId`),
  KEY `categoriaEqId` (`categoriaEqId`),
  CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`concentradorId`) REFERENCES `concentrador` (`id`),
  CONSTRAINT `sensor_ibfk_2` FOREIGN KEY (`categoriaEqId`) REFERENCES `categoriaEquipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (23,'sensor_1','primer sensor',23,20,30,1,'12:1a:3f:f1:4c:c6',345,1,1);
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 21:15:07
