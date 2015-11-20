# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.21)
# Database: restful_api_demo
# Generation Time: 2015-11-20 03:13:37 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table user_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `user_info_id` int(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` int(70) NOT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  `user_location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_info_id`),
  UNIQUE KEY `user_id_fk_UNIQUE` (`user_id_fk`),
  CONSTRAINT `user_info_foreign_key` FOREIGN KEY (`user_id_fk`) REFERENCES `user_login` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table user_login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `user_id` int(70) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(45) NOT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_join_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;

INSERT INTO `user_login` (`user_id`, `user_email`, `user_password`, `user_join_date`)
VALUES
	(1,'cinzunza@groupon.com','4297f44b13955235245b2497399d7a93','2015-11-19 22:02:20'),
	(2,'cesar.inzunza@gmail.com','1acc6dbfa540bc26150e743bb351450f','2015-11-19 22:03:06');

/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_status`;

CREATE TABLE `user_status` (
  `user_status_id` int(70) NOT NULL AUTO_INCREMENT,
  `user_id_fk` int(70) NOT NULL,
  `status_text` text,
  `status_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_status_id`),
  UNIQUE KEY `user_id_fk_UNIQUE` (`user_id_fk`),
  CONSTRAINT `user_status_foreign_key` FOREIGN KEY (`user_id_fk`) REFERENCES `user_login` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
