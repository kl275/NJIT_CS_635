-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: CS631
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admitPatient`
--

DROP TABLE IF EXISTS `admitPatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admitPatient` (
  `admissionNumber` int(11) NOT NULL AUTO_INCREMENT,
  `dateAdmitted` date NOT NULL,
  `nursingUnit` int(11) NOT NULL,
  `room` text NOT NULL,
  `bedNumber` int(11) NOT NULL,
  PRIMARY KEY (`admissionNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admitPatient`
--

LOCK TABLES `admitPatient` WRITE;
/*!40000 ALTER TABLE `admitPatient` DISABLE KEYS */;
INSERT INTO `admitPatient` VALUES (1,'2022-07-04',4,'blue',1);
/*!40000 ALTER TABLE `admitPatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allergyInfo`
--

DROP TABLE IF EXISTS `allergyInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allergyInfo` (
  `code` int(11) NOT NULL,
  `allergyInfo` text NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergyInfo`
--

LOCK TABLES `allergyInfo` WRITE;
/*!40000 ALTER TABLE `allergyInfo` DISABLE KEYS */;
INSERT INTO `allergyInfo` VALUES (1,'pennicillin');
/*!40000 ALTER TABLE `allergyInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointmentTable`
--

DROP TABLE IF EXISTS `appointmentTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointmentTable` (
  `aptNum` int(11) NOT NULL AUTO_INCREMENT,
  `dateofApt` date NOT NULL,
  `patientNumber` int(11) NOT NULL,
  `physician` int(11) NOT NULL,
  PRIMARY KEY (`aptNum`),
  KEY `patientNumber` (`patientNumber`),
  CONSTRAINT `appointmentTable_ibfk_1` FOREIGN KEY (`patientNumber`) REFERENCES `patientTable` (`patientNumber`),
  CONSTRAINT `appointmentTable_ibfk_2` FOREIGN KEY (`patientNumber`) REFERENCES `surgeonTable` (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointmentTable`
--

LOCK TABLES `appointmentTable` WRITE;
/*!40000 ALTER TABLE `appointmentTable` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointmentTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cholesterolTable`
--

DROP TABLE IF EXISTS `cholesterolTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cholesterolTable` (
  `testNum` int(11) NOT NULL AUTO_INCREMENT,
  `HDLlevels` int(11) NOT NULL,
  `LDLlevels` int(11) NOT NULL,
  `Triglycerides` int(11) NOT NULL,
  `dateAdministered` date NOT NULL,
  `patientNumber` int(11) NOT NULL,
  PRIMARY KEY (`testNum`),
  KEY `patientNumber` (`patientNumber`),
  CONSTRAINT `cholesterolTable_ibfk_1` FOREIGN KEY (`patientNumber`) REFERENCES `patientTable` (`patientNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cholesterolTable`
--

LOCK TABLES `cholesterolTable` WRITE;
/*!40000 ALTER TABLE `cholesterolTable` DISABLE KEYS */;
INSERT INTO `cholesterolTable` VALUES (4,2,2,3,'2022-07-08',2);
/*!40000 ALTER TABLE `cholesterolTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contractInfo`
--

DROP TABLE IF EXISTS `contractInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contractInfo` (
  `contractNum` int(11) NOT NULL,
  `contractLength` int(11) NOT NULL,
  `dateStart` date NOT NULL,
  `specialty` text NOT NULL,
  PRIMARY KEY (`contractNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contractInfo`
--

LOCK TABLES `contractInfo` WRITE;
/*!40000 ALTER TABLE `contractInfo` DISABLE KEYS */;
INSERT INTO `contractInfo` VALUES (1214,78,'2022-02-01','anesthesia');
/*!40000 ALTER TABLE `contractInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illnessTable`
--

DROP TABLE IF EXISTS `illnessTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illnessTable` (
  `code` int(11) NOT NULL,
  `name` text NOT NULL,
  `requiresInPatient` tinyint(1) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illnessTable`
--

LOCK TABLES `illnessTable` WRITE;
/*!40000 ALTER TABLE `illnessTable` DISABLE KEYS */;
INSERT INTO `illnessTable` VALUES (1,'broken bone',1);
/*!40000 ALTER TABLE `illnessTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicationTable`
--

DROP TABLE IF EXISTS `medicationTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicationTable` (
  `medCode` int(11) NOT NULL,
  `name` text NOT NULL,
  `assignedBy` int(11) NOT NULL,
  `assignedTo` int(11) NOT NULL,
  `quantityOnHand` int(11) NOT NULL,
  `quantityOnOrder` int(11) NOT NULL,
  `unitCost` float NOT NULL,
  PRIMARY KEY (`medCode`),
  KEY `assignedTo` (`assignedTo`),
  KEY `assignedBy` (`assignedBy`),
  CONSTRAINT `medicationTable_ibfk_1` FOREIGN KEY (`assignedBy`) REFERENCES `physicianTable` (`employeeNumber`),
  CONSTRAINT `medicationTable_ibfk_2` FOREIGN KEY (`assignedBy`) REFERENCES `patientTable` (`patientNumber`),
  CONSTRAINT `medicationTable_ibfk_3` FOREIGN KEY (`assignedTo`) REFERENCES `patientTable` (`patientNumber`),
  CONSTRAINT `medicationTable_ibfk_4` FOREIGN KEY (`assignedBy`) REFERENCES `physicianTable` (`employeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicationTable`
--

LOCK TABLES `medicationTable` WRITE;
/*!40000 ALTER TABLE `medicationTable` DISABLE KEYS */;
INSERT INTO `medicationTable` VALUES (1,'Tylenol',2,2,100,400,29.99);
/*!40000 ALTER TABLE `medicationTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurseTable`
--

DROP TABLE IF EXISTS `nurseTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurseTable` (
  `employeeNumber` int(11) NOT NULL,
  `Name` text DEFAULT NULL,
  `ssn` int(11) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `numPatientsAssigned` int(11) DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  PRIMARY KEY (`employeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurseTable`
--

LOCK TABLES `nurseTable` WRITE;
/*!40000 ALTER TABLE `nurseTable` DISABLE KEYS */;
INSERT INTO `nurseTable` VALUES (1,'Maria McGregor',987654321,75000,'pediatrics',2,'female','121 Gigawatt Avenue','(987)876-6543',3,3);
/*!40000 ALTER TABLE `nurseTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientMedDate`
--

DROP TABLE IF EXISTS `patientMedDate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientMedDate` (
  `visitNumber` int(11) NOT NULL AUTO_INCREMENT,
  `datePrescribed` date NOT NULL,
  `patientNumber` int(11) NOT NULL,
  `cholesterol` int(11) NOT NULL,
  `bloodSugar` int(11) NOT NULL,
  `allergyCodes` int(11) DEFAULT NULL,
  PRIMARY KEY (`visitNumber`),
  KEY `patientNumber` (`patientNumber`),
  KEY `allergyCodes` (`allergyCodes`),
  CONSTRAINT `patientMedDate_ibfk_1` FOREIGN KEY (`patientNumber`) REFERENCES `patientTable` (`patientNumber`),
  CONSTRAINT `patientMedDate_ibfk_2` FOREIGN KEY (`allergyCodes`) REFERENCES `allergyInfo` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientMedDate`
--

LOCK TABLES `patientMedDate` WRITE;
/*!40000 ALTER TABLE `patientMedDate` DISABLE KEYS */;
INSERT INTO `patientMedDate` VALUES (1,'2022-07-12',2,4,50,1);
/*!40000 ALTER TABLE `patientMedDate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientTable`
--

DROP TABLE IF EXISTS `patientTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientTable` (
  `patientNumber` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ssn` char(11) NOT NULL,
  `address` text NOT NULL,
  `primaryCarePhys` int(11) NOT NULL,
  `nurse` int(11) NOT NULL,
  `allergies` text DEFAULT NULL,
  `gender` text DEFAULT NULL,
  `dateOfBirth` text NOT NULL,
  PRIMARY KEY (`patientNumber`),
  KEY `primaryCarePhys` (`primaryCarePhys`),
  CONSTRAINT `patientTable_ibfk_1` FOREIGN KEY (`primaryCarePhys`) REFERENCES `physicianTable` (`employeeNumber`),
  CONSTRAINT `patientTable_ibfk_2` FOREIGN KEY (`primaryCarePhys`) REFERENCES `nurseTable` (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientTable`
--

LOCK TABLES `patientTable` WRITE;
/*!40000 ALTER TABLE `patientTable` DISABLE KEYS */;
INSERT INTO `patientTable` VALUES (2,'Tom Smith','123-45-6789','234 Main Steet, AnyState',1,1,'penicillin','male','29 Feb 1970'),(3,'Tom Smith','123-45-6789','234 Main Steet, AnyState',1,1,'penicillin','male','29 Feb 1970');
/*!40000 ALTER TABLE `patientTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physicianTable`
--

DROP TABLE IF EXISTS `physicianTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physicianTable` (
  `employeeNumber` int(11) NOT NULL AUTO_INCREMENT,
  `ssn` char(11) NOT NULL,
  `salary` float NOT NULL,
  `gender` text NOT NULL,
  `address` text NOT NULL,
  `phoneNumber` char(14) DEFAULT NULL,
  `speciality` text NOT NULL,
  PRIMARY KEY (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physicianTable`
--

LOCK TABLES `physicianTable` WRITE;
/*!40000 ALTER TABLE `physicianTable` DISABLE KEYS */;
INSERT INTO `physicianTable` VALUES (1,'123-45-6789',123456,'male','123 Main Street, Anytown, Anywhere','(123)456-7890','orthopedics'),(2,'111-22-3333',100000,'female','1313 MockingBird Lane, Munsterville','555-55-5555','neurology');
/*!40000 ALTER TABLE `physicianTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgeonTable`
--

DROP TABLE IF EXISTS `surgeonTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surgeonTable` (
  `employeeNumber` int(11) NOT NULL AUTO_INCREMENT,
  `ssn` char(11) NOT NULL,
  `gender` text NOT NULL,
  `address` text NOT NULL,
  `phoneNumber` char(14) DEFAULT NULL,
  `contractNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`employeeNumber`),
  KEY `contractNum` (`contractNum`),
  CONSTRAINT `surgeonTable_ibfk_1` FOREIGN KEY (`contractNum`) REFERENCES `contractInfo` (`contractNum`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgeonTable`
--

LOCK TABLES `surgeonTable` WRITE;
/*!40000 ALTER TABLE `surgeonTable` DISABLE KEYS */;
INSERT INTO `surgeonTable` VALUES (2,'321-21-1234','female','Hotel Broadilbin','907-871-4532',1214);
/*!40000 ALTER TABLE `surgeonTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surgerySchedule`
--

DROP TABLE IF EXISTS `surgerySchedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surgerySchedule` (
  `surgeryNum` int(11) NOT NULL AUTO_INCREMENT,
  `scheduledDate` date DEFAULT NULL,
  `location` text NOT NULL,
  `patientNumber` int(11) NOT NULL,
  `surgeonNumber` int(11) NOT NULL,
  PRIMARY KEY (`surgeryNum`),
  KEY `surgeonNumber` (`surgeonNumber`),
  CONSTRAINT `surgerySchedule_ibfk_1` FOREIGN KEY (`surgeonNumber`) REFERENCES `surgeonTable` (`employeeNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surgerySchedule`
--

LOCK TABLES `surgerySchedule` WRITE;
/*!40000 ALTER TABLE `surgerySchedule` DISABLE KEYS */;
INSERT INTO `surgerySchedule` VALUES (2,'2022-07-15','Fourth Floor',2,2);
/*!40000 ALTER TABLE `surgerySchedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-07 15:38:00
