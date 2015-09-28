# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: capstone
# Generation Time: 2015-09-28 08:09:36 +0000
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`)
VALUES
	(1,'test group');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `currentGroup` int(11) DEFAULT '0',
  `mainArea` varchar(30) DEFAULT NULL,
  `skills` varchar(30) DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `goal` double DEFAULT NULL,
  `bio` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `dob`, `currentGroup`, `mainArea`, `skills`, `gpa`, `goal`, `bio`)
VALUES
	(1,'Ruslan Abylkassov','ruslan.abylkassov@student.qut.edu.au','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-05',1,'Project Leadership',NULL,5,7,'Hi I\'m Ruslan im ok'),
	(6,'Darius Franklin','gravida@congue.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1989-04-26',0,'Business',NULL,NULL,NULL,NULL),
	(7,'Candice Foley','non@pedeCum.org',NULL,'1986-10-06',1,'Business',NULL,NULL,NULL,NULL),
	(8,'Rae Vinson','metus@nonenim.ca',NULL,'1990-11-27',0,'Web Development',NULL,NULL,NULL,NULL),
	(9,'Mari Maddox','Sed@ornareplacerat.edu',NULL,'1988-02-15',0,'Project Leadership',NULL,NULL,NULL,NULL),
	(10,'Beck Keller','laoreet.posuere@elitCurabitursed.net',NULL,'1990-02-27',0,'Business',NULL,NULL,NULL,NULL),
	(11,'Gail Odom','vulputate@facilisisnonbibendum.co.uk',NULL,'1988-07-17',0,'Business',NULL,NULL,NULL,NULL),
	(12,'Kaseem Davis','a.arcu.Sed@augue.edu',NULL,'1987-02-05',1,'Business',NULL,NULL,NULL,NULL),
	(13,'Barclay Riley','venenatis.vel@lectuspedeultrices.co.uk',NULL,'1992-03-30',0,'Project Leadership',NULL,NULL,NULL,NULL),
	(14,'Zorita Boyer','et@eudui.com',NULL,'1988-11-08',0,'Project Leadership',NULL,NULL,NULL,NULL),
	(15,'Hayley West','ultrices.posuere.cubilia@montesnascetur.',NULL,'1986-12-05',0,'Web Development',NULL,NULL,NULL,NULL),
	(16,'Declan Maldonado','nunc.sit.amet@ametconsectetuer.com',NULL,'1995-08-02',1,'Programming',NULL,NULL,NULL,NULL),
	(17,'Echo Collier','orci.consectetuer@sollicitudinorcisem.or',NULL,'1994-03-30',0,'Project Leadership',NULL,NULL,NULL,NULL),
	(18,'Warren Buchanan','scelerisque.sed@convallisligula.org',NULL,'1993-10-28',0,'Programming',NULL,NULL,NULL,NULL),
	(19,'Phoebe Barton','luctus.aliquet@orciUt.com',NULL,'1987-01-29',1,'Programming',NULL,NULL,NULL,NULL),
	(20,'Aline Owens','sagittis.Nullam.vitae@libero.ca',NULL,'1990-11-24',0,'Business',NULL,NULL,NULL,NULL),
	(21,'Carter Hawkins','Quisque.ac.libero@Pellentesquehabitant.o',NULL,'1994-01-07',0,'Programming',NULL,NULL,NULL,NULL),
	(22,'Griffin Kirk','aliquet.odio.Etiam@semperauctorMauris.ca',NULL,'1993-11-17',0,'Web Development',NULL,NULL,NULL,NULL),
	(23,'Ryder Mathis','enim@eleifendnecmalesuada.ca',NULL,'1995-11-26',0,'Business',NULL,NULL,NULL,NULL),
	(24,'Rylee Carter','nunc.id@egetdictum.ca',NULL,'1991-12-19',1,'Web Development',NULL,NULL,NULL,NULL),
	(25,'Nasim Hoffman','pellentesque@dolor.com',NULL,'1994-08-20',0,'Web Development',NULL,NULL,NULL,NULL),
	(26,'Hoyt Burton','non.dapibus.rutrum@atpretium.ca',NULL,'1993-08-22',0,'Business',NULL,NULL,NULL,NULL),
	(27,'Hannah Marks','at.velit.Cras@orci.net',NULL,'1991-04-02',1,'Business',NULL,NULL,NULL,NULL),
	(28,'Keiko Rutledge','Vestibulum@libero.co.uk',NULL,'1995-01-29',0,'Project Leadership',NULL,NULL,NULL,NULL),
	(29,'Colton Mosley','Etiam.ligula@fermentumarcuVestibulum.edu',NULL,'1989-03-17',0,'Business',NULL,NULL,NULL,NULL),
	(30,'Gage Foster','sapien.cursus@vulputateullamcorpermagna.',NULL,'1992-03-28',0,'Business',NULL,NULL,NULL,NULL),
	(31,'Bradley Scott','Mauris@in.com',NULL,'1995-12-10',1,'Programming',NULL,NULL,NULL,NULL),
	(32,'Cedric Jenkins','Vivamus@disparturientmontes.ca',NULL,'1993-05-29',0,'Business',NULL,NULL,NULL,NULL),
	(33,'Keane Dawson','libero.Donec.consectetuer@maurisidsapien',NULL,'1988-09-09',0,'Web Development',NULL,NULL,NULL,NULL),
	(34,'Kim Meyers','sed.hendrerit@infaucibus.co.uk',NULL,'1995-09-13',0,'Business',NULL,NULL,NULL,NULL),
	(35,'Gregory Harrell','enim.Etiam@liberoProin.com',NULL,'1987-05-18',0,'Programming',NULL,NULL,NULL,NULL),
	(42,'Ruslan Testy','ruslan@test.test','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','1994-12-12',0,'','php,html,css',4.78,5,'im a test man');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
