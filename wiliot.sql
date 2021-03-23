-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: wiliot
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_seqilkyenmqpzxtxnuswxjfdjzsuhehosgwy` (`sessionId`,`volumeId`),
  KEY `idx_gqzdextsmjtkdoukafidvphyrtueoarstabh` (`volumeId`),
  CONSTRAINT `fk_digucgrviaqfnjposldfnrtodqosargskrtw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rtamwlbyykrydcyvhbboybhawbeasssgwwmb` (`filename`,`folderId`),
  KEY `idx_sovjvgdhydnqlxasulykwzmeyqmqwhmulzaw` (`folderId`),
  KEY `idx_qdtmujvsgguxkavajbpufosnvgtyqsujxokb` (`volumeId`),
  KEY `fk_rsjyzyozlsqfqfyalgqisnsiwqsycnhjpaev` (`uploaderId`),
  CONSTRAINT `fk_hbjhkfwbudawafmeoedccpuwvwuiqzdbsgor` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lzayvxohxaguoysnwrfmosbpemyacckfylux` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rsjyzyozlsqfqfyalgqisnsiwqsycnhjpaev` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wtysjlcanghyuqanihczhuxgxntjmiybucmg` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (47,2,4,1,'test_logo.jpg','image',228,128,4320,NULL,NULL,NULL,'2021-03-08 13:34:04','2021-03-08 13:34:04','2021-03-08 13:34:04','ed4a3ac1-97ad-4dfe-a5f5-f145ea0bb4d4');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ucxxbyzpubknuorflkujuyiblmhdyywyesby` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransformindex`
--

LOCK TABLES `assettransformindex` WRITE;
/*!40000 ALTER TABLE `assettransformindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kizqjxfdrberednislwwemhygqmizblobtjw` (`name`),
  KEY `idx_qvcsplpxzqopxafsnjjpgbcuconcfhhdeozx` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tnrmccynaqvphajgxtwulmnomqanhhgpjebs` (`groupId`),
  KEY `fk_oqknifksvnqtydufzjtepoaetppacxsfomqe` (`parentId`),
  CONSTRAINT `fk_ngwngwichshgxtuloswwdxfvktrsgfadyawf` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oqknifksvnqtydufzjtepoaetppacxsfomqe` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vbfqzebyccegcytgeipfaarxzhhdongoevdl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fcodegwjhsbyimvnrtyynhpqqszzmtyyhadh` (`name`),
  KEY `idx_mnrjdyxohkmupdgmsazmnbcfpcgnsjqcqhev` (`handle`),
  KEY `idx_irabmbaeewzsmsibsompwrghaixkizqxzmsc` (`structureId`),
  KEY `idx_vqsgcrqbwwcuvbigvzgsbbcpjenzfockqavi` (`fieldLayoutId`),
  KEY `idx_yqwggstmsfzmjmozcjamwhoxwfjnmdkdfyvc` (`dateDeleted`),
  CONSTRAINT `fk_qskqzubymzyvulvusniytuagyiudtswojrqh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rcybwetmhypbtsulcvkwpxtkdvcywxrbtumq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_svkmpwcpecrryjdocegjrmcfhpykazpdwsfh` (`groupId`,`siteId`),
  KEY `idx_lwxwbddvdfiwccixvptptbgkforydbwssoki` (`siteId`),
  CONSTRAINT `fk_bcxujrwrbtzyirmrfswkztisdejrudhgalut` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tixgyfomfdfxrvdqlrvofdivqrtzcucixdfo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_kukqklljbcydenyloitbmmkqnajqhhusvgzk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_hgdsbnallystwozgiphicpgbtwqcrrwmrdif` (`siteId`),
  KEY `fk_rxixvysanclpuomzhvpeiqvjddrczzewsokh` (`userId`),
  CONSTRAINT `fk_hgdsbnallystwozgiphicpgbtwqcrrwmrdif` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mjxefzdxsadrqbyhguwjdnhljpqnxprjyicz` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rxixvysanclpuomzhvpeiqvjddrczzewsokh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_rtfgwfntqbluaqhlsvrziybduteoekauqxhg` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ovjzqrdtkfftoroogoelwpxcecryhadtzjwq` (`siteId`),
  KEY `fk_ghoenspjyjpoeuozvwxzwgnfgyxaizhmhzpc` (`fieldId`),
  KEY `fk_ttezlpiyghrsefysrurjrxqgcvcrfbbwrlyx` (`userId`),
  CONSTRAINT `fk_ghoenspjyjpoeuozvwxzwgnfgyxaizhmhzpc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ovjzqrdtkfftoroogoelwpxcecryhadtzjwq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qoghanwbwkjpdawcdgfipxtyzdyejqswraal` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ttezlpiyghrsefysrurjrxqgcvcrfbbwrlyx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (13,1,5,'2021-03-08 12:36:32',0,1),(13,1,6,'2021-03-08 12:36:32',0,1),(13,1,7,'2021-03-08 12:36:32',0,1),(13,1,8,'2021-03-08 12:36:32',0,1),(13,1,9,'2021-03-08 12:36:32',0,1),(13,1,10,'2021-03-08 12:36:32',0,1),(13,1,11,'2021-03-08 12:36:32',0,1),(13,1,12,'2021-03-08 12:42:54',0,1),(13,1,13,'2021-03-08 15:21:55',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_heroTitle` text COLLATE utf8_unicode_ci,
  `field_heroSubtitle` text COLLATE utf8_unicode_ci,
  `field_heroSizes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_introTitle` text COLLATE utf8_unicode_ci,
  `field_introDescription` text COLLATE utf8_unicode_ci,
  `field_outroTitle` text COLLATE utf8_unicode_ci,
  `field_outroDescription` text COLLATE utf8_unicode_ci,
  `field_outroButton` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ywjccdeonhguhlepfhdnbzafospflwxslkoi` (`elementId`,`siteId`),
  KEY `idx_twncrtboyenufiqsmogvawdvfnkaxbtubujx` (`siteId`),
  KEY `idx_vtdgqvaoqddyowlnhxctemmoiplfkqhkaxsu` (`title`),
  CONSTRAINT `fk_fsteglwbvwawityecjtpdfseocbxthpklpuq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kmngjzaeobfyiasrmjfkrnbwvtzglcqhdpuc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-03-04 12:19:12','2021-03-04 12:19:12','87d2ed48-ef81-4f25-92bc-a9253b892113',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,'Podstrona','2021-03-04 15:11:39','2021-03-05 12:43:26','0e8fb61d-95eb-4526-a6e8-6a530b5e224d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,'Podstrona','2021-03-04 15:11:39','2021-03-04 15:11:39','fee95186-4ccc-4a8d-852b-4b7edc566c58',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,1,'Podstrona','2021-03-04 15:12:26','2021-03-04 15:12:26','26a27db8-d379-44d6-b02c-8165aa334013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'Podstrona','2021-03-04 15:43:30','2021-03-04 15:43:30','6070d217-284d-4a15-b0a6-2e162d23b388',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,6,1,'Podstrona','2021-03-04 15:43:52','2021-03-04 15:43:52','9ec06ea9-a633-44d3-8677-2d79c82fe33f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,7,1,'Podstrona','2021-03-04 15:45:24','2021-03-04 15:45:24','29880f46-f2d8-4290-957d-a8df4aae9c78',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,8,1,'Podstrona','2021-03-04 15:46:39','2021-03-04 15:46:39','41d3bf79-6372-498a-a7b8-c5676cf76423',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,9,1,'Podstrona','2021-03-04 15:47:52','2021-03-04 15:47:52','27d5b9b9-ec08-4c74-b5d9-ad3dee5e620b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,10,1,'Podstrona','2021-03-04 15:48:11','2021-03-04 15:48:11','28194748-9c02-48fc-8aeb-afd6f5ccc0d0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,11,1,'Podstrona','2021-03-04 15:48:24','2021-03-04 15:48:24','09187812-ca6d-470c-9122-fd3c4a040c07',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,12,1,'Podstrona','2021-03-04 15:54:15','2021-03-04 15:54:15','2a76a6ac-4008-408f-8200-8f93de7e7996',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,13,1,'Partners','2021-03-05 11:46:09','2021-03-08 15:21:54','10ea65d4-3240-473b-9c46-ab4dead7c2ff','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(14,14,1,'Partners','2021-03-05 11:46:09','2021-03-05 11:46:09','49990582-cab7-4fc7-a782-4d080f8a4b00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,15,1,'Partners','2021-03-05 11:47:03','2021-03-05 11:47:03','f7563528-7356-4b88-808a-c539593b19eb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'Partners','2021-03-05 12:04:37','2021-03-05 12:04:37','ab7d20ad-4248-4d27-9c00-35c6c85ecda3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,18,1,'Partners','2021-03-05 12:42:38','2021-03-05 12:42:38','1616b0bc-67fe-4dcd-b224-271e7737170c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,20,1,'Podstrona','2021-03-05 12:43:26','2021-03-05 12:43:26','6f5b7685-6907-4f29-92e0-f757acfdb41f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,21,1,'Partners','2021-03-05 13:38:20','2021-03-05 13:38:20','cc7eebae-a1d8-4ef4-a18d-6e290122b9d3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,22,1,'Partners','2021-03-05 13:38:42','2021-03-05 13:38:42','8be4fdbc-6a4a-4932-96ab-8114a9973e39',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,25,1,'Partners','2021-03-05 14:16:58','2021-03-05 14:16:58','5228cf63-6021-4eb4-bfc9-544af5f4504d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,28,1,'Partners','2021-03-05 14:59:13','2021-03-05 14:59:13','0a92aac1-0731-4def-8734-2efe87a1217f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,29,1,'Partners','2021-03-05 15:02:04','2021-03-05 15:02:04','2ceeaab8-3240-4a2d-8922-d46c1bf99f91',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,30,1,'Partners','2021-03-05 15:02:19','2021-03-05 15:02:19','92f0db81-cabc-41c4-996f-6c69daa17420','Designed to enable best of breed solutions','Works with Wiliot',NULL,NULL,NULL,NULL,NULL,NULL),(25,31,1,'Partners','2021-03-05 15:11:21','2021-03-05 15:11:21','03b81689-396a-4015-b2f9-aea13d81c942','Designed to enable best of breed solutions','Works with Wiliot',NULL,NULL,NULL,NULL,NULL,NULL),(26,32,1,'Partners','2021-03-05 15:12:04','2021-03-05 15:12:04','5b06ed2d-5524-4a58-9252-3dd7874dfda4','Designed to enable best of breed solutions','Works with Wiliot','small',NULL,NULL,NULL,NULL,NULL),(27,33,1,'Partners','2021-03-08 11:12:13','2021-03-08 11:12:13','2e3aaec5-7964-4cd3-a440-d58db5ed8651','Designed to enable best of breed solutions','Works with Wiliot','small',NULL,NULL,NULL,NULL,NULL),(28,34,1,'Partners','2021-03-08 11:12:45','2021-03-08 11:12:45','91cb46b1-3026-4d51-8d3f-af58b286903d','Designed to enable best of breed solutions','Works with Wiliot','small','Works with Wiliot','<p>fds</p>',NULL,NULL,NULL),(29,35,1,'Partners','2021-03-08 11:16:05','2021-03-08 11:16:05','000fa4fa-3b84-4397-9260-dad71096a3d9','Designed to enable best of breed solutions','Works with Wiliot','small',NULL,'',NULL,NULL,NULL),(30,36,1,'Partners','2021-03-08 11:19:38','2021-03-08 11:19:38','b600cfcd-0a86-42ff-97b1-d31940a6a500','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>',NULL,NULL,NULL),(31,37,1,'Partners','2021-03-08 12:20:24','2021-03-08 12:20:24','362f0302-1087-48c6-bc03-5f24358fb305','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>',NULL,NULL,'{\"ariaLabel\":null,\"customQuery\":null,\"customText\":null,\"target\":null,\"title\":null,\"type\":null,\"value\":null}'),(32,38,1,'Partners','2021-03-08 12:21:01','2021-03-08 12:21:01','b29bed89-a600-4446-bbed-607dec9bfd28','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW <br> Partner Today',NULL,'{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"url\",\"value\":\"\"}'),(33,39,1,'Partners','2021-03-08 12:21:19','2021-03-08 12:21:19','fff0f53b-f6aa-41ba-8ad2-42e93c046d72','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today',NULL,'{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"\",\"target\":null,\"title\":null,\"type\":\"url\",\"value\":\"\"}'),(34,40,1,'Partners','2021-03-08 12:23:02','2021-03-08 12:23:02','e8a38848-0576-4bfa-9291-32b2018f59b7','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":null,\"title\":null,\"type\":\"entry\",\"value\":\"13\"}'),(35,41,1,'Partners','2021-03-08 12:31:31','2021-03-08 12:31:31','4ebc0fc1-974a-40bc-bb7e-ec219a121b94','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"_blank\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(36,42,1,'Partners','2021-03-08 12:35:49','2021-03-08 12:35:49','286837b8-a5e8-4066-aed4-5c4e69f0bb72','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(38,44,1,'Partners','2021-03-08 12:36:32','2021-03-08 12:36:32','7c04609a-33c9-4663-ab6e-5f2b24d6c056','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(39,45,1,'Partners','2021-03-08 12:36:45','2021-03-08 12:36:45','2bf93f6e-d794-4329-8f5b-81eb9f9edc23','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"_blank\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(40,46,1,'Partners','2021-03-08 12:42:54','2021-03-08 12:42:54','8d9af3c4-1629-4f9b-91ec-c2dba920fd58','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(41,47,1,'Test logo','2021-03-08 13:34:04','2021-03-08 13:34:04','6ae0b264-d917-481d-a604-36448ecd61a8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,48,1,'Partners','2021-03-08 13:39:39','2021-03-08 13:39:39','846b86f7-8c43-4dde-b6a7-f8cbff8d785a','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(43,50,1,'Partners','2021-03-08 13:43:27','2021-03-08 13:43:27','21daf97a-0147-4232-929e-111abcff10d8','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(44,52,1,'Partners','2021-03-08 13:48:30','2021-03-08 13:48:30','098fd66d-fbb5-481c-8861-e44a4a8ca8e1','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(45,55,1,'Partners','2021-03-08 14:57:44','2021-03-08 14:57:44','d1adb211-0faa-4cb3-af38-21d72983a241','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(46,60,1,'Partners','2021-03-08 15:02:42','2021-03-08 15:02:42','69ac3d97-b3ee-4ff4-bd8c-759bb48bc9d3','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(47,73,1,'Partners','2021-03-08 15:19:52','2021-03-08 15:19:52','d29f2ed9-3142-4ce5-a6df-a540904f776f','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}'),(48,86,1,'Partners','2021-03-08 15:21:54','2021-03-08 15:21:54','995a64e6-0ddf-454e-8976-e5bf9a4181a1','Designed to enable best of breed solutions','Works with Wiliot','small','Partnership Program','<p>The Works with Wiliot Program helps our partners build successful businesses on our product, opening up more options and functionality for our customers. Our strategy is to enable an extensive ecosystem that will help accelerate Wiliot\'s mission to \'connect everything\', changing the way things are made, distributed, sold, used and recycled.</p>','Become a WwW Partner Today','<p>Works with Wiliot is built to be a platform to plug into the established ecosystems of smartphones, tag manufacturers, Bluetooth IoT devices, printers, and applications. There is an important role for the Management Consultants, Solution Prodivers, and Systems Integrators that can help our customers glue components together and adapt their organizations to capitalize on the new opportunities, such as the move from supply chain to demand chain systems. Join Works with Wiliot today.</p>','{\"ariaLabel\":null,\"customQuery\":null,\"customText\":\"Partner\",\"target\":\"\",\"title\":\"Partner\",\"type\":\"entry\",\"value\":\"13\"}');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_oroapvofrsllylbbldxoncmzswrprqnvtirb` (`userId`),
  CONSTRAINT `fk_oroapvofrsllylbbldxoncmzswrprqnvtirb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ylcwuqedktloqabpjumuybdjwhvidianxmfr` (`key`,`fingerprint`)
) ENGINE=InnoDB AUTO_INCREMENT=1193 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
INSERT INTO `deprecationerrors` VALUES (1190,'ElementQuery::getIterator()','/Applications/MAMP/htdocs/wiliot/templates/sections/partners-listing.twig:59','2021-03-17 09:18:00','/Applications/MAMP/htdocs/wiliot/templates/sections/partners-listing.twig',59,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Applications/MAMP/htdocs/wiliot/storage/runtime/compiled_templates/27/2797d554e0a9200b76435462c50752006c22653d44cf9cf576deb62528da9bac.php\",\"line\":204,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_81c9e1f607784ab234c5497f6225bd1dbcc8630afbb4a2c3219b36428dbba0fd\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_81c9e1f607784ab234c5497f6225bd1dbcc8630afbb4a2c3219b36428dbba0fd\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_81c9e1f607784ab234c5497f6225bd1dbcc8630afbb4a2c3219b36428dbba0fd\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_81c9e1f607784ab234c5497f6225bd1dbcc8630afbb4a2c3219b36428dbba0fd\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...]\"},{\"objectClass\":\"__TwigTemplate_81c9e1f607784ab234c5497f6225bd1dbcc8630afbb4a2c3219b36428dbba0fd\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1231,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...]\"},{\"objectClass\":null,\"file\":\"/Applications/MAMP/htdocs/wiliot/storage/runtime/compiled_templates/3d/3db1eead7b9490783b407c6d0b8c9a3a5ce956d2e24d17e578a834fa203043fa.php\",\"line\":86,\"class\":null,\"method\":\"twig_include\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], \\\"/sections/partners-listing.twig\\\"\"},{\"objectClass\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462\",\"file\":\"/Applications/MAMP/htdocs/wiliot/storage/runtime/compiled_templates/58/586dc57fde55e49b22a1da321983b0c88cf5fa3dfc15262e54f850cb09582796.php\",\"line\":56,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_8845803ba196630aed19ca7245d57cb8d864051ba167afc7498b1658d277a462\",\"file\":\"/Applications/MAMP/htdocs/wiliot/storage/runtime/compiled_templates/3d/3db1eead7b9490783b407c6d0b8c9a3a5ce956d2e24d17e578a834fa203043fa.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"title\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_title\\\"], \\\"head\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_a218df5bcf84ff7d099c730bd321a640f1cd494c3f3e7938a4cf3abcb1046322\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-17 09:18:00','2021-03-17 09:18:00','8ea9c5ac-9b22-4caa-898f-e7feaaf75364'),(1191,'ElementQuery::getIterator()','/Applications/MAMP/htdocs/wiliot-kopia/templates/sections/partners-listing.twig:59','2021-03-16 15:07:01','/Applications/MAMP/htdocs/wiliot-kopia/templates/sections/partners-listing.twig',59,'Looping through element queries directly has been deprecated. Use the `all()` function to fetch the query results before looping over them.','[{\"objectClass\":\"craft\\\\services\\\\Deprecator\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/elements/db/ElementQuery.php\",\"line\":575,\"class\":\"craft\\\\services\\\\Deprecator\",\"method\":\"log\",\"args\":\"\\\"ElementQuery::getIterator()\\\", \\\"Looping through element queries directly has been deprecated. Us...\\\"\"},{\"objectClass\":\"craft\\\\elements\\\\db\\\\MatrixBlockQuery\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/storage/runtime/compiled_templates/18/18221a3482b7f774e41a054528a71efe9bba2cc24eb4eaad09068e193841b285.php\",\"line\":204,\"class\":\"craft\\\\elements\\\\db\\\\ElementQuery\",\"method\":\"getIterator\",\"args\":null},{\"objectClass\":\"__TwigTemplate_fdb2669a08d3e5938f89b1f01580caeefc2eb5375b9b5133225024c898185074\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_fdb2669a08d3e5938f89b1f01580caeefc2eb5375b9b5133225024c898185074\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_fdb2669a08d3e5938f89b1f01580caeefc2eb5375b9b5133225024c898185074\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], []\"},{\"objectClass\":\"__TwigTemplate_fdb2669a08d3e5938f89b1f01580caeefc2eb5375b9b5133225024c898185074\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...]\"},{\"objectClass\":\"__TwigTemplate_fdb2669a08d3e5938f89b1f01580caeefc2eb5375b9b5133225024c898185074\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Extension/CoreExtension.php\",\"line\":1231,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...]\"},{\"objectClass\":null,\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/storage/runtime/compiled_templates/bb/bb1bb14dffc816123ebe9672172087b392e3b74efc4f35d4d2125c06d91c89aa.php\",\"line\":86,\"class\":null,\"method\":\"twig_include\",\"args\":\"craft\\\\web\\\\twig\\\\Environment, [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], \\\"/sections/partners-listing.twig\\\"\"},{\"objectClass\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":182,\"class\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"method\":\"block_main\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/storage/runtime/compiled_templates/51/5135361297b6f24c84269106af6a5ef82fd59e3ba182b210e0a949d7065d3342.php\",\"line\":56,\"class\":\"Twig\\\\Template\",\"method\":\"displayBlock\",\"args\":\"\\\"main\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"], \\\"footer\\\" => [__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520, \\\"block_footer\\\"]]\"},{\"objectClass\":\"__TwigTemplate_51d62de33bdef53b723bfec78b46f8c52d91bca55bf90bfc3d2cbbabd1549520\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/storage/runtime/compiled_templates/bb/bb1bb14dffc816123ebe9672172087b392e3b74efc4f35d4d2125c06d91c89aa.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":405,\"class\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"method\":\"doDisplay\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":378,\"class\":\"Twig\\\\Template\",\"method\":\"displayWithErrorHandling\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"view\\\" => craft\\\\web\\\\View, \\\"devMode\\\" => true, ...], [\\\"title\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_title\\\"], \\\"head\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_head\\\"], \\\"main\\\" => [__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f, \\\"block_main\\\"]]\"},{\"objectClass\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Template.php\",\"line\":390,\"class\":\"Twig\\\\Template\",\"method\":\"display\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"__TwigTemplate_83b5b19a22e1f380be42cc8df07ea92775edce0ad9a617be70bbbe601d050e7f\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/TemplateWrapper.php\",\"line\":45,\"class\":\"Twig\\\\Template\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], []\"},{\"objectClass\":\"Twig\\\\TemplateWrapper\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/twig/twig/src/Environment.php\",\"line\":318,\"class\":\"Twig\\\\TemplateWrapper\",\"method\":\"render\",\"args\":\"[\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\twig\\\\Environment\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/web/View.php\",\"line\":390,\"class\":\"Twig\\\\Environment\",\"method\":\"render\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/web/View.php\",\"line\":451,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderTemplate\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\web\\\\View\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/web/Controller.php\",\"line\":257,\"class\":\"craft\\\\web\\\\View\",\"method\":\"renderPageTemplate\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]], \\\"site\\\"\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/controllers/TemplatesController.php\",\"line\":100,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"renderTemplate\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":null,\"line\":null,\"class\":\"craft\\\\controllers\\\\TemplatesController\",\"method\":\"actionRender\",\"args\":\"\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry, \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":null,\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/yiisoft/yii2/base/InlineAction.php\",\"line\":57,\"class\":null,\"method\":\"call_user_func_array\",\"args\":\"[craft\\\\controllers\\\\TemplatesController, \\\"actionRender\\\"], [\\\"pages/partners\\\", [\\\"entry\\\" => craft\\\\elements\\\\Entry]]\"},{\"objectClass\":\"yii\\\\base\\\\InlineAction\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/yiisoft/yii2/base/Controller.php\",\"line\":181,\"class\":\"yii\\\\base\\\\InlineAction\",\"method\":\"runWithParams\",\"args\":\"[\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/web/Controller.php\",\"line\":190,\"class\":\"yii\\\\base\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\controllers\\\\TemplatesController\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/yiisoft/yii2/base/Module.php\",\"line\":534,\"class\":\"craft\\\\web\\\\Controller\",\"method\":\"runAction\",\"args\":\"\\\"render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/web/Application.php\",\"line\":274,\"class\":\"yii\\\\base\\\\Module\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/yiisoft/yii2/web/Application.php\",\"line\":104,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"runAction\",\"args\":\"\\\"templates/render\\\", [\\\"template\\\" => \\\"pages/partners\\\", \\\"variables\\\" => [\\\"entry\\\" => craft\\\\elements\\\\Entry], \\\"p\\\" => \\\"partners\\\"]\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/craftcms/cms/src/web/Application.php\",\"line\":259,\"class\":\"yii\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/vendor/yiisoft/yii2/base/Application.php\",\"line\":392,\"class\":\"craft\\\\web\\\\Application\",\"method\":\"handleRequest\",\"args\":\"craft\\\\web\\\\Request\"},{\"objectClass\":\"craft\\\\web\\\\Application\",\"file\":\"/Applications/MAMP/htdocs/wiliot-kopia/web/index.php\",\"line\":22,\"class\":\"yii\\\\base\\\\Application\",\"method\":\"run\",\"args\":null}]','2021-03-16 15:07:01','2021-03-16 15:07:01','f5cb06de-5910-4f99-9c3b-6a151c203dbf');
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_erepsgfczrmyvhkddadogmdmdfznkargryoj` (`saved`),
  KEY `fk_levdvfgrdixyorfqeampzbsftksuzxvouofh` (`creatorId`),
  KEY `fk_pvddqurppnvawajryuutqzcbswgdkjyqrwyt` (`sourceId`),
  CONSTRAINT `fk_levdvfgrdixyorfqeampzbsftksuzxvouofh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pvddqurppnvawajryuutqzcbswgdkjyqrwyt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jsbcusmjzzcukxsshjjieehctofbtufdopji` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
INSERT INTO `elementindexsettings` VALUES (1,'craft\\elements\\Entry','{\"sources\":{\"*\":{\"tableAttributes\":{\"1\":\"section\",\"2\":\"postDate\",\"3\":\"expiryDate\",\"4\":\"link\",\"5\":\"type\",\"6\":\"slug\",\"7\":\"id\"}}}}','2021-03-05 11:39:01','2021-03-05 11:39:01','8307e046-3a0c-473c-88fc-4768587a12a9');
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ktjcckqxrvbeomktvgrnldbnwcgpmwvzroqw` (`dateDeleted`),
  KEY `idx_naunclrxgtenrwxlbebgcokbkuxuonrkentp` (`fieldLayoutId`),
  KEY `idx_txwgtylhsnfljixythakfgwankdlsiemtkss` (`type`),
  KEY `idx_goubtaehiirclhculqqsuzmrvpajblnddhqq` (`enabled`),
  KEY `idx_frejhseshtvvgjzqkqntlictteoezheccacd` (`archived`,`dateCreated`),
  KEY `idx_bjhdqmlnsflwkmagymetnviffqkndrlhrwjx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_xectmzusjzzckqeopedefxckqmnaqxtapvph` (`draftId`),
  KEY `fk_gyvidspprxfayhsgjjadpueulsavdgixtpkr` (`revisionId`),
  CONSTRAINT `fk_gyvidspprxfayhsgjjadpueulsavdgixtpkr` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nmyhtyijogvuhgltczlclvlrucxwswdhhych` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xectmzusjzzckqeopedefxckqmnaqxtapvph` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-03-04 12:19:12','2021-03-04 12:19:12',NULL,'a6b2b973-9273-4b3c-b87e-6a20add9b4ac'),(2,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:11:39','2021-03-05 12:43:26','2021-03-05 13:23:05','bff20efb-acbd-44e6-8008-0cb01877ed43'),(3,NULL,1,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:11:39','2021-03-04 15:11:39','2021-03-05 13:23:05','2c18d38a-402c-4c18-80e5-fa54361cab41'),(4,NULL,2,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:12:26','2021-03-04 15:12:26','2021-03-05 13:23:05','2db43985-675c-4f8e-a8d6-4a45bd485bcc'),(5,NULL,3,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:43:30','2021-03-04 15:43:30','2021-03-05 13:23:05','2b002e77-b80d-4b22-bf83-44242f833ff8'),(6,NULL,4,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:43:52','2021-03-04 15:43:52','2021-03-05 13:23:05','62b4e56f-309a-48d3-91bc-1fbc586f8702'),(7,NULL,5,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:45:24','2021-03-04 15:45:24','2021-03-05 13:23:05','24229268-7824-4a7b-af22-a21db6af396c'),(8,NULL,6,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:46:39','2021-03-04 15:46:39','2021-03-05 13:23:05','bfd67812-83c8-4ed9-8ae3-f9b9b5b4982a'),(9,NULL,7,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:47:52','2021-03-04 15:47:52','2021-03-05 13:23:05','7a8760c0-36ff-45b7-9bbe-7ce81401346c'),(10,NULL,8,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:48:11','2021-03-04 15:48:11','2021-03-05 13:23:05','fd14bc62-b226-4799-bad1-85e803994371'),(11,NULL,9,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:48:24','2021-03-04 15:48:24','2021-03-05 13:23:05','eac9fbfa-97d6-45df-9d22-636a90e99421'),(12,NULL,10,1,'craft\\elements\\Entry',1,0,'2021-03-04 15:54:15','2021-03-04 15:54:15','2021-03-05 13:23:05','80cce018-9664-43f5-ae3b-fdadc46bc3f7'),(13,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-03-05 11:46:09','2021-03-08 15:21:54',NULL,'52b673d1-998d-435a-bb79-d4b145d8f8fc'),(14,NULL,11,3,'craft\\elements\\Entry',1,0,'2021-03-05 11:46:09','2021-03-05 11:46:09',NULL,'281c5ce1-5422-468c-9572-c1ad05dae382'),(15,NULL,12,3,'craft\\elements\\Entry',1,0,'2021-03-05 11:47:03','2021-03-05 11:47:03',NULL,'fb18ddb5-35e1-4707-800d-8ec0bb39e912'),(16,NULL,13,3,'craft\\elements\\Entry',1,0,'2021-03-05 12:04:37','2021-03-05 12:04:37',NULL,'37eb6b8f-5164-4d05-b1b3-c532d2b77e28'),(17,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-03-05 12:42:38','2021-03-05 14:16:58','2021-03-05 14:54:08','4ad97d12-d83a-457c-9d0c-ffe8abb07624'),(18,NULL,14,3,'craft\\elements\\Entry',1,0,'2021-03-05 12:42:38','2021-03-05 12:42:38',NULL,'c1516c23-90d0-4d08-9806-1fe24d37e64d'),(19,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-03-05 12:42:38','2021-03-05 12:42:38',NULL,'01ebe3aa-29aa-4f56-b32c-80918ff18cb4'),(20,NULL,15,1,'craft\\elements\\Entry',1,0,'2021-03-05 12:43:26','2021-03-05 12:43:26','2021-03-05 13:23:05','7b01a0e3-6f52-4f11-a29b-0224d1c54533'),(21,NULL,16,3,'craft\\elements\\Entry',1,0,'2021-03-05 13:38:20','2021-03-05 13:38:20',NULL,'40842778-a5d7-4665-9923-51c4424ce2f5'),(22,NULL,17,3,'craft\\elements\\Entry',1,0,'2021-03-05 13:38:42','2021-03-05 13:38:42',NULL,'705b0866-4444-4b8a-bc58-a9a2d11b76cb'),(23,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-03-05 13:38:42','2021-03-05 12:42:38',NULL,'9c205ade-6c5e-4693-93d0-7cea90ed7a49'),(24,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-03-05 14:16:58','2021-03-05 14:16:58','2021-03-05 14:54:08','e4f2c29d-0556-4511-b828-30fd851f8a95'),(25,NULL,18,3,'craft\\elements\\Entry',1,0,'2021-03-05 14:16:58','2021-03-05 14:16:58',NULL,'6f2bf4f3-3214-4129-81aa-87222cac022f'),(26,NULL,NULL,5,'craft\\elements\\MatrixBlock',1,0,'2021-03-05 14:16:58','2021-03-05 14:16:58',NULL,'3305010d-70d5-4e90-8482-3cfc65d9cb2a'),(27,NULL,NULL,4,'craft\\elements\\MatrixBlock',1,0,'2021-03-05 14:16:58','2021-03-05 14:16:58',NULL,'bb7eb8a9-bddb-42c5-9543-0bfddb711f89'),(28,NULL,19,3,'craft\\elements\\Entry',1,0,'2021-03-05 14:59:13','2021-03-05 14:59:13',NULL,'e7a06847-7f5c-4fd4-8be2-1881e1bc538a'),(29,NULL,20,3,'craft\\elements\\Entry',1,0,'2021-03-05 15:02:04','2021-03-05 15:02:04',NULL,'bfb2af28-16d4-4d35-afb8-86acac325ed6'),(30,NULL,21,3,'craft\\elements\\Entry',1,0,'2021-03-05 15:02:19','2021-03-05 15:02:19',NULL,'5d8f1dad-fcf7-4ccc-a086-ac86e8fa74f9'),(31,NULL,22,3,'craft\\elements\\Entry',1,0,'2021-03-05 15:11:21','2021-03-05 15:11:21',NULL,'659b37e8-b9ac-411c-afcc-db9ed97a58ef'),(32,NULL,23,3,'craft\\elements\\Entry',1,0,'2021-03-05 15:12:04','2021-03-05 15:12:04',NULL,'3bf64f77-fff8-49e9-a561-37bcc6f30182'),(33,NULL,24,3,'craft\\elements\\Entry',1,0,'2021-03-08 11:12:13','2021-03-08 11:12:13',NULL,'6b1d7ac6-5a31-4540-bc72-ff8c9094969c'),(34,NULL,25,3,'craft\\elements\\Entry',1,0,'2021-03-08 11:12:45','2021-03-08 11:12:45',NULL,'723e7bb1-a598-4872-b404-1c396830f1e5'),(35,NULL,26,3,'craft\\elements\\Entry',1,0,'2021-03-08 11:16:05','2021-03-08 11:16:05',NULL,'a80ca414-028c-46c4-9904-753bb5fba185'),(36,NULL,27,3,'craft\\elements\\Entry',1,0,'2021-03-08 11:19:38','2021-03-08 11:19:38',NULL,'9a6c3220-0099-4913-9abb-e5c2c21c86a5'),(37,NULL,28,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:20:24','2021-03-08 12:20:24',NULL,'53a3592c-b9bc-4231-a883-3cc3f84c06b5'),(38,NULL,29,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:21:01','2021-03-08 12:21:01',NULL,'bc3ecbac-2bbe-43a6-89b7-b540878923b3'),(39,NULL,30,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:21:19','2021-03-08 12:21:19',NULL,'dddae01b-2d6a-4a2b-a3c1-b9144c736308'),(40,NULL,31,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:23:02','2021-03-08 12:23:02',NULL,'bc014f27-203b-431a-81de-192dc19f7722'),(41,NULL,32,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:31:31','2021-03-08 12:31:31',NULL,'38cbfdb9-aed2-4764-9e03-eeb3338ec0a1'),(42,NULL,33,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:35:49','2021-03-08 12:35:49',NULL,'d3c634e7-d801-48a6-9ef0-e3419384e199'),(44,NULL,34,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:36:32','2021-03-08 12:36:32',NULL,'57432854-55be-47b8-8523-90786aaef341'),(45,NULL,35,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:36:45','2021-03-08 12:36:45',NULL,'60a12467-45aa-4106-9217-35be9078f3fe'),(46,NULL,36,3,'craft\\elements\\Entry',1,0,'2021-03-08 12:42:54','2021-03-08 12:42:54',NULL,'a82efa6f-8cdd-4648-8ab7-7b1df416acd6'),(47,NULL,NULL,6,'craft\\elements\\Asset',1,0,'2021-03-08 13:34:04','2021-03-08 13:34:04',NULL,'c3321abb-86f7-4c82-9f3d-3789c5b175bf'),(48,NULL,37,3,'craft\\elements\\Entry',1,0,'2021-03-08 13:39:39','2021-03-08 13:39:39',NULL,'0b5e41d0-d627-463c-a1dd-b6d346312f48'),(49,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 13:43:27','2021-03-08 15:19:52',NULL,'b8e0faac-9a3d-4f21-aefb-16cf08c6e8e7'),(50,NULL,38,3,'craft\\elements\\Entry',1,0,'2021-03-08 13:43:27','2021-03-08 13:43:27',NULL,'01c297ba-118c-4fb5-8ac3-cf61fc729c7d'),(51,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 13:43:27','2021-03-08 13:43:27',NULL,'f5c5aec3-1579-4ec7-bb1b-20afadab9fb5'),(52,NULL,39,3,'craft\\elements\\Entry',1,0,'2021-03-08 13:48:30','2021-03-08 13:48:30',NULL,'31c0ac77-8b36-4f4a-ad73-9d066d3b234b'),(53,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 13:48:30','2021-03-08 13:48:30',NULL,'4c6982fb-5162-45ac-bcf1-171a58c112b2'),(54,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 14:57:44','2021-03-08 15:19:52',NULL,'a73181e2-7593-48f3-bad9-98cbef90e0d6'),(55,NULL,40,3,'craft\\elements\\Entry',1,0,'2021-03-08 14:57:43','2021-03-08 14:57:43',NULL,'d7d38b47-9da1-49c9-ac51-8c8cccccc7b1'),(56,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 14:57:44','2021-03-08 14:57:44',NULL,'4c64efc6-480c-430b-8d85-3d578f1aeeb1'),(57,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 14:57:44','2021-03-08 14:57:44',NULL,'2808ac54-5bd0-422b-91ca-b6752c43c807'),(58,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:02:42','2021-03-08 15:19:52',NULL,'14f547e5-8dbd-4d39-9416-ee92c40c2f8f'),(59,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:02:42','2021-03-08 15:19:52',NULL,'e68bf529-1d56-4195-bb1f-76262a05c412'),(60,NULL,41,3,'craft\\elements\\Entry',1,0,'2021-03-08 15:02:42','2021-03-08 15:02:42',NULL,'6da28c39-6f86-4141-8e8e-342710ac29e3'),(61,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:02:42','2021-03-08 15:02:42',NULL,'f7b21a2c-8b76-4e8c-890c-ece41ae54341'),(62,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:02:42','2021-03-08 15:02:42',NULL,'5b9279ab-1c33-4fcd-b388-5289e25ba5ec'),(63,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:02:42','2021-03-08 15:02:42',NULL,'49c5e921-4131-4e83-b5ce-6a34a54bcb2d'),(64,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:02:43','2021-03-08 15:02:42',NULL,'aaae88e6-2b17-451a-ad9f-aef8db69dcb9'),(65,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'ae968fcc-b801-41e2-b9c3-a24eccc1c07d'),(66,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'69fb25d8-0404-4c4e-9d24-f3ee08ab4ab7'),(67,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:21:54',NULL,'a793b733-fab4-4304-886a-667183203da7'),(68,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:21:54',NULL,'f9776e86-7041-46a6-b4b0-4155a2b44810'),(69,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'46ca2d69-caf0-46f1-96e8-e2fb594f42ce'),(70,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'068aa1f2-a462-42f8-a63e-abae8de39f14'),(71,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'bcccb0d2-106f-4512-a970-0a683cbd8764'),(72,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'44944ade-59ec-4013-bb77-71a89b9f16af'),(73,NULL,42,3,'craft\\elements\\Entry',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'c75d2267-3081-4bb0-971d-89fa110d7fb1'),(74,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'1030e7d6-59bf-4c7f-bbb3-e4038beb15a8'),(75,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'c82cedb0-a97f-4ba6-a2a0-8f104973caea'),(76,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'9664b5ff-2471-4380-9482-59fcda6bcc64'),(77,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'650fe137-e597-435f-bd05-f2b5df587ca8'),(78,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'2264e34b-7d77-4465-a985-0ebdf84d345a'),(79,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'2f5709dd-44c0-4431-aac6-959d00030abb'),(80,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'0dbece1f-22da-4f1a-80d9-2ca89c5b44a9'),(81,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'a675a7e7-a2e8-4831-8978-b4276de8ab6b'),(82,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'e4c3ba37-e01d-4c99-af25-0eb19f908636'),(83,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'621dc01d-177f-4557-92f9-873a35a470a1'),(84,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'6b456dd1-e0c9-4f37-bfec-632e5b5fcfd3'),(85,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:19:52','2021-03-08 15:19:52',NULL,'e8959940-02b3-41db-8734-cd113e3e4f41'),(86,NULL,43,3,'craft\\elements\\Entry',1,0,'2021-03-08 15:21:54','2021-03-08 15:21:54',NULL,'982675b3-3efa-44ba-a064-6390913c7a5e'),(87,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:54','2021-03-08 15:19:52',NULL,'5cd582de-deea-4638-9c0b-e0c59f406f9a'),(88,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:54','2021-03-08 15:19:52',NULL,'f7808d26-58c0-46a6-9bb3-c1b31cd79625'),(89,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:54','2021-03-08 15:19:52',NULL,'e00d6006-a4cd-497e-b275-7eb5432f1b85'),(90,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'0625fdde-ded9-406f-9bdc-9e4a539b2d33'),(91,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'281585fa-a3b2-48f8-9284-ef3f50522687'),(92,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'0dd10bb1-74df-4b05-ac44-71e485aed4d9'),(93,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:21:54',NULL,'5a0a8f20-00d3-484e-94be-235edc348ee5'),(94,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:21:54',NULL,'2bd53268-65d5-4d77-bac9-f6640a976397'),(95,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'71fd0096-ec20-475c-81d6-165ebb987fa2'),(96,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'d2d2ccf6-b995-42cb-8806-e7f12d5a3d5b'),(97,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'35eb866c-b6f6-4547-8d48-0361e0cefb57'),(98,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2021-03-08 15:21:55','2021-03-08 15:19:52',NULL,'13451c48-d925-4c67-be6f-f55296b6fef9');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_afbevhogwnlozkoiejqovbynzhqeexslayfs` (`elementId`,`siteId`),
  KEY `idx_sowayflralvidacodcehdypegnvxhzttmsbd` (`siteId`),
  KEY `idx_pccxhrthkixmhopbvbqvahrnzhllfgddzqnr` (`slug`,`siteId`),
  KEY `idx_eyzucdbdbvlnapwuewenclzsciwbthvmvgho` (`enabled`),
  KEY `idx_tpyyfgpsupmlodqjxhmvxeejlxytntgvfrtr` (`uri`,`siteId`),
  CONSTRAINT `fk_lnuhickykpmptlumidmtcvuflzoqwvwhiwun` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_qylbhwpfoqipeziahngnmdpzvgjmtzxssugc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-03-04 12:19:12','2021-03-04 12:19:12','c1a82be7-cff6-4bff-98f7-0ae3d2b3e9e0'),(2,2,1,'podstrona','podstrona',1,'2021-03-04 15:11:39','2021-03-04 15:11:39','d1d54ef9-1077-44a4-a552-2d684e4da4fd'),(3,3,1,'podstrona','podstrona',1,'2021-03-04 15:11:39','2021-03-04 15:11:39','62117f72-d7ec-49a3-8185-d17d134502e2'),(4,4,1,'podstrona','podstrona',1,'2021-03-04 15:12:26','2021-03-04 15:12:26','e09173c7-a975-462b-9c25-fe0abed61e3a'),(5,5,1,'podstrona','podstrona',1,'2021-03-04 15:43:30','2021-03-04 15:43:30','eb9d44e7-cb8b-4c48-acba-0e7acb85f613'),(6,6,1,'podstrona','podstrona',1,'2021-03-04 15:43:52','2021-03-04 15:43:52','e63d904d-4dba-4dd4-a3d0-3b764d966f53'),(7,7,1,'podstrona','podstrona',1,'2021-03-04 15:45:24','2021-03-04 15:45:24','fe10860e-6e0c-4900-a629-e51fc0c5481d'),(8,8,1,'podstrona','podstrona',1,'2021-03-04 15:46:39','2021-03-04 15:46:39','d80f78f4-00ac-45a8-b1fd-7f7451e5af4e'),(9,9,1,'podstrona','podstrona',1,'2021-03-04 15:47:52','2021-03-04 15:47:52','bfc58a5d-4d54-4a9e-8fc7-b05717db6d35'),(10,10,1,'podstrona','podstrona',1,'2021-03-04 15:48:11','2021-03-04 15:48:11','9944dae6-0f3a-4172-961a-a0bf7f05315c'),(11,11,1,'podstrona','podstrona',1,'2021-03-04 15:48:24','2021-03-04 15:48:24','b438790e-ee7b-45f3-8603-25b1b101fe6a'),(12,12,1,'podstrona','podstrona',1,'2021-03-04 15:54:15','2021-03-04 15:54:15','c868ac76-329c-46a1-8a02-b7cc9aa55d24'),(13,13,1,'partners','partners',1,'2021-03-05 11:46:09','2021-03-05 11:46:09','eccd08d7-53b5-44b3-97f1-0ed3fac29363'),(14,14,1,'partners','partners',1,'2021-03-05 11:46:09','2021-03-05 11:46:09','a1e39bd2-ab4e-47f9-a927-23f7622edaf0'),(15,15,1,'partners','partners',1,'2021-03-05 11:47:03','2021-03-05 11:47:03','be2dedb6-3274-448c-92d2-f872c19c84c8'),(16,16,1,'partners','partners',1,'2021-03-05 12:04:37','2021-03-05 12:04:37','239062df-55ab-451f-b0a8-581c1eec84fb'),(17,17,1,NULL,NULL,1,'2021-03-05 12:42:38','2021-03-05 12:42:38','8c761292-a993-4d14-8eb8-c79425236211'),(18,18,1,'partners','partners',1,'2021-03-05 12:42:38','2021-03-05 12:42:38','063a3df5-52ff-4281-9c92-0efc6b897cd0'),(19,19,1,NULL,NULL,1,'2021-03-05 12:42:38','2021-03-05 12:42:38','2b9227e9-c31d-463e-a480-77143a13ced1'),(20,20,1,'podstrona','podstrona',1,'2021-03-05 12:43:26','2021-03-05 12:43:26','29aa4b3b-21c0-4d0d-80a1-74b9569ba87b'),(21,21,1,'partners','partners',1,'2021-03-05 13:38:20','2021-03-05 13:38:20','7aa2cf30-091c-4ffd-87ba-9584ce39b470'),(22,22,1,'partners','partners',1,'2021-03-05 13:38:42','2021-03-05 13:38:42','3e2def69-4167-4c26-b3bc-eb016f1cb57a'),(23,23,1,NULL,NULL,1,'2021-03-05 13:38:42','2021-03-05 13:38:42','6dde0665-8c3c-49cd-9981-e370c9620238'),(24,24,1,NULL,NULL,1,'2021-03-05 14:16:58','2021-03-05 14:16:58','0a77d8d3-fe6a-423c-8976-addf2a264aba'),(25,25,1,'partners','partners',1,'2021-03-05 14:16:58','2021-03-05 14:16:58','8cab383b-afb3-4796-83a1-8aec6cf13f45'),(26,26,1,NULL,NULL,1,'2021-03-05 14:16:58','2021-03-05 14:16:58','20530889-87c9-447b-a0f6-fdf1eed8897d'),(27,27,1,NULL,NULL,1,'2021-03-05 14:16:58','2021-03-05 14:16:58','94f4b476-8c97-4c4f-a1f3-c7044c8bddc6'),(28,28,1,'partners','partners',1,'2021-03-05 14:59:13','2021-03-05 14:59:13','d402a778-9848-4644-be82-84e1bd08870f'),(29,29,1,'partners','partners',1,'2021-03-05 15:02:04','2021-03-05 15:02:04','4d8e1243-5fe9-449c-9966-5764625c6685'),(30,30,1,'partners','partners',1,'2021-03-05 15:02:19','2021-03-05 15:02:19','07e81b99-1c07-447b-9253-94c41b5653b7'),(31,31,1,'partners','partners',1,'2021-03-05 15:11:21','2021-03-05 15:11:21','277a5099-ebd1-4c72-b46e-058769dc4492'),(32,32,1,'partners','partners',1,'2021-03-05 15:12:04','2021-03-05 15:12:04','57c87c84-c8c6-4683-a6f9-13195932f051'),(33,33,1,'partners','partners',1,'2021-03-08 11:12:13','2021-03-08 11:12:13','060599b1-f66f-4df5-9e58-6857bb4017cd'),(34,34,1,'partners','partners',1,'2021-03-08 11:12:45','2021-03-08 11:12:45','b1a76154-7946-40db-bf8b-c18168b090dd'),(35,35,1,'partners','partners',1,'2021-03-08 11:16:05','2021-03-08 11:16:05','61b6e084-ef0a-4b68-9246-aa60fa42118a'),(36,36,1,'partners','partners',1,'2021-03-08 11:19:38','2021-03-08 11:19:38','5bca92fc-801d-4609-ab7c-bc5c97e63e72'),(37,37,1,'partners','partners',1,'2021-03-08 12:20:24','2021-03-08 12:20:24','7954e574-c927-4fab-a50b-2f6ab672a872'),(38,38,1,'partners','partners',1,'2021-03-08 12:21:01','2021-03-08 12:21:01','a4f41e54-5b22-4ca9-bcfc-4eb78dc2477c'),(39,39,1,'partners','partners',1,'2021-03-08 12:21:19','2021-03-08 12:21:19','fd1c158b-f376-43ac-9f6c-047d0d923818'),(40,40,1,'partners','partners',1,'2021-03-08 12:23:02','2021-03-08 12:23:02','089b8891-3356-495c-8c94-b9e9ad68c071'),(41,41,1,'partners','partners',1,'2021-03-08 12:31:31','2021-03-08 12:31:31','07591e1a-6fd0-412d-83a5-9b47129052f0'),(42,42,1,'partners','partners',1,'2021-03-08 12:35:49','2021-03-08 12:35:49','09deb0bf-ad72-4b44-8b22-020f6aff1007'),(44,44,1,'partners','partners',1,'2021-03-08 12:36:32','2021-03-08 12:36:32','2e0c3367-9fe3-4f56-8d8e-76d2a2fee34c'),(45,45,1,'partners','partners',1,'2021-03-08 12:36:45','2021-03-08 12:36:45','eced044c-fa68-4a88-8974-05f32e60a2d1'),(46,46,1,'partners','partners',1,'2021-03-08 12:42:54','2021-03-08 12:42:54','64abdbc3-bb3d-480a-8a1a-6b35387fc6db'),(47,47,1,NULL,NULL,1,'2021-03-08 13:34:04','2021-03-08 13:34:04','c10d803c-2aec-40d9-a87c-4c9114f761b8'),(48,48,1,'partners','partners',1,'2021-03-08 13:39:39','2021-03-08 13:39:39','51694212-79e3-4394-a7e9-bfde797fbfbd'),(49,49,1,NULL,NULL,1,'2021-03-08 13:43:27','2021-03-08 13:43:27','b8ba9b7d-f3f1-4ba4-80d7-e576cad45db6'),(50,50,1,'partners','partners',1,'2021-03-08 13:43:27','2021-03-08 13:43:27','cd3fc1f0-81ca-4fd3-89d2-de96627f706d'),(51,51,1,NULL,NULL,1,'2021-03-08 13:43:27','2021-03-08 13:43:27','4e5f78ae-baa1-4a84-80f5-16d62a29b3fb'),(52,52,1,'partners','partners',1,'2021-03-08 13:48:30','2021-03-08 13:48:30','05537e3d-2670-4bcb-819e-ea4fcc64fc64'),(53,53,1,NULL,NULL,1,'2021-03-08 13:48:30','2021-03-08 13:48:30','b13beaca-f716-4147-a755-8134e7052821'),(54,54,1,NULL,NULL,1,'2021-03-08 14:57:44','2021-03-08 14:57:44','b9a46051-006d-4cc4-bcfa-89732acd03b1'),(55,55,1,'partners','partners',1,'2021-03-08 14:57:44','2021-03-08 14:57:44','22373c87-9230-44b1-9dc1-96b32412b3fc'),(56,56,1,NULL,NULL,1,'2021-03-08 14:57:44','2021-03-08 14:57:44','1e6769b2-c3db-4d6a-8cfb-04f13f6cd011'),(57,57,1,NULL,NULL,1,'2021-03-08 14:57:44','2021-03-08 14:57:44','ac7dce12-e1bc-4f70-84e0-de68d292d4a8'),(58,58,1,NULL,NULL,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','12a40e79-6684-416b-be7d-e11c965c887b'),(59,59,1,NULL,NULL,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','9fdc7a7a-4e24-4ddd-9eca-9b4ad7cdd02a'),(60,60,1,'partners','partners',1,'2021-03-08 15:02:42','2021-03-08 15:02:42','8d1878ef-8019-41b4-b400-9b809e65c551'),(61,61,1,NULL,NULL,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','7df8e59e-dbfa-4b4c-aadf-54e8a51fbbab'),(62,62,1,NULL,NULL,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','52548756-9dd7-42a9-af20-c3b0be0cdbdf'),(63,63,1,NULL,NULL,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','70fb1828-ad6c-4a87-ac71-7c6a797de43c'),(64,64,1,NULL,NULL,1,'2021-03-08 15:02:43','2021-03-08 15:02:43','5f55c6f1-d2fb-48ff-a65e-21b40e17888d'),(65,65,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','83f70b8b-efc3-403b-bece-264c935a265b'),(66,66,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','d3209837-ac22-4528-990a-30dac8b73a23'),(67,67,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','b2436a78-2f7a-4e86-9ac8-d14068ce45aa'),(68,68,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','de719606-d970-4a0d-a637-e065b0047730'),(69,69,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','25e92908-45cc-4ffa-beb5-cd5d27899699'),(70,70,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','0f25b9ad-bffa-4fa2-8165-1c3e502384f8'),(71,71,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','699e95c8-9cf8-4bc2-85d7-69617df69352'),(72,72,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','e00cc797-fdba-4100-b1fc-1ad8e4f84257'),(73,73,1,'partners','partners',1,'2021-03-08 15:19:52','2021-03-08 15:19:52','7ea0a063-5b5e-4b4a-a93b-e208a78df602'),(74,74,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','f35b9a00-a766-490f-b9e4-4b483266cf82'),(75,75,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','0fc07dc8-fcec-4885-a1f2-826534831be3'),(76,76,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','ccb227a6-2814-42aa-9800-92183d464894'),(77,77,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','ba110b3c-99e2-49c5-b07e-edd028508c7f'),(78,78,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','50e88fa1-3931-406f-8f29-13001458f254'),(79,79,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','223ccba4-6f44-485a-ac22-c3dc10f2e5a0'),(80,80,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','48dc0ecc-00cc-4860-8e46-358c652b25b9'),(81,81,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','0492ba25-9fc7-42e5-9b8e-5374a8f4d3d4'),(82,82,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','651128e6-4918-4130-be3f-00f1d9533bfe'),(83,83,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','33c06650-d3d8-4122-9982-cc411032b9c7'),(84,84,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','3b71b713-f4a1-4d35-b905-d97d7cd15c53'),(85,85,1,NULL,NULL,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','c1b19542-4ab3-4a17-a9fd-9d4ec63c4dc0'),(86,86,1,'partners','partners',1,'2021-03-08 15:21:54','2021-03-08 15:21:54','5ec1c7ad-503c-4e45-9864-8c757de91c12'),(87,87,1,NULL,NULL,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','3585f83b-a3a3-4b5c-95ab-a28e6a9a2d49'),(88,88,1,NULL,NULL,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','9ed8c912-2f25-4a61-86eb-7292a8ad3eb0'),(89,89,1,NULL,NULL,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','79f79bc6-3525-44e6-8ed4-3731f2d59e85'),(90,90,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','eb8b059a-a9e1-4536-a87d-288e2d7362f0'),(91,91,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','7592f08e-432b-4a9e-a351-68d6ddc5fb12'),(92,92,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','a499102d-a2c1-4a20-82af-e0d1084c7bb8'),(93,93,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','91357f60-b986-45e4-86a1-d9ea283f867b'),(94,94,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','fbebe75c-f913-4a72-854f-1154a123d79e'),(95,95,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','b1170e33-ffc8-47ce-93b7-937084321c6f'),(96,96,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','a0cc23e6-66fa-4dfe-9ced-739cfd98ad25'),(97,97,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','4ebc8480-4ebd-4cfa-9775-2aa4b3f745ad'),(98,98,1,NULL,NULL,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','de980135-b253-4837-ad4d-02d670a3b581');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lkvgplpmjdvupuudqtizeajkomuvrvvwzjpk` (`postDate`),
  KEY `idx_ycyarwomilsqecgcrnrvayyjguuipkfxrfeg` (`expiryDate`),
  KEY `idx_oecsrmxqkcsrerudtbbyndiuukrqjrmvczmx` (`authorId`),
  KEY `idx_ehmefzqomegldbvixvdcwvrdlddymviunlex` (`sectionId`),
  KEY `idx_fffeoiyrencjunpubjmauahcqagylzsqrjkj` (`typeId`),
  KEY `fk_dsblxoydyddzhwhwgreftqzzatzqxgwtxkqz` (`parentId`),
  CONSTRAINT `fk_dsblxoydyddzhwhwgreftqzzatzqxgwtxkqz` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hafdtchknfmqpwkvxjumohjslbqvjktzivhi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iegwtawamchlefdlysqeedsuikavgwwlplxk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_waimhqfkorweviysysjehyfliddkvgxfaner` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wcszhgqohwsdcduwrllrrqytoeherssmlcwg` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,1,'2021-03-04 15:11:39','2021-03-04 15:11:39','3cda97ad-3c15-4836-9490-7ba8f452c4cb'),(3,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:11:39','2021-03-04 15:11:39','26284267-bb81-4533-80b6-ca882f1854d6'),(4,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:12:26','2021-03-04 15:12:26','404024ed-77d8-4f76-90c7-af00abf85f57'),(5,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:43:30','2021-03-04 15:43:30','fc90bb30-3caa-43d4-9bfe-0005df9593d1'),(6,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:43:52','2021-03-04 15:43:52','02f9ac6d-311a-488e-9a2b-9b24ff0e16ab'),(7,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:45:24','2021-03-04 15:45:24','9d4724e9-e677-4b8a-ad9d-cc2671a4c75c'),(8,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:46:39','2021-03-04 15:46:39','61a1a571-cd10-401c-9d14-eb939310568f'),(9,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:47:52','2021-03-04 15:47:52','d6dbdc35-83fd-4cfc-a160-b298f2ea6618'),(10,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:48:11','2021-03-04 15:48:11','a2bd9f6a-67eb-4d5e-b8fe-41387ec3116a'),(11,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:48:24','2021-03-04 15:48:24','993a1fda-a26a-4c02-9cf7-8040fbe17622'),(12,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-04 15:54:15','2021-03-04 15:54:15','6af179ba-a447-43d2-acae-711e8b69aa17'),(13,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 11:46:09','2021-03-05 11:46:09','390d24b9-bac6-4ca3-ab96-b181dabb1bb8'),(14,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 11:46:09','2021-03-05 11:46:09','8af9ac8a-ff05-4385-a633-41b9229cf17c'),(15,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 11:47:03','2021-03-05 11:47:03','25e79de5-e5c8-4642-a065-7429647d7cbc'),(16,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 12:04:37','2021-03-05 12:04:37','6c2fb50e-95a8-45c8-9e2c-6175082531a9'),(18,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 12:42:38','2021-03-05 12:42:38','87581c13-a1aa-4b5f-a1f6-b2833aed3126'),(20,1,NULL,1,NULL,'2021-03-04 15:11:00',NULL,NULL,'2021-03-05 12:43:26','2021-03-05 12:43:26','cbbb7d2c-7e24-4724-a01f-2bfb6b2b5391'),(21,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 13:38:20','2021-03-05 13:38:20','3e2cc54b-0950-4c2b-8df3-a56886a9d2c5'),(22,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 13:38:42','2021-03-05 13:38:42','d6d7bb15-723e-4de9-a92f-e059822e30c9'),(25,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 14:16:58','2021-03-05 14:16:58','c5c29daa-a78a-4918-adba-856626756498'),(28,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 14:59:13','2021-03-05 14:59:13','7d4efc55-fd6c-4e5b-965b-3b71db091a54'),(29,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 15:02:04','2021-03-05 15:02:04','03d831f4-679b-4714-9770-3b7f905a7f35'),(30,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 15:02:19','2021-03-05 15:02:19','3060e3e2-a9e5-49cd-aa4f-177dd0f1d354'),(31,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 15:11:21','2021-03-05 15:11:21','e2bf18cc-d694-4c71-bd55-ad47519630fc'),(32,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-05 15:12:04','2021-03-05 15:12:04','40b231d5-a498-4139-89c1-8fa57fe03e6f'),(33,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 11:12:13','2021-03-08 11:12:13','d07a1e42-52eb-4816-bb21-1df57e6a8632'),(34,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 11:12:45','2021-03-08 11:12:45','dba1dc10-e07f-4581-9b70-edb2155e07c1'),(35,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 11:16:05','2021-03-08 11:16:05','09b2e368-c0f5-4913-ab0a-a986f43f86d6'),(36,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 11:19:38','2021-03-08 11:19:38','a7d6b763-a162-4a8e-b133-7db304fe090d'),(37,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:20:24','2021-03-08 12:20:24','1958bbdc-64d7-4801-8ccc-ce4cd5aa37c2'),(38,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:21:01','2021-03-08 12:21:01','e4b81862-dd13-400c-a55f-ac4e136b96d8'),(39,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:21:19','2021-03-08 12:21:19','c577fddd-0c69-4fbb-a689-c5e2fe73183e'),(40,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:23:02','2021-03-08 12:23:02','b6e2ef32-041e-4f4c-a127-93ed9cef009e'),(41,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:31:31','2021-03-08 12:31:31','9c005c43-3e91-451e-9e81-be1ff804b6fe'),(42,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:35:49','2021-03-08 12:35:49','f309d846-53dd-46a1-b5e5-b52e9be6026c'),(44,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:36:32','2021-03-08 12:36:32','7ea2c5ac-db21-41e0-bd3f-3164214e7956'),(45,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:36:45','2021-03-08 12:36:45','e898c52b-5a33-43ad-b38c-a157b81d8089'),(46,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 12:42:54','2021-03-08 12:42:54','a1004eb6-b5a4-404f-b972-1df07dc458e5'),(48,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 13:39:39','2021-03-08 13:39:39','b933fbe6-911e-4820-a62a-2c563c8293c1'),(50,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 13:43:27','2021-03-08 13:43:27','d661da7a-fe7f-45b5-860f-0042c5347725'),(52,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 13:48:30','2021-03-08 13:48:30','b97cb5dd-302a-4833-83aa-ba6a6a99afd6'),(55,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 14:57:44','2021-03-08 14:57:44','c56ad9da-194b-4b1e-b803-652f231c55d1'),(60,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 15:02:42','2021-03-08 15:02:42','ddd91321-e45e-4595-b8bf-0f5fbe8440b8'),(73,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','c2f7f32e-b5de-45e7-95fa-a710ecd2654c'),(86,2,NULL,2,NULL,'2021-03-05 11:46:00',NULL,NULL,'2021-03-08 15:21:54','2021-03-08 15:21:54','680a39ce-c43f-41dd-ab90-f347ec43767e');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xwdopgfabtviueuksxldycthkvrggzuxvlcc` (`name`,`sectionId`),
  KEY `idx_pmerqymuwbyqqvfewyayqgityfqvayqomblj` (`handle`,`sectionId`),
  KEY `idx_aggggehbdsjdbkbfyenwubyymunjdbdbrpdb` (`sectionId`),
  KEY `idx_yaeqmvugduafzlgrvjovkrvfkadjnrnnljuo` (`fieldLayoutId`),
  KEY `idx_wuqncrpugmitfvhzudqambaborzfoyynztnj` (`dateDeleted`),
  CONSTRAINT `fk_cwoydqzbhvbsdjakxljhpqmgpzgqpitmizqc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yguwxkrredxbkdisgjhlnikgphqxywukizcc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Podstrona','podstrona',0,'site',NULL,'{section.name|raw}',1,'2021-03-04 15:11:39','2021-03-04 15:54:15','2021-03-05 13:23:05','765b37e2-8587-4b6e-85c6-b8641556746c'),(2,2,3,'Partners','partners',0,'site',NULL,'{section.name|raw}',1,'2021-03-05 11:46:09','2021-03-05 11:46:09',NULL,'68d3e256-4114-4b54-bd0f-0c9fa54a5bae');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzpfrphtthhmsalwnirquuicksobeobtbnqa` (`name`),
  KEY `idx_zkjneljgxfsfpzczuobumsjnsjwcqsafkuld` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-03-04 12:19:12','2021-03-04 12:19:12','2021-03-05 14:54:14','400e4f7e-e2f6-4519-a2e3-7680368c630d'),(2,'Partners','2021-03-05 13:52:53','2021-03-05 13:52:53','2021-03-05 14:54:17','3ee78eef-8da4-4cd7-9f2f-12af0bd8c6e5'),(3,'Hero','2021-03-05 14:54:44','2021-03-05 14:54:44',NULL,'83a380f9-0f52-4434-a9f9-dfcd5c8a80c9'),(4,'Intro','2021-03-08 11:08:00','2021-03-08 11:08:00',NULL,'d5e4c30e-3d1d-421e-89a7-581b54f7c4a9'),(5,'Outro','2021-03-08 11:38:18','2021-03-08 11:38:18',NULL,'1539e223-b771-4778-a5b9-3676b59a2508'),(6,'Partners listing','2021-03-08 13:28:16','2021-03-08 13:28:16',NULL,'c6882d8c-7b75-4033-97e8-bb0a0d47c7c4');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hkdpsrudsrdxmtbigpbansvzecckygrincuc` (`layoutId`,`fieldId`),
  KEY `idx_xrkuiqxvsqoovjwhmmiedpfojpvkhnojooxt` (`sortOrder`),
  KEY `idx_xdalxnoidnvxmpxomxnjwakfenherjheeejs` (`tabId`),
  KEY `idx_zqggqphlxujnrwqetjgvuibchxmmhfwwyldw` (`fieldId`),
  CONSTRAINT `fk_cpskgsbtibvmvlzzsqzpwwefdknohgzedxgw` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xcylxeqjqgsjtiodwaulfsoksjinwbelvymz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xrkahonpvmzvifzrweiftbxkynvqrncjpfru` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (56,3,45,7,0,0,'2021-03-08 13:39:39','2021-03-08 13:39:39','686aec29-bfe6-40d5-8251-0b62aac4771d'),(57,3,45,6,0,1,'2021-03-08 13:39:39','2021-03-08 13:39:39','52c3f426-e18a-4a80-af98-c50069d886e0'),(58,3,45,5,0,2,'2021-03-08 13:39:39','2021-03-08 13:39:39','6425ba6a-647b-46aa-9d5e-8589c0b537ab'),(59,3,46,8,0,0,'2021-03-08 13:39:39','2021-03-08 13:39:39','47d26e76-391c-4af9-a594-9002f42b22c1'),(60,3,46,9,0,1,'2021-03-08 13:39:39','2021-03-08 13:39:39','3f73b0b7-f050-45cd-959a-5699c747c740'),(61,3,47,13,0,0,'2021-03-08 13:39:39','2021-03-08 13:39:39','ceb30141-d561-4d37-9f6f-a9a2a7802402'),(62,3,48,10,0,0,'2021-03-08 13:39:39','2021-03-08 13:39:39','23bf1f53-bd5e-4ece-9d0a-0120b8cca7f3'),(63,3,48,11,0,1,'2021-03-08 13:39:39','2021-03-08 13:39:39','6c596279-aedf-4577-90b9-8881baad0e98'),(64,3,48,12,0,2,'2021-03-08 13:39:39','2021-03-08 13:39:39','9425ce8d-cb0c-4ad0-892a-e68a65711413'),(70,7,51,14,0,0,'2021-03-08 13:46:44','2021-03-08 13:46:44','415b42b4-c29d-4f53-bd97-6b5aa520994f'),(71,7,51,18,0,1,'2021-03-08 13:46:44','2021-03-08 13:46:44','08b2e40b-078b-4e77-9ba4-15f7cd4aed3c'),(72,7,51,17,0,2,'2021-03-08 13:46:44','2021-03-08 13:46:44','6e187d91-6368-4fc1-8db7-581d7895964e'),(73,7,51,16,0,3,'2021-03-08 13:46:44','2021-03-08 13:46:44','550b1d93-68e5-4b39-83cb-ddaf6c179654'),(74,7,51,15,0,4,'2021-03-08 13:46:44','2021-03-08 13:46:44','f8640c34-f54f-457c-93a4-ac7aad04901e');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_savibntbdulbskkdqhfrynosepfeqfnllqan` (`dateDeleted`),
  KEY `idx_jwfgtfbezygprobdnppdlysaqlhjjjkmwwmy` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2021-03-04 15:11:39','2021-03-04 15:11:39','2021-03-05 13:23:05','79cba67f-c208-4107-af05-8a2f49dda0f7'),(2,'craft\\elements\\Asset','2021-03-04 15:14:06','2021-03-04 15:14:06','2021-03-08 13:31:35','fad52573-f5d9-49b1-898d-e27014906576'),(3,'craft\\elements\\Entry','2021-03-05 11:46:09','2021-03-05 11:46:09',NULL,'db411207-5bae-4ce4-bdbe-34a057e2a6ca'),(4,'craft\\elements\\MatrixBlock','2021-03-05 12:03:56','2021-03-05 12:03:56','2021-03-05 14:54:08','b36bf07d-502e-40a0-a5c2-1ae972e0679e'),(5,'craft\\elements\\MatrixBlock','2021-03-05 14:07:45','2021-03-05 14:07:45','2021-03-05 14:54:08','e74244ed-f0e0-41b4-b082-12438b1d1149'),(6,'craft\\elements\\Asset','2021-03-08 13:33:14','2021-03-08 13:33:14',NULL,'4c575b21-eea6-485a-887c-fb78e0fa51d4'),(7,'craft\\elements\\MatrixBlock','2021-03-08 13:34:38','2021-03-08 13:34:38',NULL,'9e918aae-9a5c-44f0-a19e-1e07d1b7fef0');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jkuszniyvkfkynhouhsnuzjictveqeyixzvu` (`sortOrder`),
  KEY `idx_mgzmdsseacwxkoyrmxulahtuerbnswpqaaqm` (`layoutId`),
  CONSTRAINT `fk_hlkejnqhfmdzccajqmdabkglhlovecnoqpev` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (3,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-03-04 15:14:06','2021-03-04 15:14:06','8049b4df-8f72-41da-b5d9-5e6885df6d74'),(12,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"518c8fa3-2cd5-45c2-bad5-c9910986d17c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":25}]',1,'2021-03-05 12:43:26','2021-03-05 12:43:26','9d8e138c-8d66-4484-be42-40c42e6e1a7b'),(28,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":25,\"fieldUid\":\"fb83efaa-d3ae-4eae-a80e-04678d029f73\"}]',1,'2021-03-05 14:23:54','2021-03-05 14:23:54','f0794836-3ddf-4170-9030-fdd9a644fa4d'),(29,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"eebcfd3e-eaa9-4856-bb9b-a8fd90bd456b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7d6dda68-42f2-4217-beb5-b90b457e6358\"}]',1,'2021-03-05 14:23:54','2021-03-05 14:23:54','32ff4f65-4ce7-43bf-ae90-4550a744dc7c'),(45,3,'Hero','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"569c1536-e1e1-478b-8a94-de85377f9ba0\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":75,\"fieldUid\":\"070c859e-ec54-49e9-acd9-e658f728d891\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"70e371d8-d7fb-43ef-a3fc-913faa7db3d1\"}]',1,'2021-03-08 13:39:39','2021-03-08 13:39:39','a910063f-88f0-46d6-9493-6e9764c62ed4'),(46,3,'Intro','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f3ab10b4-5d6a-4c83-9a65-ca0ab0346314\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f0515b35-e39d-4154-bb06-ea6904427257\"}]',2,'2021-03-08 13:39:39','2021-03-08 13:39:39','8e19765d-bc35-402d-8104-bd70d9bb7fc6'),(47,3,'Partners Listing','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"98991cd5-c9c4-41b3-9e68-2b31b44bd772\"}]',3,'2021-03-08 13:39:39','2021-03-08 13:39:39','5e345a1c-9243-4bbd-8ee3-2327f1085ee8'),(48,3,'Outro','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ba42799d-0a49-4f7f-817a-cde956fa12ee\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7637ec1c-947f-42f2-9b7d-3ba65f195b8d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4318cfd0-f068-4073-9703-1db060485eb7\"}]',4,'2021-03-08 13:39:39','2021-03-08 13:39:39','80e81c88-a72f-40b2-8272-f1d65f736454'),(49,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',5,'2021-03-08 13:39:39','2021-03-08 13:39:39','64f69869-c906-493a-b2b5-dcc095aa1632'),(51,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"de2f137b-e43d-43ff-8b36-31978ed3eef1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"c7c9f302-4f23-466d-a2d3-675621d8f44a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b7ac79ba-352c-490e-aaa7-737c89d9e247\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6be2d726-24c6-4a93-8d7c-30a8b9da7b06\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0a187bb9-ebd0-4016-b111-84d728762249\"}]',1,'2021-03-08 13:46:44','2021-03-08 13:46:44','3578a57f-858b-457d-9e99-45d4d9f1d13f'),(53,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-03-08 14:07:50','2021-03-08 14:07:50','34cde260-975e-4b90-b867-dfa76dc6eef0');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uhhnfbiisisqxsbpghkwvugipjajvgaesffi` (`handle`,`context`),
  KEY `idx_qomrdjqolnmfwpyhkxzgrepvjnbplnkklxsu` (`groupId`),
  KEY `idx_twtvzzrxfvwiuevsnyhwboqflqboywetsrlp` (`context`),
  CONSTRAINT `fk_ebrmslgrvamdnknwwhiruewdwiypwrmcxgem` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (5,3,'Hero tItle','heroTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"TItle\",\"uiMode\":\"normal\"}','2021-03-05 14:57:23','2021-03-05 15:08:34','70e371d8-d7fb-43ef-a3fc-913faa7db3d1'),(6,3,'Hero subtitle','heroSubtitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"Subtitle\",\"uiMode\":\"normal\"}','2021-03-05 14:57:50','2021-03-05 15:08:25','070c859e-ec54-49e9-acd9-e658f728d891'),(7,3,'Hero sizes','heroSizes','global','Select a size of a hero component',0,'none',NULL,'craft\\fields\\RadioButtons','{\"options\":[{\"label\":\"small\",\"value\":\"small\",\"default\":\"\"},{\"label\":\"medium\",\"value\":\"medium\",\"default\":\"1\"}]}','2021-03-05 15:10:53','2021-03-05 15:10:53','569c1536-e1e1-478b-8a94-de85377f9ba0'),(8,4,'Intro Title','introTitle','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"Title\",\"uiMode\":\"normal\"}','2021-03-08 11:08:26','2021-03-08 11:08:38','f3ab10b4-5d6a-4c83-9a65-ca0ab0346314'),(9,4,'Intro Description','introDescription','global','Description',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"normal\"}','2021-03-08 11:09:15','2021-03-08 11:11:10','f0515b35-e39d-4154-bb06-ea6904427257'),(10,5,'Outro Title','outroTitle','global','Title',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-08 11:38:39','2021-03-08 11:38:39','ba42799d-0a49-4f7f-817a-cde956fa12ee'),(11,5,'Outro Description','outroDescription','global','Description',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-08 11:39:04','2021-03-08 11:39:04','7637ec1c-947f-42f2-9b7d-3ba65f195b8d'),(12,5,'Outro Button','outroButton','global','Button',0,'none',NULL,'typedlinkfield\\fields\\LinkField','{\"allowCustomText\":\"1\",\"allowTarget\":\"1\",\"allowedLinkNames\":{\"3\":\"entry\",\"6\":\"custom\",\"7\":\"email\",\"8\":\"tel\",\"9\":\"url\"},\"autoNoReferrer\":\"\",\"defaultLinkName\":\"entry\",\"defaultText\":\"\",\"enableAriaLabel\":\"\",\"enableTitle\":\"1\",\"typeSettings\":{\"asset\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"category\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"entry\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"site\":{\"sites\":\"*\"},\"user\":{\"sources\":\"*\",\"allowCustomQuery\":\"\"},\"custom\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"email\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"tel\":{\"disableValidation\":\"\",\"allowAliases\":\"\"},\"url\":{\"disableValidation\":\"\",\"allowAliases\":\"\"}}}','2021-03-08 12:19:41','2021-03-08 12:38:48','4318cfd0-f068-4073-9703-1db060485eb7'),(13,6,'Partners list','partnersList','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_partnerslist}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-03-08 13:34:38','2021-03-08 13:34:38','98991cd5-c9c4-41b3-9e68-2b31b44bd772'),(14,NULL,'Partner logo','partnerLogo','matrixBlockType:c8d1de3d-26dd-49bd-bf44-fd12d34a58e8','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:9609ca58-e35b-42d2-914a-4865163ca851\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:9609ca58-e35b-42d2-914a-4865163ca851\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-08 13:34:38','2021-03-08 13:41:48','de2f137b-e43d-43ff-8b36-31978ed3eef1'),(15,NULL,'Partner category','partnerCategory','matrixBlockType:c8d1de3d-26dd-49bd-bf44-fd12d34a58e8','Press ctrl (cmd) or Shift to select multiple values',0,'none',NULL,'craft\\fields\\MultiSelect','{\"multi\":true,\"optgroups\":true,\"options\":[{\"label\":\"Inlay & Tag\",\"value\":\"inlayTag\",\"default\":\"\"},{\"label\":\"Printer\",\"value\":\"printer\",\"default\":\"\"},{\"label\":\"Serialization\",\"value\":\"serialization\",\"default\":\"\"},{\"label\":\"Solution Provider\",\"value\":\"solutionProvider\",\"default\":\"\"},{\"label\":\"Wi-Fi Access Point Gateway\",\"value\":\"wiFiAccessPointGateway\",\"default\":\"\"},{\"label\":\"Consulting\",\"value\":\"consulting\",\"default\":\"\"}]}','2021-03-08 13:41:48','2021-03-08 13:46:44','0a187bb9-ebd0-4016-b111-84d728762249'),(16,NULL,'Partner Link','partnerLink','matrixBlockType:c8d1de3d-26dd-49bd-bf44-fd12d34a58e8','',0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":\"255\",\"placeholder\":null,\"types\":[\"url\"]}','2021-03-08 13:41:48','2021-03-08 13:41:48','6be2d726-24c6-4a93-8d7c-30a8b9da7b06'),(17,NULL,'Partner description','partnerDescription','matrixBlockType:c8d1de3d-26dd-49bd-bf44-fd12d34a58e8','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-08 13:41:48','2021-03-08 13:41:48','b7ac79ba-352c-490e-aaa7-737c89d9e247'),(18,NULL,'Partner Name','partnerName','matrixBlockType:c8d1de3d-26dd-49bd-bf44-fd12d34a58e8','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-08 13:41:48','2021-03-08 13:41:48','c7c9f302-4f23-466d-a2d3-675621d8f44a');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_izvjrowznmuzzbsnnsuqpmctljknexuumthj` (`name`),
  KEY `idx_kmoaoxdhibaoaunxaadueaeszjunypsdvnfx` (`handle`),
  KEY `idx_jzhgphidxmfssobrrpiytyvdhuvcjmendhae` (`fieldLayoutId`),
  CONSTRAINT `fk_nfgeifnlpluadduhchzhjellniufevpcraii` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wwelzkuevomconmhqvrqbhtiaubzmnfevbsj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fqsofwvwqestogedejqhfuzxgcjbmnuprsli` (`accessToken`),
  UNIQUE KEY `idx_ftfomeqfjrdfedvckakxqeednmwdbwzexwwc` (`name`),
  KEY `fk_qrnqoyxlsmpkxvynqvjttzghdmrzdyeageoo` (`schemaId`),
  CONSTRAINT `fk_qrnqoyxlsmpkxvynqvjttzghdmrzdyeageoo` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'3.6.10','3.6.6',0,'vgbkwugqpsyh','oqyrwapewfgt','2021-03-04 12:19:12','2021-03-16 16:23:25','e87bafc4-65a6-425a-9806-6bf6c6859f75');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tctlqcxpikxrundkertlkjufiepivfjqvini` (`ownerId`),
  KEY `idx_gmymkbsukrwtdfepdaraozjoupeluadjlhne` (`fieldId`),
  KEY `idx_fwoswowqlsrpysevflglxrhqgledmqbowjxu` (`typeId`),
  KEY `idx_tambqvkzrlgmronxjqnykxybpstbbcsukmeh` (`sortOrder`),
  CONSTRAINT `fk_gtrbntpcecomygljyqrarjkpjmgpwifamnyc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ufjhetjueqppiozgessdiwrfiygcleyvtaap` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsnbcvptqbzqbnbxmwfwuoepyyoqexnwtgtc` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yqdzjymxomzrmihrqlkgvlclvanhjcsgjdiq` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
INSERT INTO `matrixblocks` VALUES (49,13,13,1,1,NULL,'2021-03-08 13:43:27','2021-03-08 13:43:27','0aacffd4-e5e6-42f0-b3b9-c68eafd8707d'),(51,50,13,1,1,NULL,'2021-03-08 13:43:27','2021-03-08 13:43:27','6bf5c934-582b-4a77-84bc-0fabe32798bc'),(53,52,13,1,1,NULL,'2021-03-08 13:48:30','2021-03-08 13:48:30','611c058b-5e0b-4d85-b514-cebfc56ecee7'),(54,13,13,1,2,NULL,'2021-03-08 14:57:44','2021-03-08 14:57:44','29c3d834-20aa-4f13-9a01-37805456b59d'),(56,55,13,1,1,NULL,'2021-03-08 14:57:44','2021-03-08 14:57:44','c365db3c-d7a8-4e6f-ade3-c85aa8540a95'),(57,55,13,1,2,NULL,'2021-03-08 14:57:44','2021-03-08 14:57:44','1910d0c2-9f8d-444d-98c3-600e48c12cf0'),(58,13,13,1,3,NULL,'2021-03-08 15:02:42','2021-03-08 15:02:42','3adcb7f2-46c5-4e6e-897d-2154cf31f8c7'),(59,13,13,1,4,NULL,'2021-03-08 15:02:42','2021-03-08 15:02:42','cbb9a09e-2db5-4e70-b32a-d66c9c7e81c7'),(61,60,13,1,1,NULL,'2021-03-08 15:02:42','2021-03-08 15:02:42','09b01800-c807-43b2-801d-ec0880fe7cc6'),(62,60,13,1,2,NULL,'2021-03-08 15:02:42','2021-03-08 15:02:42','f8596f2a-d4e8-4cdd-8c24-ae39d917dac7'),(63,60,13,1,3,NULL,'2021-03-08 15:02:42','2021-03-08 15:02:42','1a444079-faaf-432f-bfb9-d2d8211d1c49'),(64,60,13,1,4,NULL,'2021-03-08 15:02:43','2021-03-08 15:02:43','caaf1500-1a2d-492a-a8a0-342e1d4760b6'),(65,13,13,1,5,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','0a1cdbf8-7f33-4d60-a10f-1199d2ec9766'),(66,13,13,1,6,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','f53b9f26-df8a-431f-9549-af5f101999ac'),(67,13,13,1,7,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','46c87b12-6183-4261-b1e5-82b84cea5c4a'),(68,13,13,1,8,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','d24b1b30-c8cd-4eb4-8741-e2dc5de8dbb0'),(69,13,13,1,9,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','31b5e73e-e5a2-4c0d-9c0e-08cb6ede8eb6'),(70,13,13,1,10,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','5095a1cc-8eaf-4fdc-a612-2dea9f434a2e'),(71,13,13,1,11,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','d45baa9b-f2b9-453b-b372-458fb0f3aa2c'),(72,13,13,1,12,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','5b29efaf-d946-4eca-8808-556c21e36423'),(74,73,13,1,1,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','1d14cc82-41c1-4d34-a72d-33c5c348f9cc'),(75,73,13,1,2,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','33b58264-3f56-44c8-937e-9742d95046f4'),(76,73,13,1,3,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','1f1aa721-d259-4c9b-864a-5d9e3d9692d8'),(77,73,13,1,4,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','724552cb-6a3d-4471-aa5f-c53e9ddb568d'),(78,73,13,1,5,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','78a776fb-309a-4e3a-94ca-0131fd0df1da'),(79,73,13,1,6,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','7ef52565-11a7-4f4b-b2b0-623e3508e9d7'),(80,73,13,1,7,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','c93b7142-f00a-4824-a117-1a0e749cf4a5'),(81,73,13,1,8,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','0a95d836-d893-4dbc-b594-5b43418de858'),(82,73,13,1,9,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','2694be81-64cd-4812-a187-405896c4f83f'),(83,73,13,1,10,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','38d1bc45-ad36-4779-969a-9e839b5598e6'),(84,73,13,1,11,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','2a2d5c21-bee6-46c9-8963-3325bdbc2fba'),(85,73,13,1,12,NULL,'2021-03-08 15:19:52','2021-03-08 15:19:52','657bf80f-8967-49b5-afca-aeb46b49520c'),(87,86,13,1,1,NULL,'2021-03-08 15:21:54','2021-03-08 15:21:54','60cda88f-25c4-4557-8321-e8cb633f5ba7'),(88,86,13,1,2,NULL,'2021-03-08 15:21:54','2021-03-08 15:21:54','423b19b8-7ec1-469b-8783-667dcff94795'),(89,86,13,1,3,NULL,'2021-03-08 15:21:54','2021-03-08 15:21:54','784a524f-e493-49fa-a3d0-ea487df9f826'),(90,86,13,1,4,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','e60286d9-f934-45ef-99d2-c97e1b76c081'),(91,86,13,1,5,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','166a08c8-902c-44be-a321-783f6fe9568c'),(92,86,13,1,6,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','d2d91ad7-696b-4127-9233-d462000586f3'),(93,86,13,1,7,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','fa58ce8a-7d09-45de-8e0a-a5fd3ef03416'),(94,86,13,1,8,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','7c655eb2-22e3-4b9c-9934-7e8fe97e0aac'),(95,86,13,1,9,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','40f0af6b-307e-4aa2-9e13-b124532c3a99'),(96,86,13,1,10,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','a638e0be-65df-40ee-a306-b2b0ae141fda'),(97,86,13,1,11,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','62d0bfd1-5210-4125-92d2-f74edb3c47a3'),(98,86,13,1,12,NULL,'2021-03-08 15:21:55','2021-03-08 15:21:55','8e3ed46d-0b19-4da2-8cc7-8a6574a29eea');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ukvnjsiogaddyrfpxuhonwnatstkxcrlltpk` (`name`,`fieldId`),
  KEY `idx_cqghjfoofsgceqhskkbsanolkzvcpbyjzwhl` (`handle`,`fieldId`),
  KEY `idx_sudqdxmulxsuionnszcvnjhpdzujtsyfvttd` (`fieldId`),
  KEY `idx_nfwkrcjfzxetkwwqygzgvfeqsmahmzqdgqhf` (`fieldLayoutId`),
  CONSTRAINT `fk_quhickvwfeuwgsanzhksbfmzbxtasvmopewh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsophsqdvpjymjaaoiuzubyoyedhpxhvtifd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
INSERT INTO `matrixblocktypes` VALUES (1,13,7,'Item','item',1,'2021-03-08 13:34:38','2021-03-08 13:41:48','c8d1de3d-26dd-49bd-bf44-fd12d34a58e8');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixcontent_partnerslist`
--

DROP TABLE IF EXISTS `matrixcontent_partnerslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_partnerslist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_item_partnerCategory` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_item_partnerLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_item_partnerDescription` text COLLATE utf8_unicode_ci,
  `field_item_partnerName` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lggpfmlbtixykttwzufsimlwsyloepadfouq` (`elementId`,`siteId`),
  KEY `fk_eeymxxizcmkxecmblnkdphqvgobnzvisgnbw` (`siteId`),
  CONSTRAINT `fk_eeymxxizcmkxecmblnkdphqvgobnzvisgnbw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_lckpjrylvjhnwlswnoaqdlfwohdrmpscukkr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixcontent_partnerslist`
--

LOCK TABLES `matrixcontent_partnerslist` WRITE;
/*!40000 ALTER TABLE `matrixcontent_partnerslist` DISABLE KEYS */;
INSERT INTO `matrixcontent_partnerslist` VALUES (1,49,1,'2021-03-08 13:43:27','2021-03-08 15:19:52','ab7b02f6-7ceb-456c-938a-a2f80d3e18f0','[\"inlayTag\",\"solutionProvider\",\"consulting\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(2,51,1,'2021-03-08 13:43:27','2021-03-08 13:43:27','6e54c695-3a37-4a7e-b736-54fbc274fb0a','[\"serialization\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(3,53,1,'2021-03-08 13:48:30','2021-03-08 13:48:30','b8e9fdcb-32f6-435f-9168-44eefc4b7a72','[\"inlayTag\",\"solutionProvider\",\"consulting\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(4,54,1,'2021-03-08 14:57:44','2021-03-08 15:19:52','0b6c5b22-2a79-4a80-b836-b6343ea38648','[\"consulting\"]','https://www2.deloitte.com/','<p>Deloitte provides industry-leading audit, consulting, tax, and advisory services to many of the world’s most admired brands, including nearly 90 percent of the Fortune 500® and more than 5,000 private and middle-market companies.</p>','Deloitte'),(5,56,1,'2021-03-08 14:57:44','2021-03-08 14:57:44','eb0b07ec-9b4a-4382-a60b-3a7fbd205196','[\"inlayTag\",\"solutionProvider\",\"consulting\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(6,57,1,'2021-03-08 14:57:44','2021-03-08 14:57:44','d4ab1b25-c59c-47a0-86a1-997a29c83710','[\"consulting\"]','https://www2.deloitte.com/','<p>Deloitte provides industry-leading audit, consulting, tax, and advisory services to many of the world’s most admired brands, including nearly 90 percent of the Fortune 500® and more than 5,000 private and middle-market companies.</p>','Deloitte'),(7,58,1,'2021-03-08 15:02:42','2021-03-08 15:19:52','414ec928-c63d-4e63-833d-e3d6ffabca8e','[\"consulting\"]','https://www.satoeurope.com/','<p>SATO is a leading global provider of Auto-ID solutions that connect people, goods and information. SATO America is a premier manufacturer of Industrial Thermal Printers, Print Engines, Laser Printers and RFID embedded tags and labels.</p>','Sato'),(8,59,1,'2021-03-08 15:02:42','2021-03-08 15:19:52','3b83b275-9302-40fd-8989-f3b759c29ff3','[\"printer\"]','https://evrythng.com/','<p>EVRYTHNG provides a suite of solutions to drive new digital applications, better control your supply chain, and engage directly with your customers.</p>','Evrythng'),(9,61,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','85b9825f-9876-4e0b-ac92-66e2dedbda67','[\"inlayTag\",\"solutionProvider\",\"consulting\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(10,62,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','394c2995-5608-4808-ba50-0ec29d914b69','[\"consulting\"]','https://www2.deloitte.com/','<p>Deloitte provides industry-leading audit, consulting, tax, and advisory services to many of the world’s most admired brands, including nearly 90 percent of the Fortune 500® and more than 5,000 private and middle-market companies.</p>','Deloitte'),(11,63,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','875e20fb-278c-4009-9744-c1b6e939065e','[\"consulting\"]','https://www.satoeurope.com/','<p>SATO is a leading global provider of Auto-ID solutions that connect people, goods and information. SATO America is a premier manufacturer of Industrial Thermal Printers, Print Engines, Laser Printers and RFID embedded tags and labels.</p>','Sato'),(12,64,1,'2021-03-08 15:02:43','2021-03-08 15:02:43','b063a557-4c22-41cf-8329-58a4726f9e13','[\"printer\"]','https://evrythng.com/','<p>EVRYTHNG provides a suite of solutions to drive new digital applications, better control your supply chain, and engage directly with your customers.</p>','Evrythng'),(13,65,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','5f7d5e1f-ebae-4622-a951-29b8508ee701','[]','https://www.cloudleaf.com/','<p>Cloudleaf provides you with continuous visibility into the context, condition, timing and location of material and assets throughout your supply chain.</p>','Cloudleaf'),(14,66,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','a1e23529-b856-428d-a69f-0d65b348781a','[\"serialization\",\"wiFiAccessPointGateway\"]','https://blyott.com','<p>Blyott is a machine learning and modular RTLS, giving healthcare organisations remote insights into their assets and can lead to big savings and happy staff.</p>','Blyott'),(15,67,1,'2021-03-08 15:19:52','2021-03-08 15:21:54','318c5e77-e505-4b16-8fca-1763f923e423','[\"inlayTag\",\"printer\",\"serialization\",\"solutionProvider\"]','https://www.arubanetworks.com/','<p>Aruba is the industry leader in wired, wireless and security networking solutions for todays experience edge.</p>','HP Aruba'),(16,68,1,'2021-03-08 15:19:52','2021-03-08 15:21:54','eccde4f8-99e1-4735-a793-0207377dc514','[\"solutionProvider\"]','https://www.mist.com/','<p>Mist is pioneering the new wireless network. The first AI-driven WLAN makes Wi-Fi predictable, reliable, and measurable while delivering amazing indoor location experiences.</p>','Mist'),(17,69,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','294dd9e2-79e4-425b-86ba-7aa4bebf4d8a','[\"serialization\",\"solutionProvider\"]','https://estimote.com/','<p>Estimote – location and proximity solutions with programmable IoT stack using Bluetooth, Ultra Wideband, and LTE / NB-IoT connectivity.</p>','Estimote'),(18,70,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','c63ac5d3-43ba-4fc3-a888-3814ae1ad7ad','[]','https://www.tadbik.com/','<p>The one-stop-shop for packaging solutions worldwide. With 30 years of expertise, we add value to our customers across industries and continents.</p>','Tadbik'),(19,71,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','36bdf2f4-e5c2-47f3-a35d-f99935bda037','[\"inlayTag\",\"printer\"]','https://www.fanstel.com/','<p>Bluetooth modules, Bluetooth 5 modules and contract manufacturing.</p>','Fanstel'),(20,72,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','9bc79cf4-95cd-414f-8567-830eb03fb7b4','[\"wiFiAccessPointGateway\"]','https://www.muehlbauer.de/','<p>The Mühlbauer Group is the only one-stop-shop technology partner for the production and personalization of cards, passports and RFID applications worldwide.</p>','Mühlbauer Group'),(21,74,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','e20ae6c2-5fb0-42f2-8e65-0872eb1e0a09','[\"inlayTag\",\"solutionProvider\",\"consulting\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(22,75,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','9414fc58-9e29-4e09-9df3-bd4c410f2a1b','[\"consulting\"]','https://www2.deloitte.com/','<p>Deloitte provides industry-leading audit, consulting, tax, and advisory services to many of the world’s most admired brands, including nearly 90 percent of the Fortune 500® and more than 5,000 private and middle-market companies.</p>','Deloitte'),(23,76,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','077c2ec8-1a0d-40b1-ac0f-4fa294657000','[\"consulting\"]','https://www.satoeurope.com/','<p>SATO is a leading global provider of Auto-ID solutions that connect people, goods and information. SATO America is a premier manufacturer of Industrial Thermal Printers, Print Engines, Laser Printers and RFID embedded tags and labels.</p>','Sato'),(24,77,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','832fef78-22d1-4dc5-b870-20719eea8dc3','[\"printer\"]','https://evrythng.com/','<p>EVRYTHNG provides a suite of solutions to drive new digital applications, better control your supply chain, and engage directly with your customers.</p>','Evrythng'),(25,78,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','6a8bef43-b41c-4cce-a9f4-62deab6f8409','[]','https://www.cloudleaf.com/','<p>Cloudleaf provides you with continuous visibility into the context, condition, timing and location of material and assets throughout your supply chain.</p>','Cloudleaf'),(26,79,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','61ea1de1-5eea-4948-be58-563ef3a559f1','[\"serialization\",\"wiFiAccessPointGateway\"]','https://blyott.com','<p>Blyott is a machine learning and modular RTLS, giving healthcare organisations remote insights into their assets and can lead to big savings and happy staff.</p>','Blyott'),(27,80,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','cc42fa6b-5f14-4d40-bda5-c99e24d2221c','[\"wiFiAccessPointGateway\",\"consulting\"]','https://www.arubanetworks.com/','<p>Aruba is the industry leader in wired, wireless and security networking solutions for todays experience edge.</p>','HP Aruba'),(28,81,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','577db164-b92b-4512-a23e-84eeecee4aef','[]','https://www.mist.com/','<p>Mist is pioneering the new wireless network. The first AI-driven WLAN makes Wi-Fi predictable, reliable, and measurable while delivering amazing indoor location experiences.</p>','Mist'),(29,82,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','a13e2309-5878-48b1-acf4-86859cecc38b','[\"serialization\",\"solutionProvider\"]','https://estimote.com/','<p>Estimote – location and proximity solutions with programmable IoT stack using Bluetooth, Ultra Wideband, and LTE / NB-IoT connectivity.</p>','Estimote'),(30,83,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','d2c6c7db-8310-4656-9300-820630c27505','[]','https://www.tadbik.com/','<p>The one-stop-shop for packaging solutions worldwide. With 30 years of expertise, we add value to our customers across industries and continents.</p>','Tadbik'),(31,84,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','dc63de2f-25d2-45b9-bc0c-15e164681142','[\"inlayTag\",\"printer\"]','https://www.fanstel.com/','<p>Bluetooth modules, Bluetooth 5 modules and contract manufacturing.</p>','Fanstel'),(32,85,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','97042687-047a-40be-a905-dc03e5639c00','[\"wiFiAccessPointGateway\"]','https://www.muehlbauer.de/','<p>The Mühlbauer Group is the only one-stop-shop technology partner for the production and personalization of cards, passports and RFID applications worldwide.</p>','Mühlbauer Group'),(33,87,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','8adc19b7-7b09-43b9-9f57-1dbc4f26e1c9','[\"inlayTag\",\"solutionProvider\",\"consulting\"]','https://www.averydennison.com','<p>Avery Dennison is a materials science and manufacturing company specializing in the design and manufacture of a wide variety of labeling and functional, including tapes, tags, labels, and radio frequency identification (RFID) solutions.</p>','Avery Dennison'),(34,88,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','797049b0-051b-42bf-b276-ac58e39687ce','[\"consulting\"]','https://www2.deloitte.com/','<p>Deloitte provides industry-leading audit, consulting, tax, and advisory services to many of the world’s most admired brands, including nearly 90 percent of the Fortune 500® and more than 5,000 private and middle-market companies.</p>','Deloitte'),(35,89,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','30649981-6fd7-4a19-82f6-c9b587ee8eb2','[\"consulting\"]','https://www.satoeurope.com/','<p>SATO is a leading global provider of Auto-ID solutions that connect people, goods and information. SATO America is a premier manufacturer of Industrial Thermal Printers, Print Engines, Laser Printers and RFID embedded tags and labels.</p>','Sato'),(36,90,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','8157380b-c325-4a9a-b2ed-e1148f11a567','[\"printer\"]','https://evrythng.com/','<p>EVRYTHNG provides a suite of solutions to drive new digital applications, better control your supply chain, and engage directly with your customers.</p>','Evrythng'),(37,91,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','178c5fb3-904f-4027-a3d0-8ee578c31b58','[]','https://www.cloudleaf.com/','<p>Cloudleaf provides you with continuous visibility into the context, condition, timing and location of material and assets throughout your supply chain.</p>','Cloudleaf'),(38,92,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','133e517e-b7b2-4cd7-9344-fcc15b5346b7','[\"serialization\",\"wiFiAccessPointGateway\"]','https://blyott.com','<p>Blyott is a machine learning and modular RTLS, giving healthcare organisations remote insights into their assets and can lead to big savings and happy staff.</p>','Blyott'),(39,93,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','e8f78f0e-5da7-4bba-bd15-b6ea7434a019','[\"inlayTag\",\"printer\",\"serialization\",\"solutionProvider\"]','https://www.arubanetworks.com/','<p>Aruba is the industry leader in wired, wireless and security networking solutions for todays experience edge.</p>','HP Aruba'),(40,94,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','17aa1a4d-d2c5-4fc1-88b3-ab64d5ad8ea1','[\"solutionProvider\"]','https://www.mist.com/','<p>Mist is pioneering the new wireless network. The first AI-driven WLAN makes Wi-Fi predictable, reliable, and measurable while delivering amazing indoor location experiences.</p>','Mist'),(41,95,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','acc087aa-555f-46a8-a0fd-33f6be508c6e','[\"serialization\",\"solutionProvider\"]','https://estimote.com/','<p>Estimote – location and proximity solutions with programmable IoT stack using Bluetooth, Ultra Wideband, and LTE / NB-IoT connectivity.</p>','Estimote'),(42,96,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','715a35c6-03fb-402e-afe3-fae8e6c1ee71','[]','https://www.tadbik.com/','<p>The one-stop-shop for packaging solutions worldwide. With 30 years of expertise, we add value to our customers across industries and continents.</p>','Tadbik'),(43,97,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','13ae0ad1-aace-4533-855e-5f622c9d6347','[\"inlayTag\",\"printer\"]','https://www.fanstel.com/','<p>Bluetooth modules, Bluetooth 5 modules and contract manufacturing.</p>','Fanstel'),(44,98,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','6a433dc8-82f4-45c4-a3f7-479e8ebdf45b','[\"wiFiAccessPointGateway\"]','https://www.muehlbauer.de/','<p>The Mühlbauer Group is the only one-stop-shop technology partner for the production and personalization of cards, passports and RFID applications worldwide.</p>','Mühlbauer Group');
/*!40000 ALTER TABLE `matrixcontent_partnerslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xmcghpwneagupnmwqpolamtzffvgakmnrfyb` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','8fcfad3b-b4e6-4133-b3d4-a04394255f81'),(2,'craft','m150403_183908_migrations_table_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d2f15554-8367-4bfc-9649-d665c384b386'),(3,'craft','m150403_184247_plugins_table_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c55758fc-77b0-4473-89bf-aefd50079eb6'),(4,'craft','m150403_184533_field_version','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','cf2c1266-6602-4886-9edf-9d7181317984'),(5,'craft','m150403_184729_type_columns','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','fef9d3d0-0727-44dc-a9db-7b40e78f3e36'),(6,'craft','m150403_185142_volumes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','abdf2ad9-d10e-4ee3-bc13-673c87776afe'),(7,'craft','m150428_231346_userpreferences','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','a86b388b-155b-4645-8909-a7942a09a469'),(8,'craft','m150519_150900_fieldversion_conversion','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','8438fd21-413f-472e-b30b-17f830a8f809'),(9,'craft','m150617_213829_update_email_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','2a8b45a1-f1c0-49de-8fb5-bf5f4da8996a'),(10,'craft','m150721_124739_templatecachequeries','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','eb820af3-1bfd-45c9-8cbb-14f00eee31a7'),(11,'craft','m150724_140822_adjust_quality_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0175bc60-7e82-4e4e-86cc-0395b5ff6e36'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6edce7e4-644b-41c9-9318-cc96a28e80a3'),(13,'craft','m151002_095935_volume_cache_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','bdb28e70-0018-41cb-a5a5-c7a754b0a56c'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1b483244-a7a8-44cc-98a0-8d94672a6509'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','7eb5732e-efcc-4bd4-987a-3a690d464468'),(16,'craft','m151209_000000_move_logo','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','9f6a4459-d30b-43d5-a215-5c4c861871d6'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','92ea6f2d-805e-45a8-b1b4-e53dfab7a9c2'),(18,'craft','m151215_000000_rename_asset_permissions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1c82f200-cff2-4070-b315-af5b8d1e7990'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e3d97e6d-b0ac-43a1-bd18-b030bf5840ea'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','28528423-cd90-4a03-bbfb-eceec72daccc'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','ab360149-9724-4e22-af7d-5830ec72cb88'),(22,'craft','m160727_194637_column_cleanup','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','896a8af2-f458-46e0-935b-2cb8fd1c6ff1'),(23,'craft','m160804_110002_userphotos_to_assets','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','374618e3-3ccf-4678-b575-b266285246cb'),(24,'craft','m160807_144858_sites','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f6a4e205-b639-4ad7-88eb-98374976ee7b'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','197c51f8-618f-4d49-b62f-dcf541af4426'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1044eaff-1a7e-402c-8549-4480ecd6ea9c'),(27,'craft','m160912_230520_require_entry_type_id','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b10d5f91-aaa0-4a15-b268-d4d60bbd818d'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f8cf40c6-4067-4e83-a716-d4de623d605b'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','78999450-0fef-4956-9c64-470dd2d96c6b'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4a483931-f7c2-40f9-9fbf-f0286d33a384'),(31,'craft','m160925_113941_route_uri_parts','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f678ba06-a8ae-47e6-8d8c-6a77d0bd03d4'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b3d85c72-250c-4c0f-94dc-e56624f281d1'),(33,'craft','m161007_130653_update_email_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c7477e62-a239-43ed-9e7b-023f19007af8'),(34,'craft','m161013_175052_newParentId','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','77a166be-6e54-4137-afda-c1aebb63a5ac'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6dcc145c-1d8f-49dc-b17a-238e45dbc55e'),(36,'craft','m161021_182140_rename_get_help_widget','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f37e119b-4036-43dc-b92f-495a58bb3e9f'),(37,'craft','m161025_000000_fix_char_columns','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','fbf79a82-e5b3-463c-a645-3d79dcf9cccd'),(38,'craft','m161029_124145_email_message_languages','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','2ead339c-11c0-4e8e-862f-79a7ef87be6a'),(39,'craft','m161108_000000_new_version_format','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','302be0c3-bde3-4171-830c-1a99940427b2'),(40,'craft','m161109_000000_index_shuffle','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1cd2de55-280b-48e4-ba20-0c1d7e7989a0'),(41,'craft','m161122_185500_no_craft_app','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','096497b1-bbc5-4ccb-8e5a-2a2b027efdde'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','32592e33-8a47-4dfe-a5d8-82441a8f9b5b'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','97632d76-5283-49c8-a88a-dbeb13e36866'),(44,'craft','m170114_161144_udates_permission','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e834c56f-ad30-46cd-93f1-1e191b415d00'),(45,'craft','m170120_000000_schema_cleanup','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','322848d0-816c-4be8-99bb-7d91611e9df7'),(46,'craft','m170126_000000_assets_focal_point','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4f7f82f1-afc9-41ba-b1b8-1ea08199d58f'),(47,'craft','m170206_142126_system_name','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','7ee9a77e-b70c-496f-9cb4-99ce051c17a1'),(48,'craft','m170217_044740_category_branch_limits','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','02042e4f-8b5f-41a9-bc78-8b03995577ad'),(49,'craft','m170217_120224_asset_indexing_columns','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4abd0914-fa66-4741-82a4-e051d101e9ac'),(50,'craft','m170223_224012_plain_text_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0059a7ec-7d99-4281-9b42-571e7810f344'),(51,'craft','m170227_120814_focal_point_percentage','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0d216dc4-0811-4a1e-9720-a550b347d7f0'),(52,'craft','m170228_171113_system_messages','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6e572f3f-08f4-4975-98c5-ad310f45b71a'),(53,'craft','m170303_140500_asset_field_source_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','9c645224-5eec-47f8-a9e8-6db5078de48c'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','82912787-9d43-4596-a68f-5bcc6e01e787'),(55,'craft','m170523_190652_element_field_layout_ids','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','3f4649c2-828c-4a6c-9d5f-51188c6f9b6f'),(56,'craft','m170621_195237_format_plugin_handles','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','62837e29-cd6a-4bc0-b20e-aeddbda7600f'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','22e88585-9685-4faa-b298-f04946914aca'),(58,'craft','m170630_161028_deprecation_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','14359919-20ea-4200-8bdc-3931f123c9f4'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','7483035c-95fc-4cbc-941c-af8f752e28b6'),(60,'craft','m170704_134916_sites_tables','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4d509f37-6de1-4270-b303-5043fc4231b3'),(61,'craft','m170706_183216_rename_sequences','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','3e0c18e7-ae04-4c93-b2bd-1cf7440736f5'),(62,'craft','m170707_094758_delete_compiled_traits','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','47ade2c3-eaa0-4e26-8bef-e190a7adb347'),(63,'craft','m170731_190138_drop_asset_packagist','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e63b20bd-733d-4188-af38-bdf108eb44cb'),(64,'craft','m170810_201318_create_queue_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6f74e1ac-2d7a-4804-8885-63a1f6429534'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','3b6be73e-e1f3-459e-9eae-f847d8c939a4'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1be49a2b-7571-4267-9c6e-97864416832a'),(67,'craft','m171011_214115_site_groups','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','ce901b54-27aa-41ad-9618-fb6538b95d64'),(68,'craft','m171012_151440_primary_site','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1d579bec-7e56-47a4-b1f7-4cd008c3cebd'),(69,'craft','m171013_142500_transform_interlace','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f8b9e5ae-40db-4166-a8bf-31ee73b6b247'),(70,'craft','m171016_092553_drop_position_select','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','7aca874a-e67a-4559-9a93-39daed0aabab'),(71,'craft','m171016_221244_less_strict_translation_method','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6159988b-4746-4350-815b-33c30889106b'),(72,'craft','m171107_000000_assign_group_permissions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','122c6a62-2091-4acc-b630-5876982e34ea'),(73,'craft','m171117_000001_templatecache_index_tune','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','64d1efe2-bdf7-4367-92a3-e104638e6b73'),(74,'craft','m171126_105927_disabled_plugins','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0587e76d-f738-4cad-8126-9dac0093ca0e'),(75,'craft','m171130_214407_craftidtokens_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b8a25eaf-e943-40a4-ac15-df1311b482f3'),(76,'craft','m171202_004225_update_email_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0a4a7fd1-4a84-40da-baff-08ca4d18585b'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','3542d7d1-1299-4dd8-a925-eaba58db1ec9'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','eee449a3-afd1-4894-a33e-58465ae5ddc4'),(79,'craft','m171218_143135_longtext_query_column','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','be44ea6e-8544-417b-b890-29e906ccb0b1'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e0e971e7-de06-4ff0-b20c-cf4ba6a21ca7'),(81,'craft','m180113_153740_drop_users_archived_column','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','946d008c-5fa6-4601-9ec4-e8e5cb2a6de6'),(82,'craft','m180122_213433_propagate_entries_setting','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','fcb4e1ed-c785-4472-9942-12fa041c31dd'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','499dd0c2-1500-4fd9-9cb9-9bdc1bff6eb7'),(84,'craft','m180128_235202_set_tag_slugs','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','357a2afe-6537-44d8-9611-e9345783cf51'),(85,'craft','m180202_185551_fix_focal_points','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1706e57a-5158-4f78-9639-66ca80a445e4'),(86,'craft','m180217_172123_tiny_ints','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','aa30add7-b496-4a1e-827e-5975dd99e45b'),(87,'craft','m180321_233505_small_ints','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','a7e15c37-fc90-45dc-a5a8-53371c37ff52'),(88,'craft','m180404_182320_edition_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','75878b68-5d7d-44da-b0ba-751cf8dbfd5c'),(89,'craft','m180411_102218_fix_db_routes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','7d581d88-7aee-48e4-b83d-49a8a91a9a9d'),(90,'craft','m180416_205628_resourcepaths_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b0eb5ea1-0fc5-4d91-8787-6b4ba6bb219a'),(91,'craft','m180418_205713_widget_cleanup','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0bcec384-5413-4d29-a516-9ce944f7693d'),(92,'craft','m180425_203349_searchable_fields','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','30c75986-6104-4ebc-a784-373b83441a8c'),(93,'craft','m180516_153000_uids_in_field_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','ced1ac8f-15e4-4b6b-99de-c66bf56a40a1'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b07e48a9-88f2-4691-9836-2a7dfa32550a'),(95,'craft','m180518_173000_permissions_to_uid','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','3149cc16-91b2-4a5a-9a58-fab948d8217a'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d0a2857a-0aa4-4dd6-bced-79531d315c51'),(97,'craft','m180521_172900_project_config_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','a0960421-c570-4ec3-b6f1-09c954b857d8'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4fc131b1-955c-4303-8a99-3ba70cd22e03'),(99,'craft','m180731_162030_soft_delete_sites','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','8cf1b18e-d158-42f3-8d91-abad028cebba'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4993530e-d918-4117-b390-b7a70c319cb4'),(101,'craft','m180810_214439_soft_delete_elements','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','777a799b-7878-4daa-8116-efd7edd59d17'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','62b06489-9630-41ee-9acb-3fadf63edae9'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','301a6b92-1add-4543-9d60-12cca727e5cc'),(104,'craft','m180904_112109_permission_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','14c5305e-c4db-444b-9054-220c90a02e9c'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4d220f36-b274-417d-8567-1ad4d0ebc300'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','10c8ef0e-2cad-4822-a786-ea9ec7047b74'),(107,'craft','m181016_183648_set_default_user_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','782a9f36-7d99-4a7a-840d-180f8ec7225b'),(108,'craft','m181017_225222_system_config_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e8f6084a-4847-4c16-8977-ce63cd319ac3'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d73a5246-87ea-47b6-8ccf-705e6f594bc5'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f5d44b7a-f230-48f1-90a2-498a19d7de6a'),(111,'craft','m181112_203955_sequences_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6e4dc7a7-ac89-4698-83b4-dd7b36a7d447'),(112,'craft','m181121_001712_cleanup_field_configs','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d9242092-9721-45c7-8d8d-13f5a1325702'),(113,'craft','m181128_193942_fix_project_config','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','141eec26-73ee-471c-a36c-474d05ca6371'),(114,'craft','m181130_143040_fix_schema_version','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4333fcb6-ff7e-499b-a864-076739942141'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c36a4698-a9e1-476f-be91-c535a63f8e4d'),(116,'craft','m181217_153000_fix_structure_uids','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','a60e6a9a-b63e-4e1f-bb0c-c79fe774eabb'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','dda2a017-ab19-4522-9c5c-f2fa4e5246ec'),(118,'craft','m190108_110000_cleanup_project_config','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1c9829af-cc79-45ff-a0c8-d220e80ef902'),(119,'craft','m190108_113000_asset_field_setting_change','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','5cc8f055-ac21-4a51-91bf-925c04a8932b'),(120,'craft','m190109_172845_fix_colspan','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','352d319d-7fc7-440a-a392-d693bb62108a'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','fc5e455b-9427-41f5-bfa4-b05244028320'),(122,'craft','m190110_214819_soft_delete_volumes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','61cff3bb-d63b-4454-9aae-650e01c7bedc'),(123,'craft','m190112_124737_fix_user_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c2b58817-ae46-497f-927b-be0fc785cd25'),(124,'craft','m190112_131225_fix_field_layouts','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','73bb1ebd-b7dd-4ad2-b3ec-c11e27ebf791'),(125,'craft','m190112_201010_more_soft_deletes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','79498fa4-7e54-4e99-8b7e-f9fc93cbec0d'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','bcccd688-45a2-4980-a949-1bd26a47456b'),(127,'craft','m190121_120000_rich_text_config_setting','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','8e26b9a0-3d68-46e4-b35f-7786a399bcdf'),(128,'craft','m190125_191628_fix_email_transport_password','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','bb2ca3cd-cfe7-4bc9-aaff-07bf936f2e86'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d6fffdaf-1783-4989-a7e6-b6656a6c73bd'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1486d933-2648-47a1-8c18-e097bfcd9de7'),(131,'craft','m190218_143000_element_index_settings_uid','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','cbb7c67b-6a15-4a24-bb1d-d04f6675a8f8'),(132,'craft','m190312_152740_element_revisions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b75b4a21-167c-466c-bcfe-b7edbabdcc2e'),(133,'craft','m190327_235137_propagation_method','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','8a16e655-1997-4ba9-b6dc-6bbed84dd55f'),(134,'craft','m190401_223843_drop_old_indexes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6871e465-1e0c-43bc-b430-e8376e4dae05'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c03571f7-76dc-4ebb-b24f-2d6504c4ab06'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e5967fea-3900-49c5-8e35-6133a1527dd2'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','081e3539-a6fc-459e-8e13-3014189c7651'),(138,'craft','m190504_150349_preview_targets','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','cf0922f7-1f0e-4b69-9689-471102252511'),(139,'craft','m190516_184711_job_progress_label','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','520327d5-de7d-45a6-adfb-ebf9d82fde89'),(140,'craft','m190523_190303_optional_revision_creators','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','2937f5bf-e8d8-4669-91b2-557bdab95ec3'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c4794339-47e7-4927-8782-60f0a625831e'),(142,'craft','m190605_223807_unsaved_drafts','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b56863c4-acd1-49cb-80d8-25b7c1add2ac'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','6c72e15d-bb74-49ad-8af6-77e14a530f62'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','7b5661f4-46e1-48dd-98a1-383b8aaea3d6'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d3e4e532-bfe7-4046-8695-4e265194f247'),(146,'craft','m190624_234204_matrix_propagation_method','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','fb04b30f-5a60-4daa-b9bb-3f1613a966e3'),(147,'craft','m190711_153020_drop_snapshots','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','bc7663d3-3c60-4764-af80-b42a4f535a68'),(148,'craft','m190712_195914_no_draft_revisions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','3e0529c0-7d4e-4a33-bfb1-8839e52edb05'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','27ac1c29-81b9-4b3d-8a8b-819c34d16b44'),(150,'craft','m190820_003519_flush_compiled_templates','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','bd8def15-9cb2-4ad3-b2f1-62dfa7311a36'),(151,'craft','m190823_020339_optional_draft_creators','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','411a6b05-cbf0-4ab7-9953-e6cff90bf01b'),(152,'craft','m190913_152146_update_preview_targets','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','56099483-4087-485a-9cc3-ef5738a315d9'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','400189a9-7d48-448f-aa70-8ae4ff094f45'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','5f20f775-6c25-4559-bcf8-c533a4f088f2'),(155,'craft','m191206_001148_change_tracking','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b3abe0e2-9963-41d6-9bfd-f2cd8cdb6584'),(156,'craft','m191216_191635_asset_upload_tracking','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c17eb0cb-50e6-40c7-83ee-f428d296bd2d'),(157,'craft','m191222_002848_peer_asset_permissions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e1efc806-a399-4b70-8b8f-0a5aee18fc26'),(158,'craft','m200127_172522_queue_channels','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','98e44d38-fdee-4b46-a87d-085f26883169'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','e1207964-d68a-4a63-97dc-c1873ac9134a'),(160,'craft','m200213_172522_new_elements_index','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','c3ae69a4-4c29-4fa9-9fb3-a4026b4b14f7'),(161,'craft','m200228_195211_long_deprecation_messages','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','f311e97b-6cd8-43c3-aa26-42ecf95921fa'),(162,'craft','m200306_054652_disabled_sites','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','490f379c-fd7a-406e-bbb1-4c14c86ecac9'),(163,'craft','m200522_191453_clear_template_caches','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b82863c8-a6d6-4485-81b0-fdd984fd956e'),(164,'craft','m200606_231117_migration_tracks','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','1b80faa4-0b9c-4303-ac15-caa1d3341189'),(165,'craft','m200619_215137_title_translation_method','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','b5742077-8cb1-4e80-93fd-627899c886fc'),(166,'craft','m200620_005028_user_group_descriptions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','afe789ab-6383-4460-8240-0ae51a206ae0'),(167,'craft','m200620_230205_field_layout_changes','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','94855ef5-8ecb-4ff9-b801-5cc92bcc2a8f'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','13394371-1b5c-4b8a-871a-6d49813fb372'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','cc9cd136-db13-455b-ae2a-21bfe5ef8b64'),(170,'craft','m200630_183000_drop_configmap','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','49522fee-299e-44f4-b630-9da23c8e4a3c'),(171,'craft','m200715_113400_transform_index_error_flag','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','9aa58ef7-a088-499f-a706-12d389b43d14'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','52285f3a-8ae3-4b4e-870f-8c49acb6a2f2'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','4ca1c991-c70c-4e29-bb3c-0b4a2e9c3856'),(174,'craft','m200720_175543_drop_unique_constraints','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','98bfe5cd-0138-4c0e-ae11-a580b737033e'),(175,'craft','m200825_051217_project_config_version','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','842ca9c2-9386-4fd8-9c42-bc4f05468854'),(176,'craft','m201116_190500_asset_title_translation_method','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0d0642eb-a60b-429b-9090-5a3d9aa08a1c'),(177,'craft','m201124_003555_plugin_trials','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','cfaa08fb-d390-4adf-8c5e-e022594a8f0a'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','d0d988b9-9de4-4049-a5e9-46357519d6a9'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','81e5b588-ed89-4da8-a80e-154da6ac5235'),(180,'craft','m210214_202731_track_saved_drafts','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','a0509db8-3eb9-4015-a872-c205c11a2c6f'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','0359f5d7-c920-4965-bad9-3dde14da1a00'),(182,'craft','m210224_162000_add_projectconfignames_table','2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-04 12:19:14','32b1cbea-2db7-417c-8f59-e4358c6adb8f'),(183,'plugin:redactor','m180430_204710_remove_old_plugins','2021-03-04 14:59:56','2021-03-04 14:59:56','2021-03-04 14:59:56','448582bc-4998-4a38-9a7d-d5234566d6fe'),(184,'plugin:redactor','Install','2021-03-04 14:59:56','2021-03-04 14:59:56','2021-03-04 14:59:56','8c27e659-11f9-4162-b484-91aadee4eb26'),(185,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-03-04 14:59:56','2021-03-04 14:59:56','2021-03-04 14:59:56','9c7fd077-ab05-4722-ab04-01e61bb84520'),(186,'plugin:super-table','Install','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','48ef74bd-13eb-4468-972c-3595c13c3742'),(187,'plugin:super-table','m180210_000000_migrate_content_tables','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','8a54b169-6825-43d8-91aa-f5f98f158e02'),(188,'plugin:super-table','m180211_000000_type_columns','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','fef8ee88-89b9-4fe8-8a6f-cc70657d26fb'),(189,'plugin:super-table','m180219_000000_sites','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','4c883799-7b4a-4025-9a36-7e8b9d0f47dd'),(190,'plugin:super-table','m180220_000000_fix_context','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','ded4aa3a-26e4-4171-90d9-9e5738bbe8fe'),(191,'plugin:super-table','m190117_000000_soft_deletes','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','b1cb2e33-e260-4878-8b72-922e6241eb95'),(192,'plugin:super-table','m190117_000001_context_to_uids','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','40ef36b6-8608-4c1b-84e1-dfbe2834e050'),(193,'plugin:super-table','m190120_000000_fix_supertablecontent_tables','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','202ba45a-569d-4df9-8296-11a0051b64aa'),(194,'plugin:super-table','m190131_000000_fix_supertable_missing_fields','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','cd6877b6-5f90-44b9-843a-0dc61ff3e7db'),(195,'plugin:super-table','m190227_100000_fix_project_config','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','c4888896-262d-4b33-9194-7548ed55ed74'),(196,'plugin:super-table','m190511_100000_fix_project_config','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','25596415-434a-4fc1-b966-01ec11d9a502'),(197,'plugin:super-table','m190520_000000_fix_project_config','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','c3509997-047e-4c59-84d4-be4a4931de50'),(198,'plugin:super-table','m190714_000000_propagation_method','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','3b28ffed-53e0-4e33-b58e-b8a43642cec6'),(199,'plugin:super-table','m191127_000000_fix_width','2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-05 11:29:04','19e1af4c-06eb-4929-aa65-06826541ef11');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xvqykdqesvyofzipphwbvejjpnmswymohiar` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'redactor','2.8.5','2.3.0','unknown',NULL,'2021-03-04 14:59:56','2021-03-04 14:59:56','2021-03-16 16:24:12','c9880523-5184-4583-bc98-72c10aaba645'),(2,'redactor-anchors','1.1.0','2.0','unknown',NULL,'2021-03-04 15:04:43','2021-03-04 15:04:43','2021-03-16 16:24:12','baa81868-838f-44b7-b890-ad483852119e'),(3,'image-resizer','2.1.0','2.0.0','unknown',NULL,'2021-03-05 11:26:00','2021-03-05 11:26:00','2021-03-16 16:24:12','beebd82e-f950-4da9-a76d-e0070071d81e'),(4,'assetusage','2.2.1','2.0.0','unknown',NULL,'2021-03-05 11:28:09','2021-03-05 11:28:09','2021-03-16 16:24:12','d4c66abb-7d36-4d84-b150-ba45feb596b9'),(5,'super-table','2.6.7','2.2.1','unknown',NULL,'2021-03-05 11:29:04','2021-03-05 11:29:04','2021-03-16 16:24:12','2df7abcc-f03c-4914-bcbb-890ca9779d80'),(6,'field-manager','2.2.2','1.0.0','unknown',NULL,'2021-03-05 14:52:45','2021-03-05 14:52:45','2021-03-16 16:24:12','b96c0100-1ce8-4005-932b-61bd59d285ec'),(7,'typedlinkfield','1.0.25','1.0.0','unknown',NULL,'2021-03-08 12:18:04','2021-03-08 12:18:04','2021-03-16 16:24:12','19565f79-98ee-4953-80e0-1b9a75ea55e3');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1615911805'),('email.fromEmail','\"marcin@adchitects.co\"'),('email.fromName','\"Wiliot\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.fieldUid','\"569c1536-e1e1-478b-8a94-de85377f9ba0\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.0.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.fieldUid','\"070c859e-ec54-49e9-acd9-e658f728d891\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.1.width','75'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.fieldUid','\"70e371d8-d7fb-43ef-a3fc-913faa7db3d1\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.elements.2.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.name','\"Hero\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.0.sortOrder','1'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.fieldUid','\"f3ab10b4-5d6a-4c83-9a65-ca0ab0346314\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.0.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.fieldUid','\"f0515b35-e39d-4154-bb06-ea6904427257\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.elements.1.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.name','\"Intro\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.1.sortOrder','2'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.fieldUid','\"98991cd5-c9c4-41b3-9e68-2b31b44bd772\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.elements.0.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.name','\"Partners Listing\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.2.sortOrder','3'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.fieldUid','\"ba42799d-0a49-4f7f-817a-cde956fa12ee\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.0.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.fieldUid','\"7637ec1c-947f-42f2-9b7d-3ba65f195b8d\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.1.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.fieldUid','\"4318cfd0-f068-4073-9703-1db060485eb7\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.required','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.elements.2.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.name','\"Outro\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.3.sortOrder','4'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.autocapitalize','true'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.autocomplete','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.autocorrect','true'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.class','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.disabled','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.id','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.instructions','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.label','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.max','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.min','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.name','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.orientation','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.placeholder','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.readonly','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.requirable','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.size','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.step','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.tip','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.title','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.warning','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.elements.0.width','100'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.name','\"Content\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.fieldLayouts.db411207-5bae-4ce4-bdbe-34a057e2a6ca.tabs.4.sortOrder','5'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.handle','\"partners\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.hasTitleField','false'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.name','\"Partners\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.section','\"2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.sortOrder','1'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.titleFormat','\"{section.name|raw}\"'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.titleTranslationKeyFormat','null'),('entryTypes.68d3e256-4114-4b54-bd0f-0c9fa54a5bae.titleTranslationMethod','\"site\"'),('fieldGroups.1539e223-b771-4778-a5b9-3676b59a2508.name','\"Outro\"'),('fieldGroups.83a380f9-0f52-4434-a9f9-dfcd5c8a80c9.name','\"Hero\"'),('fieldGroups.c6882d8c-7b75-4033-97e8-bb0a0d47c7c4.name','\"Partners listing\"'),('fieldGroups.d5e4c30e-3d1d-421e-89a7-581b54f7c4a9.name','\"Intro\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.contentColumnType','\"text\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.fieldGroup','\"83a380f9-0f52-4434-a9f9-dfcd5c8a80c9\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.handle','\"heroSubtitle\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.instructions','\"\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.name','\"Hero subtitle\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.searchable','false'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.byteLimit','null'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.charLimit','null'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.code','\"\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.columnType','null'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.initialRows','\"4\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.multiline','\"\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.placeholder','\"Subtitle\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.settings.uiMode','\"normal\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.translationKeyFormat','null'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.translationMethod','\"none\"'),('fields.070c859e-ec54-49e9-acd9-e658f728d891.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.contentColumnType','\"text\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.fieldGroup','\"1539e223-b771-4778-a5b9-3676b59a2508\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.handle','\"outroButton\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.instructions','\"Button\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.name','\"Outro Button\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.searchable','false'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowCustomText','\"1\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowedLinkNames.3','\"entry\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowedLinkNames.6','\"custom\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowedLinkNames.7','\"email\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowedLinkNames.8','\"tel\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowedLinkNames.9','\"url\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.allowTarget','\"1\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.autoNoReferrer','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.defaultLinkName','\"entry\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.defaultText','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.enableAriaLabel','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.enableTitle','\"1\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.0.0','\"asset\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.0.1.__assoc__.0.0','\"sources\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.0.1.__assoc__.0.1','\"*\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.0.1.__assoc__.1.0','\"allowCustomQuery\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.0.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.1.0','\"category\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.1.1.__assoc__.0.0','\"sources\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.1.1.__assoc__.0.1','\"*\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.1.1.__assoc__.1.0','\"allowCustomQuery\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.1.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.2.0','\"entry\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.2.1.__assoc__.0.0','\"sources\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.2.1.__assoc__.0.1','\"*\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.2.1.__assoc__.1.0','\"allowCustomQuery\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.2.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.3.0','\"site\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.3.1.__assoc__.0.0','\"sites\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.3.1.__assoc__.0.1','\"*\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.4.0','\"user\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.4.1.__assoc__.0.0','\"sources\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.4.1.__assoc__.0.1','\"*\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.4.1.__assoc__.1.0','\"allowCustomQuery\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.4.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.5.0','\"custom\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.5.1.__assoc__.0.0','\"disableValidation\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.5.1.__assoc__.0.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.5.1.__assoc__.1.0','\"allowAliases\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.5.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.6.0','\"email\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.6.1.__assoc__.0.0','\"disableValidation\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.6.1.__assoc__.0.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.6.1.__assoc__.1.0','\"allowAliases\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.6.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.7.0','\"tel\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.7.1.__assoc__.0.0','\"disableValidation\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.7.1.__assoc__.0.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.7.1.__assoc__.1.0','\"allowAliases\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.7.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.8.0','\"url\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.8.1.__assoc__.0.0','\"disableValidation\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.8.1.__assoc__.0.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.8.1.__assoc__.1.0','\"allowAliases\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.settings.typeSettings.__assoc__.8.1.__assoc__.1.1','\"\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.translationKeyFormat','null'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.translationMethod','\"none\"'),('fields.4318cfd0-f068-4073-9703-1db060485eb7.type','\"typedlinkfield\\\\fields\\\\LinkField\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.contentColumnType','\"string\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.fieldGroup','\"83a380f9-0f52-4434-a9f9-dfcd5c8a80c9\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.handle','\"heroSizes\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.instructions','\"Select a size of a hero component\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.name','\"Hero sizes\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.searchable','false'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.0.__assoc__.0.0','\"label\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.0.__assoc__.0.1','\"small\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.0.__assoc__.1.0','\"value\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.0.__assoc__.1.1','\"small\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.0.__assoc__.2.0','\"default\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.0.__assoc__.2.1','\"\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.1.__assoc__.0.0','\"label\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.1.__assoc__.0.1','\"medium\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.1.__assoc__.1.0','\"value\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.1.__assoc__.1.1','\"medium\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.1.__assoc__.2.0','\"default\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.settings.options.1.__assoc__.2.1','\"1\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.translationKeyFormat','null'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.translationMethod','\"none\"'),('fields.569c1536-e1e1-478b-8a94-de85377f9ba0.type','\"craft\\\\fields\\\\RadioButtons\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.contentColumnType','\"text\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.fieldGroup','\"83a380f9-0f52-4434-a9f9-dfcd5c8a80c9\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.handle','\"heroTitle\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.instructions','\"\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.name','\"Hero tItle\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.searchable','false'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.byteLimit','null'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.charLimit','null'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.code','\"\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.columnType','null'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.initialRows','\"4\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.multiline','\"\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.placeholder','\"TItle\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.settings.uiMode','\"normal\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.translationKeyFormat','null'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.translationMethod','\"none\"'),('fields.70e371d8-d7fb-43ef-a3fc-913faa7db3d1.type','\"craft\\\\fields\\\\PlainText\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.contentColumnType','\"text\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.fieldGroup','\"1539e223-b771-4778-a5b9-3676b59a2508\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.handle','\"outroDescription\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.instructions','\"Description\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.name','\"Outro Description\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.searchable','false'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.availableTransforms','\"*\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.availableVolumes','\"*\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.cleanupHtml','true'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.columnType','\"text\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.configSelectionMode','\"choose\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.defaultTransform','\"\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.manualConfig','\"\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.purifierConfig','\"\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.purifyHtml','\"1\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.redactorConfig','\"\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.removeEmptyTags','\"1\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.removeInlineStyles','\"1\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.removeNbsp','\"1\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.showUnpermittedFiles','false'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.showUnpermittedVolumes','false'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.settings.uiMode','\"enlarged\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.translationKeyFormat','null'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.translationMethod','\"none\"'),('fields.7637ec1c-947f-42f2-9b7d-3ba65f195b8d.type','\"craft\\\\redactor\\\\Field\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.contentColumnType','\"string\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.fieldGroup','\"c6882d8c-7b75-4033-97e8-bb0a0d47c7c4\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.handle','\"partnersList\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.instructions','\"\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.name','\"Partners list\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.searchable','false'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.settings.contentTable','\"{{%matrixcontent_partnerslist}}\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.settings.maxBlocks','\"\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.settings.minBlocks','\"\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.settings.propagationMethod','\"all\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.translationKeyFormat','null'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.translationMethod','\"site\"'),('fields.98991cd5-c9c4-41b3-9e68-2b31b44bd772.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.contentColumnType','\"text\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.fieldGroup','\"1539e223-b771-4778-a5b9-3676b59a2508\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.handle','\"outroTitle\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.instructions','\"Title\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.name','\"Outro Title\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.searchable','false'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.byteLimit','null'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.charLimit','null'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.code','\"\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.columnType','null'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.initialRows','\"4\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.multiline','\"\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.placeholder','null'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.settings.uiMode','\"normal\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.translationKeyFormat','null'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.translationMethod','\"none\"'),('fields.ba42799d-0a49-4f7f-817a-cde956fa12ee.type','\"craft\\\\fields\\\\PlainText\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.contentColumnType','\"text\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.fieldGroup','\"d5e4c30e-3d1d-421e-89a7-581b54f7c4a9\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.handle','\"introDescription\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.instructions','\"Description\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.name','\"Intro Description\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.searchable','false'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.availableTransforms','\"*\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.availableVolumes','\"*\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.cleanupHtml','true'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.columnType','\"text\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.configSelectionMode','\"choose\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.defaultTransform','\"\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.manualConfig','\"\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.purifierConfig','\"\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.purifyHtml','\"1\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.redactorConfig','\"\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.removeEmptyTags','\"1\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.removeInlineStyles','\"1\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.removeNbsp','\"1\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.showUnpermittedFiles','false'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.showUnpermittedVolumes','false'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.settings.uiMode','\"normal\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.translationKeyFormat','null'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.translationMethod','\"none\"'),('fields.f0515b35-e39d-4154-bb06-ea6904427257.type','\"craft\\\\redactor\\\\Field\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.contentColumnType','\"text\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.fieldGroup','\"d5e4c30e-3d1d-421e-89a7-581b54f7c4a9\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.handle','\"introTitle\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.instructions','\"\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.name','\"Intro Title\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.searchable','false'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.byteLimit','null'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.charLimit','null'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.code','\"\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.columnType','null'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.initialRows','\"4\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.multiline','\"\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.placeholder','\"Title\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.settings.uiMode','\"normal\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.translationKeyFormat','null'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.translationMethod','\"none\"'),('fields.f3ab10b4-5d6a-4c83-9a65-ca0ab0346314.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.field','\"98991cd5-c9c4-41b3-9e68-2b31b44bd772\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.fieldUid','\"de2f137b-e43d-43ff-8b36-31978ed3eef1\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.label','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.required','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.tip','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.warning','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.0.width','100'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.fieldUid','\"c7c9f302-4f23-466d-a2d3-675621d8f44a\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.label','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.required','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.tip','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.warning','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.1.width','100'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.fieldUid','\"b7ac79ba-352c-490e-aaa7-737c89d9e247\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.label','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.required','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.tip','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.warning','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.2.width','100'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.fieldUid','\"6be2d726-24c6-4a93-8d7c-30a8b9da7b06\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.instructions','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.label','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.required','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.tip','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.warning','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.3.width','100'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.fieldUid','\"0a187bb9-ebd0-4016-b111-84d728762249\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.instructions','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.label','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.required','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.tip','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.warning','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.elements.4.width','100'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.name','\"Content\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fieldLayouts.9e918aae-9a5c-44f0-a19e-1e07d1b7fef0.tabs.0.sortOrder','1'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.contentColumnType','\"string\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.fieldGroup','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.handle','\"partnerCategory\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.instructions','\"Press ctrl (cmd) or Shift to select multiple values\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.name','\"Partner category\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.searchable','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.multi','true'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.optgroups','true'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.0.__assoc__.0.0','\"label\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.0.__assoc__.0.1','\"Inlay & Tag\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.0.__assoc__.1.0','\"value\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.0.__assoc__.1.1','\"inlayTag\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.0.__assoc__.2.0','\"default\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.0.__assoc__.2.1','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.1.__assoc__.0.0','\"label\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.1.__assoc__.0.1','\"Printer\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.1.__assoc__.1.0','\"value\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.1.__assoc__.1.1','\"printer\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.1.__assoc__.2.0','\"default\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.2.__assoc__.0.0','\"label\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.2.__assoc__.0.1','\"Serialization\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.2.__assoc__.1.0','\"value\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.2.__assoc__.1.1','\"serialization\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.2.__assoc__.2.0','\"default\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.2.__assoc__.2.1','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.3.__assoc__.0.0','\"label\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.3.__assoc__.0.1','\"Solution Provider\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.3.__assoc__.1.0','\"value\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.3.__assoc__.1.1','\"solutionProvider\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.3.__assoc__.2.0','\"default\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.3.__assoc__.2.1','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.4.__assoc__.0.0','\"label\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.4.__assoc__.0.1','\"Wi-Fi Access Point Gateway\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.4.__assoc__.1.0','\"value\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.4.__assoc__.1.1','\"wiFiAccessPointGateway\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.4.__assoc__.2.0','\"default\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.4.__assoc__.2.1','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.5.__assoc__.0.0','\"label\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.5.__assoc__.0.1','\"Consulting\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.5.__assoc__.1.0','\"value\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.5.__assoc__.1.1','\"consulting\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.5.__assoc__.2.0','\"default\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.settings.options.5.__assoc__.2.1','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.translationKeyFormat','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.translationMethod','\"none\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.0a187bb9-ebd0-4016-b111-84d728762249.type','\"craft\\\\fields\\\\MultiSelect\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.contentColumnType','\"string(255)\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.fieldGroup','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.handle','\"partnerLink\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.instructions','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.name','\"Partner Link\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.searchable','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.settings.maxLength','\"255\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.settings.placeholder','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.settings.types.0','\"url\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.translationKeyFormat','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.translationMethod','\"none\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.6be2d726-24c6-4a93-8d7c-30a8b9da7b06.type','\"craft\\\\fields\\\\Url\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.contentColumnType','\"text\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.fieldGroup','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.handle','\"partnerDescription\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.instructions','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.name','\"Partner description\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.searchable','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.availableTransforms','\"*\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.availableVolumes','\"*\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.cleanupHtml','true'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.columnType','\"text\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.defaultTransform','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.manualConfig','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.purifierConfig','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.purifyHtml','\"1\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.redactorConfig','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.removeNbsp','\"1\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.showUnpermittedFiles','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.translationKeyFormat','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.translationMethod','\"none\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.b7ac79ba-352c-490e-aaa7-737c89d9e247.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.contentColumnType','\"text\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.fieldGroup','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.handle','\"partnerName\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.instructions','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.name','\"Partner Name\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.searchable','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.byteLimit','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.charLimit','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.code','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.columnType','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.initialRows','\"4\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.multiline','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.placeholder','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.settings.uiMode','\"normal\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.translationKeyFormat','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.translationMethod','\"none\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.c7c9f302-4f23-466d-a2d3-675621d8f44a.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.contentColumnType','\"string\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.fieldGroup','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.handle','\"partnerLogo\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.instructions','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.name','\"Partner logo\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.searchable','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.allowedKinds','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.allowSelfRelations','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.allowUploads','true'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.defaultUploadLocationSource','\"volume:9609ca58-e35b-42d2-914a-4865163ca851\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.limit','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.localizeRelations','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.previewMode','\"full\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.restrictFiles','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.selectionLabel','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.showSiteMenu','true'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.showUnpermittedFiles','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.singleUploadLocationSource','\"volume:9609ca58-e35b-42d2-914a-4865163ca851\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.source','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.sources','\"*\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.targetSiteId','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.useSingleFolder','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.validateRelatedElements','false'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.settings.viewMode','\"list\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.translationKeyFormat','null'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.translationMethod','\"site\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.fields.de2f137b-e43d-43ff-8b36-31978ed3eef1.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.handle','\"item\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.name','\"Item\"'),('matrixBlockTypes.c8d1de3d-26dd-49bd-bf44-fd12d34a58e8.sortOrder','1'),('plugins.assetusage.edition','\"standard\"'),('plugins.assetusage.enabled','true'),('plugins.assetusage.schemaVersion','\"2.0.0\"'),('plugins.field-manager.edition','\"standard\"'),('plugins.field-manager.enabled','true'),('plugins.field-manager.schemaVersion','\"1.0.0\"'),('plugins.image-resizer.edition','\"standard\"'),('plugins.image-resizer.enabled','true'),('plugins.image-resizer.schemaVersion','\"2.0.0\"'),('plugins.redactor-anchors.edition','\"standard\"'),('plugins.redactor-anchors.enabled','true'),('plugins.redactor-anchors.schemaVersion','\"2.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"2.2.1\"'),('plugins.typedlinkfield.edition','\"standard\"'),('plugins.typedlinkfield.enabled','true'),('plugins.typedlinkfield.schemaVersion','\"1.0.0\"'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.enableVersioning','true'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.handle','\"partners\"'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.name','\"Partners\"'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.propagationMethod','\"all\"'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.siteSettings.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.enabledByDefault','true'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.siteSettings.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.hasUrls','true'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.siteSettings.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.template','\"pages/partners\"'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.siteSettings.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.uriFormat','\"partners\"'),('sections.2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889.type','\"single\"'),('siteGroups.28cc361f-34dd-4d00-a9fe-5eaa8ea0e475.name','\"Wiliot\"'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.handle','\"default\"'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.hasUrls','true'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.language','\"en-US\"'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.name','\"Wiliot\"'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.primary','true'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.siteGroup','\"28cc361f-34dd-4d00-a9fe-5eaa8ea0e475\"'),('sites.37de40b8-92bb-49a3-a07a-6f27ac6c2fb5.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Wiliot\"'),('system.schemaVersion','\"3.6.6\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.autocapitalize','true'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.autocomplete','false'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.autocorrect','true'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.class','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.disabled','false'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.id','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.instructions','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.label','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.max','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.min','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.name','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.orientation','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.placeholder','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.readonly','false'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.requirable','false'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.size','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.step','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.tip','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.title','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.warning','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.elements.0.width','100'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.name','\"Content\"'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.fieldLayouts.4c575b21-eea6-485a-887c-fb78e0fa51d4.tabs.0.sortOrder','1'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.handle','\"main\"'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.hasUrls','true'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.name','\"Main\"'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.settings.path','\"@assets/uploads\"'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.sortOrder','0'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.titleTranslationKeyFormat','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.titleTranslationMethod','null'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.type','\"craft\\\\volumes\\\\Local\"'),('volumes.9609ca58-e35b-42d2-914a-4865163ca851.url','\"@assets/uploads/\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfignames`
--

DROP TABLE IF EXISTS `projectconfignames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
INSERT INTO `projectconfignames` VALUES ('070c859e-ec54-49e9-acd9-e658f728d891','Hero subtitle'),('0a187bb9-ebd0-4016-b111-84d728762249','Partner category'),('1539e223-b771-4778-a5b9-3676b59a2508','Outro'),('28cc361f-34dd-4d00-a9fe-5eaa8ea0e475','Wiliot'),('2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889','Partners'),('37de40b8-92bb-49a3-a07a-6f27ac6c2fb5','Wiliot'),('4318cfd0-f068-4073-9703-1db060485eb7','Outro Button'),('569c1536-e1e1-478b-8a94-de85377f9ba0','Hero sizes'),('68d3e256-4114-4b54-bd0f-0c9fa54a5bae','Partners'),('6be2d726-24c6-4a93-8d7c-30a8b9da7b06','Partner Link'),('70e371d8-d7fb-43ef-a3fc-913faa7db3d1','Hero tItle'),('7637ec1c-947f-42f2-9b7d-3ba65f195b8d','Outro Description'),('7d6dda68-42f2-4217-beb5-b90b457e6358','Main text'),('83a380f9-0f52-4434-a9f9-dfcd5c8a80c9','Hero'),('9609ca58-e35b-42d2-914a-4865163ca851','Main'),('98991cd5-c9c4-41b3-9e68-2b31b44bd772','Partners list'),('b7ac79ba-352c-490e-aaa7-737c89d9e247','Partner description'),('ba42799d-0a49-4f7f-817a-cde956fa12ee','Outro Title'),('c6882d8c-7b75-4033-97e8-bb0a0d47c7c4','Partners listing'),('c7c9f302-4f23-466d-a2d3-675621d8f44a','Partner Name'),('c8d1de3d-26dd-49bd-bf44-fd12d34a58e8','Item'),('d5e4c30e-3d1d-421e-89a7-581b54f7c4a9','Intro'),('de2f137b-e43d-43ff-8b36-31978ed3eef1','Partner logo'),('eebcfd3e-eaa9-4856-bb9b-a8fd90bd456b','Sub text'),('f0515b35-e39d-4154-bb06-ea6904427257','Intro Description'),('f3ab10b4-5d6a-4c83-9a65-ca0ab0346314','Intro Title'),('fb83efaa-d3ae-4eae-a80e-04678d029f73','Size');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_syzfzrgdjoyluqijpxlkiyhvgpmpexrrbdtz` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zoqorgveejzxjgspdlkilylknvtnrfjssioi` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_icyolwnatksducfdibnkhlgckpuvbmzccgee` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_cblehnqqkyxazcqnxexzqnhofdgfjuxvnxnz` (`sourceId`),
  KEY `idx_rzkkbpdhmlxqrnzllvvwykdaknjiuzzpkjbd` (`targetId`),
  KEY `idx_hekjpuxwfocyxcqlrhqrmjdftqveegkovytx` (`sourceSiteId`),
  CONSTRAINT `fk_calynymmpcykpsxiyoeycvdxnvdajtiizktz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lseiwfyhbwhsskddxnainqcemfiyibltngqt` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhrsuarlptgvdvdfjhkqxkoqvywoffkaacwt` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vzdyvhctrkpoexhtxdtdrwwfsmpcpurvbiuz` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (1,14,49,NULL,47,1,'2021-03-08 13:43:27','2021-03-08 13:43:27','b833630b-6862-422d-b04d-7f9163127117'),(2,14,51,NULL,47,1,'2021-03-08 13:43:27','2021-03-08 13:43:27','b9f1eb38-304c-4029-a425-cefe6465b4d5'),(3,14,53,NULL,47,1,'2021-03-08 13:48:30','2021-03-08 13:48:30','047489d5-2684-48f5-8d8a-10e8be94d3f6'),(4,14,56,NULL,47,1,'2021-03-08 14:57:44','2021-03-08 14:57:44','34c458d1-11da-405f-a796-c82f2a2789cd'),(5,14,58,NULL,47,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','b4231570-a0d2-4070-b63f-55b9b2c5c413'),(6,14,59,NULL,47,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','06b53e2d-fe23-49c3-9375-d9e2db57a878'),(7,14,61,NULL,47,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','d5df5e61-44da-4d51-82a9-917278b38011'),(8,14,63,NULL,47,1,'2021-03-08 15:02:42','2021-03-08 15:02:42','1dce3350-9ce8-4a55-b2ae-e4ddffa793c4'),(9,14,64,NULL,47,1,'2021-03-08 15:02:43','2021-03-08 15:02:43','9a54359c-a0bf-46bd-b7c1-6c58e2e06852'),(10,14,65,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','dba189b5-a031-4368-82bd-f59b4cff76f2'),(11,14,66,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','ce38f0a1-1823-47ca-8a45-e1d95d6cd69b'),(12,14,67,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','50cba9b1-0df7-4126-a883-81cc1a9eead4'),(13,14,68,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','2d368832-38a0-4767-83c5-878381638186'),(14,14,69,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','b94cfd54-81a0-4d72-8036-15612122bf5f'),(15,14,70,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','009ee68e-0125-4a2e-b4df-581da1777c7a'),(16,14,71,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','dc97937a-ce64-45eb-a2b5-afe337737ba8'),(17,14,72,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','e68c52b0-5916-4777-acc7-8a49c9fd616a'),(18,14,74,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','fe7b375a-94ed-48f6-94aa-6f7df8787a46'),(19,14,76,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','4f04af25-655a-4172-a9e3-e92a87244f2f'),(20,14,77,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','c936d613-09e1-4a95-b4cd-19d1dddeff06'),(21,14,78,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','14070c69-02ed-4043-96ae-1c5bb1577fdf'),(22,14,79,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','ec225d2b-9f22-4cd3-bf44-489f4868b2ee'),(23,14,80,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','aad819cf-112b-4cf8-89d1-cfb9451a80ce'),(24,14,81,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','b2b31266-706a-4b81-b09b-adc484ea5080'),(25,14,82,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','d2b5ee84-2a5c-4e61-acac-e7c2092a0430'),(26,14,83,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','91d4b89e-2cba-4b8c-9a15-4e84a09b1d53'),(27,14,84,NULL,47,1,'2021-03-08 15:19:52','2021-03-08 15:19:52','5b67d2af-2cf4-44be-a092-f7f3cfd189a9'),(28,14,85,NULL,47,1,'2021-03-08 15:19:53','2021-03-08 15:19:53','f29df51f-1e2d-4609-a3aa-cf32d78513ac'),(29,14,87,NULL,47,1,'2021-03-08 15:21:54','2021-03-08 15:21:54','11db707f-fe08-40d1-a345-bba496a7e54c'),(30,14,89,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','1e6de0cc-537e-4482-968c-69e0f72f2b8c'),(31,14,90,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','f87d2c52-62e7-4692-ad54-9a1f3291ca59'),(32,14,91,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','de80d174-9d9e-4a34-bb0b-98d2a819462d'),(33,14,92,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','e16ec766-68af-4d8a-907b-a150eec18350'),(34,14,93,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','fb9313a7-5bfe-464c-bae9-2377c2849553'),(35,14,94,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','31bbe333-c513-408f-b1f9-11dd63945cd2'),(36,14,95,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','6a3b1fca-fc49-4c98-bda3-e9e0644d4e8e'),(37,14,96,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','9423c556-cb5a-4097-9b51-459e923dc2d7'),(38,14,97,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','83e4e378-2919-41a4-aa82-ce9e7d2060e1'),(39,14,98,NULL,47,1,'2021-03-08 15:21:55','2021-03-08 15:21:55','99b02205-8076-470d-90af-6719d48e42f8');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('10344b9e','@bower/jquery/dist'),('137acf94','@lib/jquery-touch-events'),('14def356','@lib/picturefill'),('14e71657','@craft/web/assets/login/dist'),('16c4c3e8','@app/web/assets/utilities/dist'),('1a7bd307','@lib/d3'),('1b4370af','@app/web/assets/cp/dist'),('1bbbce3','@lib/velocity'),('1ce1a19a','@craft/web/assets/craftsupport/dist'),('1d9c130b','@lib/jquery.payment'),('1f7d65d1','@app/web/assets/login/dist'),('1feeadb7','@app/web/assets/tablesettings/dist'),('200f840b','@app/web/assets/updates/dist'),('20eed690','@lib/jquery-ui'),('225125c','@craft/web/assets/cp/dist'),('23f49cde','@craft/web/assets/feed/dist'),('23fb7f65','@craft/web/assets/edittransform/dist'),('28e14773','@app/web/assets/updater/dist'),('29c6c481','@lib/garnishjs'),('2a3996d9','@lib/axios'),('2f22cffc','@craft/web/assets/updater/dist'),('31592166','@app/web/assets/queuemanager/dist'),('35f73615','@app/web/assets/fieldsettings/dist'),('3626b98d','@app/web/assets/craftsupport/dist'),('37bbec73','@lib/iframe-resizer-cw'),('38893b33','@craft/web/assets/editsection/dist'),('38956534','@app/web/assets/fields/dist'),('38b4154c','@app/web/assets/updateswidget/dist'),('3993efae','@app/web/assets/plugins/dist'),('3c6e9ea8','@app/web/assets/matrixsettings/dist'),('3c8010bf','@lib/fabric'),('3e506721','@craft/web/assets/plugins/dist'),('3e6e597f','@app/web/assets/deprecationerrors/dist'),('3fa4e06b','@lib/element-resize-detector'),('3ff24b7a','@app/web/assets/dashboard/dist'),('40a0ded2','@lib/selectize'),('40a3715','@lib/selectize'),('443f2478','@lib/iframe-resizer'),('45c5670f','@lib/axios'),('471db6a5','@app/web/assets/updater/dist'),('489c1b6f','@lib/fileupload'),('4acc9a58','@lib/xregexp'),('4f122746','@lib/jquery-ui'),('505811bd','@lib/element-resize-detector'),('50741a91','@lib/picturefill'),('53926f7e','@app/web/assets/matrixsettings/dist'),('5748e49a','@app/web/assets/updateswidget/dist'),('57d02653','@lib/jquery-touch-events'),('58d72a96','@craft/web/assets/utilities/dist'),('59da485b','@app/web/assets/craftsupport/dist'),('5a020035','@craft/redactor/assets/field/dist'),('5a0bc7c3','@app/web/assets/fieldsettings/dist'),('5ab7ba15','@craft/web/assets/dashboard/dist'),('5ed13ac0','@lib/d3'),('5f34d0b6','@craft/web/assets/queuemanager/dist'),('604a0d0b','@verbb/base/resources/dist'),('60e5722','@app/web/assets/recententries/dist'),('61378f2a','@app/web/assets/admintable/dist'),('62583b11','@app/web/assets/feed/dist'),('628a67e6','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('64a56dcc','@app/web/assets/updates/dist'),('682ec47a','@lib/vue'),('69f2a6f4','@app/web/assets/recententries/dist'),('6c62aac4','@app/web/assets/clearcaches/dist'),('6d6c2d46','@lib/garnishjs'),('6e474d35','@lib/velocity'),('6f87cc52','@app/web/assets/pluginstore/dist'),('70125c61','@app/web/assets/tablesettings/dist'),('70819407','@app/web/assets/login/dist'),('7260e2dd','@lib/jquery.payment'),('74bf8179','@app/web/assets/cp/dist'),('7533c22d','@lib/timepicker'),('75f3c8a1','@app/web/assets/queuemanager/dist'),('782af978','@lib/fabric'),('7938323e','@app/web/assets/utilities/dist'),('7b3d84','@app/web/assets/pluginstore/dist'),('7d235ac','@lib/vue'),('7d390669','@app/web/assets/plugins/dist'),('7fc8ba48','@bower/jquery/dist'),('83f84ace','@lib/jquery-ui'),('847676e7','@lib/fileupload'),('85e44e88','@app/web/assets/feed/dist'),('85f715fd','@craft/web/assets/recententries/dist'),('868bfab3','@app/web/assets/admintable/dist'),('88d549f0','@lib/iframe-resizer'),('892f0a87','@lib/axios'),('89fb38ac','@lib/velocity'),('8bf7db2d','@app/web/assets/updater/dist'),('8c3453a2','@craft/web/assets/updater/dist'),('8f94ecf4','@utakka/redactoranchors/resources'),('90bab8c8','@app/web/assets/editsection/dist'),('923b5748','@lib/d3'),('928fb7b4','@lib/timepicker'),('93f22f4','@app/web/assets/sites/dist'),('95cdbf','@lib/iframe-resizer'),('95dc9744','@lib/jquery.payment'),('97140d35','@app/web/assets/editentry/dist'),('97ae29f8','@app/web/assets/tablesettings/dist'),('98362f01','@app/web/assets/matrix/dist'),('9874cfd1','@bower/jquery/dist'),('99bc4152','@lib/prismjs'),('9b3a4bdb','@lib/jquery-touch-events'),('9c9e7719','@lib/picturefill'),('9ca83807','@verbb/fieldmanager/resources/dist'),('9d46fb7f','@craft/web/assets/plugins/dist'),('9e8447a7','@app/web/assets/utilities/dist'),('a1338e02','@craft/web/assets/cp/dist'),('a18640ce','@lib/garnishjs'),('a36da1da','@app/web/assets/pluginstore/dist'),('a4c4a9f2','@lib/vue'),('a71cab4b','@lib/selectize'),('a83d63df','@verbb/imageresizer/resources/dist'),('a848be7f','@craft/web/assets/pluginstore/dist'),('a84f0044','@app/web/assets/updates/dist'),('aa51f748','@app/web/assets/routes/dist'),('ab5782f6','@typedlinkfield/resources'),('ad70efc1','@lib/xregexp'),('b0d5e17b','@app/web/assets/fields/dist'),('b42e1ae7','@app/web/assets/matrixsettings/dist'),('b4c094f0','@lib/fabric'),('b5e2221','@craft/web/assets/pluginstore/dist'),('b62edd30','@app/web/assets/deprecationerrors/dist'),('b7b2cf35','@app/web/assets/dashboard/dist'),('b7e46424','@lib/element-resize-detector'),('b855ecf1','@app/web/assets/cp/dist'),('bac459','@app/web/assets/dbbackup/dist'),('bb4d5793','@craft/web/assets/updateswidget/dist'),('c28c1e17','@lib/xregexp'),('c36f2a8','@lib/fileupload'),('c73a1cb7','@app/web/assets/findreplace/dist'),('c752a309','@lib/jquery-ui'),('c8e05a9d','@lib/selectize'),('c90a24bb','@app/web/assets/installer/dist'),('cbac0cc4','@app/web/assets/generalsettings/dist'),('cd51d16b','@lib/velocity'),('cd5b380f','@craft/redactor/assets/redactor-plugins/dist/video'),('cd85e340','@lib/axios'),('ce7ab118','@lib/garnishjs'),('cf0e2bac','@craft/redactor/assets/redactor/dist'),('cf5d32ea','@app/web/assets/updater/dist'),('d1767e83','@lib/jquery.payment'),('d19acc14','@app/web/assets/craftsupport/dist'),('d24b438c','@app/web/assets/fieldsettings/dist'),('d2d7541e','@craft/web/assets/admintable/dist'),('d84e3ee3','@app/web/assets/dashboard/dist'),('da2eae60','@app/web/assets/utilities/dist'),('da4cac7','@app/web/assets/feed/dist'),('db05889c','@unionco/craftsyncdb/assetbundles/cp/dist'),('db3c6526','@lib/fabric'),('dcde2616','@bower/jquery/dist'),('df0860d5','@app/web/assets/updateswidget/dist'),('df2910ad','@app/web/assets/fields/dist'),('e06e4035','@lib/vue'),('e1b222bb','@app/web/assets/recententries/dist'),('e51924eb','@craft/web/assets/sites/dist'),('e66739f','@lib/xregexp'),('e729b826','@lib/iframe-resizer'),('e7c7481d','@app/web/assets/pluginstore/dist'),('e9770b65','@app/web/assets/admintable/dist'),('eb8a8731','@lib/fileupload'),('ee83576d','@app/web/assets/sites/dist'),('f34e8de3','@lib/element-resize-detector'),('f36286cf','@lib/picturefill'),('f4c6ba0d','@lib/jquery-touch-events'),('f5798226','@app/web/assets/plugins/dist'),('f62a9c1d','@verbb/supertable/resources/dist'),('f640b084','@lib/prismjs'),('f7caded7','@app/web/assets/matrix/dist'),('f8c11048','@app/web/assets/login/dist'),('f8e8fce3','@app/web/assets/editentry/dist'),('fcff0536','@app/web/assets/cp/dist'),('fd734662','@lib/timepicker'),('fdc7a69e','@lib/d3'),('ff46491e','@app/web/assets/editsection/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mbueumtfmfnkhlkrjwzlrwibqvcrqfmnwdgr` (`sourceId`,`num`),
  KEY `fk_dhoguspbjuxyyzshkfvwgwvbynuquzgwwsss` (`creatorId`),
  CONSTRAINT `fk_dhoguspbjuxyyzshkfvwgwvbynuquzgwwsss` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ghwnzbpagbmmohcoyxwlfokexfqdtcfrudni` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,NULL),(5,2,1,5,NULL),(6,2,1,6,NULL),(7,2,1,7,NULL),(8,2,1,8,NULL),(9,2,1,9,NULL),(10,2,1,10,NULL),(11,13,1,1,NULL),(12,13,1,2,NULL),(13,13,1,3,NULL),(14,13,1,4,''),(15,2,1,11,NULL),(16,13,1,5,NULL),(17,13,1,6,NULL),(18,13,1,7,''),(19,13,1,8,NULL),(20,13,1,9,NULL),(21,13,1,10,''),(22,13,1,11,NULL),(23,13,1,12,''),(24,13,1,13,NULL),(25,13,1,14,''),(26,13,1,15,''),(27,13,1,16,''),(28,13,1,17,NULL),(29,13,1,18,''),(30,13,1,19,''),(31,13,1,20,''),(32,13,1,21,''),(33,13,1,22,''),(34,13,1,23,''),(35,13,1,24,''),(36,13,1,25,''),(37,13,1,26,NULL),(38,13,1,27,''),(39,13,1,28,''),(40,13,1,29,''),(41,13,1,30,''),(42,13,1,31,''),(43,13,1,32,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_tnlxwrvitknjtwrsgtswkgkvikfbscydbjhb` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' marcin adchitects co '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,' podstrona '),(2,'title',0,1,' podstrona '),(13,'slug',0,1,' partners '),(13,'title',0,1,' partners '),(17,'slug',0,1,''),(19,'slug',0,1,''),(23,'slug',0,1,''),(24,'slug',0,1,''),(26,'slug',0,1,''),(27,'slug',0,1,''),(47,'extension',0,1,' jpg '),(47,'filename',0,1,' test logo jpg '),(47,'kind',0,1,' image '),(47,'slug',0,1,''),(47,'title',0,1,' test logo '),(49,'slug',0,1,''),(51,'slug',0,1,''),(53,'slug',0,1,''),(54,'slug',0,1,''),(56,'slug',0,1,''),(57,'slug',0,1,''),(58,'slug',0,1,''),(59,'slug',0,1,''),(61,'slug',0,1,''),(62,'slug',0,1,''),(63,'slug',0,1,''),(64,'slug',0,1,''),(65,'slug',0,1,''),(66,'slug',0,1,''),(67,'slug',0,1,''),(68,'slug',0,1,''),(69,'slug',0,1,''),(70,'slug',0,1,''),(71,'slug',0,1,''),(72,'slug',0,1,''),(74,'slug',0,1,''),(75,'slug',0,1,''),(76,'slug',0,1,''),(77,'slug',0,1,''),(78,'slug',0,1,''),(79,'slug',0,1,''),(80,'slug',0,1,''),(81,'slug',0,1,''),(82,'slug',0,1,''),(83,'slug',0,1,''),(84,'slug',0,1,''),(85,'slug',0,1,''),(87,'slug',0,1,''),(88,'slug',0,1,''),(89,'slug',0,1,''),(90,'slug',0,1,''),(91,'slug',0,1,''),(92,'slug',0,1,''),(93,'slug',0,1,''),(94,'slug',0,1,''),(95,'slug',0,1,''),(96,'slug',0,1,''),(97,'slug',0,1,''),(98,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_omsuchqzkskipvqwtzxofrsshkncehpmgsbb` (`handle`),
  KEY `idx_sjwxljhdjktzeaevtpvpmcuwdldznqkkuvag` (`name`),
  KEY `idx_sprunaxsvzwlxueuevssdenhybjgsnqvhkzj` (`structureId`),
  KEY `idx_eqhhlukdjkkgjihepignkryftyieucrwzrdo` (`dateDeleted`),
  CONSTRAINT `fk_invbbpxuirljcjkentqxiiszvawsimxkmtog` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Podstrona','podstrona','single',1,'all',NULL,'2021-03-04 15:11:39','2021-03-04 15:11:39','2021-03-05 13:23:05','e5fc4089-32c8-4ed3-9911-454059acdb3a'),(2,NULL,'Partners','partners','single',1,'all',NULL,'2021-03-05 11:46:09','2021-03-05 11:46:09',NULL,'2b215e7d-7d00-4f6b-bd9c-e07c5a8c2889');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cunzlkimgexnshtggpsehqnuinjmfqckgfxs` (`sectionId`,`siteId`),
  KEY `idx_kkdlxzwtfvycxtmdrqjqrnbzfmxglcdhhhjt` (`siteId`),
  CONSTRAINT `fk_gyyscsjewpfpoccenihcbcujtvppprmopeoy` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zuijafrlvwbaoelltmefoccarbeokuucgxot` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'podstrona','pages/podstrona',1,'2021-03-04 15:11:39','2021-03-04 15:48:24','c98cd632-8a5c-4d5c-8785-016a463cd9be'),(2,2,1,1,'partners','pages/partners',1,'2021-03-05 11:46:09','2021-03-05 11:46:09','283f7010-56cc-4855-81b9-e882176f6b3c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xbezistdztcnrwoeuifhlxteexcicdclolzc` (`uid`),
  KEY `idx_gkrnqinjjwrfhytbokbzxawqiomjknbfrtje` (`token`),
  KEY `idx_voqfodrdemehnpuedperwcpogtimmtdmafas` (`dateUpdated`),
  KEY `idx_eyiufboaeltlrcoabjzzaylsncimxxxtseaf` (`userId`),
  CONSTRAINT `fk_shbjavohxznkimjaoqoaynzalwlphlbhtlxh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'5jKObLJdjgYcMUMGSMAQ4UMsGtHDU3ofTs9ocUbT_yWvn80RQjmB8E0nwM-o9sN2gs6UHhkJOf43-ePs3BEOfTA9ajIHuoHHsIpY','2021-03-04 12:19:14','2021-03-04 15:54:34','b71ba6cc-2f4f-464b-8286-d8ee43e9fac5'),(2,1,'OTkRWWsU8efzITAZvQPXdosb3Qb94cPIRd1uUB6lD8g96dl1BP4OnQRX9TE1YCqBFtkBGNwCXNPPLPS7SkeUTCI5__SxonLFTiwA','2021-03-04 13:58:37','2021-03-04 15:55:57','ac678897-8350-4ee7-ab9b-2cb07f76563a'),(3,1,'WLaUOVu9j8seiz6TOYvDeluxrJJdRyuEz2sItTYgVjGuSXbGpNECB_k_IvJvv-Zzl2D-h3rWKyEZSmk_RIojeyiybrYpNO8ymipy','2021-03-05 09:37:41','2021-03-05 09:37:41','113fb145-3bbd-4ec2-958c-2d4850d99f42'),(4,1,'NMv5B04HwHrgnRsHR5d0aYlH9uef4czRXuWXjk-0fT0kOBrqV5keUuKpYQsomoZNyLz7e6pC5Hf8vL0kZpT9ilUIj9qxO3hbqr7R','2021-03-05 09:37:49','2021-03-05 09:38:12','9367d45f-5a83-4421-af41-a1a018782e4b'),(5,1,'2XuDsk9csTQA6dgPxvbPuh5c7qYyiYlsFRVSSGKdl0ZomARXpmw0lH7JEoB4IylXifQX4aMfMSYaGEnbkpppGTR_C2XUL8sCVNPM','2021-03-05 10:38:19','2021-03-05 12:04:43','13f1a7de-a9f9-4cff-94ca-f4d5054f10df'),(6,1,'FpbyKzKlP-4dJo1owqYqKLfXKD5E6iQFyAWVrSHuEyzi5a1hLy9CtVN9mMaENIiDe956dJks1zPMdk2UXRKeIC2WGCUJvIYymh8r','2021-03-05 10:38:27','2021-03-05 15:12:06','c23a3b4d-1fa0-4905-9753-309f5a411dd0'),(7,1,'gog7N0z3GQzMq2HMzIxotNY7GeXSGGfuGtP9h3KI535N6BYvzYwZS9VJ-_AqJLeLiRMcablbdu78obIQLu0lVu-LFo4jUCPzxrP4','2021-03-08 11:06:58','2021-03-08 11:38:02','86e7ef7a-62af-48c5-9256-242e710673c5'),(8,1,'Us36rqtRKNk84yj9PuZqNqowf9zmUGPtnrU7aNAAS4ba428pcHXj9nTmbsrGeRteXhz95xYdVdG05jtyHISY8WkGmb2ANNOePL_k','2021-03-09 10:05:43','2021-03-09 15:52:55','a717f770-8f4b-4925-a156-5467b7e0d5be'),(9,1,'FmEese8gZEHI7ZhtmnHMTAf2CYtQLJtWii_sQxwCzJEue-1ZPblxp5b7sU972VcR_cpHKMpordHzW-A927nOjdY5imQl90sg3qCv','2021-03-09 10:05:51','2021-03-09 15:56:45','4747be6a-6529-4f84-99b7-7533a031030b'),(10,1,'vu1M2QGAFLAG1Mtm5yJg8R32KrJFIwLrxaL1-dyG0NGTXxNfLHTEz4N5u29vLJjIKHddwA3LFBQhSJjXGq-KkmE77lmxB9p59RNK','2021-03-16 14:15:42','2021-03-16 15:25:21','2d728ef0-7124-4915-b851-f91a27cfc81a'),(11,1,'iIzWZb0fKENSCfKfXGwTNDYcpJCvuvfQdfF-UkBkcQ3kgyhSqX4xaycgYIoOzKUH_bWynvtafJgFhtvK7H923aLUGQuSwe2VNTX_','2021-03-16 14:15:56','2021-03-16 16:24:14','ed1499da-f3dd-4405-bc68-f541b1b46f36'),(12,1,'qq2M13OVLFHJkk00XGPdv6Af-eNkq_wF_OtCrCCmnCnK5xOhDzf2pTw9JpYBCcSbww_OwRjkahM2TtmlM9xh2id8EtTH_STAtTIz','2021-03-16 15:07:21','2021-03-16 15:07:24','1b7a7692-6ef5-4bf7-aa90-a1fbf010db3b');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lfpueodufxyndcrenieafpbldzisfrbnxmip` (`userId`,`message`),
  CONSTRAINT `fk_wuftgyxywcgmplwpjnskqgmhmftstffnddok` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_whcltckhuaqfwniwkspjxfxdxxwgmitdttyc` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Wiliot','2021-03-04 12:19:12','2021-03-04 12:19:12',NULL,'28cc361f-34dd-4d00-a9fe-5eaa8ea0e475');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rfygajyhgemsukxiwaxbbxuhfzflmzfmspad` (`dateDeleted`),
  KEY `idx_sjhdyowtjbpfmvccvkarafyimtjtmjqlcjwa` (`handle`),
  KEY `idx_kcvccnqaweitggmraqgimlkpjoavmugrzxpz` (`sortOrder`),
  KEY `fk_pjogjhjehjavlceeylmdswrfnixbxbxgjfuh` (`groupId`),
  CONSTRAINT `fk_pjogjhjehjavlceeylmdswrfnixbxbxgjfuh` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,1,'Wiliot','default','en-US',1,'$PRIMARY_SITE_URL',1,'2021-03-04 12:19:12','2021-03-04 12:19:12',NULL,'37de40b8-92bb-49a3-a07a-6f27ac6c2fb5');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oxslyjlkuoiswrsmjpnupoambolgvxifycmh` (`structureId`,`elementId`),
  KEY `idx_nbyjsgrzfrhckcsiibkxdhytmvueyijiusjk` (`root`),
  KEY `idx_eiccnrdqztliwzkgywiqbqsxpkteugpxtefj` (`lft`),
  KEY `idx_lheymltrghlfjjryndzrlfbjtlamureuukbu` (`rgt`),
  KEY `idx_ynxfsvjavzckgisixokmabutrgnqapswzsdk` (`level`),
  KEY `idx_efgdpiyywtuwvyzrqduvwdezkmkkjlrcrjcm` (`elementId`),
  CONSTRAINT `fk_lqkoffkjotasiubrhdbygkjpguwmstmofvsh` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xmdpehjegogcohfhltaakdzcjqlcrgdjkjyi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nnqwsebudiwhsncltwttqfxjrmtzrkuuelzn` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_piuqemppfiwbmoffydogcsxubvspzjyqosmd` (`ownerId`),
  KEY `idx_mhiplzcutvbiiwyzylccwxbqkrtorugjojhu` (`fieldId`),
  KEY `idx_imkuwpzecyvcoxhkpiepbnrjchrliwwywsur` (`typeId`),
  KEY `idx_neadgjiwltgeeyxfjaijrywvsdtsdqkvthds` (`sortOrder`),
  CONSTRAINT `fk_dbgnyifiivxuvedbkmpwhwtuwcupxkwuuflr` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jzjtnvnzqugzqaymslyblknwcwightiavucs` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wigkjdbcpjmywfkneyhzvesadkizgwqvgmwx` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkvqfqnjgqmsnibevrftrsmmnaprxnignrab` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lhqyjhduihmdmdjtgncbtoepfiqoylhwfrtp` (`fieldId`),
  KEY `idx_nfsfipzkbfseffzfeqvuaxzrtibnpiflbuay` (`fieldLayoutId`),
  CONSTRAINT `fk_gdhzntvvncqnncmtpquiwxmloriqhfrdgmbx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yvbzaytrgtukahzmlmhodbwcvqyjhzivjchc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hhmceiuvhnogncxlqhsaejeeqlzyhvcpehpx` (`key`,`language`),
  KEY `idx_cvfwvukbfgwmrfjpitftoopaqyntmyitevqp` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rptnnxhhkfviorkyjraujjcphifhmjvzhois` (`name`),
  KEY `idx_irffrkyecxwsvwccabdtfhufeovwvptwhkpu` (`handle`),
  KEY `idx_sbqcoizzcegmimyajcyusozpabgowbdaiqwr` (`dateDeleted`),
  KEY `fk_iospnelkcfrwzrxxbzmtbzetpqlrddkwljxb` (`fieldLayoutId`),
  CONSTRAINT `fk_iospnelkcfrwzrxxbzmtbzetpqlrddkwljxb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdnfjuqqwdgyqkgontmdubekduczdjdddsis` (`groupId`),
  CONSTRAINT `fk_jcgczrdpssmwlwbopkzppmyiupdhcftoplcz` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kgasencodvfbvactsodlusuhfslvkayempyk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ugkuxkjgwymelbikghckdctbojmqsklgapth` (`cacheId`),
  KEY `idx_yjcwzsvvofjsakpwedvnsnzhvkpxwwekajmw` (`elementId`),
  CONSTRAINT `fk_uvkujazsaptrjusotrzhcrjsguluuqxpjpyr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwgkwrjlupzhjuuoyhunkodnxvbnigjvczdq` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecacheelements`
--

LOCK TABLES `templatecacheelements` WRITE;
/*!40000 ALTER TABLE `templatecacheelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bgxfdgjrdfnqbrbaltcllcogyuxmipfylhqc` (`cacheId`),
  KEY `idx_atqltgbzbxmpenycgkomxvgktkqmdlgilusy` (`type`),
  CONSTRAINT `fk_sbjrrmslnotbdqlslnjrxqjlynnrknfqjwhg` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecachequeries`
--

LOCK TABLES `templatecachequeries` WRITE;
/*!40000 ALTER TABLE `templatecachequeries` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_infbfynrhqikihwclxlcvamtycgspypegcyv` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_qxisqjukueplagvvngvsaypmuzkkghajilsq` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_dfrtdcbksuhpfbrgyjbffgzecbljgdhvrvry` (`siteId`),
  CONSTRAINT `fk_bazeqvhtvbdflmepeloggilttlcxlwzlyryk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatecaches`
--

LOCK TABLES `templatecaches` WRITE;
/*!40000 ALTER TABLE `templatecaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `templatecaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrhwmvbvblptkocyqjyyufodznbgbtagwynx` (`token`),
  KEY `idx_fiwyaouasnskgwhcfqyaahbebqrnqkdjmbhs` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'jf8OsGkQ5ZgrOKJZe0LYBmXwxeQFTXel','[\"preview/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":13,\"siteId\":1,\"draftId\":1,\"revisionId\":null}]',NULL,NULL,'2021-03-09 12:36:10','2021-03-08 12:36:10','2021-03-08 12:36:10','7661034d-4465-40aa-9039-803c44ec4268');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gilmhfpwnmczlyewcivimszmkskktpqortdq` (`handle`),
  KEY `idx_xwhgdvpbqzjbmdxglwadqppfamjmdydgklur` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gosxloxobncuumbfnguqctluctpmoffjzhau` (`groupId`,`userId`),
  KEY `idx_gsharaxillpkrzztevnkrqsdgcgevfqiqqtn` (`userId`),
  CONSTRAINT `fk_rrstnlbtsaezvwtvvwpapnqdrpeubfgfczdl` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sflvnokywsnqguvffkfumezsrftvenxewapq` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ttautnorrtbscpdsqxgnxromwiysxnnsecyo` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ypczsrzkznfkpudwmvisjwsawpzljtggfohk` (`permissionId`,`groupId`),
  KEY `idx_lhesjabudkrruastrsjprpanotpuwqysxxwe` (`groupId`),
  CONSTRAINT `fk_bbwzalstshlqvzntdtappomtscowujmtkusw` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sbdfpyxqrodepmgfoqzjwhwxmsumdybnouxq` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vshfhymhaavxxruwlkiqnmfmijqpmmedjumy` (`permissionId`,`userId`),
  KEY `idx_hqeovqrbtsjeetsrkoambhzikrcqjobgjfsf` (`userId`),
  CONSTRAINT `fk_aiccjcyxatwbplqyonhxrjaywntbowmjymgy` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uqmaqyfqanbjsalvagzgtyzpghhzhkfifcrs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_jtjbnfzewjumyrxaaevbfomtwojxztqnbdri` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vanmsdiqfizllgrkguvbqgnrwttyrjnjrsgf` (`uid`),
  KEY `idx_nfhvwrfaizxbhhoapythfxmchwpkmcqywjlj` (`verificationCode`),
  KEY `idx_kipeitzrinusfwohsdwbrfpdltwfbjaizjxd` (`email`),
  KEY `idx_aqbxzxpsldqnpzjvqrcltjgzvyzmvsrdzhgy` (`username`),
  KEY `fk_qmhwhqjnognybpiaavkfeahnccicazsxotej` (`photoId`),
  CONSTRAINT `fk_mlpgrnadvpmaognvlvycpliaodsrwqgznirj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qmhwhqjnognybpiaavkfeahnccicazsxotej` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin',NULL,NULL,NULL,'marcin@adchitects.co','$2y$13$/VG51Ea0pynpQ5b/zwIjYu2XItJWewHVQ7zeDvqb45E5bMwCwUwVK',1,0,0,0,'2021-03-16 15:07:21',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2021-03-04 12:19:14','2021-03-04 12:19:14','2021-03-16 15:07:21','2013c5c9-9bd5-4ebf-8c83-64c8d0867d11');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vxxrtuvopzlphvfhrbhvidiofhsukpfyzmqj` (`name`,`parentId`,`volumeId`),
  KEY `idx_tonwdprqikhancrzvaggjcllhpepzxhzilvh` (`parentId`),
  KEY `idx_mmyxvoeasbibuboqyrjgetqmjkvxvupnyvot` (`volumeId`),
  CONSTRAINT `fk_nxyngrwsxcgkdpzmdngquplakduxztevfosy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ztihavmpflqinvoeoobdlebcphioocxxvwff` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'wolume','','2021-03-04 15:14:06','2021-03-04 15:14:06','7e1b84fc-299d-4f65-95a9-8dd0029e988e'),(2,NULL,NULL,'Temporary source',NULL,'2021-03-05 13:51:26','2021-03-05 13:51:26','587b7446-558c-4d9d-8b4b-83fcde649853'),(3,2,NULL,'user_1','user_1/','2021-03-05 13:51:26','2021-03-05 13:51:26','9866e03f-fe99-4b8b-9fba-fba6c9226495'),(4,NULL,2,'Main','','2021-03-08 13:33:14','2021-03-08 13:33:14','5c5bc32e-baf6-423e-b22f-86ed117119e9');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jitrijryhexnryhyliznekcrcdedqdlpcydw` (`name`),
  KEY `idx_gwkcwlnmacltzvrewfwmisknjzdivszpmshj` (`handle`),
  KEY `idx_nhtzjbnoxhnggbcxqgvxcnhxcvnscsdjbudw` (`fieldLayoutId`),
  KEY `idx_pgzbudbjigqtrxhvoqfdbhtwdcvhihosdcuy` (`dateDeleted`),
  CONSTRAINT `fk_pkkjpwegrvceluappwgtcnhsmejvcpkapfpw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'wolume','wolume','craft\\volumes\\Local',0,NULL,'site',NULL,'{\"path\":\"@assets/uploads\"}',1,'2021-03-04 15:14:06','2021-03-04 15:14:06','2021-03-08 13:31:35','aebfea1d-1f0e-478c-91fa-44f5c65d4640'),(2,6,'Main','main','craft\\volumes\\Local',1,'@assets/uploads/','site',NULL,'{\"path\":\"@assets/uploads\"}',0,'2021-03-08 13:33:14','2021-03-08 14:07:50',NULL,'9609ca58-e35b-42d2-914a-4865163ca851');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mcauhwloswcfjftiilngjrijxeyljfcxqvns` (`userId`),
  CONSTRAINT `fk_cazklrzrqpbhhdgxhngbskmdyhdaojvuqyxm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-03-04 12:19:15','2021-03-04 12:19:15','aa392a95-9281-473f-84cb-3697fe8a25d9'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-03-04 12:19:15','2021-03-04 12:19:15','79c52857-2f30-41a3-99f1-e385bc5d232c'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-03-04 12:19:15','2021-03-04 12:19:15','c736ecc4-0e44-4bcd-8c88-0c11a51611e9'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-03-04 12:19:15','2021-03-04 12:19:15','a09e5a5a-d207-45fb-a576-bd8f57d7bd8b');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-17 11:18:22
