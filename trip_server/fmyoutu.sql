-- MySQL dump 10.13  Distrib 5.6.25, for osx10.10 (x86_64)
--
-- Host: localhost    Database: fmyoutu
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `t_id` int(11) NOT NULL,
  `l_created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `l_created_by` varchar(50) DEFAULT NULL,
  `l_updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `l_updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`l_id`),
  KEY `u_id` (`u_id`),
  KEY `t_id` (`t_id`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE,
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `trips` (`t_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,1,2,'2018-01-06 22:25:25',NULL,'2018-01-06 22:25:25',NULL),(2,1,4,'2018-01-06 22:25:36',NULL,'2018-01-06 22:25:36',NULL),(3,1,1,'2018-01-06 22:58:43',NULL,'2018-01-06 22:58:43',NULL);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_from` int(11) NOT NULL,
  `n_to` int(11) NOT NULL,
  `n_type` int(11) NOT NULL,
  `n_content` text,
  `n_created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `n_created_by` varchar(50) DEFAULT NULL,
  `n_updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `n_updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,2,1,1,'San Diego','2018-01-07 18:55:15','miwangyao','2018-01-07 21:09:56','miwangyao'),(2,1,1,1,'3','2018-01-07 21:13:51','miwangyao','2018-01-07 21:14:29',NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `t_id` int(11) NOT NULL,
  `u_id` int(11) NOT NULL,
  `t_view` int(11) DEFAULT NULL,
  `t_title` varchar(255) NOT NULL,
  `t_content` text NOT NULL,
  `t_pic1` varchar(255) DEFAULT NULL,
  `t_pic2` varchar(255) DEFAULT NULL,
  `t_pic3` varchar(255) DEFAULT NULL,
  `t_pic4` varchar(255) DEFAULT NULL,
  `t_pic5` varchar(255) DEFAULT NULL,
  `t_pic6` varchar(255) DEFAULT NULL,
  `t_pic7` varchar(255) DEFAULT NULL,
  `t_pic8` varchar(255) DEFAULT NULL,
  `t_pic9` varchar(255) DEFAULT NULL,
  `t_location` varchar(50) DEFAULT NULL,
  `t_created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_created_by` varchar(50) DEFAULT NULL,
  `t_updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `t_updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,1,3,'San Diego','这座拥有两艘航母的美国海港城市. 干净的街道和开阔的视野, 着实让人不想开','http://o99spo2ev.bkt.clouddn.com/images/big/21/1486849267511.JPG','http://o99spo2ev.bkt.clouddn.com/images/big/21/1486849313609.JPG','http://o99spo2ev.bkt.clouddn.com/images/big/21/1486849390165.JPG',NULL,NULL,NULL,NULL,NULL,NULL,'美国','2018-01-06 18:08:11',NULL,'2018-01-06 18:08:11',NULL),(2,1,3,'伦敦的黄昏','Sunset is so beautiful! 最爱的是British accent. 走在大街上环顾四周穿梭于行人之中，说着一口流利的British accent, 好不惬意.','http://o99spo2ev.bkt.clouddn.com/images/big/21/1484990405920.JPG','http://o99spo2ev.bkt.clouddn.com/images/big/21/1484990430833.JPG','http://o99spo2ev.bkt.clouddn.com/images/big/21/1484990491353.JPG',NULL,NULL,NULL,NULL,NULL,NULL,'英国','2018-01-06 18:16:23',NULL,'2018-01-06 18:16:23',NULL),(3,1,37,'北欧风情古都','白雪覆盖的哥本哈根. 沿街的罗马式建筑, 雄伟壮观的基督教堂. 海明威的美人鱼. 赞不','http://o99spo2ev.bkt.clouddn.com/images/big/21/1483346934868.JPG','http://o99spo2ev.bkt.clouddn.com/images/big/21/1483346976696.JPG','http://o99spo2ev.bkt.clouddn.com/images/big/21/1483347021645.JPG',NULL,NULL,NULL,NULL,NULL,NULL,'丹麦','2018-01-06 18:19:25',NULL,'2018-01-06 18:19:25',NULL),(4,1,12,'不在的广场','加德满都, 杜巴广场','http://o99spo2ev.bkt.clouddn.com/images/small/47/1474806207636.jpeg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'丹麦','2018-01-06 18:22:11',NULL,'2018-01-06 18:22:11',NULL);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(50) NOT NULL,
  `u_avatar` varchar(255) DEFAULT NULL,
  `u_gender` int(11) DEFAULT NULL,
  `u_province` varchar(25) DEFAULT NULL,
  `u_city` varchar(25) DEFAULT NULL,
  `u_country` varchar(25) DEFAULT NULL,
  `u_level` int(10) DEFAULT NULL,
  `u_phone` varchar(50) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_pwd` varchar(255) DEFAULT NULL,
  `u_created_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_created_by` varchar(50) DEFAULT NULL,
  `u_updated_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `u_updated_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_name` (`u_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'miwangyao','http://o99spo2ev.bkt.clouddn.com/images/mini/21/1472264266086.jpeg',0,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-06 18:07:46',NULL,'2018-01-06 18:07:46','miwangyao');
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

-- Dump completed on 2018-01-08 23:11:00
