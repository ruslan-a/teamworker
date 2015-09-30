# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: capstone
# Generation Time: 2015-09-30 05:18:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` mediumtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `description`)
VALUES
	(1,'test group',NULL),
	(2,'cool dog group','we\'re cool'),
	(6,'cool cat group','we super cool'),
	(8,'cool bird group','we like them'),
	(9,'asdfasdf','asdfasdf'),
	(10,'cool man group','not really that cool'),
	(12,'not cool group','at all');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `content` longtext,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `groupId`, `userId`, `content`, `timestamp`)
VALUES
	(2,1,1,'hi this coding thing is kinda hard :/','2015-09-29 09:29:38'),
	(3,1,42,'hello world this is me\n','2015-09-29 09:48:02'),
	(4,12,1,'hello ass','2015-09-30 03:41:00'),
	(8,12,1,'hi hi hi','2015-09-30 03:47:37'),
	(9,12,1,'WOWie','2015-09-30 03:47:41');

/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permissions` int(11) NOT NULL DEFAULT '1',
  `currentGroup` int(11) DEFAULT '0',
  `groupLeader` tinyint(1) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mainArea` varchar(30) DEFAULT NULL,
  `skills` varchar(30) DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `goal` double DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `permissions`, `currentGroup`, `groupLeader`, `name`, `email`, `password`, `dob`, `mainArea`, `skills`, `gpa`, `goal`, `bio`)
VALUES
	(1,0,12,1,'Ruslan Abylkassov','ruslan.abylkassov@student.qut.edu.au','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-05','Project Leadership',NULL,5,7,'Hi I\'m Ruslan im ok'),
	(6,0,0,NULL,'Darius Franklin','gravida@congue.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-26','Business',NULL,NULL,NULL,NULL),
	(7,0,1,NULL,'Candice Foley','non@pedeCum.org','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1986-10-06','Business',NULL,NULL,NULL,NULL),
	(8,0,0,NULL,'Rae Vinson','metus@nonenim.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1990-11-27','Web Development',NULL,NULL,NULL,NULL),
	(9,0,12,NULL,'Mari Maddox','Sed@ornareplacerat.edu','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-02-15','Project Leadership',NULL,NULL,NULL,NULL),
	(10,0,0,NULL,'Beck Keller','laoreet.posuere@elitCurabitursed.net','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1990-02-27','Business',NULL,NULL,NULL,NULL),
	(11,0,0,NULL,'Gail Odom','vulputate@facilisisnonbibendum.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-07-17','Business',NULL,NULL,NULL,NULL),
	(12,0,1,NULL,'Kaseem Davis','a.arcu.Sed@augue.edu','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1987-02-05','Business',NULL,NULL,NULL,NULL),
	(13,0,12,NULL,'Barclay Riley','venenatis.vel@lectuspedeultrices.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1992-03-30','Project Leadership',NULL,NULL,NULL,NULL),
	(14,0,0,NULL,'Zorita Boyer','et@eudui.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-11-08','Project Leadership',NULL,NULL,NULL,NULL),
	(15,0,0,NULL,'Hayley West','ultrices.posuere.cubilia@montesnascetur.','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1986-12-05','Web Development',NULL,NULL,NULL,NULL),
	(16,0,1,NULL,'Declan Maldonado','nunc.sit.amet@ametconsectetuer.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-08-02','Programming',NULL,NULL,NULL,NULL),
	(17,0,12,NULL,'Echo Collier','orci.consectetuer@sollicitudinorcisem.or','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-03-30','Project Leadership',NULL,NULL,NULL,NULL),
	(18,0,0,NULL,'Warren Buchanan','scelerisque.sed@convallisligula.org','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-10-28','Programming',NULL,NULL,NULL,NULL),
	(19,0,1,NULL,'Phoebe Barton','luctus.aliquet@orciUt.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1987-01-29','Programming',NULL,NULL,NULL,NULL),
	(20,0,0,NULL,'Aline Owens','sagittis.Nullam.vitae@libero.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1990-11-24','Business',NULL,NULL,NULL,NULL),
	(21,0,0,NULL,'Carter Hawkins','Quisque.ac.libero@Pellentesquehabitant.o','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-01-07','Programming',NULL,NULL,NULL,NULL),
	(22,0,0,NULL,'Griffin Kirk','aliquet.odio.Etiam@semperauctorMauris.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-11-17','Web Development',NULL,NULL,NULL,NULL),
	(23,0,0,NULL,'Ryder Mathis','enim@eleifendnecmalesuada.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-11-26','Business',NULL,NULL,NULL,NULL),
	(24,0,1,NULL,'Rylee Carter','nunc.id@egetdictum.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1991-12-19','Web Development',NULL,NULL,NULL,NULL),
	(25,0,0,NULL,'Nasim Hoffman','pellentesque@dolor.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-08-20','Web Development',NULL,NULL,NULL,NULL),
	(26,0,0,NULL,'Hoyt Burton','non.dapibus.rutrum@atpretium.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-08-22','Business',NULL,NULL,NULL,NULL),
	(27,0,1,NULL,'Hannah Marks','at.velit.Cras@orci.net','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1991-04-02','Business',NULL,NULL,NULL,NULL),
	(28,0,0,NULL,'Keiko Rutledge','Vestibulum@libero.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-01-29','Project Leadership',NULL,NULL,NULL,NULL),
	(29,0,0,NULL,'Colton Mosley','Etiam.ligula@fermentumarcuVestibulum.edu','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-03-17','Business',NULL,NULL,NULL,NULL),
	(30,0,0,NULL,'Gage Foster','sapien.cursus@vulputateullamcorpermagna.','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1992-03-28','Business',NULL,NULL,NULL,NULL),
	(31,0,1,NULL,'Bradley Scott','Mauris@in.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-12-10','Programming',NULL,NULL,NULL,NULL),
	(32,0,0,NULL,'Cedric Jenkins','Vivamus@disparturientmontes.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-05-29','Business',NULL,NULL,NULL,NULL),
	(33,0,0,NULL,'Keane Dawson','libero.Donec.consectetuer@maurisidsapien','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-09-09','Web Development',NULL,NULL,NULL,NULL),
	(34,0,0,NULL,'Kim Meyers','sed.hendrerit@infaucibus.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-09-13','Business',NULL,NULL,NULL,NULL),
	(35,0,0,NULL,'Gregory Harrell','enim.Etiam@liberoProin.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1987-05-18','Programming',NULL,NULL,NULL,NULL),
	(42,0,0,NULL,'Testy Testman','ruslan@test.test','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-13','Web Development','php,html,css',4.78,5,'im a test man'),
	(52,3,0,NULL,'Admin User','admin','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-05',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
