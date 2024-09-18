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
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `cliente_id` int DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `monto_total` decimal(10,2) GENERATED ALWAYS AS ((`cantidad` * `precio_unitario`)) STORED,
  `empleado_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_id` (`producto_id`),
  KEY `fk_cliente_id` (`cliente_id`),
  KEY `fk_empleado_id` (`empleado_id`),
  CONSTRAINT `fk_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  CONSTRAINT `fk_empleado_id` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `fk_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` (`id`, `producto_id`, `cliente_id`, `cantidad`, `precio_unitario`, `empleado_id`) VALUES (1,1,1,2,1200.00,1),(2,1,1,2,1350.00,1),(3,2,2,3,480.00,2),(4,4,4,1,280.00,6),(5,1,3,1,1350.00,2),(6,3,1,2,350.00,5),(7,2,2,1,480.00,6),(8,4,4,2,280.00,7),(59,1,6,3,1350.00,1),(60,5,8,5,420.00,9),(61,10,2,2,800.00,6),(62,14,7,1,200.00,5),(63,20,4,4,20.00,6),(64,4,5,5,280.00,1),(65,9,5,3,550.00,1),(66,13,3,4,150.00,5),(67,19,6,2,40.00,1),(68,2,9,5,480.00,1),(69,3,9,1,350.00,1),(70,6,7,4,1200.00,1),(71,7,6,3,80.00,1),(72,12,9,5,70.00,1),(73,16,8,2,350.00,6),(74,23,9,4,180.00,1),(75,18,4,3,100.00,7),(76,11,3,2,120.00,5),(77,15,5,4,250.00,6),(78,8,8,1,120.00,7),(79,17,3,2,30.00,5),(80,21,9,5,500.00,6),(81,22,2,3,70.00,6),(82,24,9,2,180.00,1),(83,5,1,2,1350.00,1),(84,9,6,4,550.00,9),(85,13,8,3,150.00,7),(86,3,1,5,350.00,1),(87,18,9,1,100.00,6),(88,10,5,2,800.00,1),(89,7,4,3,80.00,6),(90,2,5,1,480.00,6),(91,8,7,4,120.00,7),(92,1,3,5,1350.00,5),(93,4,6,2,280.00,5),(94,12,1,1,70.00,1),(95,19,4,3,40.00,6),(96,15,3,4,250.00,5),(97,6,8,2,1200.00,7),(98,11,2,3,120.00,5);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
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
