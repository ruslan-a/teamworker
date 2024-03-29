# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: capstone
# Generation Time: 2015-10-23 01:55:03 +0000
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
  `projectType` varchar(30) DEFAULT NULL,
  `tutor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `description`, `projectType`, `tutor`)
VALUES
	(8,'Test Group','Testing group update function.','Web Development',NULL),
	(18,'New Test Group!','Another test group!','Business',NULL),
	(19,'Group Name','Generic test group description.','Design',72),
	(20,'Project Team 17','Cool description text here!','Web Development',NULL),
	(21,'Sample Group Name!','A cool description ','Programming',NULL),
	(22,'Curly Braces','We hope to make some great web software!','Web Development',72),
	(23,'Team Awesome','We\'re gonna make a great website!','Web Development',NULL);

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
  `admin` tinyint(1) DEFAULT '0',
  `fileNameServer` text,
  `fileNameOriginal` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;

INSERT INTO `posts` (`id`, `groupId`, `userId`, `content`, `timestamp`, `admin`, `fileNameServer`, `fileNameOriginal`)
VALUES
	(1,22,1,'Hey team! I\'ve attached the task sheet for us to work off. <a href=\'http://localhost:8888/uploads/QUT_Teamwork_Protocol_Compressed5B15D.pdf\' download>[download attachment]</a>','2015-10-21 16:50:17',0,NULL,NULL),
	(2,22,58,'Thanks, I\'ll check it out!','2015-10-21 16:51:55',0,NULL,NULL),
	(3,0,52,'Make sure to attend the lecture at 11 AM this Wednesday.','2015-10-22 20:35:53',1,NULL,NULL);

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
  `skills` text,
  `gpa` double DEFAULT NULL,
  `goal` double DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  `studentID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `studentID` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `permissions`, `currentGroup`, `groupLeader`, `name`, `displayName`, `email`, `password`, `dob`, `mainArea`, `skills`, `gpa`, `goal`, `bio`, `studentID`)
VALUES
	(1,1,22,1,'Ruslan Abylkassov','Ruslan','ruslan.abylkassov@student.qut.edu.au','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-05','Web Development','html, php, css, javascript',6,6,'Hi, my name\'s Ruslan, I\'m in my final year of my IVD and IT dual degree right now.','08623881'),
	(21,1,0,1,'Carter Hawkins',NULL,'Quisque.ac.libero@Pellentesquehabitant.o','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-01-07','Project Leadership','html, php, css',6,NULL,NULL,'81935464'),
	(52,3,0,0,'Admin','Administrator','admin@test.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-05','Web Development','html, php, css',NULL,0,'I\'m the site admin.','000'),
	(58,1,22,0,'Metthew Nuhn',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Web Development','html, php, css',7,NULL,NULL,'24332880'),
	(59,1,8,1,'Nick Sherme',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Web Development','html, php, css',7,NULL,NULL,'25902940'),
	(61,1,0,NULL,'Metthew Wilmen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'50420938'),
	(62,1,0,NULL,'Victor Alverez',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'50687977'),
	(63,1,0,NULL,'Tom Gee Kee',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'50958474'),
	(64,1,0,NULL,'Alex Werdle',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'60821693'),
	(65,1,23,0,'Thenh Dung Dwyer',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'70143494'),
	(66,1,0,NULL,'Moneer Akeb M Herredine',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'70203403'),
	(67,1,0,NULL,'Ahmed Omer M Lene',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'72027558'),
	(68,1,0,NULL,'Heng Yung Puc',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'72027639'),
	(69,1,22,0,'Yezeed Bender M Perker',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'73730988'),
	(70,1,0,NULL,'Frederick Brey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'75560985'),
	(71,1,0,NULL,'Aden Nguyen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','html, php, css',6,NULL,NULL,'76310588'),
	(72,2,0,NULL,'Christopher Albeqmi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming',NULL,5,NULL,NULL,'001'),
	(73,1,0,NULL,'John Alghemdi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Programming','ruby, css',5,NULL,NULL,'76936702'),
	(74,1,22,0,'Leurence Mek',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81004412'),
	(75,1,0,NULL,'Mertin Alherbi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81024766'),
	(76,1,0,NULL,'Williem Du Plessis',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81037256'),
	(77,1,0,NULL,'Moeyed Awedh A Jones',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81087636'),
	(78,1,0,NULL,'Shun-Wen Begey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81095281'),
	(79,1,0,NULL,'Minh Phet Mecpherson',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81099596'),
	(80,1,0,NULL,'Abdulleh Abduleziz N McCebe',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81104395'),
	(81,1,0,NULL,'Deniel Wheeler',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81280495'),
	(82,1,0,NULL,'Stuert Deyton',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81324522'),
	(83,1,0,NULL,'Alexender Aldhehri',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81359113'),
	(84,1,0,NULL,'Cemeron Shih',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81371555'),
	(85,1,0,NULL,'Tei Ho Tren',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81375941'),
	(86,1,0,NULL,'Qieoqi Alghuneim',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81388083'),
	(87,1,0,NULL,'Guy Duong',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81389772'),
	(88,1,0,NULL,'Metthew Stirling',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81400962'),
	(89,1,0,NULL,'Steven Spencer',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81403571'),
	(90,1,0,NULL,'Duncen Sentry',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','ruby, css',5,NULL,NULL,'81430471'),
	(91,1,0,NULL,'Melisse Nem',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81502595'),
	(92,1,0,NULL,'Micheel Xu',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81505217'),
	(93,1,0,NULL,'Imren Richerds',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81573557'),
	(94,1,0,NULL,'Wei - Ming Holdsworth',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81576904'),
	(95,1,0,NULL,'Metthew Lomes',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81578443'),
	(96,1,0,NULL,'Edwerd Meyers',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81581142'),
	(97,1,0,NULL,'Letheem Kroes',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81583820'),
	(98,1,0,NULL,'Tristen Henlon',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',5,NULL,NULL,'81585911'),
	(99,1,0,NULL,'Yu Theggerd',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81590397'),
	(100,1,0,NULL,'Tee Jun Ten',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81594473'),
	(101,1,23,0,'Petrick Tincknell',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81594945'),
	(102,1,0,NULL,'Zehui Lloyd',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81595003'),
	(103,1,0,NULL,'Seud Abduleziz M Berkhout',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81596972'),
	(104,1,0,NULL,'Abduleziz Mensour G Allen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81620954'),
	(105,1,0,NULL,'Andrew Zheng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81628769'),
	(106,1,0,NULL,'Timothy Jeon',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81633959'),
	(107,1,0,NULL,'Metthew Beggermen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81637342'),
	(108,1,0,NULL,'Zilu Zheng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81646236'),
	(109,1,0,NULL,'Chun Hung Aljeheni',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81659486'),
	(110,1,0,NULL,'Misel Nitinbhei Alsubhi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81678014'),
	(111,1,0,NULL,'Chun Hin Justin Metchett',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81684243'),
	(112,1,0,NULL,'Seed Abduleziz S Merdon',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81686998'),
	(113,1,0,NULL,'Chun Pui Brown',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81689750'),
	(114,1,0,NULL,'Kin Fu Yeng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81699437'),
	(115,1,0,NULL,'Yunshi Chung',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81701709'),
	(116,1,0,NULL,'Hui Sheng Bhimeni',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81701873'),
	(117,1,0,NULL,'Chun-Ting Ho',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81702462'),
	(118,1,0,NULL,'Ashite Menoj Alsellom',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81703817'),
	(119,1,0,NULL,'Mo Tin Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81706638'),
	(120,1,0,NULL,'Scott Wong',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81710414'),
	(121,1,0,NULL,'Keen Sun',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81716145'),
	(122,1,0,NULL,'Chi-Kit Kwen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81718563'),
	(123,1,0,NULL,'Dongmin Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81720347'),
	(124,1,0,NULL,'Chern Loon Dhuleshie',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81721025'),
	(125,1,0,NULL,'Phillip Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81726931'),
	(126,1,0,NULL,'Derren Offord',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81747300'),
	(127,1,0,NULL,'Semuel Osmenegeoglu',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81750289'),
	(128,1,0,NULL,'Joseph Choi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81770344'),
	(129,1,0,NULL,'Alyksendr Lee',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81777284'),
	(130,1,0,NULL,'Temirlen Chueh',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81779759'),
	(131,1,0,NULL,'Frenkie Bercley',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81805644'),
	(132,1,0,NULL,'Jorden Thomes',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81806713'),
	(133,1,0,NULL,'Jene Hemmill',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81811229'),
	(134,1,0,NULL,'Else Selmond',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81823928'),
	(135,1,0,NULL,'Andrew Skye',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81824037'),
	(136,1,0,NULL,'Sem Remington',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81824193'),
	(137,1,0,NULL,'Jemes Ivicevic',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81824240'),
	(138,1,0,NULL,'Albert Rees',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81824657'),
	(139,1,0,NULL,'Cleerence Lizendro Nichol',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81842205'),
	(140,1,0,NULL,'Zhenyu Howell',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81847380'),
	(141,1,0,NULL,'Joshue Smith',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81854092'),
	(142,1,0,NULL,'Steven Young',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81873291'),
	(143,1,0,NULL,'Cellum Freser',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81887705'),
	(144,1,0,NULL,'Blenke Leung',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81887918'),
	(145,1,0,NULL,'Soon Kok Wisser Dominguez',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Business','javascript,python, css',7,NULL,NULL,'81898642'),
	(146,1,0,NULL,'Gurpreet Singh Jieng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81901759'),
	(147,1,0,NULL,'Boxuen Hopkins',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81908605'),
	(148,1,0,NULL,'Sheohue Stone',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81909253'),
	(149,1,0,NULL,'Peir Gen Terry',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81911622'),
	(150,1,0,NULL,'Cho Yen Krotilove',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81918392'),
	(151,1,0,NULL,'Junior Koey',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81923078'),
	(152,1,0,NULL,'Shennon Dheliwel',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81925542'),
	(153,1,0,NULL,'Deyne Zheng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81934053'),
	(154,1,0,NULL,'Hoeng Me',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81935173'),
	(155,1,0,NULL,'Brett Aw',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81935254'),
	(156,1,23,1,'Jinxiong Hui','Jinxiong Hui',NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','0000-00-00','Project Leadership','javascript,python, css',7,7,'Hello!','81938024'),
	(157,1,0,NULL,'Xin O\'Celleghen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81941866'),
	(158,1,0,NULL,'Ven Kempen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81942161'),
	(159,1,0,NULL,'Yuet Yiu Nguyen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81961221'),
	(160,1,0,NULL,'Jessie Orr',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81963398'),
	(161,1,0,NULL,'Nede Chen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81977232'),
	(162,1,0,NULL,'Seedit Weng',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81979821'),
	(163,1,23,0,'Metthew Jeideep Singh',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81986746'),
	(164,1,0,NULL,'Benjemin To',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'81994480'),
	(165,1,0,NULL,'Sooji Bretic',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92013164'),
	(166,1,0,NULL,'Ryen Sherifi',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92013172'),
	(167,1,8,0,'Jecob Khen',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92014098'),
	(168,1,0,NULL,'Gie Scott',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92014497'),
	(169,1,0,NULL,'Devid Norris',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92014560'),
	(170,1,0,NULL,'Steven Lim',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92029036'),
	(171,1,0,NULL,'Keith Jones',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92074147'),
	(172,1,0,NULL,'Alex He',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92101900'),
	(173,1,0,NULL,'Jose Ven',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92106766'),
	(174,1,0,NULL,'Jerry Sunge',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92138099'),
	(175,1,0,NULL,'Reuben Heckenberg',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92138790'),
	(176,1,0,NULL,'Devid Weidt',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92147934'),
	(177,1,21,0,'Peter Tren','Petey',NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-06-16','Project Leadership','javascript,python, css',7,7,'Hello!','92149121'),
	(178,1,0,NULL,'Lee Joyce',NULL,NULL,'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08',NULL,'Project Leadership','javascript,python, css',7,NULL,NULL,'92213406');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
