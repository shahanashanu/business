-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: user
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'stratford'),(2,'ilford'),(3,'croydon');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_choice`
--

DROP TABLE IF EXISTS `answer_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer_choice` (
  `answer_choice_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `answer_choice_text` varchar(50) DEFAULT NULL,
  `answer_flag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`answer_choice_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_choice_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_choice`
--

LOCK TABLES `answer_choice` WRITE;
/*!40000 ALTER TABLE `answer_choice` DISABLE KEYS */;
INSERT INTO `answer_choice` VALUES (1,1,'yes',0),(2,1,'no',1);
/*!40000 ALTER TABLE `answer_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_status`
--

DROP TABLE IF EXISTS `audit_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_status` (
  `audit_status_id` int NOT NULL AUTO_INCREMENT,
  `audit_status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`audit_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_status`
--

LOCK TABLES `audit_status` WRITE;
/*!40000 ALTER TABLE `audit_status` DISABLE KEYS */;
INSERT INTO `audit_status` VALUES (1,'scheduled'),(2,'inprogress'),(3,'completed'),(4,'deferred');
/*!40000 ALTER TABLE `audit_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) DEFAULT NULL,
  `company_status_id` int DEFAULT NULL,
  `company_type_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `company_status_id` (`company_status_id`),
  KEY `company_type_id` (`company_type_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`company_status_id`) REFERENCES `company_status` (`company_status_id`),
  CONSTRAINT `company_ibfk_2` FOREIGN KEY (`company_type_id`) REFERENCES `company_type` (`company_type_id`),
  CONSTRAINT `company_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'xyz',1,1,2),(2,'abc',1,2,1),(3,'abc law',1,3,3);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_status`
--

DROP TABLE IF EXISTS `company_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_status` (
  `company_status_id` int NOT NULL AUTO_INCREMENT,
  `company_status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_status`
--

LOCK TABLES `company_status` WRITE;
/*!40000 ALTER TABLE `company_status` DISABLE KEYS */;
INSERT INTO `company_status` VALUES (1,'active'),(2,'desolve');
/*!40000 ALTER TABLE `company_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_type`
--

DROP TABLE IF EXISTS `company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_type` (
  `company_type_id` int NOT NULL AUTO_INCREMENT,
  `company_type_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`company_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_type`
--

LOCK TABLES `company_type` WRITE;
/*!40000 ALTER TABLE `company_type` DISABLE KEYS */;
INSERT INTO `company_type` VALUES (1,'privated limited'),(2,'public limited'),(3,'sole trader');
/*!40000 ALTER TABLE `company_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designation` (
  `designation_id` int NOT NULL AUTO_INCREMENT,
  `designation_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,'auditor'),(2,'key worker'),(3,'softweare devolepor'),(4,'sales manager');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_attachment`
--

DROP TABLE IF EXISTS `file_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_attachment` (
  `file_attachment_id` int NOT NULL AUTO_INCREMENT,
  `file_attachment_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`file_attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_attachment`
--

LOCK TABLES `file_attachment` WRITE;
/*!40000 ALTER TABLE `file_attachment` DISABLE KEYS */;
INSERT INTO `file_attachment` VALUES (1,'audit_report'),(2,'audit_log_report');
/*!40000 ALTER TABLE `file_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_attachment_type`
--

DROP TABLE IF EXISTS `file_attachment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_attachment_type` (
  `attachment_type_id` int NOT NULL AUTO_INCREMENT,
  `file_attachment_name` varchar(30) DEFAULT NULL,
  `file_attachment_id` int DEFAULT NULL,
  PRIMARY KEY (`attachment_type_id`),
  KEY `file_attachment_id` (`file_attachment_id`),
  CONSTRAINT `file_attachment_type_ibfk_1` FOREIGN KEY (`file_attachment_id`) REFERENCES `file_attachment` (`file_attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_attachment_type`
--

LOCK TABLES `file_attachment_type` WRITE;
/*!40000 ALTER TABLE `file_attachment_type` DISABLE KEYS */;
INSERT INTO `file_attachment_type` VALUES (1,'audit_report',2),(2,'audit_summary',1),(3,'audit_closure_meeting_point',2);
/*!40000 ALTER TABLE `file_attachment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immigration_status`
--

DROP TABLE IF EXISTS `immigration_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immigration_status` (
  `immigration_status_id` int NOT NULL AUTO_INCREMENT,
  `immigration_status_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`immigration_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immigration_status`
--

LOCK TABLES `immigration_status` WRITE;
/*!40000 ALTER TABLE `immigration_status` DISABLE KEYS */;
INSERT INTO `immigration_status` VALUES (1,'British citizen'),(2,'ILR');
/*!40000 ALTER TABLE `immigration_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `person_name` varchar(20) DEFAULT NULL,
  `designation_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `immigration_status_id` int DEFAULT NULL,
  PRIMARY KEY (`person_id`),
  KEY `designation_id` (`designation_id`),
  KEY `company_id` (`company_id`),
  KEY `immigration_status_id` (`immigration_status_id`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`designation_id`) REFERENCES `designation` (`designation_id`),
  CONSTRAINT `person_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company_type` (`company_type_id`),
  CONSTRAINT `person_ibfk_3` FOREIGN KEY (`immigration_status_id`) REFERENCES `immigration_status` (`immigration_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'john',1,3,1),(2,'jack',2,1,2),(3,'mark',2,2,1);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `question_text` varchar(100) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `question_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'do you have payslips for all the employees of oct 2022',1),(2,'do you have entry clearance stamp available for all travels carried out by immigrant employees',2),(3,'is there any change in employee address in the last three months',2),(4,'whether the changes are updated in home office systems',2);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_category`
--

DROP TABLE IF EXISTS `question_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `question_category_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_category`
--

LOCK TABLES `question_category` WRITE;
/*!40000 ALTER TABLE `question_category` DISABLE KEYS */;
INSERT INTO `question_category` VALUES (1,'payroll'),(2,'reporting');
/*!40000 ALTER TABLE `question_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term` (
  `term_id` int NOT NULL AUTO_INCREMENT,
  `term_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,'first quater'),(2,'sec quater'),(3,'third quater'),(4,'forth quater');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-15 15:07:57
