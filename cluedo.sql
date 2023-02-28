-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: practice_cluedo
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `location_weapons`
--

DROP TABLE IF EXISTS `location_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_weapons` (
  `location_ID` int NOT NULL,
  `weapon_ID` int DEFAULT NULL,
  KEY `weapon_ID_idx` (`weapon_ID`),
  KEY `location_ID` (`location_ID`),
  CONSTRAINT `location_ID` FOREIGN KEY (`location_ID`) REFERENCES `locations` (`location_ID`),
  CONSTRAINT `weapon_ID` FOREIGN KEY (`weapon_ID`) REFERENCES `weapons` (`weapon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_weapons`
--

LOCK TABLES `location_weapons` WRITE;
/*!40000 ALTER TABLE `location_weapons` DISABLE KEYS */;
INSERT INTO `location_weapons` VALUES (1,2),(1,3),(2,5),(2,6),(3,1),(4,5),(4,6),(5,1),(5,3),(6,9),(7,1),(7,3),(7,8),(7,9),(8,1),(8,9),(9,1),(9,2),(9,3),(10,1),(10,5),(10,6);
/*!40000 ALTER TABLE `location_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_ID` int NOT NULL,
  `locations` text,
  PRIMARY KEY (`location_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'kitchen'),(2,'garden'),(3,'ballroom'),(4,'conservatory'),(5,'games room'),(6,'library'),(7,'study'),(8,'lounge'),(9,'dining room'),(10,'cellar');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `locationweapons`
--

DROP TABLE IF EXISTS `locationweapons`;
/*!50001 DROP VIEW IF EXISTS `locationweapons`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `locationweapons` AS SELECT 
 1 AS `locations`,
 1 AS `weapon`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `motive`
--

DROP TABLE IF EXISTS `motive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motive` (
  `suspect_ID` int NOT NULL,
  `relation_to_victim` varchar(45) DEFAULT NULL,
  `motive` varchar(45) DEFAULT NULL,
  KEY `suspect_ID_idx` (`suspect_ID`),
  CONSTRAINT `suspect_ID` FOREIGN KEY (`suspect_ID`) REFERENCES `suspect_details` (`suspect_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motive`
--

LOCK TABLES `motive` WRITE;
/*!40000 ALTER TABLE `motive` DISABLE KEYS */;
INSERT INTO `motive` VALUES (1,'lover','affair with professor plum'),(2,'nephew','inheritance'),(4,'neighbour','defrauded Mr. Black'),(5,'friend','secret war crimes'),(6,'adopted daughter','unknown'),(7,'housekeeper','in love with Colonel Mustard');
/*!40000 ALTER TABLE `motive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `murderweapon`
--

DROP TABLE IF EXISTS `murderweapon`;
/*!50001 DROP VIEW IF EXISTS `murderweapon`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `murderweapon` AS SELECT 
 1 AS `locations`,
 1 AS `weapon`,
 1 AS `title`,
 1 AS `surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professions` (
  `suspect_ID` int NOT NULL,
  `profession` text,
  `notes` text,
  KEY `suspect_ID_idx` (`suspect_ID`),
  CONSTRAINT `suspect_ID_2` FOREIGN KEY (`suspect_ID`) REFERENCES `suspect_details` (`suspect_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` VALUES (1,'socialite',''),(2,'psychiatrist',''),(3,'ornithologist',''),(4,'priest','reputation for fraud, money laundering and smuggling'),(5,'military','sleeps with revolver under his pillow'),(6,'plant toxicologist','expelled from Suiss private school for a near-fatal poisoning incident'),(7,'housekeeper and nanny','nanny to Mr. Black\'s nephew');
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspect_details`
--

DROP TABLE IF EXISTS `suspect_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspect_details` (
  `suspect_ID` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`suspect_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspect_details`
--

LOCK TABLES `suspect_details` WRITE;
/*!40000 ALTER TABLE `suspect_details` DISABLE KEYS */;
INSERT INTO `suspect_details` VALUES (1,'Miss ','Scarlett','07826463900',32,'female'),(2,'Professor ','Plum','07945618237',36,'male'),(3,'Mrs ','Peacock','07492678100',81,'female'),(4,'Reverend','Green','07256134723',76,'male'),(5,'Colonel','Mustard','07782134900',65,'male'),(6,'Dr ','Orchid','07834194500',28,'female'),(7,'Mrs ','White','07982123856',68,'female');
/*!40000 ALTER TABLE `suspect_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspect_locations`
--

DROP TABLE IF EXISTS `suspect_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspect_locations` (
  `suspect_ID` int DEFAULT NULL,
  `time` time NOT NULL DEFAULT '00:00:00',
  `location_ID` int DEFAULT NULL,
  KEY `suspect_ID_3_idx` (`suspect_ID`),
  KEY `location_ID_2_idx` (`location_ID`),
  KEY `time_idx` (`time`),
  CONSTRAINT `location_ID_2` FOREIGN KEY (`location_ID`) REFERENCES `locations` (`location_ID`),
  CONSTRAINT `suspect_ID_3` FOREIGN KEY (`suspect_ID`) REFERENCES `suspect_details` (`suspect_ID`),
  CONSTRAINT `time` FOREIGN KEY (`time`) REFERENCES `victim_locations` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspect_locations`
--

LOCK TABLES `suspect_locations` WRITE;
/*!40000 ALTER TABLE `suspect_locations` DISABLE KEYS */;
INSERT INTO `suspect_locations` VALUES (1,'12:00:00',9),(1,'20:00:00',6),(2,'14:00:00',5),(2,'20:00:00',6),(3,'12:00:00',9),(3,'16:30:00',6),(3,'18:00:00',2),(4,'14:30:00',5),(4,'16:00:00',8),(4,'18:30:00',6),(4,'19:30:00',9),(5,'14:30:00',5),(5,'16:00:00',8),(5,'18:30:00',6),(5,'19:30:00',9),(6,'12:00:00',9),(6,'13:30:00',2),(6,'14:00:00',4),(6,'16:30:00',6),(6,'18:00:00',2),(6,'20:00:00',8),(7,'12:00:00',9),(7,'13:45:00',1),(7,'14:00:00',5),(7,'14:30:00',1),(7,'15:30:00',10),(7,'16:00:00',8),(7,'19:30:00',9),(7,'20:00:00',8),(7,'22:00:00',6);
/*!40000 ALTER TABLE `suspect_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suspect_weapons`
--

DROP TABLE IF EXISTS `suspect_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suspect_weapons` (
  `suspect_ID` int DEFAULT NULL,
  `weapon_ID` int DEFAULT NULL,
  KEY `suspect_ID_4_idx` (`suspect_ID`),
  KEY `weapon_ID` (`weapon_ID`),
  CONSTRAINT `suspect_ID_4` FOREIGN KEY (`suspect_ID`) REFERENCES `suspect_details` (`suspect_ID`),
  CONSTRAINT `weapon_ID_2` FOREIGN KEY (`weapon_ID`) REFERENCES `weapons` (`weapon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suspect_weapons`
--

LOCK TABLES `suspect_weapons` WRITE;
/*!40000 ALTER TABLE `suspect_weapons` DISABLE KEYS */;
INSERT INTO `suspect_weapons` VALUES (1,8),(2,8),(5,4),(6,7),(6,8),(7,8);
/*!40000 ALTER TABLE `suspect_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `suspectweapons`
--

DROP TABLE IF EXISTS `suspectweapons`;
/*!50001 DROP VIEW IF EXISTS `suspectweapons`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `suspectweapons` AS SELECT 
 1 AS `title`,
 1 AS `surname`,
 1 AS `weapon`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `victim_details`
--

DROP TABLE IF EXISTS `victim_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victim_details` (
  `victim_ID` int NOT NULL,
  `first_name` text,
  `surname` text,
  `age` int DEFAULT NULL,
  `gender` text,
  `details` text,
  PRIMARY KEY (`victim_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victim_details`
--

LOCK TABLES `victim_details` WRITE;
/*!40000 ALTER TABLE `victim_details` DISABLE KEYS */;
INSERT INTO `victim_details` VALUES (12,'Samuel','Black',58,'male','Mansion Owner');
/*!40000 ALTER TABLE `victim_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `victim_locations`
--

DROP TABLE IF EXISTS `victim_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `victim_locations` (
  `victim_ID` int NOT NULL,
  `time` time NOT NULL,
  `location_ID` int DEFAULT NULL,
  `activity` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`time`),
  KEY `victim_ID_2_idx` (`victim_ID`),
  KEY `location_ID_3_idx` (`location_ID`),
  CONSTRAINT `location_ID_3` FOREIGN KEY (`location_ID`) REFERENCES `locations` (`location_ID`),
  CONSTRAINT `victim_ID_2` FOREIGN KEY (`victim_ID`) REFERENCES `victim_details` (`victim_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `victim_locations`
--

LOCK TABLES `victim_locations` WRITE;
/*!40000 ALTER TABLE `victim_locations` DISABLE KEYS */;
INSERT INTO `victim_locations` VALUES (12,'12:00:00',9,'lunch'),(12,'13:30:00',2,'walk'),(12,'13:45:00',2,'walk'),(12,'14:00:00',5,'cards'),(12,'14:30:00',5,'cards'),(12,'15:30:00',5,'cards'),(12,'16:00:00',7,'work'),(12,'16:30:00',NULL,''),(12,'18:00:00',NULL,''),(12,'18:30:00',NULL,''),(12,'19:30:00',NULL,''),(12,'20:00:00',NULL,''),(12,'22:00:00',6,'found dead');
/*!40000 ALTER TABLE `victim_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weapons` (
  `weapon_ID` int NOT NULL,
  `weapon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`weapon_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
INSERT INTO `weapons` VALUES (1,'candlestick'),(2,'knife'),(3,'lead pipe'),(4,'revolver'),(5,'rope'),(6,'wrench'),(7,'poison'),(8,'medication'),(9,'paperweight');
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `whodunnit`
--

DROP TABLE IF EXISTS `whodunnit`;
/*!50001 DROP VIEW IF EXISTS `whodunnit`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `whodunnit` AS SELECT 
 1 AS `locations`,
 1 AS `time`,
 1 AS `title`,
 1 AS `surname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'practice_cluedo'
--
/*!50003 DROP FUNCTION IF EXISTS `arrest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `arrest`(s CHAR(50)) RETURNS char(100) CHARSET utf8mb4
    DETERMINISTIC
RETURN CONCAT('Arrest, ',s,'!') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `guilty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `guilty`(time TIME(6), timeofdeath TIME(6)) RETURNS varchar(11) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE guilt VARCHAR(11);
    SET @return_value = 'GUILTY' ;
    IF (time <timeofdeath OR time > timeofdeath) THEN SET guilt = 'NOT GUILTY';
    ELSEIF (time = timeofdeath) THEN SET guilt = 'GUILTY';
    END IF;
	RETURN (guilt);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `room` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `room`(locationID INT) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN 
DECLARE location VARCHAR(20);
    IF locationID = 1 THEN SET location = 'KITCHEN';
	ELSEIF locationID = 2 THEN SET location = 'GARDEN';
    ELSEIF locationID = 3 THEN SET location='BALLROOM';
    ELSEIF locationID = 4 THEN SET location='CONSERVATORY';
	ELSEIF locationID = 5 THEN SET location='GAMES ROOM';
	ELSEIF locationID = 6 THEN SET location='LIBRARY';
	ELSEIF locationID = 7 THEN SET location='STUDY';
	ELSEIF locationID = 8 THEN SET location='LOUNGE'; 
    ELSEIF locationID = 9 THEN SET location='DINING ROOM';
    ELSEIF locationID = 10 THEN SET location='CELLAR';
    END IF; 
    RETURN (location);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `located` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `located`(IN activity VARCHAR(20), OUT location VARCHAR(20))
BEGIN
  SELECT v.location_ID
  FROM victim_locations v
  WHERE activity = v.activity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `locationweapons`
--

/*!50001 DROP VIEW IF EXISTS `locationweapons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `locationweapons` AS select `l`.`locations` AS `locations`,`w`.`weapon` AS `weapon` from ((`locations` `l` join `location_weapons` `q` on((`q`.`location_ID` = `l`.`location_ID`))) join `weapons` `w` on((`w`.`weapon_ID` = `q`.`weapon_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `murderweapon`
--

/*!50001 DROP VIEW IF EXISTS `murderweapon`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `murderweapon` AS select `l`.`locations` AS `locations`,`w`.`weapon` AS `weapon`,`t`.`title` AS `title`,`t`.`surname` AS `surname` from (((`weapons` `w` left join (`location_weapons` `z` left join `locations` `l` on((`z`.`location_ID` = `l`.`location_ID`))) on((`w`.`weapon_ID` = `z`.`weapon_ID`))) left join `suspect_weapons` `s` on((`s`.`weapon_ID` = `w`.`weapon_ID`))) left join `suspect_details` `t` on((`t`.`suspect_ID` = `s`.`suspect_ID`))) where ((`l`.`location_ID` = 6) or (`t`.`title` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `suspectweapons`
--

/*!50001 DROP VIEW IF EXISTS `suspectweapons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `suspectweapons` AS select `t`.`title` AS `title`,`t`.`surname` AS `surname`,`w`.`weapon` AS `weapon` from ((`weapons` `w` join `suspect_weapons` `z` on((`z`.`weapon_ID` = `w`.`weapon_ID`))) join `suspect_details` `t` on((`t`.`suspect_ID` = `z`.`suspect_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `whodunnit`
--

/*!50001 DROP VIEW IF EXISTS `whodunnit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `whodunnit` AS select `l`.`locations` AS `locations`,`s`.`time` AS `time`,`t`.`title` AS `title`,`t`.`surname` AS `surname` from ((`locations` `l` join `suspect_locations` `s` on((`s`.`location_ID` = `l`.`location_ID`))) join `suspect_details` `t` on((`t`.`suspect_ID` = `s`.`suspect_ID`))) where ((`s`.`location_ID` = 6) and (`s`.`time` > 160000)) order by `s`.`time` */;
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

-- Dump completed on 2022-02-08 13:07:38
