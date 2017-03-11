# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.1.73)
# Database: movie
# Generation Time: 2017-03-11 03:33:43 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table actor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actor`;

CREATE TABLE `actor` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '演员名称',
  `img` varchar(128) DEFAULT NULL COMMENT '头像',
  `profile` varchar(256) DEFAULT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;

INSERT INTO `actor` (`id`, `name`, `img`, `profile`)
VALUES
	(1,'成龙',NULL,'国际大演员'),
	(2,'周星驰',NULL,'喜剧演员，搞笑记录保持者'),
	(3,'刘德华',NULL,'和周润发合作，成就香港赌片'),
	(4,'周润发',NULL,'监狱风云12，小马哥等佳作'),
	(5,'林正英',NULL,'恐怖加喜剧，搞笑人生'),
	(6,'邓超',NULL,'新人出马，美人鱼等佳片');

/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table actor_movie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `actor_movie`;

CREATE TABLE `actor_movie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL COMMENT '演员主键',
  `movie_id` int(11) DEFAULT NULL COMMENT '电影主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `actor_movie` WRITE;
/*!40000 ALTER TABLE `actor_movie` DISABLE KEYS */;

INSERT INTO `actor_movie` (`id`, `actor_id`, `movie_id`)
VALUES
	(1,1,1),
	(2,2,1),
	(3,3,1),
	(4,4,2),
	(5,5,2),
	(6,6,3);

/*!40000 ALTER TABLE `actor_movie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cinema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cinema`;

CREATE TABLE `cinema` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '影院名称',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `address` varchar(32) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `cinema` WRITE;
/*!40000 ALTER TABLE `cinema` DISABLE KEYS */;

INSERT INTO `cinema` (`id`, `name`, `score`, `address`)
VALUES
	(1,'增城万达影院',6,'广东省广州市增城区'),
	(2,'天河横店电影',8,'广东省广州市天河区岗顶'),
	(3,'朝阳飞渡影院',5,'北京市朝阳区'),
	(4,'佛山飞影国际影院',8,'广东省佛山市禅城区季华路'),
	(5,'白云飞影国际影院',8,'广东省广州市白云区嘉禾望岗'),
	(6,'万达国际影城',9,'广东省广州市南沙区大润发'),
	(7,'中影南方we影城',7,'广东省广州市天河区兴盛路'),
	(8,'佳兆业国际影城',8,'广东省深圳市福田区'),
	(9,'大地数字影院',7,'上海市浦东开发区中山路'),
	(10,'万达IMAX影院',9,'广东省深圳市南山区'),
	(11,'金逸空中影城',9,'广东省广州市天河区珠江新城'),
	(12,'保利影城',9,'广东省广州市越秀区'),
	(13,'花都影院',6,'广东省广州市花都区'),
	(14,'横店电影城白云分店',7,'广东省广州市白云区机场路');

/*!40000 ALTER TABLE `cinema` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cinema_movie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cinema_movie`;

CREATE TABLE `cinema_movie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL COMMENT '电影主键',
  `cinema_id` int(11) DEFAULT NULL COMMENT '影院主键',
  `play_time` datetime DEFAULT NULL COMMENT '播放时间',
  `price` double DEFAULT NULL COMMENT '价钱',
  `times` int(3) DEFAULT NULL COMMENT '播放场次',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `cinema_movie` WRITE;
/*!40000 ALTER TABLE `cinema_movie` DISABLE KEYS */;

INSERT INTO `cinema_movie` (`id`, `movie_id`, `cinema_id`, `play_time`, `price`, `times`)
VALUES
	(1,1,2,'2016-12-10 15:00:00',1,2),
	(2,1,1,'2016-11-10 10:00:00',1,3),
	(3,2,2,'2016-11-10 10:00:00',1,1),
	(4,1,3,'2017-11-10 10:00:00',1,6),
	(5,1,2,'2017-01-22 10:00:00',1,1);

/*!40000 ALTER TABLE `cinema_movie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论主键',
  `openid` varchar(32) DEFAULT NULL COMMENT '用户标示',
  `nickname` varbinary(32) DEFAULT NULL COMMENT '用户名称',
  `head_img` varchar(256) DEFAULT NULL COMMENT '微信头像',
  `movie_id` int(16) DEFAULT NULL COMMENT '电影主键',
  `create_time` datetime DEFAULT NULL COMMENT '评论时间',
  `content` varchar(256) DEFAULT '' COMMENT '评论内容',
  `score` int(2) DEFAULT NULL COMMENT '10分为满分',
  `order_id` int(6) DEFAULT NULL COMMENT '订单主键',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;

INSERT INTO `comment` (`id`, `openid`, `nickname`, `head_img`, `movie_id`, `create_time`, `content`, `score`, `order_id`)
VALUES
	(1,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6E5B08FE6ADA6','http://wx.qlogo.cn/mmopen/NNHCx6icpib2j3I2wVMK6Ws7yXFkZthzibezTlJnYvLjliaeEF5pa2reRF0AqQElZM9ghnK7lyd10wvibax9RyCFeUUbDlExZInRq/0',1,'2016-11-13 13:20:00','不错很满意',8,111),
	(2,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E5BC80E58F91E88085','http://wx.qlogo.cn/mmopen/NNHCx6icpib2jhKfLqJPQ69VK91iag50QL0DcibNfOt5XfsnaFHoptA90cAgd2ajQShic43A9o1pQIFEAGic7USIYicQQcOvJ41Lv7',2,'2017-01-12 23:20:00','',NULL,4),
	(3,'o-XkY0VEjew3cY-8PQQcAobZA0Ksg',X'E79599E5908D','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-01-02 08:20:00','不错',NULL,3),
	(4,'o-XkY0VEjjhcY-8PQQcAobZA0K233',X'E5B08FE4B89C','http://wx.qlogo.cn/mmopen/NNHCx6icpib2j3I2wVMK6Ws7yXFkZthzibezTlJnYvLjliaeEF5pa2reRF0AqQElZM9ghnK7lyd10wvibax9RyCFeUUbDlExZInRq/0',3,'2016-09-10 13:20:31','',NULL,NULL),
	(5,'o-XkY0VEjjhcY-8PQQcAobZA0K23',X'E79FAEE5AD90','http://wx.qlogo.cn/mmopen/NNHCx6icpib2hgEGib7ZzzCuI3QL2R69I3jFjianW30B3PUnhJUX7kjLWJAQTd2HEVEb5UtGyK6eMIicFN5p5TibpoeVZOZPrdLrwM',2,'2015-11-20 21:10:10','',NULL,NULL),
	(6,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E5B08FE5BCBA','http://wx.qlogo.cn/mmopen/NNHCx6icpib2j3I2wVMK6Ws7yXFkZthzibezTlJnYvLjliaeEF5pa2reRF0AqQElZM9ghnK7lyd10wvibax9RyCFeUUbDlExZInRq/0',1,'2016-12-12 23:20:00','有点恐怖',NULL,NULL),
	(7,'o-XkY0VEj23cY-8PQQcAobZA0Ksg',X'E591BCE591BC','http://wx.qlogo.cn/mmopen/NNHCx6icpib2hgEGib7ZzzCuI3QL2R69I3jFjianW30B3PUnhJUX7kjLWJAQTd2HEVEb5UtGyK6eMIicFN5p5TibpoeVZOZPrdLrwM',3,'2016-10-04 03:10:00','',NULL,NULL),
	(8,'o-XkY0VEjjhcY-8PQQcAobZA0222',X'E5AE89E5AE89','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JR3HIwnzptfaACI3XkriaF4hRr8GWsl9thGpSfjY9d9zLw1QTuj1uuVj8A9xfPYvXr1tePcGkMd4fwyY786ZCibicGP',5,'2016-12-12 23:20:00','',NULL,NULL),
	(9,'o-XkY0VEjjhcY-8PQQcAobZA0K333',X'E98791E980B8E8AFBEE7A88B','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JR3HIwnzptfaACI3XkriaF4hRr8GWsl9thGpSfjY9d9zLw1QTuj1uuVj8A9xfPYvXr1tePcGkMd4fwyY786ZCibicGP',6,'2016-10-04 03:43:00','',NULL,NULL),
	(10,'o-XkY0VEjjhcY-8PQQcAobZA0111',X'E6B0B8E8BF9CE59CA8','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JR3HIwnzptfaACI3XkriaF4hRr8GWsl9thGpSfjY9d9zLw1QTuj1uuVj8A9xfPYvXr1tePcGkMd4fwyY786ZCibicGP',2,'2017-01-05 11:41:00','',NULL,NULL),
	(11,'o-XkY0VEjjhcY-8PQQcAobZA002',X'E4BA8CE5BD93E5AEB6','http://wx.qlogo.cn/mmopen/NNHCx6icpib2hgEGib7ZzzCuI3QL2R69I3jFjianW30B3PUnhJUX7kjLWJAQTd2HEVEb5UtGyK6eMIicFN5p5TibpoeVZOZPrdLrwM',3,'2016-12-12 23:20:00','',NULL,NULL),
	(12,'o-XkY0VEjjhcY-8PQQcAobZA0123',X'E5B08FE6ADA6','http://wx.qlogo.cn/mmopen/NNHCx6icpib2j3I2wVMK6Ws7yXFkZthzibezTlJnYvLjliaeEF5pa2reRF0AqQElZM9ghnK7lyd10wvibax9RyCFeUUbDlExZInRq/0',2,'2016-04-05 23:20:00','',NULL,NULL),
	(13,'o-XkY0VEjjhcY-8PQQcAobZA0K643',X'E6B581E6B5AAE6B189','http://wx.qlogo.cn/mmopen/Q3auHgzwzM5JR3HIwnzptfaACI3XkriaF4hRr8GWsl9thGpSfjY9d9zLw1QTuj1uuVj8A9xfPYvXr1tePcGkMd4fwyY786ZCibicGP',3,'2016-12-12 13:20:00','',NULL,NULL),
	(14,'o-XkY0VEjjhcY-8PQQcAobZA0Ks23',X'E88BB9E69E9CE5BC80E58F91E88085','http://wx.qlogo.cn/mmopen/NNHCx6icpib2hgEGib7ZzzCuI3QL2R69I3jFjianW30B3PUnhJUX7kjLWJAQTd2HEVEb5UtGyK6eMIicFN5p5TibpoeVZOZPrdLrwM',4,'2016-11-24 23:20:00','',NULL,NULL),
	(15,'o-XkY0VEjjhcY-8PQQcAobZA0Kv3',X'6A617661E68A80E69CAFE88085','http://wx.qlogo.cn/mmopen/NNHCx6icpib2j3I2wVMK6Ws7yXFkZthzibezTlJnYvLjliaeEF5pa2reRF0AqQElZM9ghnK7lyd10wvibax9RyCFeUUbDlExZInRq/0',5,'2016-02-19 21:20:00','',NULL,NULL),
	(16,'o-XkY0VEjjhcY-8PQQcAobZA0K32',X'E5908DE7A7B0E4B98BE5AEB6','http://wx.qlogo.cn/mmopen/NNHCx6icpib2j3I2wVMK6Ws7yXFkZthzibezTlJnYvLjliaeEF5pa2reRF0AqQElZM9ghnK7lyd10wvibax9RyCFeUUbDlExZInRq/0',6,'2016-12-12 23:20:00','',NULL,NULL),
	(39,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',NULL,'2017-02-25 12:54:37','ee',6,0),
	(19,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-02-02 22:24:01','不好看，差评',NULL,7),
	(20,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',6,'2017-02-02 22:25:57','sdcsadfasdfsaf',NULL,NULL),
	(21,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',2,'2017-02-02 22:25:57','sdcsadfasdfsaf',NULL,6),
	(22,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',2,'2017-02-02 22:33:11','sdcsadfasdfsaf',NULL,9),
	(26,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-02-18 17:15:48','很满意xxx',8,1),
	(27,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',NULL,'2017-02-19 20:52:18','',NULL,0),
	(38,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-02-20 23:02:33','电影好看',9,66),
	(42,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',2,'2017-02-25 13:01:26','nnn',9,2),
	(43,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-03-11 10:13:48','成龙大哥太帅了',9,123),
	(44,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-03-11 10:33:05','good',9,124),
	(45,'o-XkY0VEjjhcY-8PQQcAobZA0Ksg',X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0',1,'2017-03-11 10:53:44','666',9,125);

/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL COMMENT '电影主键',
  `ip` varchar(16) DEFAULT NULL COMMENT '访问ip',
  `province` varchar(32) DEFAULT NULL COMMENT '省份',
  `city` varchar(64) DEFAULT NULL COMMENT '地区详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;

INSERT INTO `data` (`id`, `movie_id`, `ip`, `province`, `city`)
VALUES
	(2,1,'120.25.1.38','广东省','深圳市'),
	(3,2,'120.25.1.38','广东省','深圳市'),
	(4,2,'120.25.1.38','广东省','深圳市'),
	(5,4,'120.25.1.38','广东省','深圳市'),
	(6,5,'120.25.1.38','广东省','深圳市'),
	(7,4,'120.25.1.38','广东省','深圳市'),
	(8,3,'140.25.1.38','广西省','桂林市'),
	(9,4,'120.25.1.38','广东省','深圳市'),
	(10,4,'120.25.1.38','广东省','深圳市'),
	(11,3,'90.25.1.38','广东省','梅州市'),
	(12,4,'120.25.1.38','广东省','深圳市'),
	(13,4,'120.25.1.38','广东省','深圳市'),
	(14,4,'120.25.1.38','广东省','深圳市'),
	(15,1,'126.17.66.205','湖北省','襄阳市'),
	(16,1,'111.127.66.88','海南省','三亚'),
	(17,6,'116.22.66.205','广东省','广州市'),
	(18,6,'116.40.66.25','广东省','中山市'),
	(19,7,'116.40.66.211','广东省','珠海市'),
	(20,1,'116.40.66.205','广东省','珠海市'),
	(21,1,'116.22.66.205','广东省','广州市'),
	(22,1,'116.17.66.205','广东省','惠州市'),
	(27,0,'127.0.0.1','',''),
	(26,1,'120.25.1.38','广东省','深圳市'),
	(28,0,'127.0.0.1','',''),
	(29,0,'127.0.0.1','',''),
	(30,0,'127.0.0.1','',''),
	(31,1,'127.0.0.1','',''),
	(32,1,'127.0.0.1','',''),
	(33,1,'127.0.0.1','',''),
	(34,1,'127.0.0.1','',''),
	(35,1,'127.0.0.1','',''),
	(36,1,'127.0.0.1','',''),
	(37,1,'127.0.0.1','',''),
	(38,1,'127.0.0.1','','');

/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movie
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `img` varchar(128) DEFAULT NULL COMMENT '电影图片',
  `title` varchar(128) DEFAULT NULL COMMENT '电影名称',
  `summary` varchar(256) DEFAULT '' COMMENT '电影简介',
  `score` int(11) DEFAULT NULL COMMENT '评分，总评分/总观看人数*10',
  `show_time` datetime DEFAULT NULL COMMENT '上映时间',
  `price` double DEFAULT NULL COMMENT '参考价格，单位分',
  `watch_count` int(11) DEFAULT NULL COMMENT '观看人数',
  PRIMARY KEY (`id`),
  KEY `in_title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;

INSERT INTO `movie` (`id`, `img`, `title`, `summary`, `score`, `show_time`, `price`, `watch_count`)
VALUES
	(1,'http://120.25.1.38:8080/img/33.jpg','绝地逃亡','1978年由袁和平执导，成龙主演的古装武侠电影。讲述了少年黄飞鸿从只会招惹麻烦的混小子，经挫折，终于从乞丐师父苏乞儿那里苦练醉拳，死缠烂打地击败',9,'2016-12-12 23:20:00',998,423),
	(2,'http://120.25.1.38:8080/img/34.jpg','醉拳','1978年由袁和平执导，成龙主演的古装武侠电影。讲述了少年黄飞鸿从只会招惹麻烦的混小子，经挫折，终于从乞丐师父苏乞儿那里苦练醉拳，死缠烂打地击败',8,'2015-10-09 20:04:30',776,23),
	(3,'http://120.25.1.38:8080/img/35.jpg','美人鱼','由周星驰执导，由江玉仪监制的喜剧爱情片，邓超、罗志祥、张雨绮、林允等领衔出演。该片讲述了富豪刘轩和为了拯救同族前往刺杀他的美人鱼珊珊坠入爱河，谱写了一段人鱼爱情童话的故事。该片于2016年2月8日在中国上映',8,'2016-01-01 00:00:00',1333,322),
	(4,'http://120.25.1.38:8080/img/36.jpg','海贼王','改编的电视动画《航海王》于1999年10月20日起在富士电视台首播。截至2015年6月15日，《ONE PIECE》以日本本土累计发行了3亿2086万6000本，被吉尼斯世界纪录官方认证为“世界上发行量最高的单一作者创作的系列漫画',8,'2016-01-01 20:50:00',4232,423),
	(5,'http://120.25.1.38:8080/img/37.jpg','最佳拍档','金刚(许冠杰 饰)与光头佬(麦嘉 饰)在一次泰国的任务中不欢而散,自此分道扬镳各奔前程……时间一晃三年,国宝兵马俑与秦皇宝剑在赴港展出的路上被白手',9,'2016-12-01 05:54:43',2323,34),
	(6,'http://120.25.1.38:8080/img/38.jpg','僵尸先生','善良的道长林正英（林正英 饰）开设祭坛，供奉那些被母亲堕胎以致肉体毁灭无法投胎的灵婴。祭坛中的灵婴大多天真可爱，但有三个因三番五次被堕胎',7,'2016-01-05 22:10:40',4323,235),
	(7,'http://120.25.1.38:8080/img/39.jpg','赌侠','是1990年上映的一部香港影片，本片由香港导演王晶执导，周星驰、刘德华领衔主演，张敏、陈法蓉、吴孟达等联袂主演的香港喜剧电影。该片主要讲述了高进的徒弟陈小刀（刀仔）的故事，而且还加上《赌圣》（星仔）的故事',6,'2016-01-11 14:40:09',2112,234),
	(8,'http://120.25.1.38:8080/img/40.jpg','精装追女仔','两车房老板坚及沾因旧仇及私利互相斗气。坚之4名猛男伙计与沾之4名美女帮手，在互斗中发生爱意。其后两伙人更成为好朋友互助脱离移民公司的谋财卖猪.',7,'2015-11-09 20:40:44',6545,234),
	(9,'http://120.25.1.38:8080/img/41.jpg','监狱风云','英文：Prison on Fire）是1987年香港新艺城电影公司出品的一部动作与监狱片，影片由林岭东执导，周润发、梁家辉、张耀扬等人主演。影片讲述了监狱中的犯人、黑帮以及典狱长之间的恩怨情仇。影片已于1987年11月13日在中国香港',9,'2016-05-09 15:30:34',6432,222),
	(10,'http://120.25.1.38:8080/img/40.jpg','老虎出更','是由刘家良导演，周润发、利智等主演的香港功夫片。该片讲述了个性憨直冲动的新警员，因为生性潇洒到处留情的资深警探周润发因而产生误会而认识，并被上司安排成一',9,'2016-04-22 10:20:00',5344,112),
	(11,'http://120.25.1.38:8080/img/38.jpg','赌圣','赌圣》是1990上映的一部电影，本片由元奎、刘镇伟联合导演。主要演员有周星驰、吴孟达、吴君如等。该片讲述了身怀特异功能的大陆青年左颂星，来港投靠三叔。左颂星投靠三叔后，被发现具有特异功能，两叔侄开始走江湖，两人在香港误打误撞',8,'2016-05-09 15:30:34',432,2342),
	(13,'http://120.25.1.38:8080/img/36.jpg','赌圣上海毒王','两车房老板坚及沾因旧仇及私利互相斗气。坚之4名猛男伙计与沾之4名美女帮手，在互斗中发生爱意。其后两伙人更成为好朋友互助脱离移民公司的谋财卖猪.',5,'2016-04-22 10:20:00',442,534),
	(14,'http://120.25.1.38:8080/img/33.jpg','拉斯维加斯赌战','拉丝维加斯是1990上映的一部电影，本片由元奎、刘镇伟联合导演。主要演员有周星驰、吴孟达、吴君如等。该片讲述了身怀特异功能的大陆青年左颂星，来港投靠三叔。左颂星投靠三叔后，被发现具有特异功能，两叔侄开始走江湖，两人在香港误打误撞',7,'2016-01-22 10:20:00',111,6643);

/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table movie_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `movie_order`;

CREATE TABLE `movie_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `openid` varchar(32) DEFAULT NULL COMMENT '用户标示',
  `out_trade_no` varchar(64) DEFAULT NULL COMMENT '订单唯一标识',
  `state` int(11) DEFAULT NULL COMMENT '订单状态，0表示未支付，1表示已支付，2表示已兑奖,3是评价成功',
  `create_time` datetime DEFAULT NULL COMMENT '订单生成时间',
  `notify_time` datetime DEFAULT NULL COMMENT '支付回调时间',
  `total_fee` int(11) DEFAULT NULL COMMENT '支付金额，单位分',
  `nickname` varchar(32) DEFAULT NULL COMMENT '微信昵称',
  `head_img` varchar(128) DEFAULT NULL COMMENT '微信头像',
  `code` varchar(16) DEFAULT '' COMMENT '兑换码',
  `cinema_id` int(11) DEFAULT NULL COMMENT '影院主键',
  `movie_id` int(11) DEFAULT NULL COMMENT '电影主键',
  `times` int(2) DEFAULT NULL COMMENT '场次',
  `movie_title` varchar(128) DEFAULT NULL COMMENT '电影名称',
  `movie_img` varchar(256) DEFAULT NULL COMMENT '电影图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `movie_order` WRITE;
/*!40000 ALTER TABLE `movie_order` DISABLE KEYS */;

INSERT INTO `movie_order` (`id`, `phone`, `openid`, `out_trade_no`, `state`, `create_time`, `notify_time`, `total_fee`, `nickname`, `head_img`, `code`, `cinema_id`, `movie_id`, `times`, `movie_title`, `movie_img`)
VALUES
	(2,'13113777331','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201701059548633420',3,'2017-01-05 14:53:34','2017-01-05 14:53:38',1,'二当家小武',NULL,'',1,2,2,'鬼','http://120.25.1.38:8080/img/33.jpg'),
	(3,'13113777331','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201701055345116680',3,'2017-01-05 14:54:09','2017-01-05 14:54:13',1,'二当家小武',NULL,'',1,1,2,'海贼瓦','http://120.25.1.38:8080/img/39.jpg'),
	(66,'13113777331','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201701056620809125',3,'2017-01-05 14:54:36','2017-01-05 14:54:40',1,'二当家小武',NULL,'123562',1,1,2,'英雄本色','http://120.25.1.38:8080/img/38.jpg'),
	(5,'13113777331','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201701052428587649',1,'2017-01-05 14:54:48','2017-01-05 14:54:53',1,'二当家小武',NULL,'768610',1,1,2,'监狱风云','http://120.25.1.38:8080/img/37.jpg'),
	(67,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702255351759166',0,'2017-02-25 10:27:34',NULL,433,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',3,1,6,'僵尸道长','http://120.25.1.38:8080/img/36.jpg'),
	(68,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702258892067512',0,'2017-02-25 10:32:59',NULL,433,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',3,1,6,'猫和老鼠','http://120.25.1.38:8080/img/35.jpg'),
	(69,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702250646150587',0,'2017-02-25 12:16:25',NULL,433,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',3,1,6,'火影','http://120.25.1.38:8080/img/34.jpg'),
	(70,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702257422830020',0,'2017-02-25 15:56:03',NULL,222,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',2,1,2,'僵尸道长','http://120.25.1.38:8080/img/34.jpg'),
	(71,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702266879227411',0,'2017-02-26 06:22:47',NULL,433,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',3,1,6,'僵尸道长','http://120.25.1.38:8080/img/34.jpg'),
	(72,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702266791656348',0,'2017-02-26 06:27:52',NULL,433,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',3,1,6,'英雄本色','http://120.25.1.38:8080/img/34.jpg'),
	(73,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201702265020544246',0,'2017-02-26 06:29:12',NULL,433,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','',3,1,6,'英雄本色','http://120.25.1.38:8080/img/34.jpg'),
	(125,'131311323232','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','201703110883563401',3,'2017-03-11 10:52:57','2017-03-11 10:53:16',1,NULL,'http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','300543',3,1,6,'绝地逃亡','http://120.25.1.38:8080/img/33.jpg');

/*!40000 ALTER TABLE `movie_order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varbinary(32) DEFAULT NULL COMMENT '用户昵称',
  `openid` varchar(32) DEFAULT NULL COMMENT '用户openid',
  `head_img` varchar(128) DEFAULT NULL COMMENT '用户微信头像',
  `phone` varchar(16) DEFAULT NULL COMMENT '用户手机号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `token` varchar(256) DEFAULT NULL COMMENT '登录唯一标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `nickname`, `openid`, `head_img`, `phone`, `create_time`, `age`, `token`)
VALUES
	(2,X'44616E69656C','o-XkY0VEjjhcY-8PQQcAwe23f23',NULL,'15219108765','2016-12-12 00:00:00',29,NULL),
	(3,X'E5BC80E58F91E88085E7A4BEE58CBA','o-XkY0VEjjhcY-8PQQcAorrrrrKsg',NULL,'13112333432','2017-01-02 00:00:00',33,NULL),
	(17,X'E4BA8CE5BD93E5AEB6F09F949CE5B08FE6ADA6','o-XkY0VEjjhcY-8PQQcAobZA0Ksg','http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJiavDB2PGCCFM3iayD9ftnI7OLK1hkgvl6q3bibrDfVFrDFmPt8gmxenNhibJ1RMj8mGicYsYXjPIPY9w/0','131311323232','2017-02-02 20:44:00',423,'lNew09iYh8FfB_T7c_LNoX3qKmaHt1vIbVA08TOyRkIpnkqflIhkJj4Jb_uSMedBmzxetBWNyomo5xFREYOZuY7WvhB27oQBmvPK_rPIq_w0yWuSw2ksnHA2Xa5TO2de');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
