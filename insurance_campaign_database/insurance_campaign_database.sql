-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campanha_seguros
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `acidente`
--

DROP TABLE IF EXISTS `acidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acidente` (
  `id_acidente` int NOT NULL,
  `data_acidente` date DEFAULT NULL,
  `local_acidente` varchar(60) NOT NULL,
  `obs` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_acidente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acidente`
--

LOCK TABLES `acidente` WRITE;
/*!40000 ALTER TABLE `acidente` DISABLE KEYS */;
INSERT INTO `acidente` VALUES (101,'2023-01-24','rua do acidente1','grave'),(102,'2023-01-12','rua do acidente2','leve'),(103,'2022-12-25','rua do acidente3','gravissimo'),(104,'2022-12-13','rua do acidente4','medio'),(105,'2020-11-22','rua do acidente5','medio'),(106,'2023-01-22','rua do acidente6','leve'),(107,'2023-12-22','rua do acidente7','gravissimo'),(108,'2022-11-15','rua do acidente8','leve'),(109,'2022-11-14','rua do acidente9','grave'),(110,'2022-11-14','rua do acidente7','leve');
/*!40000 ALTER TABLE `acidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `id_carro` int NOT NULL,
  `marca` varchar(60) NOT NULL,
  `cor` varchar(40) NOT NULL,
  `modelo` varchar(60) NOT NULL,
  `placa` varchar(60) NOT NULL,
  `cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_carro`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `carro_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (12,'volkswagen','preto','suv','bra-3r52',1),(13,'fiat','prata','compacto','ice-2973',3),(14,'ford','vermelho','esportivo','bfq-8663',2),(15,'volvo','branco','hatch','pec-2013',5),(16,'audi','branco-gelo','sedan','hmg-8693',4),(17,'jeep','preto','suv','jsq-7463',6),(18,'mercedez-benz','azul','esportivo','for-1904',8),(19,'kia','prata','suv','jdr-0312',7),(20,'hyundai','branco','sedan','jjk-1960',10),(21,'subaru','branco','sedan','lpt-4625',9);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carros_sofrem_acidentes`
--

DROP TABLE IF EXISTS `carros_sofrem_acidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carros_sofrem_acidentes` (
  `id_carro` int NOT NULL,
  `id_acidente` int NOT NULL,
  PRIMARY KEY (`id_carro`,`id_acidente`),
  KEY `id_acidente` (`id_acidente`),
  CONSTRAINT `carros_sofrem_acidentes_ibfk_1` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id_carro`) ON DELETE CASCADE,
  CONSTRAINT `carros_sofrem_acidentes_ibfk_2` FOREIGN KEY (`id_acidente`) REFERENCES `acidente` (`id_acidente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carros_sofrem_acidentes`
--

LOCK TABLES `carros_sofrem_acidentes` WRITE;
/*!40000 ALTER TABLE `carros_sofrem_acidentes` DISABLE KEYS */;
INSERT INTO `carros_sofrem_acidentes` VALUES (14,101),(19,101),(12,102),(14,103),(15,103),(13,104),(20,104),(16,105),(17,106),(17,107),(18,107),(19,108),(21,109),(20,110);
/*!40000 ALTER TABLE `carros_sofrem_acidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL,
  `nome` varchar(40) NOT NULL,
  `cpf` varchar(60) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'José','78526986332','+5571975863052'),(2,'Maria','78526977332','+5571972263052'),(3,'Carlos','78526986112','+5571695863052'),(4,'João','78526989732','+5571975863632'),(5,'Luiz','78526984872','+5571977853052'),(6,'Vanessa','78574986332','+5571975862552'),(7,'Tereza','78566986332','+5571972863052'),(8,'Vânia','78578986332','+5571941863052'),(9,'Marcela','78588986332','+5571975563052'),(10,'Thiago','78536986332','+5571975743052');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'campanha_seguros'
--

--
-- Dumping routines for database 'campanha_seguros'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-15 11:13:57
