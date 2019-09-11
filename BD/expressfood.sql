CREATE DATABASE  IF NOT EXISTS `express_food` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `express_food`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: express_food
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chef`
--

DROP TABLE IF EXISTS `chef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chef` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Chef` varchar(45) NOT NULL,
  `Prénom_Chef` varchar(45) NOT NULL,
  `utilisateur_Identifiant` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`,`utilisateur_Identifiant`),
  KEY `fk_chef_utilisateur1_idx` (`utilisateur_Identifiant`),
  CONSTRAINT `fk_chef_utilisateur1` FOREIGN KEY (`utilisateur_Identifiant`) REFERENCES `utilisateur` (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef`
--

LOCK TABLES `chef` WRITE;
/*!40000 ALTER TABLE `chef` DISABLE KEYS */;
INSERT INTO `chef` VALUES (1,'DUCASSE','Alain','aducasse'),(2,'LIGNAC','Cyril','clignac'),(3,'ROBUCHON','Joël','jrobuchon');
/*!40000 ALTER TABLE `chef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Client` varchar(45) NOT NULL,
  `Prénom_Client` varchar(45) NOT NULL,
  `Tél` varchar(45) NOT NULL,
  `E-Mail` varchar(45) NOT NULL,
  `Adresse` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'DELAVEGA','Diego','0651256389','ddelavega@gmail.com','45 Chemin des Galopins 07170 Lavilledieu'),(2,'DUVAL','Jérome','0729631452','jduval@gmail.com','85 Rue du chateau 07200 Aubenas '),(3,'DALLAS','Korben','0625731680','kdallas@gmail.com','225 Rue de l\'espace 07170 Villeneuve de Berg');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `commande` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Commande` date NOT NULL,
  `livraison_Id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`client_id`),
  KEY `fk_commande_livraison1_idx` (`livraison_Id`),
  KEY `fk_commande_client1_idx` (`client_id`),
  CONSTRAINT `fk_commande_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_commande_livraison1` FOREIGN KEY (`livraison_Id`) REFERENCES `livraison` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (3,'2019-01-07',1,1),(4,'2019-01-07',2,3),(5,'2019-01-07',3,2);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne de commande`
--

DROP TABLE IF EXISTS `ligne de commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ligne de commande` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Plat` varchar(45) DEFAULT NULL,
  `Nom_Dessert` varchar(45) DEFAULT NULL,
  `Quantite_Plat_Commande` int(11) DEFAULT NULL,
  `Quantité_Dessert_Commande` int(11) DEFAULT NULL,
  `commande_Id` int(11) NOT NULL,
  `commande_client_id` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`commande_Id`,`commande_client_id`),
  KEY `fk_Ligne de commande_commande1_idx` (`commande_Id`,`commande_client_id`),
  CONSTRAINT `fk_Ligne de commande_commande1` FOREIGN KEY (`commande_Id`, `commande_client_id`) REFERENCES `commande` (`id`, `client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne de commande`
--

LOCK TABLES `ligne de commande` WRITE;
/*!40000 ALTER TABLE `ligne de commande` DISABLE KEYS */;
INSERT INTO `ligne de commande` VALUES (1,'Lasagnes','0',1,0,3,1),(2,'Moules frites','Mousse au chocolat',2,2,3,1),(3,'Petit Pois Carottes','Buche à la vanille',4,4,4,3),(7,'Lasagnes','Eclair au chocolat',5,1,5,2),(8,'Moules frites','',5,0,5,2),(9,'Petit Pois Carrottes','',5,0,5,2);
/*!40000 ALTER TABLE `ligne de commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livraison` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Livraison` date NOT NULL,
  `Id_Commande` int(11) NOT NULL,
  `livreur_Id` int(11) NOT NULL,
  `livreur_utilisateur_Identifiant` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`,`livreur_Id`,`livreur_utilisateur_Identifiant`),
  KEY `fk_livraison_livreur1_idx` (`livreur_Id`,`livreur_utilisateur_Identifiant`),
  CONSTRAINT `fk_livraison_livreur1` FOREIGN KEY (`livreur_Id`, `livreur_utilisateur_Identifiant`) REFERENCES `livreur` (`id`, `utilisateur_identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES (1,'2019-01-07',1,1,'mmouse'),(2,'2019-01-07',2,2,'dduck'),(3,'2019-01-07',3,3,'bpicsou');
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `livreur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom_Livreur` varchar(45) NOT NULL,
  `Prénom_Livreur` varchar(45) NOT NULL,
  `Quantité_Plat_Livreur` int(11) NOT NULL,
  `Quantité_Dessert_Livreur` int(11) NOT NULL,
  `Statut` varchar(45) NOT NULL,
  `utilisateur_Identifiant` varchar(45) NOT NULL,
  `position_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`,`utilisateur_Identifiant`),
  KEY `fk_livreur_utilisateur1_idx` (`utilisateur_Identifiant`),
  KEY `fk_livreur_position1_idx` (`position_Id`),
  CONSTRAINT `fk_livreur_position1` FOREIGN KEY (`position_Id`) REFERENCES `position` (`id`),
  CONSTRAINT `fk_livreur_utilisateur1` FOREIGN KEY (`utilisateur_Identifiant`) REFERENCES `utilisateur` (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,'MOUSE','Mickey',10,10,'Libre','mmouse',1),(2,'DUCK','Donald',10,10,'Libre','dduck',2),(3,'PICSOU','Balthazar',9,9,'En livraison','bpicsou',3);
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(45) NOT NULL,
  `Quantité` int(11) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `chef_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_menu_chef1_idx` (`chef_Id`),
  CONSTRAINT `fk_menu_chef1` FOREIGN KEY (`chef_Id`) REFERENCES `chef` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Moule frites',50,'Plat',1),(2,'Lasagnes',50,'Plat',2),(3,'Petit Pois Carottes',40,'Plat',2),(4,'Eclair au chocolat',50,'Dessert',1),(5,'Mousse au chocolat',50,'Dessert',3),(6,'Buche à la vanille',30,'Dessert',3);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paiement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Paiement` date NOT NULL,
  `Montant` double NOT NULL,
  `commande_Id` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_paiement_commande1_idx` (`commande_Id`),
  CONSTRAINT `fk_paiement_commande1` FOREIGN KEY (`commande_Id`) REFERENCES `commande` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
INSERT INTO `paiement` VALUES (1,'2019-01-07',20,3),(2,'2019-01-07',5,4),(3,'2019-01-07',12,5);
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `position` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Latitude` decimal(10,0) NOT NULL,
  `Longitude` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,1,1),(2,2,3),(3,4,5);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utilisateur` (
  `Identifiant` varchar(45) NOT NULL,
  `Mdp` varchar(45) NOT NULL,
  PRIMARY KEY (`Identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES ('aducasse','1234'),('bpicsou','1234'),('clignac','1234'),('dduck','1234'),('jrobuchon','1234'),('mmouse','1234');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'express_food'
--

--
-- Dumping routines for database 'express_food'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-12 23:55:36
