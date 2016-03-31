-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.25


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema shoppingcart
--

CREATE DATABASE IF NOT EXISTS shoppingcart;
USE shoppingcart;

--
-- Definition of table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `billamount` double NOT NULL,
  `checkoutno` varchar(200) DEFAULT NULL,
  `billdate` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `ispaid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`cartid`) USING BTREE,
  KEY `FK_cart_1` (`userid`),
  CONSTRAINT `FK_cart_1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cartid`,`userid`,`billamount`,`checkoutno`,`billdate`,`status`,`ispaid`) VALUES 
 (1,1,49500,'1392895627727','2014-02-20',1,1),
 (2,1,24000,'1392896274708','2014-02-20',1,1),
 (3,2,63000,'1392897631790','2014-02-20',1,1),
 (4,1,39000,'1392965000844','2014-02-21',1,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;


--
-- Definition of table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
CREATE TABLE `cartitems` (
  `cartitemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cartid` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `cost` double NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cartitemid`),
  KEY `FK_cartitems_1` (`cartid`),
  KEY `FK_cartitems_2` (`itemid`),
  CONSTRAINT `FK_cartitems_1` FOREIGN KEY (`cartid`) REFERENCES `cart` (`cartid`),
  CONSTRAINT `FK_cartitems_2` FOREIGN KEY (`itemid`) REFERENCES `items` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cartitems`
--

/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` (`cartitemid`,`cartid`,`itemid`,`cost`,`quantity`) VALUES 
 (2,2,1,15000,1),
 (3,2,2,4500,2),
 (4,3,1,15000,1),
 (5,3,2,4500,4),
 (6,3,1,15000,2),
 (7,4,1,15000,2),
 (8,4,2,4500,2);
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;


--
-- Definition of table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `cost` double NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL,
  `quantitty` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`itemid`,`name`,`cost`,`isactive`,`quantitty`) VALUES 
 (1,'mobiles',15000,1,10),
 (2,'mp3',4500,1,6);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`userid`,`username`,`password`,`firstname`,`lastname`,`mobile`,`address`) VALUES 
 (1,'admin','admin','Sreekanth','M','8096605454','hyderqabad'),
 (2,'gabe@mail.com','ganesh','ganesh',NULL,'9999999999','edgdgdfgdg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
