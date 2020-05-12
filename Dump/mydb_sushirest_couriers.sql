-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb_sushirest
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `couriers`
--

DROP TABLE IF EXISTS `couriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `couriers` (
  `courier_id` int(11) NOT NULL,
  `firtname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `phone` int(9) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `ident` varchar(45) NOT NULL,
  PRIMARY KEY (`courier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couriers`
--

LOCK TABLES `couriers` WRITE;
/*!40000 ALTER TABLE `couriers` DISABLE KEYS */;
INSERT INTO `couriers` VALUES (1,'Акгулим','Живодугов',331353325,'kudelich77@mail.ru','6682490916'),(2,'Белоцвета','Зорикоева',443303804,'ostre.kate@mail.ru','3923878763'),(3,'Георгиадис','Расшивалин',295100524,'olga000007@mail.ru','4422011517'),(4,'Ладарий','Ватенков',293452356,'zotkina2013@mail.ru','1958735139'),(5,'Феоктист','Липинский',339182341,'larabonya@mail.ru','5267418239'),(6,'Севастьян','Снайдин',448216353,'47anna3@mail.ru','9935113785'),(7,'Глориан','Остраменский',337483624,'zelenko87@mail.ru','3347950816'),(8,'Курбан','Буднин',337911586,'kia-ashiri@mail.ru','7359272101'),(9,'Евгений','Говрилов',448233353,'privet@mail.ru','2211929928'),(10,'Иван','Иванов',334454545,'123angek@gmail.com','2929929922'),(11,'Жульен','Михачев',443212345,'321drakula@bk.ru','2929929299'),(12,'Виталий','Стадочев',334564422,'www222.gmail.com','2299199119');
/*!40000 ALTER TABLE `couriers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-26  0:32:43
