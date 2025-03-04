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
-- Table structure for table `transactiontable`
--

DROP TABLE IF EXISTS `transactiontable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontable` (
  `Transaction_id` varchar(10) NOT NULL,
  `Booking_id` varchar(10) NOT NULL,
  `Customer_id` varchar(7) DEFAULT NULL,
  `Rider_id` varchar(255) DEFAULT NULL,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pickup_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_status` enum('Pending','Paid','Failed') NOT NULL,
  PRIMARY KEY (`Transaction_id`),
  UNIQUE KEY `Booking_id` (`Booking_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Rider_id` (`Rider_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`Customer_id`) REFERENCES `customertable` (`Customer_id`) ON DELETE SET NULL,
  CONSTRAINT `transactiontable_chk_1` CHECK ((`amount_paid` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontable`
--

LOCK TABLES `transactiontable` WRITE;
/*!40000 ALTER TABLE `transactiontable` DISABLE KEYS */;
INSERT INTO `transactiontable` VALUES ('T001','B001','C-001',NULL,'2025-03-02 17:03:29','2025-03-02 17:03:00','2025-03-02 17:03:30',30.00,'Paid'),('T002','B002','C-001',NULL,'2025-03-02 17:53:14','2025-03-02 17:53:00','2025-03-02 17:53:14',30.00,'Paid'),('T003','B003','C-001','No rider assigned','2025-03-02 18:29:33','2025-03-02 18:29:00','2025-03-02 18:29:34',55.00,'Paid'),('T004','B004','C-001','No rider assigned','2025-03-03 16:52:10','2025-03-03 16:52:00','2025-03-03 16:52:11',55.00,'Paid'),('T005','B005','C-001','No rider assigned','2025-03-03 20:07:47','2025-03-03 20:07:00','2025-03-03 20:07:47',55.00,'Paid'),('T006','B006','C-014','No rider assigned','2025-03-03 20:17:55','2025-03-03 20:17:00','2025-03-03 20:17:56',35.00,'Paid');
/*!40000 ALTER TABLE `transactiontable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-04 10:05:00
