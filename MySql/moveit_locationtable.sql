-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: moveit
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `locationtable`
--

DROP TABLE IF EXISTS `locationtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locationtable` (
  `Customer_id` varchar(7) NOT NULL,
  `City` varchar(25) NOT NULL,
  `Zip` int NOT NULL,
  `Street` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  CONSTRAINT `locationtable_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customertable` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationtable`
--

LOCK TABLES `locationtable` WRITE;
/*!40000 ALTER TABLE `locationtable` DISABLE KEYS */;
INSERT INTO `locationtable` VALUES ('C-001','Las Pinas',1700,'Villanueva St.'),('C-004','San Jose Del Monte City',3023,'realonda st.'),('C-005','Las Pinas City',1700,'Manuyo Dos'),('C-006','Infanta City',2000,'Infanta st.'),('C-007','Paranaque City',1700,'H. Rodriguez'),('C-008','Calapan City',5200,'Managpi'),('C-009','Las Pinas City',1700,'Villanueva St.'),('C-010','Calapan City',5200,'Managpi, Ilaya'),('C-012','Calapan City',5200,'Ilaya'),('C-013','Paranaque City',1700,'tagadongalo st.'),('C-014','Las Pinas',1700,'Villanueva St.'),('C-015','Las Pinas City',1700,'mangahan st.');
/*!40000 ALTER TABLE `locationtable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-04 10:05:01
