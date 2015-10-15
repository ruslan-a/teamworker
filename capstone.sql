# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: capstone
# Generation Time: 2015-10-15 08:08:34 +0000
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

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
	(12,'not cool group','at all'),
	(13,'testy test test group','testt'),
	(15,'sdfasdfasdfasdf','asdfasdfasdf'),
	(17,'asdfasdgfsdfgsdfgsdfgxdf','dsfgsdfgsdf'),
	(18,'New Test Group!','Cool group for cool peeps'),
	(19,'new Group name','group description'),
	(20,'Project Team 17','We\'re doing things');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `groupId`, `userId`, `content`, `timestamp`)
VALUES
	(2,1,1,'hi this coding thing is kinda hard :/','2015-09-29 19:29:38'),
	(3,1,42,'hello world this is me\n','2015-09-29 19:48:02'),
	(4,12,1,'hello ass','2015-09-30 13:41:00'),
	(8,12,1,'hi hi hi','2015-09-30 13:47:37'),
	(9,12,1,'WOWie','2015-09-30 13:47:41'),
	(10,0,57,'odufhasldjfasdf','2015-10-07 12:06:40');

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
  `displayName` varchar(30) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mainArea` varchar(30) DEFAULT NULL,
  `skills` varchar(30) DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `goal` double DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `studentID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `studentID` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `permissions`, `currentGroup`, `groupLeader`, `name`, `displayName`, `email`, `password`, `dob`, `mainArea`, `skills`, `gpa`, `goal`, `bio`, `studentID`)
VALUES
	(1,1,0,1,'Ruslan Abylkassov','ruslan','ruslan.abylkassov@student.qut.edu.au','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-05','Project Leadership',NULL,5,7,'Hi I\'m Ruslan im ok','8623881'),
	(6,1,0,NULL,'Darius Franklin','test name','gravida@congue.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-26','Business',NULL,NULL,NULL,NULL,NULL),
	(7,1,0,NULL,'Candice Foley','test name','non@pedeCum.org','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1986-10-06','Business',NULL,NULL,NULL,NULL,NULL),
	(8,1,0,NULL,'Rae Vinson','test name','metus@nonenim.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1990-11-27','Web Development',NULL,NULL,NULL,NULL,NULL),
	(9,1,12,NULL,'Mari Maddox','test name','Sed@ornareplacerat.edu','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-02-15','Project Leadership',NULL,NULL,NULL,NULL,NULL),
	(10,1,0,NULL,'Beck Keller','test name','laoreet.posuere@elitCurabitursed.net','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1990-02-27','Business',NULL,NULL,NULL,NULL,NULL),
	(11,1,0,NULL,'Gail Odom','test name','vulputate@facilisisnonbibendum.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-07-17','Business',NULL,NULL,NULL,NULL,NULL),
	(12,1,1,NULL,'Kaseem Davis','test name','a.arcu.Sed@augue.edu','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1987-02-05','Business',NULL,NULL,NULL,NULL,NULL),
	(13,1,12,NULL,'Barclay Riley','test name','venenatis.vel@lectuspedeultrices.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1992-03-30','Project Leadership',NULL,NULL,NULL,NULL,NULL),
	(14,1,17,0,'Zorita Boyer','test name','et@eudui.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-11-08','Project Leadership',NULL,NULL,NULL,NULL,NULL),
	(15,1,18,0,'Hayley West','test name','ultrices.posuere.cubilia@montesnascetur.','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1986-12-05','Web Development',NULL,NULL,NULL,NULL,NULL),
	(16,1,1,NULL,'Declan Maldonado','test name','nunc.sit.amet@ametconsectetuer.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-08-02','Programming',NULL,NULL,NULL,NULL,NULL),
	(17,1,12,NULL,'Echo Collier','test name','orci.consectetuer@sollicitudinorcisem.or','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-03-30','Project Leadership',NULL,NULL,NULL,NULL,NULL),
	(18,1,18,0,'Warren Buchanan','test name','scelerisque.sed@convallisligula.org','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-10-28','Programming',NULL,NULL,NULL,NULL,NULL),
	(19,1,1,NULL,'Phoebe Barton','test name','luctus.aliquet@orciUt.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1987-01-29','Programming',NULL,NULL,NULL,NULL,NULL),
	(20,1,0,NULL,'Aline Owens','test name','sagittis.Nullam.vitae@libero.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1990-11-24','Business',NULL,NULL,NULL,NULL,NULL),
	(21,1,0,NULL,'Carter Hawkins','test name','Quisque.ac.libero@Pellentesquehabitant.o','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-01-07','Programming',NULL,NULL,NULL,NULL,NULL),
	(22,1,1,0,'Griffin Kirk','test name','aliquet.odio.Etiam@semperauctorMauris.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-11-17','Web Development',NULL,NULL,NULL,NULL,NULL),
	(23,1,0,NULL,'Ryder Mathis','test name','enim@eleifendnecmalesuada.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-11-26','Business',NULL,NULL,NULL,NULL,NULL),
	(24,1,1,NULL,'Rylee Carter','test name','nunc.id@egetdictum.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1991-12-19','Web Development',NULL,NULL,NULL,NULL,NULL),
	(25,1,0,NULL,'Nasim Hoffman','test name','pellentesque@dolor.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-08-20','Web Development',NULL,NULL,NULL,NULL,NULL),
	(26,1,0,NULL,'Hoyt Burton','test name','non.dapibus.rutrum@atpretium.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-08-22','Business',NULL,NULL,NULL,NULL,NULL),
	(27,1,1,NULL,'Hannah Marks','test name','at.velit.Cras@orci.net','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1991-04-02','Business',NULL,NULL,NULL,NULL,NULL),
	(28,1,20,0,'Keiko Rutledge','test name','Vestibulum@libero.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-01-29','Project Leadership',NULL,NULL,NULL,NULL,NULL),
	(29,1,0,NULL,'Colton Mosley','test name','Etiam.ligula@fermentumarcuVestibulum.edu','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-03-17','Business',NULL,NULL,NULL,NULL,NULL),
	(30,1,0,NULL,'Gage Foster','test name','sapien.cursus@vulputateullamcorpermagna.','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1992-03-28','Business',NULL,NULL,NULL,NULL,NULL),
	(31,1,1,NULL,'Bradley Scott','test name','Mauris@in.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-12-10','Programming',NULL,NULL,NULL,NULL,NULL),
	(32,1,0,NULL,'Cedric Jenkins','test name','Vivamus@disparturientmontes.ca','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1993-05-29','Business',NULL,NULL,NULL,NULL,NULL),
	(33,1,20,0,'Keane Dawson','test name','libero.Donec.consectetuer@maurisidsapien','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1988-09-09','Web Development',NULL,NULL,NULL,NULL,NULL),
	(34,1,0,NULL,'Kim Meyers','test name','sed.hendrerit@infaucibus.co.uk','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1995-09-13','Business',NULL,NULL,NULL,NULL,NULL),
	(35,1,20,0,'Gregory Harrell','test name','enim.Etiam@liberoProin.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1987-05-18','Programming',NULL,NULL,NULL,NULL,NULL),
	(42,1,0,NULL,'Testy Testman','test name','ruslan@test.test','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-13','Web Development','php,html,css',4.78,5,'im a test man',NULL),
	(52,3,0,NULL,'Admin User','test name','admin@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-05','Web Development',NULL,0,0,'',NULL),
	(53,1,0,NULL,'Sally Warble','test name','sal@test','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL),
	(54,1,0,NULL,'Jon Snow',NULL,'jon@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-07-14',NULL,NULL,NULL,NULL,NULL,NULL),
	(55,1,0,NULL,'asdfa sadf','jerk','jerk@test','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-03-15',NULL,NULL,NULL,NULL,NULL,NULL),
	(56,1,0,NULL,'asdfasdf','asd','','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','0000-00-00',NULL,NULL,NULL,NULL,NULL,NULL),
	(57,1,0,NULL,'new name','display name','newemail@email.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1997-03-11','Web Development',NULL,4,5,'sdfasdfasdf',NULL),
	(58,1,0,NULL,'Metthew Nuhn',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'24332880'),
	(59,1,0,NULL,'Nick Sherme',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'25902940'),
	(60,1,0,NULL,'Jecob Grey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'22134460'),
	(61,1,0,NULL,'Metthew Wilmen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'50420938'),
	(62,1,0,NULL,'Victor Alverez',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'50687977'),
	(63,1,0,NULL,'Tom Gee Kee',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'50958474'),
	(64,1,0,NULL,'Alex Werdle',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'60821693'),
	(65,1,0,NULL,'Thenh Dung Dwyer',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'70143494'),
	(66,1,0,NULL,'Moneer Akeb M Herredine',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'70203403'),
	(67,1,0,NULL,'Ahmed Omer M Lene',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'72027558'),
	(68,1,0,NULL,'Heng Yung Puc',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'72027639'),
	(69,1,0,NULL,'Yezeed Bender M Perker',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'73730988'),
	(70,1,0,NULL,'Frederick Brey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'75560985'),
	(71,1,0,NULL,'Aden Nguyen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'76310588'),
	(72,1,0,NULL,'Christopher Albeqmi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'76810704'),
	(73,1,0,NULL,'John Alghemdi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'76936702'),
	(74,1,0,NULL,'Leurence Mek',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81004412'),
	(75,1,0,NULL,'Mertin Alherbi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81024766'),
	(76,1,0,NULL,'Williem Du Plessis',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81037256'),
	(77,1,0,NULL,'Moeyed Awedh A Jones',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81087636'),
	(78,1,0,NULL,'Shun-Wen Begey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81095281'),
	(79,1,0,NULL,'Minh Phet Mecpherson',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81099596'),
	(80,1,0,NULL,'Abdulleh Abduleziz N McCebe',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81104395'),
	(81,1,0,NULL,'Deniel Wheeler',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81280495'),
	(82,1,0,NULL,'Stuert Deyton',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81324522'),
	(83,1,0,NULL,'Alexender Aldhehri',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81359113'),
	(84,1,0,NULL,'Cemeron Shih',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81371555'),
	(85,1,0,NULL,'Tei Ho Tren',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81375941'),
	(86,1,0,NULL,'Qieoqi Alghuneim',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81388083'),
	(87,1,0,NULL,'Guy Duong',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81389772'),
	(88,1,0,NULL,'Metthew Stirling',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81400962'),
	(89,1,0,NULL,'Steven Spencer',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81403571'),
	(90,1,0,NULL,'Duncen Sentry',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81430471'),
	(91,1,0,NULL,'Melisse Nem',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81502595'),
	(92,1,0,NULL,'Micheel Xu',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81505217'),
	(93,1,0,NULL,'Imren Richerds',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81573557'),
	(94,1,0,NULL,'Wei - Ming Holdsworth',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81576904'),
	(95,1,0,NULL,'Metthew Lomes',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81578443'),
	(96,1,0,NULL,'Edwerd Meyers',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81581142'),
	(97,1,0,NULL,'Letheem Kroes',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81583820'),
	(98,1,0,NULL,'Tristen Henlon',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81585911'),
	(99,1,0,NULL,'Yu Theggerd',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81590397'),
	(100,1,0,NULL,'Tee Jun Ten',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81594473'),
	(101,1,0,NULL,'Petrick Tincknell',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81594945'),
	(102,1,0,NULL,'Zehui Lloyd',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81595003'),
	(103,1,0,NULL,'Seud Abduleziz M Berkhout',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81596972'),
	(104,1,0,NULL,'Abduleziz Mensour G Allen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81620954'),
	(105,1,0,NULL,'Andrew Zheng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81628769'),
	(106,1,0,NULL,'Timothy Jeon',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81633959'),
	(107,1,0,NULL,'Metthew Beggermen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81637342'),
	(108,1,0,NULL,'Zilu Zheng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81646236'),
	(109,1,0,NULL,'Chun Hung Aljeheni',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81659486'),
	(110,1,0,NULL,'Misel Nitinbhei Alsubhi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81678014'),
	(111,1,0,NULL,'Chun Hin Justin Metchett',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81684243'),
	(112,1,0,NULL,'Seed Abduleziz S Merdon',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81686998'),
	(113,1,0,NULL,'Chun Pui Brown',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81689750'),
	(114,1,0,NULL,'Kin Fu Yeng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81699437'),
	(115,1,0,NULL,'Yunshi Chung',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81701709'),
	(116,1,0,NULL,'Hui Sheng Bhimeni',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81701873'),
	(117,1,0,NULL,'Chun-Ting Ho',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81702462'),
	(118,1,0,NULL,'Ashite Menoj Alsellom',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81703817'),
	(119,1,0,NULL,'Mo Tin Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81706638'),
	(120,1,0,NULL,'Scott Wong',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81710414'),
	(121,1,0,NULL,'Keen Sun',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81716145'),
	(122,1,0,NULL,'Chi-Kit Kwen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81718563'),
	(123,1,0,NULL,'Dongmin Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81720347'),
	(124,1,0,NULL,'Chern Loon Dhuleshie',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81721025'),
	(125,1,0,NULL,'Phillip Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81726931'),
	(126,1,0,NULL,'Derren Offord',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81747300'),
	(127,1,0,NULL,'Semuel Osmenegeoglu',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81750289'),
	(128,1,0,NULL,'Joseph Choi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81770344'),
	(129,1,0,NULL,'Alyksendr Lee',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81777284'),
	(130,1,0,NULL,'Temirlen Chueh',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81779759'),
	(131,1,0,NULL,'Frenkie Bercley',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81805644'),
	(132,1,0,NULL,'Jorden Thomes',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81806713'),
	(133,1,0,NULL,'Jene Hemmill',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81811229'),
	(134,1,0,NULL,'Else Selmond',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81823928'),
	(135,1,0,NULL,'Andrew Skye',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81824037'),
	(136,1,0,NULL,'Sem Remington',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81824193'),
	(137,1,0,NULL,'Jemes Ivicevic',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81824240'),
	(138,1,0,NULL,'Albert Rees',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81824657'),
	(139,1,0,NULL,'Cleerence Lizendro Nichol',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81842205'),
	(140,1,0,NULL,'Zhenyu Howell',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81847380'),
	(141,1,0,NULL,'Joshue Smith',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81854092'),
	(142,1,0,NULL,'Steven Young',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81873291'),
	(143,1,0,NULL,'Cellum Freser',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81887705'),
	(144,1,0,NULL,'Blenke Leung',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81887918'),
	(145,1,0,NULL,'Soon Kok Wisser Dominguez',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81898642'),
	(146,1,0,NULL,'Gurpreet Singh Jieng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81901759'),
	(147,1,0,NULL,'Boxuen Hopkins',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81908605'),
	(148,1,0,NULL,'Sheohue Stone',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81909253'),
	(149,1,0,NULL,'Peir Gen Terry',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81911622'),
	(150,1,0,NULL,'Cho Yen Krotilove',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81918392'),
	(151,1,0,NULL,'Junior Koey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81923078'),
	(152,1,0,NULL,'Shennon Dheliwel',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81925542'),
	(153,1,0,NULL,'Deyne Zheng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81934053'),
	(154,1,0,NULL,'Hoeng Me',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81935173'),
	(155,1,0,NULL,'Brett Aw',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81935254'),
	(156,1,0,NULL,'Jinxiong Hui',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81938024'),
	(157,1,0,NULL,'Xin O\'Celleghen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81941866'),
	(158,1,0,NULL,'Ven Kempen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81942161'),
	(159,1,0,NULL,'Yuet Yiu Nguyen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81961221'),
	(160,1,0,NULL,'Jessie Orr',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81963398'),
	(161,1,0,NULL,'Nede Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81977232'),
	(162,1,0,NULL,'Seedit Weng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81979821'),
	(163,1,0,NULL,'Metthew Jeideep Singh',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81986746'),
	(164,1,0,NULL,'Benjemin To',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'81994480'),
	(165,1,0,NULL,'Sooji Bretic',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92013164'),
	(166,1,0,NULL,'Ryen Sherifi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92013172'),
	(167,1,0,NULL,'Jecob Khen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92014098'),
	(168,1,0,NULL,'Gie Scott',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92014497'),
	(169,1,0,NULL,'Devid Norris',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92014560'),
	(170,1,0,NULL,'Steven Lim',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92029036'),
	(171,1,0,NULL,'Keith Jones',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92074147'),
	(172,1,0,NULL,'Alex He',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92101900'),
	(173,1,0,NULL,'Jose Ven',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92106766'),
	(174,1,0,NULL,'Jerry Sunge',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92138099'),
	(175,1,0,NULL,'Reuben Heckenberg',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92138790'),
	(176,1,0,NULL,'Devid Weidt',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92147934'),
	(177,1,0,NULL,'Peter Tren','Petey',NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-06-16','Programming',NULL,6,7,'Hello!','92149121'),
	(178,1,0,NULL,'Lee Joyce',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,NULL,NULL,NULL,NULL,NULL,'92213406');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
