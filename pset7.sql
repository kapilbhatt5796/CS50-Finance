-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: pset7
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(10) NOT NULL,
  `transaction` varchar(8) NOT NULL,
  `symbol` varchar(8) NOT NULL,
  `shares` int(10) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (12,'Buy','FB',10,111,'0000-00-00 00:00:00'),(12,'Buy','FB',10,111,'0000-00-00 00:00:00'),(12,'Sold','FB',10,111,'0000-00-00 00:00:00'),(14,'Bought','FB',20,111,'0000-00-00 00:00:00'),(14,'Sold','FB',20,111,'0000-00-00 00:00:00'),(14,'Bought','FB',20,111,'0000-00-00 00:00:00'),(15,'Bought','FB',50,111,'0000-00-00 00:00:00'),(16,'Bought','FB',50,111,'2016-03-18 05:52:53'),(16,'Bought','FB',50,111,'2016-03-18 05:53:14'),(16,'Sold','FB',50,111,'2016-03-18 05:55:04'),(16,'Bought','FB',50,111,'2016-03-18 06:01:29'),(16,'Bought','FB',50,111,'2016-03-18 06:03:17'),(16,'Bought','FB',10,111,'2016-03-18 06:07:23'),(16,'Bought','FB',10,111,'2016-03-18 06:07:53'),(16,'Bought','FB',10,111,'2016-03-18 06:08:16'),(17,'Bought','FB',5000,111,'2016-03-18 06:11:14'),(17,'Bought','FB',50,111,'2016-03-18 06:11:44'),(17,'Bought','FB',50,111,'2016-03-18 06:12:44'),(17,'Bought','FB',50,111,'2016-03-18 06:12:58'),(17,'','FB',50,111,'2016-03-18 06:21:43'),(17,'Sold','FB',5000,111,'2016-03-18 06:22:40'),(18,'','FB',50,111,'2016-03-18 06:23:03'),(18,'','FB',50,111,'2016-03-18 06:23:11'),(18,'Bought','FB',100,111,'2016-03-18 06:24:54'),(18,'Sold','FB',50,111,'2016-03-18 06:28:20'),(18,'Sold','FB',50,111,'2016-03-18 06:28:27'),(18,'Sold','FB',100,111,'2016-03-18 06:28:33');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `id` int(16) NOT NULL AUTO_INCREMENT,
  `user_id` int(16) NOT NULL,
  `symbol` varchar(20) NOT NULL,
  `shares` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (17,14,'FB',20),(18,15,'FB',50),(21,16,'FB',50),(22,16,'FB',50),(23,16,'FB',10),(24,16,'FB',10),(25,16,'FB',10),(27,17,'FB',50),(28,17,'FB',50),(29,17,'FB',50),(30,17,'FB',50),(31,17,'FB',50),(32,17,'FB',50);
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `cash` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'andi','$2y$10$c.e4DK7pVyLT.stmHxgAleWq4yViMmkwKz3x8XCo4b/u3r8g5OTnS',0),(2,'caesar','$2y$10$0p2dlmu6HnhzEMf9UaUIfuaQP7tFVDMxgFcVs0irhGqhOxt6hJFaa',0),(3,'eli','$2y$10$COO6EnTVrCPCEddZyWeEJeH9qPCwPkCS0jJpusNiru.XpRN6Jf7HW',0),(4,'hdan','$2y$10$o9a4ZoHqVkVHSno6j.k34.wC.qzgeQTBHiwa3rpnLq7j2PlPJHo1G',0),(5,'jason','$2y$10$ci2zwcWLJmSSqyhCnHKUF.AjoysFMvlIb1w4zfmCS7/WaOrmBnLNe',0),(6,'john','$2y$10$dy.LVhWgoxIQHAgfCStWietGdJCPjnNrxKNRs5twGcMrQvAPPIxSy',0),(7,'levatich','$2y$10$fBfk7L/QFiplffZdo6etM.096pt4Oyz2imLSp5s8HUAykdLXaz6MK',0),(8,'rob','$2y$10$3pRWcBbGdAdzdDiVVybKSeFq6C50g80zyPRAxcsh2t5UnwAkG.I.2',0),(9,'skroob','$2y$10$395b7wODm.o2N7W5UZSXXuXwrC0OtFB17w4VjPnCIn/nvv9e4XUQK',0),(10,'zamyla','$2y$10$UOaRF0LGOaeHG4oaEkfO4O7vfI34B1W23WqHr9zCpXL68hfQsS3/e',0),(11,'kapil','$2y$10$hl1XPbqLbXPgQ2zDt/0nT.QpOxnsW9JnLiRFnPkiYqANiRyha0.XS',10000),(12,'kapil1','$2y$10$FW4ORBw0UW3YFavLNfIP3OQ0Kj0E6ZXsubire3RV80H7FT3PtaFuy',7780),(13,'kapil12','$2y$10$E/wcoKgiMBZ17RhkGfsB8uHK3VXmdioEPc6V5ozEeNBuiVOY3J69G',10000),(14,'kapilbhatt5796','$2y$10$ClxGVb/tfMo0ODsIeCdMLOtfHDy74vUUPyS4U.4Qk5laHf2IzZUTu',7780),(15,'kk','$2y$10$G.uCSzhauD0p2W.exwQa/e8mCqrsBQSR2smmESGrkvoJGKxBaOXHm',4449),(16,'k1','$2y$10$aG9ikQ55HpU9H/x9/hv0LO/HQJv3J9RgqreZWG1xgpZy7cVmkJSTi',-9983),(17,'kkk','$2y$10$QJczLgufCs8yaWdx.dwgX.Fe3/wkJgb5m567Mdjkb5WP3RTy8jo4G',-23306),(18,'aa','$2y$10$RUB7Dfv44agoD.OhGpE4/uJ9kKC8qP0AjFkvzauPy4rukUHHOapay',10000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-18  6:38:23
