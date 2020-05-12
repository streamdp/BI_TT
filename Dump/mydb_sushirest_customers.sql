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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `phone` int(9) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `street_id` int(11) NOT NULL,
  `homeNum` varchar(5) NOT NULL,
  `apartmentsNum` int(11) DEFAULT NULL,
  `district_id` int(11) NOT NULL,
  `commentCourier_id` int(11) DEFAULT NULL,
  `reviewCourier_id` int(11) DEFAULT NULL,
  `reviewKitchen_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customers_district_idx` (`district_id`),
  KEY `customers_street_idx` (`street_id`),
  KEY `customers_reviewC_idx` (`reviewCourier_id`),
  KEY `customers_reviewK_idx` (`reviewKitchen_id`),
  CONSTRAINT `customers_districtFK` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customers_streetFK` FOREIGN KEY (`street_id`) REFERENCES `streets` (`street_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Александр','Примак',335328752,'primak.aa@gmail.com',2,'23',34,1,NULL,NULL,NULL),(2,'Адилаида','Стелюк',331892193,'mel.mel.1983@list.ru',1,'66',2,1,NULL,NULL,NULL),(3,'Маромиса','Хлюсшина',334511124,'zhulego.93@mail.ru',1,'56',24,1,NULL,NULL,NULL),(4,'Теодос','Граховский',297513388,'tylla-1995@mail.ru',2,'144',46,1,NULL,NULL,NULL),(5,'Шеррунда','Иорудас',299413368,'carun-195@mail.ru',11,'52',21,3,NULL,NULL,NULL),(6,'Паубло','Ларчев',295371544,'malah_arsenalfan@mail.ru',13,'95',62,4,NULL,NULL,NULL),(7,'Шахабыз','Летов',335459175,'vkalita70@mail.ru',6,'76',90,2,NULL,NULL,NULL),(8,'Евтрудия','Бедринская',337727212,'onenn@mail.ru',9,'102',71,3,NULL,NULL,NULL),(9,'Эдэлина','Рассудимова',291347409,'alkagolik.is.bresta@mail.ru',5,'101',29,2,NULL,NULL,NULL),(10,'Татуся','Окшина',331086555,'evnikden@mail.ru',6,'147',52,2,NULL,NULL,NULL),(11,'Наил','Вострилов',448003934,'bondarevasveta2010@mail.ru',8,'91',56,2,NULL,NULL,NULL),(12,'Тиррза','Кудайбергенов',295599431,'charm125@mail.ru',3,'107',65,1,NULL,NULL,NULL),(13,'Полинарий','Голомазов',291352556,'tatarinova-ira@mail.ru',1,'139',60,1,NULL,NULL,NULL),(14,'Низаютдин','Пошехнов',334925461,'vecher.k@mail.ru',11,'148',37,3,NULL,NULL,NULL),(15,'Трефена','Бухолдин',442327995,'inna_chesnakova@mail.ru',6,'121',80,2,NULL,NULL,NULL),(16,'Туркназ','Семиладнова',296030656,'68-viktor@mail.ru',4,'59',59,1,NULL,NULL,NULL),(17,'Жержета','Рошмакова',296731482,'evgeniy.mamyko.88@mail.ru',10,'127',26,3,NULL,NULL,NULL),(18,'Заава','Баймухамбетов',331964979,'diana19096@mail.ru',5,'122',5,2,NULL,NULL,NULL),(19,'Майслав','Фатюшкин',336715776,'bu152@mail.ru',13,'55',15,4,NULL,NULL,NULL),(20,'Рикко','Лдобачев',447813370,'egor.bozhenko@mail.ru',4,'138',100,1,NULL,NULL,NULL),(21,'Иренинья','Маган',441509574,'galina.lukashevich@list.ru',9,'72',77,3,NULL,NULL,NULL),(22,'Созия','Урушкина',336450254,'victor0619@bk.ru',2,'143',84,1,NULL,NULL,NULL),(23,'Ильдусь','Дынич',338187661,'vasyashca@mail.ru',7,'86',17,2,NULL,NULL,NULL),(24,'Раисса','Ананичев',331018372,'alekx03andr@mail.ru',3,'53',54,1,NULL,NULL,NULL),(25,'Николка','Ветошенкова',442510130,'gricenya57@mail.ru',2,'85',72,1,NULL,NULL,NULL),(26,'Лайт','Рабеев',337320217,'slopankov@mail.ru',9,'67',55,3,NULL,NULL,NULL),(27,'Саския','Живодугова',294443457,'harli@bk.ru',5,'142',95,2,NULL,NULL,NULL),(28,'Яния','Зорикоев',335687616,'7614277@mail.ru',4,'115',36,1,NULL,NULL,NULL),(29,'Фархизиян','Расшивалина',334070898,'mikshta326@mail.ru',8,'54',76,2,NULL,NULL,NULL),(30,'Растислава','Ватенков',333886564,'sagan64@mail.ru',7,'109',25,2,NULL,NULL,NULL),(31,'Акеаина','Липинский',298493054,'shabanvera@mail.ru',11,'92',47,3,NULL,NULL,NULL),(32,'Адверд','Снайдин',448439371,'mesnik0077@mail.ru',8,'135',85,2,NULL,NULL,NULL),(33,'Эсди','Остраменский',443305284,'maksimovichnv@mail.ru',12,'132',50,3,NULL,NULL,NULL),(34,'Клеофас','Буднина',446610938,'e.salenik@mail.ru',13,'150',86,4,NULL,NULL,NULL),(35,'Еркемен','Скобеева',299511924,'lastohka1986@mail.ru',10,'89',45,3,NULL,NULL,NULL),(36,'Герасим','Иссерлис',332627901,'danekoff@mail.ru',3,'88',30,1,NULL,NULL,NULL),(37,'Рамих','Юриков',336255687,'lida_0881@mail.ru',12,'137',19,3,NULL,NULL,NULL),(38,'Наушат','Брычихин',447654760,'muv.yuliya@mail.ru',12,'119',81,3,NULL,NULL,NULL),(39,'Кажыр','Жеребецкая',444808932,'olgas_2307@mail.ru',10,'124',23,3,NULL,NULL,NULL),(40,'Алатавнех','Литовка',448121949,'aleks-sered@mail.ru',7,'136',96,2,NULL,NULL,NULL),(41,'Оуби','Эмильев',337026313,'marisha82-1@mail.ru',8,'60',38,2,NULL,NULL,NULL),(42,'Афтон','Чихачев',295112764,'tatjana_juchno@mail.ru',12,'145',12,3,NULL,NULL,NULL),(43,'Луи','Пядышева',337620383,'enya.09@mail.ru',13,'70',91,4,NULL,NULL,NULL),(44,'Еврений','Смолихин',442878644,'lyubov_kobylyane@mail.ru',10,'77',83,3,NULL,NULL,NULL),(45,'Дрюндель','Чинарихин',449634636,'maksimenkova-a@mail.ru',3,'58',78,1,NULL,NULL,NULL),(46,'Махида','Брайцев',445543914,'ozatdjon@mail.ru',12,'68',34,3,NULL,NULL,NULL),(47,'Бронко','Мищеров',295594474,'bestvictor@mail.ru',12,'133',67,3,NULL,NULL,NULL),(48,'Антипа','Прухникова',331740700,'yorec2009@mail.ru',10,'63',61,3,NULL,NULL,NULL),(49,'Карлыгаш','Кабанцева',331529495,'znacomic@mail.ru',7,'69',69,2,NULL,NULL,NULL),(50,'Унсая','Цомирова',295383581,'vipsalon@mail.ru',9,'129',68,3,NULL,NULL,NULL),(51,'Сагипат','Бартницкая',443354905,'zhenka345@mail.ru',2,'57',40,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
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
