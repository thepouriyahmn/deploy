-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: hellodb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `choosen_class`
--

DROP TABLE IF EXISTS `choosen_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choosen_class` (
  `choosen_class_id` int NOT NULL AUTO_INCREMENT,
  `mark` int DEFAULT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`choosen_class_id`,`class_id`),
  KEY `f1_idx` (`class_id`),
  CONSTRAINT `chossen_class_f1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choosen_class`
--

LOCK TABLES `choosen_class` WRITE;
/*!40000 ALTER TABLE `choosen_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `choosen_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL AUTO_INCREMENT,
  `class_number` int NOT NULL,
  `capacity` int NOT NULL,
  `lesson_id` int NOT NULL,
  `class_time` text,
  `professor_id` int NOT NULL,
  PRIMARY KEY (`class_id`,`lesson_id`,`professor_id`),
  KEY `f1_idx` (`lesson_id`),
  KEY `classes_f2_idx` (`professor_id`),
  CONSTRAINT `classes_f1` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `classes_f2` FOREIGN KEY (`professor_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (16,1103,9,12,'12-3',21),(17,1502,1,13,'12-3',22),(18,1206,3,12,'12-3',21),(19,1207,3,15,'12-3',24),(20,1034,3,12,'12-3',30),(21,1037,5,12,'3-6',30),(22,1306,3,15,'4-7',24);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `classes_view`
--

DROP TABLE IF EXISTS `classes_view`;
/*!50001 DROP VIEW IF EXISTS `classes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classes_view` AS SELECT 
 1 AS `username`,
 1 AS `lesson_name`,
 1 AS `lesson_unit`,
 1 AS `class_number`,
 1 AS `capacity`,
 1 AS `class_time`,
 1 AS `class_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lessons`
--

DROP TABLE IF EXISTS `lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lessons` (
  `lesson_id` int NOT NULL AUTO_INCREMENT,
  `lesson_name` varchar(45) NOT NULL,
  `lesson_unit` int NOT NULL,
  PRIMARY KEY (`lesson_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lessons`
--

LOCK TABLES `lessons` WRITE;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` VALUES (12,'math',3),(13,'varzesh',3),(15,'science',3);
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'student'),(3,'prodessor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `f1_idx` (`user_id`),
  KEY `f2_idx` (`role_id`),
  CONSTRAINT `f1` FOREIGN KEY (`user_id`) REFERENCES `users` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (9,30,3),(10,31,2),(11,25,1),(12,28,2),(13,28,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `claim_professor` tinyint DEFAULT NULL,
  `claim_student` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'mehran','123',1,1),(17,'mehran','123',1,1),(18,'mehran','123',1,1),(19,'kobra','123',1,1),(20,'admin','123',1,0),(21,'ali','123',0,0),(22,'ahmadi','123',0,0),(23,'ehsan','123',0,0),(24,'alireza hosseini','$2a$10$IhGCMvwY0r.9F/vyK5dYX.5k8YCf9W2cPqyDWXHKBuBduzrRzIU5W',0,0),(25,'admin2','$2a$10$E4PhuX5uMgrOlxWLMGc2i.WYTBzKLI98zp76rs58TucQzCtaHr87S',0,0),(26,'reza akrami','$2a$10$A/ElEmib8TYVK6bHtEQggu3ojRmy0SM.v9dhzsbcF.qyHid3FjTka',0,0),(27,'mehran admin','$2a$10$KgJeW14q8YHnMUHikyYHsursZx4ElYYYmcKMeoAIbmsSq1/B3X2vi',0,0),(28,'mehran hamedani','$2a$10$0SL0.5jczjgqeYADJFOAr.WCP1AWbif8J/xAxsDfpkPXSgVVaUK46',0,1),(29,'mehran professor','$2a$10$bfjbdEPVBDsSGCGClTFDnukz/XU8xlBSuhPpBtkM2B3Kx5hIZXyfS',1,1),(30,'mitra','$2a$10$uwfTr8Y4qYhku2PZkgjcj.UmPqBfbKMi6AlEOUo/4ZZrT4TBuvadW',0,0),(31,'amir','$2a$10$iznaPDkB./gCatuWCHocBOxPyLixeQ0O6jyODe6wMxhpEo.q2djMG',0,0),(32,'hassan','$2a$10$rkPo7mbV4czNKrWApukTeuzpymv6rjfZbI0tKdgPchOXc8gPKieDi',0,0),(33,'hassani','$2a$10$4kLgu2qbWpRoap5i31oahOYGz6FrLpFbPXNiMFo/U5FKyA9H/fsYK',0,0),(34,'salar','$2a$10$39UEIbXnOcRkCcxwqeKJle6rel2Muj.08AwwiVKN8nRkTeznQg8ku',0,0),(35,'roham','$2a$10$rAGYZ4OGoAgm3SeNv.ufZ.esjyZzcHvGSui00/cpqFSdRjUa/25YS',1,0),(36,'masoud','$2a$10$tYyom2GYDwTUS6qSG9TFu.pne2xe4qwfbrgiud9zgORcoqYtIZMiO',1,0),(37,'soheil','$2a$10$XC9ng.LdU0Wb9fq8hzMYUetbV9LQP.e2cNgytq1VM0S6APjFl8bfy',1,0),(38,'shayan','$2a$10$c9vqx6nJuobM6ZSN33r3W.79HDHlVoq.c5bG0GLoDojHImIWFbmOG',0,1),(39,'mahshid','$2a$10$e0Jxrfcrfz63FeXMcgHcm..ENYuYsNrXk9kNXM.OG1yZhrGFw1XmO',0,1),(40,'mozhgan','$2a$10$44ujIEA70Z7Vjm2fS0N.HOn2v7Z0MHPm5VvLrbdybPr05jrcwZF1y',0,1),(41,'javad','$2a$10$TWB2NZdYh.PKCBr44GyNN.RlrL0GzgG.iIwxJ3qqVmsLYdxV8YY4q',1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_classes`
--

DROP TABLE IF EXISTS `users_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_classes` (
  `user_class_id` int NOT NULL,
  `class_id` int NOT NULL,
  `mark` int DEFAULT NULL,
  PRIMARY KEY (`user_class_id`,`class_id`),
  KEY `users_classes_f1_idx` (`class_id`),
  CONSTRAINT `users_classes_f1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_classes`
--

LOCK TABLES `users_classes` WRITE;
/*!40000 ALTER TABLE `users_classes` DISABLE KEYS */;
INSERT INTO `users_classes` VALUES (19,16,NULL),(19,17,NULL),(23,16,NULL),(31,19,NULL),(31,20,12);
/*!40000 ALTER TABLE `users_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `users_classes_view`
--

DROP TABLE IF EXISTS `users_classes_view`;
/*!50001 DROP VIEW IF EXISTS `users_classes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_classes_view` AS SELECT 
 1 AS `username`,
 1 AS `lesson_name`,
 1 AS `lesson_unit`,
 1 AS `class_number`,
 1 AS `capacity`,
 1 AS `class_time`,
 1 AS `class_id`,
 1 AS `mark`,
 1 AS `user_class_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `classes_view`
--

/*!50001 DROP VIEW IF EXISTS `classes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classes_view` AS select `users`.`username` AS `username`,`lessons`.`lesson_name` AS `lesson_name`,`lessons`.`lesson_unit` AS `lesson_unit`,`classes`.`class_number` AS `class_number`,`classes`.`capacity` AS `capacity`,`classes`.`class_time` AS `class_time`,`classes`.`class_id` AS `class_id` from ((`classes` join `users` on((`users`.`ID` = `classes`.`professor_id`))) join `lessons` on((`lessons`.`lesson_id` = `classes`.`lesson_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_classes_view`
--

/*!50001 DROP VIEW IF EXISTS `users_classes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_classes_view` AS select `users`.`username` AS `username`,`lessons`.`lesson_name` AS `lesson_name`,`lessons`.`lesson_unit` AS `lesson_unit`,`classes`.`class_number` AS `class_number`,`classes`.`capacity` AS `capacity`,`classes`.`class_time` AS `class_time`,`classes`.`class_id` AS `class_id`,`users_classes`.`mark` AS `mark`,`users_classes`.`user_class_id` AS `user_class_id` from (((`classes` join `users` on((`users`.`ID` = `classes`.`professor_id`))) join `lessons` on((`lessons`.`lesson_id` = `classes`.`lesson_id`))) join `users_classes` on((`classes`.`class_id` = `users_classes`.`class_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 20:25:12
