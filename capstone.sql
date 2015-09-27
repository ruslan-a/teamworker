-- MySQL dump 10.13  Distrib 5.5.42, for osx10.6 (i386)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'test group');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `mainArea` varchar(30) DEFAULT NULL,
  `skills` varchar(30) DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `goal` double DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ruslan Abylkassov','ruslan.abylkassov@student.qut.edu.au','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-05',1,'web',NULL,NULL,NULL,NULL),(6,'Darius Franklin','gravida@congue.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-26',NULL,'business',NULL,NULL,NULL,NULL),(7,'Candice Foley','non@pedeCum.org',NULL,'1986-10-06',NULL,'business',NULL,NULL,NULL,NULL),(8,'Rae Vinson','metus@nonenim.ca',NULL,'1990-11-27',NULL,'web',NULL,NULL,NULL,NULL),(9,'Mari Maddox','Sed@ornareplacerat.edu',NULL,'1988-02-15',NULL,'leader',NULL,NULL,NULL,NULL),(10,'Beck Keller','laoreet.posuere@elitCurabitursed.net',NULL,'1990-02-27',NULL,'business',NULL,NULL,NULL,NULL),(11,'Gail Odom','vulputate@facilisisnonbibendum.co.uk',NULL,'1988-07-17',NULL,'business',NULL,NULL,NULL,NULL),(12,'Kaseem Davis','a.arcu.Sed@augue.edu',NULL,'1987-02-05',NULL,'business',NULL,NULL,NULL,NULL),(13,'Barclay Riley','venenatis.vel@lectuspedeultrices.co.uk',NULL,'1992-03-30',NULL,'leader',NULL,NULL,NULL,NULL),(14,'Zorita Boyer','et@eudui.com',NULL,'1988-11-08',NULL,'leader',NULL,NULL,NULL,NULL),(15,'Hayley West','ultrices.posuere.cubilia@montesnascetur.',NULL,'1986-12-05',NULL,'web',NULL,NULL,NULL,NULL),(16,'Declan Maldonado','nunc.sit.amet@ametconsectetuer.com',NULL,'1995-08-02',NULL,'code',NULL,NULL,NULL,NULL),(17,'Echo Collier','orci.consectetuer@sollicitudinorcisem.or',NULL,'1994-03-30',NULL,'leader',NULL,NULL,NULL,NULL),(18,'Warren Buchanan','scelerisque.sed@convallisligula.org',NULL,'1993-10-28',NULL,'code',NULL,NULL,NULL,NULL),(19,'Phoebe Barton','luctus.aliquet@orciUt.com',NULL,'1987-01-29',NULL,'code',NULL,NULL,NULL,NULL),(20,'Aline Owens','sagittis.Nullam.vitae@libero.ca',NULL,'1990-11-24',NULL,'business',NULL,NULL,NULL,NULL),(21,'Carter Hawkins','Quisque.ac.libero@Pellentesquehabitant.o',NULL,'1994-01-07',NULL,'code',NULL,NULL,NULL,NULL),(22,'Griffin Kirk','aliquet.odio.Etiam@semperauctorMauris.ca',NULL,'1993-11-17',NULL,'web',NULL,NULL,NULL,NULL),(23,'Ryder Mathis','enim@eleifendnecmalesuada.ca',NULL,'1995-11-26',NULL,'business',NULL,NULL,NULL,NULL),(24,'Rylee Carter','nunc.id@egetdictum.ca',NULL,'1991-12-19',NULL,'web',NULL,NULL,NULL,NULL),(25,'Nasim Hoffman','pellentesque@dolor.com',NULL,'1994-08-20',NULL,'web',NULL,NULL,NULL,NULL),(26,'Hoyt Burton','non.dapibus.rutrum@atpretium.ca',NULL,'1993-08-22',NULL,'business',NULL,NULL,NULL,NULL),(27,'Hannah Marks','at.velit.Cras@orci.net',NULL,'1991-04-02',NULL,'business',NULL,NULL,NULL,NULL),(28,'Keiko Rutledge','Vestibulum@libero.co.uk',NULL,'1995-01-29',NULL,'leader',NULL,NULL,NULL,NULL),(29,'Colton Mosley','Etiam.ligula@fermentumarcuVestibulum.edu',NULL,'1989-03-17',NULL,'business',NULL,NULL,NULL,NULL),(30,'Gage Foster','sapien.cursus@vulputateullamcorpermagna.',NULL,'1992-03-28',NULL,'business',NULL,NULL,NULL,NULL),(31,'Bradley Scott','Mauris@in.com',NULL,'1995-12-10',NULL,'code',NULL,NULL,NULL,NULL),(32,'Cedric Jenkins','Vivamus@disparturientmontes.ca',NULL,'1993-05-29',NULL,'business',NULL,NULL,NULL,NULL),(33,'Keane Dawson','libero.Donec.consectetuer@maurisidsapien',NULL,'1988-09-09',NULL,'web',NULL,NULL,NULL,NULL),(34,'Kim Meyers','sed.hendrerit@infaucibus.co.uk',NULL,'1995-09-13',NULL,'business',NULL,NULL,NULL,NULL),(35,'Gregory Harrell','enim.Etiam@liberoProin.com',NULL,'1987-05-18',NULL,'code',NULL,NULL,NULL,NULL),(42,'testy','ruslan@test.test','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','0000-00-00',NULL,'code','php,html,css',4.78,4.5,'im a test man'),(44,'','','e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL);
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

-- Dump completed on 2015-09-27 19:23:06
