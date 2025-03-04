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
  CONSTRAINT `contacttable_ibfk_1` FOREIGN KEY (`Customer_id`) REFERENCES `customertable` (`Customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacttable`
--

LOCK TABLES `contacttable` WRITE;
/*!40000 ALTER TABLE `contacttable` DISABLE KEYS */;
INSERT INTO `contacttable` VALUES ('C-001','09957900057','dreig@gmail.com'),('C-004','09451265986','jbz@gmail.com'),('C-005','09357892569','dwayne@gmail.com'),('C-006','09568425698','ronen@gmail.com'),('C-007','09567582659','mariel@gmail.com'),('C-008','09562314598','deniele@gmail.com'),('C-009','09562145698','mandy@gmail.com'),('C-010','09455322659','randy@gmail.com'),('C-012','09342154623','taylor@gmail.com'),('C-013','09275426498','mvey@gmail.com'),('C-014','09957900057','tyrone@gmail.com'),('C-015','09452164589','bryan@gmail.com');
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
  PRIMARY KEY (`Customer_id`),
  UNIQUE KEY `CustomerFullName` (`CustomerFullName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customertable`
--

LOCK TABLES `customertable` WRITE;
/*!40000 ALTER TABLE `customertable` DISABLE KEYS */;
INSERT INTO `customertable` VALUES ('C-001','Dreig Aguila','wallace'),('C-002','dad','dada'),('C-004','Jabez Jabez','diazfamily'),('C-005','Dwayne Aguila','lot1blk2'),('C-006','ronen pano','tagainfanta'),('C-007','Mariel Aguila','aguilafamily'),('C-008','Deniele Aguila','zaynmalik'),('C-009','Mandy Adriel Aguila','cutiebebemandy'),('C-010','Randy Aguila','wassupmgakababoy'),('C-012','Taylor Pet','taylowcutie'),('C-013','Marvey Peralta','happybday'),('C-014','Tyrone Pascual','bombaclat'),('C-015','Bryan Sayson','mangoville');
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
INSERT INTO `fare_matrix` VALUES ('Caloocan','Caloocan',10.00,0.00),('Caloocan','Las Piñas',70.00,28.00),('Caloocan','Makati',50.00,18.00),('Caloocan','Malabon',20.00,8.00),('Caloocan','Mandaluyong',50.00,17.00),('Caloocan','Manila',40.00,15.00),('Caloocan','Marikina',50.00,18.00),('Caloocan','Muntinlupa',80.00,30.00),('Caloocan','Navotas',25.00,9.00),('Caloocan','Parañaque',65.00,25.00),('Caloocan','Pasay',45.00,19.00),('Caloocan','Pasig',55.00,20.00),('Caloocan','Pateros',55.00,21.00),('Caloocan','Quezon City',30.00,12.00),('Caloocan','San Juan',45.00,16.00),('Caloocan','Taguig',60.00,22.00),('Caloocan','Valenzuela',25.00,10.50),('Las Piñas','Caloocan',70.00,28.00),('Las Piñas','Las Piñas',10.00,0.00),('Las Piñas','Makati',50.00,20.00),('Las Piñas','Mandaluyong',55.00,20.00),('Las Piñas','Manila',65.00,25.00),('Las Piñas','Marikina',65.00,25.00),('Las Piñas','Muntinlupa',25.00,8.00),('Las Piñas','Parañaque',20.00,7.00),('Las Piñas','Pasay',40.00,15.00),('Las Piñas','Pasig',60.00,22.00),('Las Piñas','Pateros',45.00,17.00),('Las Piñas','Quezon City',70.00,28.00),('Las Piñas','San Juan',50.00,20.00),('Las Piñas','Taguig',45.00,15.00),('Las Piñas','Valenzuela',75.00,30.00),('Makati','Caloocan',50.00,18.00),('Makati','Las Piñas',50.00,20.00),('Makati','Makati',10.00,0.00),('Makati','Mandaluyong',25.00,10.00),('Makati','Manila',45.00,16.00),('Makati','Marikina',40.00,15.00),('Makati','Muntinlupa',60.00,25.00),('Makati','Parañaque',35.00,12.00),('Makati','Pasay',30.00,10.00),('Makati','Pasig',30.00,12.00),('Makati','Pateros',25.00,10.00),('Makati','Quezon City',45.00,16.00),('Makati','San Juan',30.00,12.00),('Makati','Taguig',20.00,8.00),('Makati','Valenzuela',55.00,20.00),('Malabon','Caloocan',20.00,8.00),('Malabon','Las Piñas',60.00,22.00),('Malabon','Makati',50.00,18.00),('Malabon','Malabon',10.00,0.00),('Malabon','Mandaluyong',45.00,16.00),('Malabon','Manila',35.00,12.00),('Malabon','Marikina',45.00,16.00),('Malabon','Muntinlupa',65.00,25.00),('Malabon','Parañaque',55.00,20.00),('Malabon','Pasay',50.00,19.00),('Malabon','Pasig',50.00,18.00),('Malabon','Quezon City',25.00,10.00),('Malabon','San Juan',40.00,15.00),('Malabon','Taguig',55.00,20.00),('Malabon','Valenzuela',20.00,8.50),('Mandaluyong','Caloocan',50.00,17.00),('Mandaluyong','Las Piñas',55.00,20.00),('Mandaluyong','Makati',25.00,10.00),('Mandaluyong','Mandaluyong',10.00,0.00),('Mandaluyong','Manila',40.00,15.00),('Mandaluyong','Marikina',30.00,11.00),('Mandaluyong','Muntinlupa',65.00,25.00),('Mandaluyong','Parañaque',50.00,18.00),('Mandaluyong','Pasay',40.00,15.00),('Mandaluyong','Pasig',20.00,8.00),('Mandaluyong','Pateros',30.00,12.00),('Mandaluyong','Quezon City',35.00,13.00),('Mandaluyong','San Juan',15.00,5.00),('Mandaluyong','Taguig',35.00,13.00),('Mandaluyong','Valenzuela',55.00,19.00),('Manila','Caloocan',40.00,15.00),('Manila','Las Piñas',65.00,25.00),('Manila','Makati',45.00,16.00),('Manila','Malabon',35.00,12.00),('Manila','Mandaluyong',40.00,15.00),('Manila','Manila',10.00,0.00),('Manila','Marikina',50.00,18.00),('Manila','Muntinlupa',75.00,28.00),('Manila','Navotas',35.00,13.00),('Manila','Parañaque',55.00,20.00),('Manila','Pasay',30.00,10.00),('Manila','Pasig',55.00,20.00),('Manila','Pateros',50.00,17.00),('Manila','Quezon City',35.00,14.00),('Manila','San Juan',30.00,10.00),('Manila','Taguig',50.00,18.00),('Manila','Valenzuela',45.00,16.00),('Marikina','Caloocan',50.00,18.00),('Marikina','Las Piñas',65.00,25.00),('Marikina','Makati',40.00,15.00),('Marikina','Mandaluyong',30.00,11.00),('Marikina','Manila',50.00,18.00),('Marikina','Marikina',10.00,0.00),('Marikina','Muntinlupa',75.00,28.00),('Marikina','Parañaque',60.00,22.00),('Marikina','Pasay',50.00,20.00),('Marikina','Pasig',20.00,8.00),('Marikina','Pateros',40.00,16.00),('Marikina','Quezon City',30.00,12.00),('Marikina','San Juan',25.00,10.00),('Marikina','Taguig',45.00,17.00),('Marikina','Valenzuela',55.00,20.00),('Muntinlupa','Caloocan',80.00,30.00),('Muntinlupa','Las Piñas',25.00,8.00),('Muntinlupa','Makati',60.00,25.00),('Muntinlupa','Mandaluyong',65.00,25.00),('Muntinlupa','Manila',75.00,28.00),('Muntinlupa','Marikina',75.00,28.00),('Muntinlupa','Muntinlupa',10.00,0.00),('Muntinlupa','Parañaque',30.00,10.00),('Muntinlupa','Pasay',55.00,20.00),('Muntinlupa','Pasig',70.00,25.00),('Muntinlupa','Pateros',55.00,20.00),('Muntinlupa','Quezon City',80.00,30.00),('Muntinlupa','San Juan',60.00,25.00),('Muntinlupa','Taguig',50.00,18.00),('Muntinlupa','Valenzuela',85.00,32.00),('Navotas','Caloocan',25.00,9.00),('Navotas','Las Piñas',75.00,30.00),('Navotas','Makati',55.00,20.00),('Navotas','Mandaluyong',50.00,17.00),('Navotas','Manila',35.00,13.00),('Navotas','Marikina',50.00,18.00),('Navotas','Muntinlupa',85.00,32.00),('Navotas','Navotas',10.00,0.00),('Navotas','Parañaque',70.00,27.00),('Navotas','Pasay',50.00,19.00),('Navotas','Pasig',55.00,20.00),('Navotas','Pateros',55.00,21.00),('Navotas','Quezon City',30.00,11.00),('Navotas','San Juan',45.00,16.00),('Navotas','Taguig',60.00,22.00),('Navotas','Valenzuela',25.00,9.50),('Parañaque','Caloocan',65.00,25.00),('Parañaque','Las Piñas',20.00,7.00),('Parañaque','Makati',35.00,12.00),('Parañaque','Mandaluyong',50.00,18.00),('Parañaque','Manila',55.00,20.00),('Parañaque','Marikina',60.00,22.00),('Parañaque','Muntinlupa',30.00,10.00),('Parañaque','Parañaque',10.00,0.00),('Parañaque','Pasay',25.00,8.00),('Parañaque','Pasig',55.00,20.00),('Parañaque','Pateros',40.00,15.00),('Parañaque','Quezon City',65.00,25.00),('Parañaque','San Juan',45.00,18.00),('Parañaque','Taguig',30.00,10.00),('Parañaque','Valenzuela',70.00,27.00),('Pasay','Caloocan',45.00,19.00),('Pasay','Las Piñas',40.00,15.00),('Pasay','Makati',30.00,10.00),('Pasay','Mandaluyong',40.00,15.00),('Pasay','Manila',30.00,10.00),('Pasay','Marikina',50.00,20.00),('Pasay','Muntinlupa',55.00,20.00),('Pasay','Parañaque',25.00,8.00),('Pasay','Pasay',10.00,0.00),('Pasay','Pasig',50.00,20.00),('Pasay','Pateros',45.00,18.00),('Pasay','Quezon City',45.00,19.00),('Pasay','San Juan',35.00,14.00),('Pasay','Taguig',35.00,12.00),('Pasay','Valenzuela',50.00,21.00),('Pasig','Caloocan',55.00,20.00),('Pasig','Las Piñas',60.00,25.00),('Pasig','Makati',30.00,12.00),('Pasig','Mandaluyong',20.00,8.00),('Pasig','Manila',55.00,20.00),('Pasig','Marikina',20.00,8.00),('Pasig','Muntinlupa',70.00,28.00),('Pasig','Parañaque',55.00,22.00),('Pasig','Pasay',50.00,20.00),('Pasig','Pasig',10.00,0.00),('Pasig','Pateros',20.00,8.00),('Pasig','Quezon City',40.00,15.00),('Pasig','San Juan',20.00,7.00),('Pasig','Taguig',25.00,10.00),('Pasig','Valenzuela',60.00,22.00),('Pateros','Caloocan',55.00,21.00),('Pateros','Las Piñas',45.00,17.00),('Pateros','Makati',25.00,10.00),('Pateros','Mandaluyong',30.00,12.00),('Pateros','Manila',50.00,17.00),('Pateros','Marikina',40.00,16.00),('Pateros','Muntinlupa',55.00,20.00),('Pateros','Parañaque',40.00,15.00),('Pateros','Pasay',45.00,18.00),('Pateros','Pasig',20.00,8.00),('Pateros','Pateros',10.00,0.00),('Pateros','Quezon City',50.00,17.00),('Pateros','San Juan',30.00,12.00),('Pateros','Taguig',20.00,8.00),('Pateros','Valenzuela',60.00,23.00),('Quezon City','Caloocan',30.00,12.00),('Quezon City','Las Piñas',70.00,28.00),('Quezon City','Makati',45.00,16.00),('Quezon City','Malabon',25.00,10.00),('Quezon City','Mandaluyong',35.00,13.00),('Quezon City','Manila',35.00,14.00),('Quezon City','Marikina',30.00,12.00),('Quezon City','Muntinlupa',80.00,30.00),('Quezon City','Navotas',30.00,11.00),('Quezon City','Parañaque',65.00,25.00),('Quezon City','Pasay',45.00,19.00),('Quezon City','Pasig',40.00,15.00),('Quezon City','Pateros',50.00,17.00),('Quezon City','Quezon City',10.00,0.00),('Quezon City','San Juan',25.00,10.00),('Quezon City','Taguig',50.00,18.00),('Quezon City','Valenzuela',35.00,14.00),('San Juan','Caloocan',45.00,16.00),('San Juan','Las Piñas',50.00,20.00),('San Juan','Makati',30.00,12.00),('San Juan','Mandaluyong',15.00,5.00),('San Juan','Manila',30.00,10.00),('San Juan','Marikina',25.00,10.00),('San Juan','Muntinlupa',60.00,25.00),('San Juan','Parañaque',45.00,18.00),('San Juan','Pasay',35.00,14.00),('San Juan','Pasig',20.00,7.00),('San Juan','Pateros',30.00,12.00),('San Juan','Quezon City',25.00,10.00),('San Juan','San Juan',10.00,0.00),('San Juan','Taguig',35.00,13.00),('San Juan','Valenzuela',50.00,18.00),('Taguig','Caloocan',60.00,22.00),('Taguig','Las Piñas',45.00,15.00),('Taguig','Makati',20.00,8.00),('Taguig','Mandaluyong',35.00,13.00),('Taguig','Manila',50.00,18.00),('Taguig','Marikina',45.00,17.00),('Taguig','Muntinlupa',50.00,18.00),('Taguig','Parañaque',30.00,10.00),('Taguig','Pasay',35.00,12.00),('Taguig','Pasig',25.00,10.00),('Taguig','Pateros',20.00,8.00),('Taguig','Quezon City',50.00,18.00),('Taguig','San Juan',35.00,13.00),('Taguig','Taguig',10.00,0.00),('Taguig','Valenzuela',65.00,24.00),('Valenzuela','Caloocan',25.00,10.50),('Valenzuela','Las Piñas',75.00,30.00),('Valenzuela','Makati',55.00,20.00),('Valenzuela','Malabon',20.00,8.50),('Valenzuela','Mandaluyong',55.00,19.00),('Valenzuela','Manila',45.00,16.00),('Valenzuela','Marikina',55.00,20.00),('Valenzuela','Muntinlupa',85.00,32.00),('Valenzuela','Navotas',25.00,9.50),('Valenzuela','Parañaque',70.00,27.00),('Valenzuela','Pasay',50.00,21.00),('Valenzuela','Pasig',60.00,22.00),('Valenzuela','Pateros',60.00,23.00),('Valenzuela','Quezon City',35.00,14.00),('Valenzuela','San Juan',50.00,18.00),('Valenzuela','Taguig',65.00,24.00),('Valenzuela','Valenzuela',10.00,0.00);
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
INSERT INTO `locationtable` VALUES ('C-001','Las Pinas',1700,'Villanueva St.'),('C-004','San Jose Del Monte City',3023,'realonda st.'),('C-005','Las Pinas City',1700,'Manuyo Dos'),('C-006','Infanta City',2000,'Infanta st.'),('C-007','Paranaque City',1700,'H. Rodriguez'),('C-008','Calapan City',5200,'Managpi'),('C-009','Las Pinas City',1700,'Villanueva St.'),('C-010','Calapan City',5200,'Managpi, Ilaya'),('C-012','Calapan City',5200,'Ilaya'),('C-013','Paranaque City',1700,'tagadongalo st.'),('C-014','Las Pinas',1700,'Villanueva St.'),('C-015','Las Pinas City',1700,'mangahan st.');
/*!40000 ALTER TABLE `locationtable` ENABLE KEYS */;
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
INSERT INTO `riderlocationtable` VALUES ('R-001','1008','Manila','Blumentrit'),('R-002','1300','Pasay','E. Rodriguez'),('R-003','3023','San Jose Del Monte','Libra'),('R-004','1550','Mandaluyong','Cleveland'),('R-005','1700','Las Pinas','Santiago St.');
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
INSERT INTO `riderratingtable` VALUES ('R-001',3,'60%'),('R-002',5,'99%'),('R-003',2,'39%'),('R-004',4,'80%'),('R-005',4,'80%');
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
  UNIQUE KEY `RiderFullname` (`RiderFullname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ridertable`
--

LOCK TABLES `ridertable` WRITE;
/*!40000 ALTER TABLE `ridertable` DISABLE KEYS */;
INSERT INTO `ridertable` VALUES ('R-001','John Pascual','09123489765'),('R-002','Leslie Panganiban','09234567812'),('R-003','Andrew Ocampo','09345678943'),('R-004','Maris Racal','09456789076'),('R-005','Johnny Bravo','09452134569');
/*!40000 ALTER TABLE `ridertable` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `users` VALUES ('ADM-001','dreig','123','2025-03-04 00:58:26'),('ADM-002','wallace','456','2025-03-04 00:58:26'),('ADM-003','jabez','123','2025-03-03 20:02:18');
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
  UNIQUE KEY `Vehicle` (`Vehicle`),
  KEY `Rider_id` (`Rider_id`),
  CONSTRAINT `vehicletable_ibfk_1` FOREIGN KEY (`Rider_id`) REFERENCES `ridertable` (`Rider_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicletable`
--

LOCK TABLES `vehicletable` WRITE;
/*!40000 ALTER TABLE `vehicletable` DISABLE KEYS */;
INSERT INTO `vehicletable` VALUES ('ABD123','Honda Click','R-001'),('CDR567','Aerox','R-002'),('EFT901','Raider Fi','R-003'),('GHY345','Brugman','R-004'),('GYS120','Raider 125','R-005');
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

-- Dump completed on 2025-03-04 10:13:47
