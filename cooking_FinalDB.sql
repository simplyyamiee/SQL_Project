CREATE DATABASE  IF NOT EXISTS `cooking_project` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cooking_project`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: cooking_project
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendanceID` int NOT NULL,
  `classID` int NOT NULL,
  `participantID` int NOT NULL,
  `AttendanceDate` datetime DEFAULT NULL,
  `Status` varchar(55) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`attendanceID`),
  KEY `fk_classID_idx` (`classID`),
  KEY `fk_participantID_idx` (`participantID`),
  CONSTRAINT `fk_classID` FOREIGN KEY (`classID`) REFERENCES `classes` (`ClassID`),
  CONSTRAINT `fk_participantID` FOREIGN KEY (`participantID`) REFERENCES `participant` (`ParticipantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (300,103,1247,'2024-02-22 18:15:00','Attended'),(303,102,1789,'2024-02-14 17:00:00','Attended'),(306,101,1789,'2024-02-05 15:30:00','Attended'),(309,103,1983,'2024-02-22 18:15:00','Did Not Attend'),(312,101,2075,'2024-02-05 15:30:00','Attended'),(315,104,3158,'2024-02-14 15:45:00','Attended'),(318,103,3762,'2024-02-22 18:15:00','Attended'),(321,101,4319,'2024-02-05 15:30:00','Attended'),(324,105,4319,'2024-02-29 20:00:00','Attended'),(327,101,4906,'2024-02-05 15:30:00','Attended'),(330,104,5190,'2024-02-14 15:45:00','Attended'),(333,105,5723,'2024-02-29 20:00:00','Attended'),(336,104,6321,'2024-02-14 15:45:00','Attended'),(339,105,6453,'2024-02-29 20:00:00','Attended'),(342,103,6842,'2024-02-22 18:15:00','Attended'),(345,101,6934,'2024-02-05 15:30:00','Did Not Attend'),(348,102,6934,'2024-02-14 17:00:00','Attended'),(351,104,6934,'2024-02-14 15:45:00','Attended'),(354,102,7542,'2024-02-14 17:00:00','Did Not Attend'),(357,104,7542,'2024-02-14 15:45:00','Attended'),(360,102,8461,'2024-02-14 17:00:00','Attended'),(363,102,9246,'2024-02-14 17:00:00','Attended'),(366,105,9274,'2024-02-29 20:00:00','Attended'),(369,101,9274,'2024-02-05 15:30:00','Did Not Attend');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `ClassID` int NOT NULL,
  `ClassName` text COLLATE utf8mb3_unicode_ci,
  `Dish Name` text COLLATE utf8mb3_unicode_ci,
  `Schedule` text COLLATE utf8mb3_unicode_ci,
  `LocationID` int NOT NULL,
  `Capacity` int DEFAULT NULL,
  `InstructorID` int DEFAULT NULL,
  PRIMARY KEY (`ClassID`),
  KEY `LocationID_idx` (`LocationID`),
  KEY `LocationID` (`LocationID`),
  KEY `fk_instructorID_idx` (`InstructorID`),
  CONSTRAINT `fk_instructorID` FOREIGN KEY (`InstructorID`) REFERENCES `instructor` (`InstructorID`),
  CONSTRAINT `fk_LocationID` FOREIGN KEY (`LocationID`) REFERENCES `location` (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (101,'A Greek Feast','Moussaka','2024-02-05 15:30I:00',215,10,8763),(102,'Passionate Pasta Pairing: The Art of Cooking Together','HomeMade Cheese Ravioli with Ricotta','2024-02-14 17:0I:00',712,8,5896),(103,'A Taste of Morocco','Lamb Tagine with Green Olives and Lemon','2024-02-22 18:15I:00',624,5,1247),(104,'Flavors of Self-Love: Solo Cooking with West African Flair','Jollof Rice and Suya Skewers','2024-02-14 15:45I:00',303,6,4302),(105,'Baking Fun for Sweet Tooths','French Macaron','2024-02-29 20:0I:00',303,10,8763);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `classingredientswithlocation`
--

DROP TABLE IF EXISTS `classingredientswithlocation`;
/*!50001 DROP VIEW IF EXISTS `classingredientswithlocation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classingredientswithlocation` AS SELECT 
 1 AS `ingredientID`,
 1 AS `IngredientName`,
 1 AS `Quantity`,
 1 AS `Unit`,
 1 AS `Description`,
 1 AS `classID`,
 1 AS `schedule`,
 1 AS `Address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `IngredientID` int NOT NULL,
  `IngredientName` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Quantity` bigint DEFAULT NULL,
  `Unit` text COLLATE utf8mb3_unicode_ci,
  `Description` text COLLATE utf8mb3_unicode_ci,
  `ClassID` int NOT NULL,
  PRIMARY KEY (`IngredientID`),
  KEY `fk_classesID_idx` (`ClassID`),
  CONSTRAINT `fk_classesID` FOREIGN KEY (`ClassID`) REFERENCES `classes` (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'whole milk',1,'cup','',102),(4,'fresh basil',2,'tsp','',102),(5,'flour',400,'g','',102),(6,'eggs',4,'','large eggs',102),(7,'tomato sauce',8,'0z','or sauce as desired',102),(9,'lemon',1,'','zest',103),(10,'saffron',1,'','threads, crumbled',103),(11,'lambs',4,'lbs','boneless',103),(12,'carrots',6,'','large eggs',103),(13,'onion',1,'','yellow onion',103),(14,'cilantro',1,'cup','',103),(15,'garlic',5,'','',103),(16,'beef',500,'g','steaks',104),(17,'peanut sauce',2,'tbsp','',104),(18,'suya',2,'tbsp','',104),(20,'scotch bonnet peppers',2,'','a.k.a habanero peppers',104),(21,'tomato paste',3,'tbsp','',104),(22,'parboiled rice',2,'cups','',104),(23,'chicken stock',3,'cups','',104),(24,'Knorr stock cube',1,'','',104),(25,'bay leaves',3,'','',104),(26,'parmesan cheese',2,'tbsp','',101),(27,'egg plant',2,'','large',101),(29,'onion',1,'','',101),(30,'garlic',4,'','',101),(31,'beef',1,'lbs','',101),(32,'tomato paste',2,'tbsp','',101),(34,'butter',4,'','',101),(35,'flour',4,'tbsp','',101),(36,'milk',2,'cup','',101),(38,'egg',2,'','',101);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `InstructorID` int NOT NULL,
  `InstructorName` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`InstructorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES (1247,'Chef Amir','Amir@hotmail.com'),(3729,'Chef Kim','Kim.CulinaryExpert@gmail.com'),(4302,'Chef Aisha','Aisha.CulinaryPro@yahoo.com'),(5896,'Chef Olivier','Olivier.GourmetMaster@yahoo.com'),(8763,'Chef Katsaros','Katsaros.Chef@gmail.com');
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `LocationID` int NOT NULL,
  `LocationName` text COLLATE utf8mb3_unicode_ci,
  `Address` text COLLATE utf8mb3_unicode_ci,
  `Capacity` int DEFAULT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (215,'Harborview Cooking Center','123 Broadway, New York, NY',10),(303,'Urban Kitchen Studio','456 5th Avenue, New York, NY',6),(624,'Central Park Culinary Studio','890 Central Park West, New York, NY',8),(712,'City Culinary Loft','789 Lexington Ave, New York, NY',6);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `ParticipantID` int NOT NULL,
  `ParticipantFirstName` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ParticipantLastName` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Email` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `DietaryPreferences` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`ParticipantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES (1247,'Inaya','Villanueva','Inaya.CulinaryEnthusiast@gmail.com','Vegan'),(1789,'Howard','Edwards','IndustryLeader14@yahoo.com',''),(1983,'Zahra','Dunlap','Zahra.Dunlap@gmail.com','Pescatarian'),(2075,'Ivan','Gill','FlavorfulDreamer18@gmail.com','Plant-Based'),(3158,'Selina','Sawyer','Selina.Sawyer@hotmail.com','Plant-Based'),(3762,'Peggy','Warner','Peggy.TasteTrailblazer@yahoo.com','Plant-Based'),(4319,'Jason','Guzman','SavoryJourney88@yahoo.com','Organic'),(4906,'May','Wall','May.Wall@gmail.com',''),(5190,'Elise','Casey','Elise.SavorMaster@msn.com',''),(5723,'Gabriel','Cervantes','BusinessMaven68@hotmail.com',''),(6321,'Malaika','Rowe','Malaika.Rowe@yahoo.com','Nut-Free'),(6453,'Lawson','Clark','CreativeThinker91@gmail.com','Kosher'),(6842,'Issac','Moon','Issac.Moon@gmail.com','Halal'),(6934,'Malika','Carter','GourmetAdventures42@hotmail.com',''),(7542,'Liberty','Padilla','Liberty.Padilla@msn.com','Dairy-Free'),(8461,'Constance','Park','TechSavvyExpert36@yahoo.com','Dairy-Free'),(9246,'Millie','Mills','VisionaryStrategist29@hotmail.com','Vegan'),(9274,'Warren','Christensen','Warren.Christensen@yahoo.com','');
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `classingredientswithlocation`
--

/*!50001 DROP VIEW IF EXISTS `classingredientswithlocation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classingredientswithlocation` AS select `i`.`IngredientID` AS `ingredientID`,`i`.`IngredientName` AS `IngredientName`,`i`.`Quantity` AS `Quantity`,`i`.`Unit` AS `Unit`,`i`.`Description` AS `Description`,`c`.`ClassID` AS `classID`,`c`.`Schedule` AS `schedule`,`l`.`Address` AS `Address` from ((`ingredients` `i` join `classes` `c` on((`i`.`ClassID` = `c`.`ClassID`))) join `location` `l` on((`c`.`LocationID` = `l`.`LocationID`))) group by `i`.`IngredientID`,`i`.`IngredientName`,`i`.`Quantity`,`i`.`Unit`,`i`.`Description` order by `c`.`Schedule` */;
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

-- Dump completed on 2024-01-30  1:18:56
