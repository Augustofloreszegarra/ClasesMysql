-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: mi_bd
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int NOT NULL,
  `salario` decimal(10,2) DEFAULT '0.00',
  `correo_electronico` varchar(255) GENERATED ALWAYS AS (concat(`nombre`,`apellido`,_utf8mb4'@mail.com')) STORED,
  `fecha_contratacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `departamento_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_departamento` (`departamento_id`),
  CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` (`id`, `nombre`, `apellido`, `edad`, `salario`, `fecha_contratacion`, `departamento_id`) VALUES (1,'Ana','Rodríguez',28,3707.55,'2024-09-18 01:03:56',1),(2,'Carlos','López',32,3360.53,'2024-09-18 01:03:56',3),(4,'Martín','González',30,3255.26,'2024-09-18 01:03:56',2),(5,'Luis','Fernández',28,3145.80,'2024-09-18 01:03:56',1),(6,'Marta','Ramírez',32,3317.00,'2024-09-18 01:03:56',1),(7,'Lorena','Guzmán',26,2600.00,'2024-09-18 01:03:56',1),(8,'Laura','Sánchez',27,3300.00,'2024-09-18 01:08:22',1),(9,'Javier','Pérez',29,3100.00,'2024-09-18 01:08:22',1),(10,'Camila','Gómez',26,3000.00,'2024-09-18 01:08:22',1),(11,'Lucas','Fernández',28,3200.00,'2024-09-18 01:08:22',1),(12,'Valentina','Rodríguez',30,3500.00,'2024-09-18 01:08:22',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-18 14:00:12
