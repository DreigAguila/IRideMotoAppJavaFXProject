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
-- Table structure for table `contacttable`
--

DROP TABLE IF EXISTS `contacttable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacttable` (
  `Customer_id` varchar(7) NOT NULL,
  `ContactNum` varchar(15) NOT NULL,
  `Email` varchar(40) NOT NULL,
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `unique_contact_number` (`ContactNum`),
  CONSTRAINT `contacttable_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customertable` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacttable`
--

LOCK TABLES `contacttable` WRITE;
/*!40000 ALTER TABLE `contacttable` DISABLE KEYS */;
INSERT INTO `contacttable` VALUES ('C-001','09957900057','dreig@gmail.com'),('C-002','09451234567','elizer@gmail.com'),('C-003','09478451548','jabezdiaz@gmail.com'),('C-005','09264561542','ronen@gmail.com'),('C-007','09451234569','tyrone@gmail.com'),('C-008','09789876541','lance@gmail.com'),('C-009','09874895876','barrera@gmail.com'),('C-010','09345897821','johnronen@gmail.com');
/*!40000 ALTER TABLE `contacttable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customertable`
--

DROP TABLE IF EXISTS `customertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customertable` (
  `Customer_id` varchar(7) NOT NULL,
  `CustomerFullName` varchar(50) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertable`
--

LOCK TABLES `customertable` WRITE;
/*!40000 ALTER TABLE `customertable` DISABLE KEYS */;
INSERT INTO `customertable` VALUES ('C-001','Dreig Rashid Aguila','wallace'),('C-002','Elizer Ponio Jr.','courseproject'),('C-003','Jabez Diaz','diazfamily'),('C-004','Ronen Pano','ronenkenneth'),('C-005','Ronen Pano','ronenkenneth'),('C-006','Tyrone Pascual','lessandra'),('C-007','Tyrone Pascual','lessandra'),('C-008','Lance Dela Paz','lancekenneth'),('C-009','JM Barrera','passworod'),('C-010','John Ronen','ronenpano');
/*!40000 ALTER TABLE `customertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare_matrix`
--

DROP TABLE IF EXISTS `fare_matrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare_matrix` (
  `origin` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `fare` decimal(5,2) DEFAULT NULL,
  `distance_km` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`origin`,`destination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare_matrix`
--

LOCK TABLES `fare_matrix` WRITE;
/*!40000 ALTER TABLE `fare_matrix` DISABLE KEYS */;
INSERT INTO `fare_matrix` VALUES ('Caloocan','Caloocan',30.00,0.00),('Caloocan','Las Piñas',415.00,28.00),('Caloocan','Makati',235.00,18.00),('Caloocan','Malabon',110.00,8.00),('Caloocan','Mandaluyong',220.00,17.00),('Caloocan','Manila',190.00,15.00),('Caloocan','Marikina',250.00,18.00),('Caloocan','Muntinlupa',445.00,30.00),('Caloocan','Navotas',125.00,9.00),('Caloocan','Parañaque',370.00,25.00),('Caloocan','Pasay',250.00,19.00),('Caloocan','Pasig',280.00,20.00),('Caloocan','Pateros',280.00,21.00),('Caloocan','Quezon City',160.00,12.00),('Caloocan','San Juan',205.00,16.00),('Caloocan','Taguig',295.00,22.00),('Caloocan','Valenzuela',127.50,10.50),('Las Piñas','Caloocan',490.00,28.00),('Las Piñas','Las Piñas',30.00,0.00),('Las Piñas','Makati',350.00,20.00),('Las Piñas','Malabon',625.00,37.00),('Las Piñas','Mandaluyong',350.00,20.00),('Las Piñas','Manila',410.00,25.00),('Las Piñas','Marikina',410.00,25.00),('Las Piñas','Muntinlupa',130.00,8.00),('Las Piñas','Navotas',530.00,30.00),('Las Piñas','Parañaque',105.00,7.00),('Las Piñas','Pasay',275.00,15.00),('Las Piñas','Pasig',380.00,22.00),('Las Piñas','Pateros',305.00,17.00),('Las Piñas','Quezon City',490.00,28.00),('Las Piñas','San Juan',350.00,20.00),('Las Piñas','Taguig',275.00,15.00),('Las Piñas','Valenzuela',535.00,30.00),('Makati','Caloocan',275.00,18.00),('Makati','Las Piñas',305.00,20.00),('Makati','Makati',30.00,0.00),('Makati','Malabon',305.00,19.00),('Makati','Mandaluyong',150.00,10.00),('Makati','Manila',245.00,16.00),('Makati','Marikina',215.00,15.00),('Makati','Muntinlupa',365.00,25.00),('Makati','Navotas',365.00,23.00),('Makati','Parañaque',185.00,12.00),('Makati','Pasay',150.00,10.00),('Makati','Pasig',185.00,12.00),('Makati','Pateros',150.00,10.00),('Makati','Quezon City',245.00,16.00),('Makati','San Juan',185.00,12.00),('Makati','Taguig',90.00,8.00),('Makati','Valenzuela',305.00,20.00),('Malabon','Caloocan',115.00,8.00),('Malabon','Las Piñas',320.00,22.00),('Malabon','Makati',260.00,18.00),('Malabon','Malabon',30.00,0.00),('Malabon','Mandaluyong',230.00,16.00),('Malabon','Manila',180.00,12.00),('Malabon','Marikina',230.00,16.00),('Malabon','Muntinlupa',365.00,25.00),('Malabon','Navotas',90.00,6.00),('Malabon','Parañaque',290.00,20.00),('Malabon','Pasay',275.00,19.00),('Malabon','Pasig',260.00,18.00),('Malabon','Quezon City',140.00,10.00),('Malabon','San Juan',215.00,15.00),('Malabon','Taguig',290.00,20.00),('Malabon','Valenzuela',122.50,8.50),('Mandaluyong','Caloocan',260.00,17.00),('Mandaluyong','Las Piñas',290.00,20.00),('Mandaluyong','Makati',150.00,10.00),('Mandaluyong','Malabon',230.00,15.00),('Mandaluyong','Mandaluyong',30.00,0.00),('Mandaluyong','Manila',200.00,15.00),('Mandaluyong','Marikina',140.00,11.00),('Mandaluyong','Muntinlupa',365.00,25.00),('Mandaluyong','Navotas',305.00,19.00),('Mandaluyong','Parañaque',260.00,18.00),('Mandaluyong','Pasay',200.00,15.00),('Mandaluyong','Pasig',90.00,8.00),('Mandaluyong','Pateros',155.00,12.00),('Mandaluyong','Quezon City',170.00,13.00),('Mandaluyong','San Juan',75.00,5.00),('Mandaluyong','Taguig',170.00,13.00),('Mandaluyong','Valenzuela',290.00,19.00),('Manila','Caloocan',200.00,15.00),('Manila','Las Piñas',350.00,25.00),('Manila','Makati',215.00,16.00),('Manila','Malabon',170.00,12.00),('Manila','Mandaluyong',200.00,15.00),('Manila','Manila',30.00,0.00),('Manila','Marikina',245.00,18.00),('Manila','Muntinlupa',395.00,28.00),('Manila','Navotas',185.00,13.00),('Manila','Parañaque',275.00,20.00),('Manila','Pasay',127.50,10.00),('Manila','Pasig',275.00,20.00),('Manila','Pateros',230.00,17.00),('Manila','Quezon City',200.00,14.00),('Manila','San Juan',127.50,10.00),('Manila','Taguig',245.00,18.00),('Manila','Valenzuela',215.00,16.00),('Marikina','Caloocan',275.00,18.00),('Marikina','Las Piñas',395.00,25.00),('Marikina','Makati',215.00,15.00),('Marikina','Malabon',305.00,20.00),('Marikina','Mandaluyong',142.50,11.00),('Marikina','Manila',275.00,18.00),('Marikina','Marikina',30.00,0.00),('Marikina','Muntinlupa',440.00,28.00),('Marikina','Navotas',350.00,23.00),('Marikina','Parañaque',350.00,22.00),('Marikina','Pasay',305.00,20.00),('Marikina','Pasig',115.00,8.00),('Marikina','Pateros',215.00,16.00),('Marikina','Quezon City',170.00,12.00),('Marikina','San Juan',127.50,10.00),('Marikina','Taguig',230.00,17.00),('Marikina','Valenzuela',305.00,20.00),('Muntinlupa','Caloocan',530.00,30.00),('Muntinlupa','Las Piñas',105.00,8.00),('Muntinlupa','Makati',425.00,25.00),('Muntinlupa','Malabon',635.00,39.00),('Muntinlupa','Mandaluyong',425.00,25.00),('Muntinlupa','Manila',485.00,28.00),('Muntinlupa','Marikina',485.00,28.00),('Muntinlupa','Muntinlupa',30.00,0.00),('Muntinlupa','Navotas',620.00,38.00),('Muntinlupa','Parañaque',130.00,10.00),('Muntinlupa','Pasay',350.00,20.00),('Muntinlupa','Pasig',425.00,25.00),('Muntinlupa','Pateros',350.00,20.00),('Muntinlupa','Quezon City',530.00,30.00),('Muntinlupa','San Juan',425.00,25.00),('Muntinlupa','Taguig',320.00,18.00),('Muntinlupa','Valenzuela',565.00,32.00),('Navotas','Caloocan',115.00,9.00),('Navotas','Las Piñas',505.00,35.00),('Navotas','Makati',325.00,22.00),('Navotas','Malabon',80.00,6.00),('Navotas','Mandaluyong',235.00,17.00),('Navotas','Manila',190.00,13.00),('Navotas','Marikina',340.00,23.00),('Navotas','Muntinlupa',535.00,37.00),('Navotas','Navotas',30.00,0.00),('Navotas','Parañaque',460.00,32.00),('Navotas','Pasay',265.00,19.00),('Navotas','Pasig',355.00,24.00),('Navotas','Pateros',370.00,25.00),('Navotas','Quezon City',325.00,22.00),('Navotas','San Juan',250.00,18.00),('Navotas','Taguig',385.00,26.00),('Navotas','Valenzuela',122.50,9.50),('Parañaque','Caloocan',430.00,25.00),('Parañaque','Las Piñas',105.00,7.00),('Parañaque','Makati',180.00,12.00),('Parañaque','Malabon',565.00,33.00),('Parañaque','Mandaluyong',290.00,18.00),('Parañaque','Manila',350.00,20.00),('Parañaque','Marikina',395.00,22.00),('Parañaque','Muntinlupa',150.00,10.00),('Parañaque','Navotas',565.00,33.00),('Parañaque','Parañaque',30.00,0.00),('Parañaque','Pasay',130.00,8.00),('Parañaque','Pasig',350.00,20.00),('Parañaque','Pateros',265.00,15.00),('Parañaque','Quezon City',430.00,25.00),('Parañaque','San Juan',290.00,18.00),('Parañaque','Taguig',150.00,10.00),('Parañaque','Valenzuela',475.00,27.00),('Pasay','Caloocan',320.00,19.00),('Pasay','Las Piñas',245.00,15.00),('Pasay','Makati',150.00,10.00),('Pasay','Malabon',305.00,18.00),('Pasay','Mandaluyong',245.00,15.00),('Pasay','Manila',150.00,10.00),('Pasay','Marikina',305.00,20.00),('Pasay','Muntinlupa',320.00,20.00),('Pasay','Navotas',305.00,18.00),('Pasay','Parañaque',130.00,8.00),('Pasay','Pasay',30.00,0.00),('Pasay','Pasig',305.00,20.00),('Pasay','Pateros',290.00,18.00),('Pasay','Quezon City',320.00,19.00),('Pasay','San Juan',230.00,14.00),('Pasay','Taguig',180.00,12.00),('Pasay','Valenzuela',365.00,21.00),('Pasig','Caloocan',305.00,20.00),('Pasig','Las Piñas',395.00,25.00),('Pasig','Makati',170.00,12.00),('Pasig','Malabon',280.00,19.00),('Pasig','Mandaluyong',115.00,8.00),('Pasig','Manila',305.00,20.00),('Pasig','Marikina',115.00,8.00),('Pasig','Muntinlupa',440.00,28.00),('Pasig','Navotas',365.00,24.00),('Pasig','Parañaque',350.00,22.00),('Pasig','Pasay',305.00,20.00),('Pasig','Pasig',30.00,0.00),('Pasig','Pateros',115.00,8.00),('Pasig','Quezon City',215.00,15.00),('Pasig','San Juan',105.00,7.00),('Pasig','Taguig',140.00,10.00),('Pasig','Valenzuela',350.00,22.00),('Pateros','Caloocan',365.00,21.00),('Pateros','Las Piñas',290.00,17.00),('Pateros','Makati',90.00,10.00),('Pateros','Malabon',365.00,21.00),('Pateros','Mandaluyong',215.00,12.00),('Pateros','Manila',290.00,17.00),('Pateros','Marikina',275.00,16.00),('Pateros','Muntinlupa',365.00,20.00),('Pateros','Navotas',440.00,26.00),('Pateros','Parañaque',275.00,15.00),('Pateros','Pasay',320.00,18.00),('Pateros','Pasig',150.00,8.00),('Pateros','Pateros',30.00,0.00),('Pateros','Quezon City',290.00,17.00),('Pateros','San Juan',215.00,12.00),('Pateros','Taguig',90.00,8.00),('Pateros','Valenzuela',395.00,23.00),('Quezon City','Caloocan',170.00,12.00),('Quezon City','Las Piñas',395.00,28.00),('Quezon City','Makati',230.00,16.00),('Quezon City','Malabon',127.50,10.00),('Quezon City','Mandaluyong',185.00,13.00),('Quezon City','Manila',200.00,14.00),('Quezon City','Marikina',170.00,12.00),('Quezon City','Muntinlupa',440.00,30.00),('Quezon City','Navotas',142.50,11.00),('Quezon City','Parañaque',350.00,25.00),('Quezon City','Pasay',260.00,19.00),('Quezon City','Pasig',215.00,15.00),('Quezon City','Pateros',230.00,17.00),('Quezon City','Quezon City',30.00,0.00),('Quezon City','San Juan',127.50,10.00),('Quezon City','Taguig',245.00,18.00),('Quezon City','Valenzuela',200.00,14.00),('San Juan','Caloocan',275.00,16.00),('San Juan','Las Piñas',350.00,20.00),('San Juan','Makati',200.00,12.00),('San Juan','Malabon',215.00,13.00),('San Juan','Mandaluyong',75.00,5.00),('San Juan','Manila',180.00,10.00),('San Juan','Marikina',180.00,10.00),('San Juan','Muntinlupa',440.00,25.00),('San Juan','Navotas',290.00,18.00),('San Juan','Parañaque',305.00,18.00),('San Juan','Pasay',245.00,14.00),('San Juan','Pasig',105.00,7.00),('San Juan','Pateros',200.00,12.00),('San Juan','Quezon City',180.00,10.00),('San Juan','San Juan',30.00,0.00),('San Juan','Taguig',230.00,13.00),('San Juan','Valenzuela',305.00,18.00),('Taguig','Caloocan',380.00,22.00),('Taguig','Las Piñas',275.00,15.00),('Taguig','Makati',90.00,8.00),('Taguig','Malabon',440.00,24.00),('Taguig','Mandaluyong',215.00,13.00),('Taguig','Manila',320.00,18.00),('Taguig','Marikina',305.00,17.00),('Taguig','Muntinlupa',320.00,18.00),('Taguig','Navotas',500.00,28.00),('Taguig','Parañaque',150.00,10.00),('Taguig','Pasay',200.00,12.00),('Taguig','Pasig',150.00,10.00),('Taguig','Pateros',90.00,8.00),('Taguig','Quezon City',320.00,18.00),('Taguig','San Juan',215.00,13.00),('Taguig','Taguig',30.00,0.00),('Taguig','Valenzuela',410.00,24.00),('Valenzuela','Caloocan',127.50,10.50),('Valenzuela','Las Piñas',445.00,30.00),('Valenzuela','Makati',265.00,20.00),('Valenzuela','Malabon',117.50,8.50),('Valenzuela','Mandaluyong',250.00,19.00),('Valenzuela','Manila',205.00,16.00),('Valenzuela','Marikina',280.00,20.00),('Valenzuela','Muntinlupa',475.00,32.00),('Valenzuela','Navotas',132.50,9.50),('Valenzuela','Parañaque',400.00,27.00),('Valenzuela','Pasay',280.00,21.00),('Valenzuela','Pasig',310.00,22.00),('Valenzuela','Pateros',310.00,23.00),('Valenzuela','Quezon City',175.00,14.00),('Valenzuela','San Juan',235.00,18.00),('Valenzuela','Taguig',325.00,24.00),('Valenzuela','Valenzuela',30.00,0.00);
/*!40000 ALTER TABLE `fare_matrix` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `locationtable` VALUES ('C-001','Las Pinas City',1700,'Banaba St.'),('C-002','Manila',1008,'Jhocson St.'),('C-003','San Jose Del Monte',3023,'Francisco Homes'),('C-004','Manila',1008,'Prudencio St.'),('C-005','Manila',1008,'Prudencio St.'),('C-006','Bulacan',3023,'Lessandra St.'),('C-007','Bulacan',3023,'Lessandra St.'),('C-008','Marikina City',1800,'Rizal St.'),('C-009','Manila',1008,'Prudencio St.'),('C-010','Manila',1008,'Jhocson St.');
/*!40000 ALTER TABLE `locationtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `PaymentID` varchar(10) NOT NULL,
  `PaymentMethod` varchar(50) DEFAULT NULL,
  `Promo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `paymentmethod_ibfk_1` (`Promo`),
  CONSTRAINT `paymentmethod_ibfk_1` FOREIGN KEY (`Promo`) REFERENCES `promotable` (`Promo`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES ('P001','Cash',NULL),('P002','Gcash',NULL),('P003','Card','NAKASUBNAMI'),('P004','Cash',NULL),('P005','Gcash',NULL),('P006','Cash',NULL),('P007','Cash',NULL),('P008','Cash',NULL),('P009','Cash',NULL),('P010','Card',NULL),('P011','Cash',NULL),('P012','Gcash',NULL),('P013','Cash',NULL),('P014','Cash','NAKASUBNAMI'),('P015','Gcash',NULL);
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotable`
--

DROP TABLE IF EXISTS `promotable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotable` (
  `Promo` varchar(50) NOT NULL,
  `Percentage` int DEFAULT NULL,
  PRIMARY KEY (`Promo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotable`
--

LOCK TABLES `promotable` WRITE;
/*!40000 ALTER TABLE `promotable` DISABLE KEYS */;
INSERT INTO `promotable` VALUES ('LATENIGHTMI',20),('NAKASUBNAMI',50),('WEEKENDNAMI',35);
/*!40000 ALTER TABLE `promotable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riderlocationtable`
--

DROP TABLE IF EXISTS `riderlocationtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riderlocationtable` (
  `Rider_id` varchar(7) DEFAULT NULL,
  `Zip` varchar(10) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Street` varchar(50) NOT NULL,
  KEY `Rider_id` (`Rider_id`),
  CONSTRAINT `riderlocationtable_ibfk_1` FOREIGN KEY (`Rider_id`) REFERENCES `ridertable` (`Rider_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riderlocationtable`
--

LOCK TABLES `riderlocationtable` WRITE;
/*!40000 ALTER TABLE `riderlocationtable` DISABLE KEYS */;
INSERT INTO `riderlocationtable` VALUES ('R-001','1008','Manila','Blumentrit'),('R-002','1300','Pasay','E. Rodriguez'),('R-003','3023','San Jose Del Monte','Libra'),('R-004','1008','Manila','Jhocson St.'),('R-005','1700','Pasay City','Gil Puyat Avenue'),('R-006','1002','Malabon','San pedro'),('R-009','1008','Manila','Jhocson St.'),('R-011','1700','Paranaque City','Villanueva St.'),('R-012','1799','Paranaque','Dos Dado St.');
/*!40000 ALTER TABLE `riderlocationtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riderratingtable`
--

DROP TABLE IF EXISTS `riderratingtable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `riderratingtable` (
  `Rider_id` varchar(7) DEFAULT NULL,
  `Rating` tinyint NOT NULL,
  `ShipOnTime` varchar(10) NOT NULL,
  KEY `Rider_id` (`Rider_id`),
  CONSTRAINT `riderratingtable_ibfk_1` FOREIGN KEY (`Rider_id`) REFERENCES `ridertable` (`Rider_id`) ON DELETE CASCADE,
  CONSTRAINT `riderratingtable_chk_1` CHECK ((`Rating` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riderratingtable`
--

LOCK TABLES `riderratingtable` WRITE;
/*!40000 ALTER TABLE `riderratingtable` DISABLE KEYS */;
INSERT INTO `riderratingtable` VALUES ('R-001',4,'80%'),('R-002',4,'80%'),('R-003',4,'60%'),('R-004',3,'39%'),('R-005',3,'60%'),('R-006',4,'80%'),('R-009',3,'60%'),('R-011',4,'80%'),('R-012',5,'99%');
/*!40000 ALTER TABLE `riderratingtable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ridertable`
--

DROP TABLE IF EXISTS `ridertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ridertable` (
  `Rider_id` varchar(7) NOT NULL,
  `RiderFullname` varchar(50) NOT NULL,
  `RiderContactNo` varchar(15) NOT NULL,
  PRIMARY KEY (`Rider_id`),
  UNIQUE KEY `unique_rider_contact` (`RiderContactNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ridertable`
--

LOCK TABLES `ridertable` WRITE;
/*!40000 ALTER TABLE `ridertable` DISABLE KEYS */;
INSERT INTO `ridertable` VALUES ('R-001','John Pascual','09123489765'),('R-002','Leslie Panganiban','09234567812'),('R-003','Andrew Ocampo','09345678943'),('R-004','Marvin Agustin','09784512654'),('R-005','Johnny Bravo','09691245326'),('R-006','Kyle Ramirez','09077667150'),('R-009','LA Tenorio','09124563987'),('R-011','Randy Aguila','09459548759'),('R-012','Marc Baroca','09477458472');
/*!40000 ALTER TABLE `ridertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactiontable`
--

DROP TABLE IF EXISTS `transactiontable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactiontable` (
  `Transaction_id` varchar(7) NOT NULL,
  `Booking_id` varchar(10) NOT NULL,
  `Customer_id` varchar(7) DEFAULT NULL,
  `Rider_id` varchar(7) DEFAULT NULL,
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pickup_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_status` enum('Pending','Paid','Failed') NOT NULL,
  `PaymentID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Transaction_id`),
  UNIQUE KEY `Booking_id` (`Booking_id`),
  KEY `Customer_id` (`Customer_id`),
  KEY `Rider_id` (`Rider_id`),
  KEY `PaymentID` (`PaymentID`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`Customer_id`) REFERENCES `customertable` (`Customer_id`) ON DELETE SET NULL,
  CONSTRAINT `transactiontable_ibfk_1` FOREIGN KEY (`PaymentID`) REFERENCES `paymentmethod` (`PaymentID`),
  CONSTRAINT `transactiontable_chk_1` CHECK ((`amount_paid` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactiontable`
--

LOCK TABLES `transactiontable` WRITE;
/*!40000 ALTER TABLE `transactiontable` DISABLE KEYS */;
INSERT INTO `transactiontable` VALUES ('T001','B001','C-002','R-002','2025-03-05 14:25:55','2025-03-05 14:25:00','2025-03-05 14:25:55',275.00,'Paid','P001'),('T002','B002','C-002','R-001','2025-03-05 15:49:04','2025-03-05 15:49:00','2025-03-05 15:49:04',440.00,'Paid','P002'),('T003','B003','C-001','R-002','2025-03-05 15:52:16','2025-03-05 15:52:00','2025-03-05 15:52:16',312.50,'Paid','P003'),('T004','B004','C-003','R-002','2025-03-05 16:28:21','2025-03-05 16:28:00','2025-03-05 16:28:21',200.00,'Paid','P004'),('T005','B005','C-003','R-004','2025-03-05 16:34:34','2025-03-05 16:34:00','2025-03-05 16:34:34',245.00,'Paid','P005'),('T006','B006','C-001','R-005','2025-03-05 16:47:10','2025-03-05 16:47:00','2025-03-05 16:47:10',170.00,'Paid','P006'),('T007','B007','C-001','R-005','2025-03-06 04:09:25','2025-03-06 04:09:00','2025-03-06 04:09:25',275.00,'Paid','P007'),('T008','B008','C-003','R-003','2025-03-06 04:14:53','2025-03-06 04:14:00','2025-03-06 04:14:53',350.00,'Paid','P008'),('T009','B009','C-002','R-004','2025-03-06 04:19:12','2025-03-06 04:19:00','2025-03-06 04:19:11',305.00,'Paid','P009'),('T010','B010','C-003','R-001','2025-03-06 06:29:03','2025-03-06 06:28:00','2025-03-06 06:29:03',200.00,'Paid','P010'),('T011','B011','C-001','R-004','2025-03-06 06:31:52','2025-03-06 06:31:00','2025-03-06 06:31:52',535.00,'Paid','P011'),('T012','B012','C-002','R-004','2025-03-06 06:32:50','2025-03-06 06:32:00','2025-03-06 06:32:50',440.00,'Paid','P012'),('T013','B013','C-009','R-001','2025-03-06 09:00:45','2025-03-06 09:00:00','2025-03-06 09:00:45',105.00,'Paid','P013'),('T014','B014','C-010','R-001','2025-03-06 09:37:46','2025-03-06 09:37:00','2025-03-06 09:37:46',175.00,'Paid','P014'),('T015','B015','C-010','R-004','2025-03-06 09:38:37','2025-03-06 09:38:00','2025-03-06 09:38:37',260.00,'Paid','P015');
/*!40000 ALTER TABLE `transactiontable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usedvouchers`
--

DROP TABLE IF EXISTS `usedvouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usedvouchers` (
  `Customer_id` varchar(7) NOT NULL,
  `PromoCode` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer_id`,`PromoCode`),
  CONSTRAINT `usedvouchers_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customertable` (`Customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usedvouchers`
--

LOCK TABLES `usedvouchers` WRITE;
/*!40000 ALTER TABLE `usedvouchers` DISABLE KEYS */;
INSERT INTO `usedvouchers` VALUES ('C-001','NAKASUBNAMI'),('C-010','NAKASUBNAMI');
/*!40000 ALTER TABLE `usedvouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_id` varchar(7) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `AccountCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ADM-001','dreig','wallace','2025-03-04 09:37:01'),('ADM-003','ronen','qwertyuiop','2025-03-05 09:25:55'),('ADM-004','jabez','boy1xbet','2025-03-05 09:26:40'),('ADM-005','tyronepascual','lessandra','2025-03-05 09:26:55');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicletable`
--

DROP TABLE IF EXISTS `vehicletable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicletable` (
  `PlateNumber` varchar(7) NOT NULL,
  `Vehicle` varchar(50) NOT NULL,
  `Rider_id` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`PlateNumber`),
  KEY `Rider_id` (`Rider_id`),
  CONSTRAINT `vehicletable_ibfk_1` FOREIGN KEY (`Rider_id`) REFERENCES `ridertable` (`Rider_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletable`
--

LOCK TABLES `vehicletable` WRITE;
/*!40000 ALTER TABLE `vehicletable` DISABLE KEYS */;
INSERT INTO `vehicletable` VALUES ('ABD123','Honda Click','R-001'),('CDR567','Aerox','R-002'),('EFT901','Raider Fi','R-003'),('GIY109','Honda PCX','R-011'),('GMS110','BMW SR1000rr','R-006'),('GMY100','Honda Click','R-009'),('IMY143','Honda Click','R-012'),('IQ1234','Sniper 155','R-005'),('MSJ619','Mio','R-004');
/*!40000 ALTER TABLE `vehicletable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-07 17:42:02
