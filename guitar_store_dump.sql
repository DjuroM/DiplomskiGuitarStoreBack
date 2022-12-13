CREATE DATABASE  IF NOT EXISTS `guitar_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `guitar_store`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: guitar_store
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `basket` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `guitar_id` int unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `guitar_id_idx` (`guitar_id`),
  KEY `users_basket_id_idx` (`user_id`),
  CONSTRAINT `guitar_basket_id` FOREIGN KEY (`guitar_id`) REFERENCES `guitar` (`id`),
  CONSTRAINT `user_basket_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (65,11,16),(73,14,13);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Fender','https://toppng.com/uploads/preview/fender-logo-vector-free-download-11574243415ruxudrj74g.png'),(4,'Ibanez','https://logos-world.net/wp-content/uploads/2020/12/Ibanez-Logo.png'),(9,'PRS','https://cdn.freebiesupply.com/logos/large/2x/prs-logo-png-transparent.png'),(10,'Epiphone','https://static.cdnlogo.com/logos/e/48/epiphone.svg'),(12,'Squire','https://ih1.redbubble.net/image.1781900841.4905/st,small,507x507-pad,600x600,f8f8f8.jpg'),(13,'Gibson','https://www.deadblondestars.com/wp-content/uploads/2020/04/gibson-logo.png');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `imageicon` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `drzava_UNIQUE` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'USA',NULL),(2,'England',NULL),(3,'Montenegro',NULL),(4,'Serbia',NULL),(5,'BIH',NULL),(6,'Crotia',NULL),(7,'Albania',NULL);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guitar`
--

DROP TABLE IF EXISTS `guitar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guitar` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `model` varchar(100) NOT NULL,
  `guitar_type_id` int unsigned NOT NULL,
  `pickups_id` int unsigned NOT NULL,
  `price` varchar(45) NOT NULL,
  `release_year` varchar(45) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `description` varchar(500) NOT NULL,
  `brand_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `guitar_type_id_idx` (`guitar_type_id`),
  KEY `pickups_id_idx` (`pickups_id`),
  KEY `brand_guitar_id_idx` (`brand_id`),
  CONSTRAINT `brand_guitar_id` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `guitar_type_guitar_id` FOREIGN KEY (`guitar_type_id`) REFERENCES `guitar_type` (`id`),
  CONSTRAINT `pickups_guitar_id` FOREIGN KEY (`pickups_id`) REFERENCES `pickups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guitar`
--

LOCK TABLES `guitar` WRITE;
/*!40000 ALTER TABLE `guitar` DISABLE KEYS */;
INSERT INTO `guitar` VALUES (3,'Les Paul Standard 60s',1,3,'1990','2019','../../../../../assets/LesPaulStandard60s.jpg','Mahogany body with mahogany neck. 22 frets and a scale of 628 mm. ',13),(4,'Les Paul Classic TC',1,3,'1633','2019','../../../../../assets/LesPaulClassicTC.jpg','Mahagony body, maple top, mahagony neck and a rosewood neck. 22 frets with a scale of 628.65',13),(5,'ES-335 Reissue 60s CH ULA',2,3,'4999','2022','../../../../../assets/ES-335Reissue60sCH_ULA.jpg','Maple body and top, with mahagony neck and a rosewood fretboard. 22 frets and 628 scale',13),(6,'AM Ultra Strat MN Cobra Blue',1,1,'1899','2019','../../../../../assets/AMUltraStratMNCobraBlue.jpg','Body made of alder, and maple neck and fretboard.  22 frets with a scale of 648 mm. Vintage tremolo',1),(7,'AM Pro II Tele MN BTB',1,6,'1666','2020','../../../../../assets/AM_Pro_II_TeleMN_BTB.jpg','Body made of pine, a maple neck and also a maple fretboard. 22 frets with a 648 mm scale length.',1),(8,'Jerry Cantrell Prophecy LP Cus',1,3,'948','2022','../../../../../assets/JerryCantrellProphecyLPCus.jpg','A signature Jerry Cantrel model, with mahogany neck and body. Maple top and a ebony fretboard. 24 frets with a 629 mm scale length',10),(9,'AS73G-RGF',3,3,'399','2020','../../../../../assets/AS73G-RGF.jpg','Basswood body, walnut fretboard and a neck made of nyatoh, 22 frets and a scale length 628mm',4),(10,'SE Mark Holcomb SVN WN',4,3,'959','2019','../../../../../assets/SE Mark Holcomb SVN WN.jpg','Mahogany body, maple neck, Ebony fretboard, Walnut top. 24 frets and a scale of 673 mm',9),(11,'CV 70s Tele Thinline MN NAT',2,3,'345','2019','../../../../../assets/CV 70s Tele Thinline MN NAT.jpg','Fretboard, body and neck all made of maple. 21 frets with a scale of 648',12),(12,'SE Hollowbody II Piezo PB',3,3,'1169','2020','../../../../../assets/SE Hollowbody II Piezo PB.jpg','Mahogany neck and soundboard, and a ebony fretboard. It also comes with piezo pickups. 22 frets and a 635 scale',9),(13,'CE 24 Amber',1,3,'2169','2016','../../../../../assets/CE 24 Amber.jpg','Maple neck, maple top, rosewood fretboard and mahogany soundboard. 24 frets with a scale of 635mm',9),(14,'Sheraton-II Pro VS',2,3,'549','2002','../../../../../assets/Sheraton-II Pro VS.jpg','Body, neck, and top all made of maple. Fretboard made of Pau Ferro, 22 frets and 628mm scale',10),(15,'ES-335 Satin Vintage Sunburst',2,3,'2199','2020','../../../../../assets/ES-335 Satin Vintage Sunburst.jpg','Top and body made of maple, neck made of mahogany and a fretboard made of rosewood. 22 frets and a scale of 628mm',13),(24,'AMH90-PBM',3,3,'589','2022','../../../../../assets/AMH90-PBM.jpg','Linden body and top, Ebony fretboard. 22 frets and 628 scale length',4),(25,'AZ24047-BK',4,2,'1880','2021','../../../../../assets/AZ24047-BK.jpg','Alder body, 24 frets, 648 scale length',4),(26,'JEMJR-WH',1,4,'399','2015','../../../../../assets/JEMJR-WH.jpg','Meranti body, maple neck. jatoba fretboard. 24 frets and scale length 648',4),(27,'Player Plus Meteora PF CJ',1,3,'839','2022','../../../../../assets/Player Plus Meteora PF CJ.jpg','Soundboard made ofAlder, neck made of Maple, fretboard made of Pau Ferro. 22 frets. Scale length 628mm',1),(28,'Jim Root Stratocaster EB BK',1,3,'1590','2010','../../../../../assets/Jim Root Stratocaster EB BK.jpg','Mahagony body, maple neck, ebony fretboard. 22 frets and a scale of 648',1),(29,'AM Pro II Tele MN MBL',1,6,'1633','2020','../../../../../assets/AM Pro II Tele MN MBL.jpg','Alder body, maple neck and fretboard. 22 frets and scale of 648mm',1),(30,'CV Starcaster MN WN',2,3,'389','2020','../../../../../assets/CV Starcaster MN WN.jpg','Body, neck, fretboard and top all made of maple. 22 frets and scale length of 648mm',12),(31,'Affinity Starcaster MN OW',2,3,'260','2019','../../../../../assets/Affinity Starcaster MN OW.jpg','Body, neck, fretboard and top all made of maple. 22 frets and scale length of 648mm',12),(32,'60s Jaguar MH SSP Ltd',1,6,'398','2020','../../../../../assets/60s Jaguar MH SSP Ltd.jpg','Maple neck, poplar soundboard, Indian Laurel fretboard. 22 frets and a scale length of 628mm',12),(33,'Flying V Prophecy Black',1,3,'769','2020','../../../../../assets/Flying V Prophecy Black.jpg','Mahogany soundboard and neck, maple top, ebony fretboard. 24 frets and scale length of 628mm',10);
/*!40000 ALTER TABLE `guitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guitar_type`
--

DROP TABLE IF EXISTS `guitar_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guitar_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guitar_type`
--

LOCK TABLES `guitar_type` WRITE;
/*!40000 ALTER TABLE `guitar_type` DISABLE KEYS */;
INSERT INTO `guitar_type` VALUES (4,'7 string'),(3,'Hollow'),(2,'Semi-Hollow'),(1,'Solid Body');
/*!40000 ALTER TABLE `guitar_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `country_id` int unsigned DEFAULT NULL,
  `price` varchar(45) NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `users_order_id_idx` (`user_id`),
  KEY `country_order_id_idx` (`country_id`),
  CONSTRAINT `country_order_id` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`),
  CONSTRAINT `users_order_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (80,'2022-12-03',3,'5344',13,'Dalmatinska BB,Podgorica, Montenegro'),(81,'2022-12-03',7,'959',13,'Dalmatinska BB,Podgorica, Albania'),(85,'2022-12-06',6,'6879',13,'Dalmatinska BB,Podgorica, Crotia');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_guitar`
--

DROP TABLE IF EXISTS `order_guitar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_guitar` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int unsigned NOT NULL,
  `guitar_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `order_order_guitar_id_idx` (`order_id`),
  KEY `guitar_order_guitar_id_idx` (`guitar_id`),
  CONSTRAINT `guitar_order_guitar_id` FOREIGN KEY (`guitar_id`) REFERENCES `guitar` (`id`),
  CONSTRAINT `order_order_guitar_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_guitar`
--

LOCK TABLES `order_guitar` WRITE;
/*!40000 ALTER TABLE `order_guitar` DISABLE KEYS */;
INSERT INTO `order_guitar` VALUES (103,80,5),(104,80,11),(105,81,10),(109,85,5),(110,85,25);
/*!40000 ALTER TABLE `order_guitar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickups`
--

DROP TABLE IF EXISTS `pickups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pickup_combination` varchar(45) NOT NULL,
  `pickup_description` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickups`
--

LOCK TABLES `pickups` WRITE;
/*!40000 ALTER TABLE `pickups` DISABLE KEYS */;
INSERT INTO `pickups` VALUES (1,'SSS','A legendary Start like pickups, three single coils'),(2,'HSS','A power strat. One humbacker at the bridge, and to single coils'),(3,'HH','A classic Les Paul configuration. Two humbackers at the bridge and neck positions'),(4,'HSH','Two humbuckers at the bridge and neck positions, with one single coil in the middle'),(6,'SS','Tele style, two single coils');
/*!40000 ALTER TABLE `pickups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `guitar_id` int unsigned NOT NULL,
  `review` varchar(5000) NOT NULL,
  `rating` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `revies_guitar_id_idx` (`guitar_id`),
  KEY `reviews_users_id_idx` (`user_id`),
  CONSTRAINT `revies_guitar_id` FOREIGN KEY (`guitar_id`) REFERENCES `guitar` (`id`),
  CONSTRAINT `reviews_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (3,4,6,'After having in my possession this instrument for more than a year I decide to wright down my honest opinion. This is one of the most premium guitars I have ever had, and I say this given that a lot of expensive guitars have passed through my hands over the years. The Fender AM ultra quickly became my main guitar for a bunch of reasons. First of all it sounds amazing, it\'s very resonant and feels great to play. The neck is way more confident and fast than you can imagine and the guitar is very well built, with care to the details from the factory. However, I made some mods to adjust it in my own taste which is: replaced the bridge pickup with a full sized humbucker and wired the s1 switch to only split the coils of the humbucker. The middle and the neck pickups are the closest thing to classic vintage fender pickups but in a noiseless form. Also, although, I use the tremolo bar quite a lot, the guitar stays in tune no matter what, and for me this is one of the most important things. Finally, this particular color, \"cobra blue\", is really unique, and combined with the maple neck, they form one of the most beautiful guitars out there! I clearly recommend it without a second thought! You can\'t go wrong with this instrument!',7),(4,4,9,'I\'ve been playing the AS73 for about half a year now and I like it better every day.\nAn absolute alternative / hard rock board!\n\nThe AS impresses in the clean channel with a warm sound in the neck position and a robust blues sound on the bridge. I hardly ever play the middle position, but it sounds pretty balanced.\nThe AS sounds distorted like 80/90 rock but also a bit modern.\nThe guitar has an incredibly great sustain and the desired feedback builds up great.\n\nThe potentiometers run cleanly and without scratching and can be finely adjusted.\nThe neck can be played well and you have something in your hand. So rather unusual for friends of the Wizard III neck, vintage is definitely hip here.\n\nThe string action on my model was a little bit too high, but that was easy to fix.\n\nThe mechanics work cleanly and keep the tuning perfect.\n\nThe velvet rose lacquer looks really good and is definitely an absolute eye-catcher with the golden hardware.\n\nConclusion: The second Ibanez guitar that I won\'t equip with new PU\'s because they sound easy!\nI thought back and forth for a long time about which color to choose because the velvet rosé is special.\nI haven\'t regretted the decision for a second, great part and definitely one of my favorite guitars.',8),(5,4,5,'The Gibson 335 is not only a legend (and therefore an emotional longing guitar), but also a highly versatile instrument: it fits into very different styles - therefore my guitar of choice. After a long time with a lot of criticism of the workmanship, Gibson has apparently recently invested a lot of care in the premium guitars - so there was no great risk to order them (Thomann\'s advice on the exact selection was very good - and very fair). The 1959 reissue VOS (VN: \"blond\") was very well adjusted and flawless (as far as a non-guitar maker can tell). Even without an amplifier, nothing rattles. One hesitates for a moment when one sees the artificially \"aged\" metal parts (tailpiece with some \"rust film\", mechanisms a little \"tarnished\"), but the \"vintage impression\" created in this way is consistent and the workmanship is impeccable everywhere. The sound is actually even more beautiful than hoped - very balanced and nuanced. The pickups produce very clear (for my ear: powerful) sounds (in the same way for all strings), and both the volume and tone controls respond in an impressively differentiated manner: they control absolutely continuously (the tone controls really control the Sound, don\'t just make it \"dull\"). The neck thickness (59 reissue) is perfect for my (relatively small) hands - surprisingly (pleasantly) slim, but not thin. The machine heads are smooth and voiceable (it arrived here almost perfectly tuned - despite the cold temperatures). As a custom shop instrument it is of course expensive, and I cannot judge whether a comparably well-made guitar could also be produced more cheaply (that is, how much you pay extra for the name here), but that was the consideration that had been made before the purchase - and decided. In any case, this is actually exactly what I wanted to play (for a long time) and it leaves nothing to be desired (for me). I am an amateur (in German: lover), not a professional guitarist and not an expert (e.g. with regard to structural workmanship), but I have no point of criticism. The goal was not only to have a quality guitar, but also one for everyday use. She will - it will be wonderful to play her for many years.',8),(6,4,10,'Hi there!\n\nThe guitar itself is extremely cool. Yes, for sure it is not like my US-made PRS, but I like almost everything about it.\n\nBut take it into account:\n\n1. This is about 3⭐️ I put for Quality.\n\nI got my guitar with rusty strings and devastatingly bad frets for fresh guitar (I have a photo, but there\'s no option to attach it), so I got to replace strings, sand (‼️ yes, not just clean), and polish the frets.\n\nTo be precise: the frets was nicely shaped and the fretwork itself is very nice. The 1-3 strings were rusty, so I expected that the rust stains were the only problem with it. I was wrong, there were also a lot of black and sticky dirt, I guess it is some kind of sealing component that was used for bird inlays. And several frets were also with like \'deep\' rust stains (so I had to use sand-paper to remove it).\n\nTO sum up: if you going to buy one - just pick up a fretboard conditioner, .10-.64 strings. The masking tape can be bought elsewhere. I used a super-fine sandpaper and my girlfriend\'s nail polish tools :) But for sure if you have special tools or a guitar master - that would be a better option.\n\nAnyway, I was so frustrated the moment I unpacked the box... Thomann, you should fix such things, you messed up my NGD ?\n\n2. The color is a bit different. Take a youtube journey and find out how it does look in fact. It is less warm and more grayish than on the picture over here. But still, it\'s cool, you will love it.\nIt looks like it was dyed to be like that, but I am not going to sand it :)\n\n3. Everything else was set up very well (bridge, nut, strings height). In fact, it was almost in tune when I unpacked it.\n\nThe playability is just \'WOW\'. I won\'t spend you time - go and watch youtube reviews.',6);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Test','Test1','Test2','test@test.com','$2y$10$pfF3ewuPqEV75AOGrBlfTOm09v27dKGT89FmmbdHYGW5dBHzDwIRq',NULL,'2022-10-22 11:14:57','2022-12-03 11:31:20'),(5,'Test1','Test1','Test1','test1@test.com','$2y$10$YRhGwcqzKE42G2LgkQaGLeAcdj5qRddWwYR6aAo0DHBhjONIjoozS',NULL,'2022-10-23 11:45:49','2022-10-23 11:45:49'),(13,'Djuro','Masonicic','Djuro','djuromas@gmail.com','$2y$10$IpjYOqSbsHN.qK6QSnYg8.xHXKhla/F/ysO1A2WfcFbz1XQxDPJTa',NULL,'2022-12-03 11:42:38','2022-12-03 21:20:51'),(14,'test','test','test','test@test1.com','$2y$10$8dep5zrEckwHHP6ovtGFUOSQp50NXhC8iQk5a55Qr4.oqscYEDHzi',NULL,'2022-12-04 19:51:45','2022-12-04 19:51:45'),(15,'test','test','test11','tes1t@test.com','$2y$10$eQ9LWezc4fEbEGMDqpN/x.PMPqccUru4TQ5QjZlTYMNOot67QVsHW',NULL,'2022-12-04 21:16:03','2022-12-04 21:16:03'),(16,'test','test','test1111','tes11t@test.com','$2y$10$qAKFrPXkU6Qsw.TnSWP3oeIx9gizly3WIGnnWDYQXwx6YqwbwkNeG',NULL,'2022-12-04 21:16:28','2022-12-04 21:16:28'),(17,'asd','asd','asd','asd@asd','$2y$10$nEkXHV1h4waxZcABwjAbjejNQ2P5VrTi3IWihu3zDe2E8A4Rpv5D.',NULL,'2022-12-04 21:19:48','2022-12-04 21:19:48');
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

-- Dump completed on 2022-12-11 20:47:54
