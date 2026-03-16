-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: keystone
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abac_audit_logs`
--

DROP TABLE IF EXISTS `abac_audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abac_audit_logs` (
  `id` varchar(64) NOT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(64) DEFAULT NULL,
  `target_action` varchar(255) NOT NULL,
  `policy_name` varchar(255) NOT NULL,
  `effect` varchar(64) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abac_audit_logs`
--

LOCK TABLES `abac_audit_logs` WRITE;
/*!40000 ALTER TABLE `abac_audit_logs` DISABLE KEYS */;
INSERT INTO `abac_audit_logs` VALUES ('10b005197e004dd1993e416e9d7de6ce','2026-03-12 12:47:28','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','allow','Requete AUTORISEE. Condition remplie: REMOTE_ADDR == 127.0.0.1'),('1c0e423bdc46404ab4aae9d3eab48f60','2026-03-13 14:34:15','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','deny','Requete BLOQUEE. Condition NON remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 192.168.56.1)'),('2a53d082081a4d44afaeb57145ace2de','2026-03-13 14:30:13','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','deny','Requete BLOQUEE. Condition NON remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 192.168.56.1)'),('424bde5eb2054171a0b7091c6b6c7d8f','2026-03-13 12:23:01','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','deny','Requete BLOQUEE. Condition NON remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 192.168.56.1)'),('443c2beedadb4b788eaff4f11c382286','2026-03-06 14:23:09','7265478a70f44fb88b841b8682ddaca3','identity:list_users','test123','deny','Requete BLOQUEE. Condition remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 127.0.0.1)'),('5462b347b3aa4c7794e29ce39252564b','2026-03-12 12:51:52','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','allow','Requete AUTORISEE. Condition remplie: REMOTE_ADDR == 127.0.0.1'),('6e39da5a31d74a088d887c0a64469daf','2026-03-13 14:36:43','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','deny','Requete BLOQUEE. Condition NON remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 192.168.56.1)'),('9f9da73fc36f4a3d8390ff18c12e1414','2026-03-06 14:21:42','7265478a70f44fb88b841b8682ddaca3','identity:list_users','test123','deny','Requete BLOQUEE. Condition remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 127.0.0.1)'),('a06bd55272f648debe54cb27ee09199b','2026-03-13 14:37:02','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','deny','Requete BLOQUEE. Condition NON remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 192.168.56.1)'),('a6271fa4ec134bfd85880995ed7bd1df','2026-03-12 12:48:05','7265478a70f44fb88b841b8682ddaca3','identity:list_users','regle_ANR','allow','Requete AUTORISEE. Condition remplie: REMOTE_ADDR == 127.0.0.1'),('e07a09b295814ba1a0e239b5161e9316','2026-03-06 11:40:08','7265478a70f44fb88b841b8682ddaca3','identity:list_users','bloquer_user_journaliser_test','deny','Requete BLOQUEE. Condition remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 127.0.0.1)'),('e7206138b2f14ae7a83156870d7e88fc','2026-03-06 14:18:18','7265478a70f44fb88b841b8682ddaca3','identity:list_users','test123','deny','Requete BLOQUEE. Condition remplie: REMOTE_ADDR == 127.0.0.1 (Valeur lue: 127.0.0.1)');
/*!40000 ALTER TABLE `abac_audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abac_context_definition`
--

DROP TABLE IF EXISTS `abac_context_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abac_context_definition` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data_type` varchar(64) NOT NULL,
  `extraction_key` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abac_context_definition`
--

LOCK TABLES `abac_context_definition` WRITE;
/*!40000 ALTER TABLE `abac_context_definition` DISABLE KEYS */;
INSERT INTO `abac_context_definition` VALUES ('17835ca5b5274c049f589da3d225e381','Test IP','cidr','REMOTE_ADDR','adresse ip'),('405f7994b9814761bdeb3cdd394ca229','CONTROLE IP','cidr','REMOTE_ADDR','remote adress'),('74ba4262dfd04df2bfd9f2bca964482a','test2','cidr','REMOTE_ADDR',''),('a423401d064e4f52a58f0cbdbc924f56','Heure','time','HTTP_X_CITY','heure de connexion'),('aafed8e6daaa413b8de6bf7e37a79b43','ANR','cidr','REMOTE_ADDR','Rachel'),('af6310974661481795846b67adc7939d','Zone geographique','cidr','REMOTE_ADDR','yesoo'),('e2397a376c0247d4812a275995c6eb1c','UTILISATEUR','string','USER_ID','identifiant');
/*!40000 ALTER TABLE `abac_context_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abac_policy`
--

DROP TABLE IF EXISTS `abac_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abac_policy` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `target_action` varchar(255) NOT NULL,
  `effect` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abac_policy`
--

LOCK TABLES `abac_policy` WRITE;
/*!40000 ALTER TABLE `abac_policy` DISABLE KEYS */;
INSERT INTO `abac_policy` VALUES ('d048bbf93bb24a0ba447fa59e1425ee7','regle_ANR','identity:list_users','allow',NULL);
/*!40000 ALTER TABLE `abac_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abac_policy_condition`
--

DROP TABLE IF EXISTS `abac_policy_condition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abac_policy_condition` (
  `id` varchar(64) NOT NULL,
  `policy_id` varchar(64) NOT NULL,
  `context_def_id` varchar(64) NOT NULL,
  `operator` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`),
  KEY `context_def_id` (`context_def_id`),
  CONSTRAINT `abac_policy_condition_ibfk_1` FOREIGN KEY (`policy_id`) REFERENCES `abac_policy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `abac_policy_condition_ibfk_2` FOREIGN KEY (`context_def_id`) REFERENCES `abac_context_definition` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abac_policy_condition`
--

LOCK TABLES `abac_policy_condition` WRITE;
/*!40000 ALTER TABLE `abac_policy_condition` DISABLE KEYS */;
INSERT INTO `abac_policy_condition` VALUES ('c80e8d6c26234b44a519c3606a14cf96','d048bbf93bb24a0ba447fa59e1425ee7','aafed8e6daaa413b8de6bf7e37a79b43','==','127.0.0.1');
/*!40000 ALTER TABLE `abac_policy_condition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_rule`
--

DROP TABLE IF EXISTS `access_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_rule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(64) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL,
  `method` varchar(16) DEFAULT NULL,
  `external_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `duplicate_access_rule_for_user_constraint` (`user_id`,`service`,`path`,`method`),
  KEY `user_id` (`user_id`),
  KEY `external_id` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_rule`
--

LOCK TABLES `access_rule` WRITE;
/*!40000 ALTER TABLE `access_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_token` (
  `id` varchar(64) NOT NULL,
  `access_secret` varchar(64) NOT NULL,
  `authorizing_user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) NOT NULL,
  `role_ids` text NOT NULL,
  `consumer_id` varchar(64) NOT NULL,
  `expires_at` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_access_token_consumer_id` (`consumer_id`),
  KEY `ix_access_token_authorizing_user_id` (`authorizing_user_id`),
  CONSTRAINT `access_token_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('47147121'),('c88cdce8f248');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_credential`
--

DROP TABLE IF EXISTS `application_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_credential` (
  `internal_id` int NOT NULL AUTO_INCREMENT,
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `secret_hash` varchar(255) NOT NULL,
  `description` text,
  `user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `expires_at` bigint DEFAULT NULL,
  `system` varchar(64) DEFAULT NULL,
  `unrestricted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`internal_id`),
  UNIQUE KEY `duplicate_app_cred_constraint` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_credential`
--

LOCK TABLES `application_credential` WRITE;
/*!40000 ALTER TABLE `application_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_credential_access_rule`
--

DROP TABLE IF EXISTS `application_credential_access_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_credential_access_rule` (
  `application_credential_id` int NOT NULL,
  `access_rule_id` int NOT NULL,
  PRIMARY KEY (`application_credential_id`,`access_rule_id`),
  KEY `access_rule_id` (`access_rule_id`),
  CONSTRAINT `application_credential_access_rule_ibfk_1` FOREIGN KEY (`application_credential_id`) REFERENCES `application_credential` (`internal_id`) ON DELETE CASCADE,
  CONSTRAINT `application_credential_access_rule_ibfk_2` FOREIGN KEY (`access_rule_id`) REFERENCES `access_rule` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_credential_access_rule`
--

LOCK TABLES `application_credential_access_rule` WRITE;
/*!40000 ALTER TABLE `application_credential_access_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_credential_access_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_credential_role`
--

DROP TABLE IF EXISTS `application_credential_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_credential_role` (
  `application_credential_id` int NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`application_credential_id`,`role_id`),
  CONSTRAINT `application_credential_role_ibfk_1` FOREIGN KEY (`application_credential_id`) REFERENCES `application_credential` (`internal_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_credential_role`
--

LOCK TABLES `application_credential_role` WRITE;
/*!40000 ALTER TABLE `application_credential_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_credential_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `type` enum('UserProject','GroupProject','UserDomain','GroupDomain') NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `target_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  `inherited` tinyint(1) NOT NULL,
  PRIMARY KEY (`type`,`actor_id`,`target_id`,`role_id`,`inherited`),
  KEY `ix_actor_id` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES ('UserProject','64eab5e5001a48cba2b889fc13ca464b','a2b949a9a0c84a029eefeaed4beaad59','b4e66749fe62464e978d797ecb5d0560',0),('UserProject','7265478a70f44fb88b841b8682ddaca3','0990242c9877414693f2dda05008c7c8','84f33f20300f4d85b99e452791328a0e',0),('UserProject','7265478a70f44fb88b841b8682ddaca3','0990242c9877414693f2dda05008c7c8','af32fc3a7a59422fb2f9226a3e58de5d',0),('UserProject','7265478a70f44fb88b841b8682ddaca3','0990242c9877414693f2dda05008c7c8','b4e66749fe62464e978d797ecb5d0560',0),('UserProject','8f4d6c74dd6d42f79fabe751ed752e2e','df437f0b6fc84017aa8abc5fe30b9e26','5f14069dc45f4a088c78e7c76c684ecc',0),('','b1709cb0ab19482cb8b6fddb54864772','a2b949a9a0c84a029eefeaed4beaad59','b4e66749fe62464e978d797ecb5d0560',0),('UserProject','b1709cb0ab19482cb8b6fddb54864772','a2b949a9a0c84a029eefeaed4beaad59','b4e66749fe62464e978d797ecb5d0560',0),('UserProject','bf910b82fc3b4d40837c6cf287df2038','f3cb709cab434202a5d66faf77c0f1d7','84f33f20300f4d85b99e452791328a0e',0),('UserProject','d12569b8dc0742979c8bec3860b40fc4','a2b949a9a0c84a029eefeaed4beaad59','b4e66749fe62464e978d797ecb5d0560',0),('UserProject','d5bd48fe658a40dba6cca3c3962022e0','587979d27e2a441abb9a89951897d821','5f14069dc45f4a088c78e7c76c684ecc',0),('UserProject','d5bd48fe658a40dba6cca3c3962022e0','587979d27e2a441abb9a89951897d821','84f33f20300f4d85b99e452791328a0e',0),('UserProject','d5bd48fe658a40dba6cca3c3962022e0','df437f0b6fc84017aa8abc5fe30b9e26','84f33f20300f4d85b99e452791328a0e',0),('','e4a1bca542d242da9db1cb54ff0f5d98','0990242c9877414693f2dda05008c7c8','b4e66749fe62464e978d797ecb5d0560',0),('UserProject','e4a1bca542d242da9db1cb54ff0f5d98','0990242c9877414693f2dda05008c7c8','b4e66749fe62464e978d797ecb5d0560',0);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_register`
--

DROP TABLE IF EXISTS `config_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_register` (
  `type` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_register`
--

LOCK TABLES `config_register` WRITE;
/*!40000 ALTER TABLE `config_register` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `id` varchar(64) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  `secret` varchar(64) NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credential` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `extra` text,
  `key_hash` varchar(64) NOT NULL,
  `encrypted_blob` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('02980713cf8143f2abe44806c74f7cae','d5bd48fe658a40dba6cca3c3962022e0',NULL,'totp','{}','3628abce7736c0b864b1b11ecacf4ea43b0d4343','gAAAAABpquS7jJn1O41R_Svbt5Xcyawtee697KSKQ1Y-2a-WJ9Czn0LxigiamTPo_KLXYslZnvvXrW1iuMinFToviEa5byDjwGjhzxUFd5TcttTGW0_3TySPJD_-ASdoMOWRNX4IksRx'),('51923b815d0147fbb4ac6015bec5fc53','d5bd48fe658a40dba6cca3c3962022e0',NULL,'totp','{}','3628abce7736c0b864b1b11ecacf4ea43b0d4343','gAAAAABpqUOQmrgJvpzhdypEZ0I19XrWekSB9v2emjM-CUBMVea_whzoBlMW3fHXAnkIl1iVDDIxBdoItfXSU9kixGiwzi0GwotnxzYRreGuGuyfPgxHB-EmXNeZvI5NgLL0-4DOAFzj'),('65244e97ef6e41a8b48dc871e16c4ce3','d5bd48fe658a40dba6cca3c3962022e0',NULL,'totp','{}','3628abce7736c0b864b1b11ecacf4ea43b0d4343','gAAAAABpqHA2OUGjZJTKxe71_seJtK4MR6j6R6sbz1YuPXg-JFNIV4xjVgAWuS-lqCDzEIgrDsXD52o-ns0EgGUzc-BkKe0B-iF9Egu75LFB6EmUdO64EaajDSgVw6bDtYMNOE6Vb8Dv'),('b198744d8dee423995874719fc2ea951','bf910b82fc3b4d40837c6cf287df2038',NULL,'totp','{}','3628abce7736c0b864b1b11ecacf4ea43b0d4343','gAAAAABpqGiGOb3oIURZyzVOpdQprJUnCVVs0LrzaWdaBjz6a1MA65c5nu-Iap7GUeig3pIOTiMpzg7lxPKS1ku9q19h3UebHefSCN52-V8qTtYyrGXzC8vVnW7GgLoQMiq_MdYEsTbu');
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint`
--

DROP TABLE IF EXISTS `endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endpoint` (
  `id` varchar(64) NOT NULL,
  `legacy_endpoint_id` varchar(64) DEFAULT NULL,
  `interface` varchar(8) NOT NULL,
  `service_id` varchar(64) NOT NULL,
  `url` text NOT NULL,
  `extra` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `region_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endpoint_region_id` (`region_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `endpoint_service_id_fkey` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`),
  CONSTRAINT `fk_endpoint_region_id` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint`
--

LOCK TABLES `endpoint` WRITE;
/*!40000 ALTER TABLE `endpoint` DISABLE KEYS */;
INSERT INTO `endpoint` VALUES ('137f9b0d2fa74fa6b32e3b4e39be0b31',NULL,'admin','bb6a0e6a91e7454980382682438adec1','http://192.168.56.3:8774/v2.1','{}',1,'RegionOne'),('4ad09e500278499ab4a24b329c4614c4',NULL,'admin','0b32be9b44984419903faaaeaae98d37','http://192.168.56.3:8778','{}',1,'RegionOne'),('713092211eca11f19f5d6c24087ab95e',NULL,'public','f2edaf77b2004174b16b8a9dbcd6b9a6','http://192.168.56.1:5001/v3','{}',1,'RegionOne'),('713498e71eca11f19f5d6c24087ab95e',NULL,'internal','f2edaf77b2004174b16b8a9dbcd6b9a6','http://192.168.56.1:5001/v3','{}',1,'RegionOne'),('71373bff1eca11f19f5d6c24087ab95e',NULL,'admin','f2edaf77b2004174b16b8a9dbcd6b9a6','http://192.168.56.1:5001/v3','{}',1,'RegionOne'),('8bac33fe70a34210a7ef6b88fa038e75',NULL,'public','bb6a0e6a91e7454980382682438adec1','http://192.168.56.3:8774/v2.1','{}',1,'RegionOne'),('c2424563cc8d4d5c9eae99903c98f412',NULL,'public','90458425792b4fa9ad08cc89f8853bff','http://192.168.56.3:9696','{}',1,'RegionOne'),('cc92e784f1df437699c45cb57a98a947',NULL,'internal','bb6a0e6a91e7454980382682438adec1','http://192.168.56.3:8774/v2.1','{}',1,'RegionOne'),('df98608cf45e4faeb8a5d7625a5502ae',NULL,'internal','90458425792b4fa9ad08cc89f8853bff','http://192.168.56.3:9696','{}',1,'RegionOne'),('e2489b8849c543d1b2c579308f7fcfa8',NULL,'internal','23ac28554715470881cd3337519bb230','http://192.168.56.3:9292','{}',1,'RegionOne'),('e7c30e009db24cccafc57c8f49d4404b',NULL,'public','0b32be9b44984419903faaaeaae98d37','http://192.168.56.3:8778','{}',1,'RegionOne'),('e8e22d2f6d5f41ac98fcf81f8f732ca4',NULL,'admin','23ac28554715470881cd3337519bb230','http://192.168.56.3:9292','{}',1,'RegionOne'),('ea425a223054412991d231fad7da169f',NULL,'admin','90458425792b4fa9ad08cc89f8853bff','http://192.168.56.3:9696','{}',1,'RegionOne'),('ee5f1c88107e442d8175cc7b140cd976',NULL,'public','23ac28554715470881cd3337519bb230','http://192.168.56.3:9292','{}',1,'RegionOne'),('f7a57926cfea4140b6e2945ca63deaa1',NULL,'internal','0b32be9b44984419903faaaeaae98d37','http://192.168.56.3:8778','{}',1,'RegionOne');
/*!40000 ALTER TABLE `endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endpoint_group`
--

DROP TABLE IF EXISTS `endpoint_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endpoint_group` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `filters` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endpoint_group`
--

LOCK TABLES `endpoint_group` WRITE;
/*!40000 ALTER TABLE `endpoint_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `endpoint_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expiring_user_group_membership`
--

DROP TABLE IF EXISTS `expiring_user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expiring_user_group_membership` (
  `user_id` varchar(64) NOT NULL,
  `group_id` varchar(64) NOT NULL,
  `idp_id` varchar(64) NOT NULL,
  `last_verified` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`,`idp_id`),
  KEY `group_id` (`group_id`),
  KEY `idp_id` (`idp_id`),
  CONSTRAINT `expiring_user_group_membership_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `expiring_user_group_membership_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `expiring_user_group_membership_ibfk_3` FOREIGN KEY (`idp_id`) REFERENCES `identity_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expiring_user_group_membership`
--

LOCK TABLES `expiring_user_group_membership` WRITE;
/*!40000 ALTER TABLE `expiring_user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `expiring_user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_user`
--

DROP TABLE IF EXISTS `federated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federated_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `idp_id` varchar(64) NOT NULL,
  `protocol_id` varchar(64) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idp_id` (`idp_id`,`protocol_id`,`unique_id`),
  KEY `federated_user_protocol_id_fkey` (`protocol_id`,`idp_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `federated_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `federated_user_ibfk_2` FOREIGN KEY (`idp_id`) REFERENCES `identity_provider` (`id`) ON DELETE CASCADE,
  CONSTRAINT `federated_user_protocol_id_fkey` FOREIGN KEY (`protocol_id`, `idp_id`) REFERENCES `federation_protocol` (`id`, `idp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_user`
--

LOCK TABLES `federated_user` WRITE;
/*!40000 ALTER TABLE `federated_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federation_protocol`
--

DROP TABLE IF EXISTS `federation_protocol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federation_protocol` (
  `id` varchar(64) NOT NULL,
  `idp_id` varchar(64) NOT NULL,
  `mapping_id` varchar(64) NOT NULL,
  `remote_id_attribute` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`,`idp_id`),
  KEY `idp_id` (`idp_id`),
  CONSTRAINT `federation_protocol_ibfk_1` FOREIGN KEY (`idp_id`) REFERENCES `identity_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federation_protocol`
--

LOCK TABLES `federation_protocol` WRITE;
/*!40000 ALTER TABLE `federation_protocol` DISABLE KEYS */;
/*!40000 ALTER TABLE `federation_protocol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `extra` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_group_name_domain_id` (`domain_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_mapping`
--

DROP TABLE IF EXISTS `id_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_mapping` (
  `public_id` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  `local_id` varchar(255) NOT NULL,
  `entity_type` enum('user','group') NOT NULL,
  PRIMARY KEY (`public_id`),
  UNIQUE KEY `domain_id` (`domain_id`,`local_id`,`entity_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_mapping`
--

LOCK TABLES `id_mapping` WRITE;
/*!40000 ALTER TABLE `id_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `id_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider`
--

DROP TABLE IF EXISTS `identity_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_provider` (
  `id` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` text,
  `domain_id` varchar(64) NOT NULL,
  `authorization_ttl` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider`
--

LOCK TABLES `identity_provider` WRITE;
/*!40000 ALTER TABLE `identity_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idp_remote_ids`
--

DROP TABLE IF EXISTS `idp_remote_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idp_remote_ids` (
  `idp_id` varchar(64) DEFAULT NULL,
  `remote_id` varchar(255) NOT NULL,
  PRIMARY KEY (`remote_id`),
  KEY `idp_id` (`idp_id`),
  CONSTRAINT `idp_remote_ids_ibfk_1` FOREIGN KEY (`idp_id`) REFERENCES `identity_provider` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idp_remote_ids`
--

LOCK TABLES `idp_remote_ids` WRITE;
/*!40000 ALTER TABLE `idp_remote_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `idp_remote_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `implied_role`
--

DROP TABLE IF EXISTS `implied_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `implied_role` (
  `prior_role_id` varchar(64) NOT NULL,
  `implied_role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`prior_role_id`,`implied_role_id`),
  KEY `implied_role_implied_role_id_fkey` (`implied_role_id`),
  CONSTRAINT `implied_role_implied_role_id_fkey` FOREIGN KEY (`implied_role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `implied_role_prior_role_id_fkey` FOREIGN KEY (`prior_role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `implied_role`
--

LOCK TABLES `implied_role` WRITE;
/*!40000 ALTER TABLE `implied_role` DISABLE KEYS */;
INSERT INTO `implied_role` VALUES ('b4e66749fe62464e978d797ecb5d0560','5f14069dc45f4a088c78e7c76c684ecc'),('5f14069dc45f4a088c78e7c76c684ecc','84f33f20300f4d85b99e452791328a0e'),('84f33f20300f4d85b99e452791328a0e','af32fc3a7a59422fb2f9226a3e58de5d');
/*!40000 ALTER TABLE `implied_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limit`
--

DROP TABLE IF EXISTS `limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `limit` (
  `id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `resource_limit` int NOT NULL,
  `description` text,
  `internal_id` int NOT NULL AUTO_INCREMENT,
  `registered_limit_id` varchar(64) DEFAULT NULL,
  `domain_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`internal_id`),
  UNIQUE KEY `limit_id_key` (`id`),
  KEY `registered_limit_id` (`registered_limit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limit`
--

LOCK TABLES `limit` WRITE;
/*!40000 ALTER TABLE `limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `local_user`
--

DROP TABLE IF EXISTS `local_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `domain_id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `failed_auth_count` int DEFAULT NULL,
  `failed_auth_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`name`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `local_user_user_id_fkey` (`user_id`,`domain_id`),
  CONSTRAINT `local_user_user_id_fkey` FOREIGN KEY (`user_id`, `domain_id`) REFERENCES `user` (`id`, `domain_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_user`
--

LOCK TABLES `local_user` WRITE;
/*!40000 ALTER TABLE `local_user` DISABLE KEYS */;
INSERT INTO `local_user` VALUES (1,'e4a1bca542d242da9db1cb54ff0f5d98','default','admin',5,'2026-02-20 10:32:58'),(2,'7265478a70f44fb88b841b8682ddaca3','default','superuser',0,NULL),(3,'9933ba75fe404b429df5fd0a9d2b3656','default','glance',NULL,NULL),(4,'64eab5e5001a48cba2b889fc13ca464b','default','placement',NULL,NULL),(5,'d12569b8dc0742979c8bec3860b40fc4','default','nova',0,NULL),(6,'bf910b82fc3b4d40837c6cf287df2038','default','daniel',0,NULL),(7,'d5bd48fe658a40dba6cca3c3962022e0','default','max',0,NULL),(8,'8f4d6c74dd6d42f79fabe751ed752e2e','default','IVANA',0,NULL),(10,'b1709cb0ab19482cb8b6fddb54864772','default','neutron',0,NULL);
/*!40000 ALTER TABLE `local_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapping`
--

DROP TABLE IF EXISTS `mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mapping` (
  `id` varchar(64) NOT NULL,
  `rules` text NOT NULL,
  `schema_version` varchar(5) NOT NULL DEFAULT '1.0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapping`
--

LOCK TABLES `mapping` WRITE;
/*!40000 ALTER TABLE `mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nonlocal_user`
--

DROP TABLE IF EXISTS `nonlocal_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nonlocal_user` (
  `domain_id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  PRIMARY KEY (`domain_id`,`name`),
  UNIQUE KEY `ixu_nonlocal_user_user_id` (`user_id`),
  KEY `nonlocal_user_user_id_fkey` (`user_id`,`domain_id`),
  CONSTRAINT `nonlocal_user_user_id_fkey` FOREIGN KEY (`user_id`, `domain_id`) REFERENCES `user` (`id`, `domain_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nonlocal_user`
--

LOCK TABLES `nonlocal_user` WRITE;
/*!40000 ALTER TABLE `nonlocal_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `nonlocal_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password` (
  `id` int NOT NULL AUTO_INCREMENT,
  `local_user_id` int NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `self_service` tinyint(1) NOT NULL DEFAULT '0',
  `password_hash` varchar(255) DEFAULT NULL,
  `created_at_int` bigint NOT NULL DEFAULT '0',
  `expires_at_int` bigint DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `local_user_id` (`local_user_id`),
  CONSTRAINT `password_ibfk_1` FOREIGN KEY (`local_user_id`) REFERENCES `local_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES (1,1,NULL,0,'$2b$12$Ui67v0VFOTKyNjZ16n43J.eOBp9Ql78kjpNQqIUxOav3pJK0SqKRK',1764518552846398,NULL,'2025-11-30 16:02:33'),(2,2,NULL,0,'$2b$12$2ONEWWix3fJLggAyT9sAxuAYin9Wi3PWkjwuLHkOqEFBmVmFvpUni',1771584409214362,NULL,'2026-02-20 10:46:49'),(3,3,NULL,0,'$2b$12$TMNaQt0LqT8Z2CbASzl9sOO7EYxe3eU2HlvymuarGxeqBT4pL.SXG',1771835243129042,NULL,'2026-02-23 08:27:23'),(4,4,NULL,0,'$2b$12$6cmbbKY939j8/6Ol7Fpx1eTW60Se.lAN0yAF6dHUZvkJewTrCNWwW',1771843527477903,NULL,'2026-02-23 10:45:27'),(5,5,NULL,0,'$2b$12$g0RPM6.Bb15TEDs8viBhm.ZgmWdRkm5sy6OcKrH8mvCDmieamDtOe',1771850503133906,NULL,'2026-02-23 12:41:43'),(6,6,'2026-03-03 19:49:10',0,'$2b$12$O5A8/YA5KBK5Hwf.gANgi.eF6qz02s4ZhI9Zszq14NftrEXkCjjr.',1772545902774481,1772567349653779,'2026-03-03 13:51:43'),(7,6,NULL,0,'$2b$12$MJXQaKVafMIKrAcYOT12Ru9n/QTFmhgL1oqAh6NptlZv5YIZBg6Wu',1772567349653779,NULL,'2026-03-03 19:49:10'),(8,7,NULL,0,'$2b$12$2RcW.8q/7eKyCGqeVnXhf.RHrrNApJiCwnrDpIy.4PFnebZSGaXaK',1772645773598381,NULL,'2026-03-04 17:36:14'),(9,8,NULL,0,'$2b$12$WdLROd2MSKfEamN2vGC0KungmNPyDOTkluh0OseupuG0cRheDMke6',1772806987365726,NULL,'2026-03-06 14:23:07'),(10,10,NULL,0,'$2b$12$nbHvZi15n6RCOyxTcqsPTeDSEIAyIc7xTg6MhHqNs0R9MY2Yd6RVO',1773404566382667,NULL,'2026-03-13 12:22:46');
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy` (
  `id` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `blob` text NOT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_association`
--

DROP TABLE IF EXISTS `policy_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `policy_association` (
  `id` varchar(64) NOT NULL,
  `policy_id` varchar(64) NOT NULL,
  `endpoint_id` varchar(64) DEFAULT NULL,
  `service_id` varchar(64) DEFAULT NULL,
  `region_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `endpoint_id` (`endpoint_id`,`service_id`,`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_association`
--

LOCK TABLES `policy_association` WRITE;
/*!40000 ALTER TABLE `policy_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `extra` text,
  `description` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  `parent_id` varchar(64) DEFAULT NULL,
  `is_domain` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_project_name_domain_id` (`domain_id`,`name`),
  KEY `project_parent_id_fkey` (`parent_id`),
  CONSTRAINT `project_domain_id_fkey` FOREIGN KEY (`domain_id`) REFERENCES `project` (`id`),
  CONSTRAINT `project_parent_id_fkey` FOREIGN KEY (`parent_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('0990242c9877414693f2dda05008c7c8','admin','{}','Bootstrap project for initializing the cloud.',1,'default','default',0),('587979d27e2a441abb9a89951897d821','test max','{}','test',1,'default','default',0),('9cf6f8d6bff344a19b0a279921181d77','Federated_Domain','{}','Domaine isolé pour les utilisateurs SSO',1,'<<keystone.domain.root>>',NULL,1),('<<keystone.domain.root>>','<<keystone.domain.root>>','{}','',0,'<<keystone.domain.root>>',NULL,1),('a2b949a9a0c84a029eefeaed4beaad59','service','{}','Service Project',1,'default','default',0),('default','Default','{}','The default domain',1,'<<keystone.domain.root>>',NULL,1),('df437f0b6fc84017aa8abc5fe30b9e26','test_project','{}','',1,'default','default',0),('f3cb709cab434202a5d66faf77c0f1d7','myproject','{}','',1,'default','default',0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_endpoint`
--

DROP TABLE IF EXISTS `project_endpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_endpoint` (
  `endpoint_id` varchar(64) NOT NULL,
  `project_id` varchar(64) NOT NULL,
  PRIMARY KEY (`endpoint_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_endpoint`
--

LOCK TABLES `project_endpoint` WRITE;
/*!40000 ALTER TABLE `project_endpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_endpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_endpoint_group`
--

DROP TABLE IF EXISTS `project_endpoint_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_endpoint_group` (
  `endpoint_group_id` varchar(64) NOT NULL,
  `project_id` varchar(64) NOT NULL,
  PRIMARY KEY (`endpoint_group_id`,`project_id`),
  CONSTRAINT `project_endpoint_group_ibfk_1` FOREIGN KEY (`endpoint_group_id`) REFERENCES `endpoint_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_endpoint_group`
--

LOCK TABLES `project_endpoint_group` WRITE;
/*!40000 ALTER TABLE `project_endpoint_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_endpoint_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_option`
--

DROP TABLE IF EXISTS `project_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_option` (
  `project_id` varchar(64) NOT NULL,
  `option_id` varchar(4) NOT NULL,
  `option_value` text,
  PRIMARY KEY (`project_id`,`option_id`),
  CONSTRAINT `project_option_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_option`
--

LOCK TABLES `project_option` WRITE;
/*!40000 ALTER TABLE `project_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_tag`
--

DROP TABLE IF EXISTS `project_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_tag` (
  `project_id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`project_id`,`name`),
  CONSTRAINT `project_tag_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_tag`
--

LOCK TABLES `project_tag` WRITE;
/*!40000 ALTER TABLE `project_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `parent_region_id` varchar(255) DEFAULT NULL,
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('RegionOne','',NULL,'{}');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registered_limit`
--

DROP TABLE IF EXISTS `registered_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registered_limit` (
  `id` varchar(64) NOT NULL,
  `service_id` varchar(255) DEFAULT NULL,
  `region_id` varchar(64) DEFAULT NULL,
  `resource_name` varchar(255) DEFAULT NULL,
  `default_limit` int NOT NULL,
  `description` text,
  `internal_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`internal_id`),
  UNIQUE KEY `registered_limit_id_key` (`id`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registered_limit`
--

LOCK TABLES `registered_limit` WRITE;
/*!40000 ALTER TABLE `registered_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `registered_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_token`
--

DROP TABLE IF EXISTS `request_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_token` (
  `id` varchar(64) NOT NULL,
  `request_secret` varchar(64) NOT NULL,
  `verifier` varchar(64) DEFAULT NULL,
  `authorizing_user_id` varchar(64) DEFAULT NULL,
  `requested_project_id` varchar(64) NOT NULL,
  `role_ids` text,
  `consumer_id` varchar(64) NOT NULL,
  `expires_at` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_request_token_consumer_id` (`consumer_id`),
  CONSTRAINT `request_token_ibfk_1` FOREIGN KEY (`consumer_id`) REFERENCES `consumer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_token`
--

LOCK TABLES `request_token` WRITE;
/*!40000 ALTER TABLE `request_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `request_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revocation_event`
--

DROP TABLE IF EXISTS `revocation_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revocation_event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain_id` varchar(64) DEFAULT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL,
  `trust_id` varchar(64) DEFAULT NULL,
  `consumer_id` varchar(64) DEFAULT NULL,
  `access_token_id` varchar(64) DEFAULT NULL,
  `issued_before` datetime NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `revoked_at` datetime NOT NULL,
  `audit_id` varchar(32) DEFAULT NULL,
  `audit_chain_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_revocation_event_audit_id_issued_before` (`audit_id`,`issued_before`),
  KEY `ix_revocation_event_new_revoked_at` (`revoked_at`),
  KEY `ix_revocation_event_issued_before` (`issued_before`),
  KEY `ix_revocation_event_project_id_issued_before` (`project_id`,`issued_before`),
  KEY `ix_revocation_event_user_id_issued_before` (`user_id`,`issued_before`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revocation_event`
--

LOCK TABLES `revocation_event` WRITE;
/*!40000 ALTER TABLE `revocation_event` DISABLE KEYS */;
INSERT INTO `revocation_event` VALUES (1,NULL,NULL,'bf910b82fc3b4d40837c6cf287df2038',NULL,NULL,NULL,NULL,'2026-03-03 19:49:10',NULL,'2026-03-03 19:49:10',NULL,NULL);
/*!40000 ALTER TABLE `revocation_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `extra` text,
  `domain_id` varchar(64) NOT NULL DEFAULT '<<null>>',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_role_name_domain_id` (`name`,`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('2501c1a83e9044ebb9edd15fff4fa564','service','{}','<<null>>',NULL),('5f14069dc45f4a088c78e7c76c684ecc','manager','{}','<<null>>',NULL),('84f33f20300f4d85b99e452791328a0e','member','{}','<<null>>',NULL),('af32fc3a7a59422fb2f9226a3e58de5d','reader','{}','<<null>>',NULL),('b4e66749fe62464e978d797ecb5d0560','admin','{}','<<null>>',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_option`
--

DROP TABLE IF EXISTS `role_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_option` (
  `role_id` varchar(64) NOT NULL,
  `option_id` varchar(4) NOT NULL,
  `option_value` text,
  PRIMARY KEY (`role_id`,`option_id`),
  CONSTRAINT `role_option_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_option`
--

LOCK TABLES `role_option` WRITE;
/*!40000 ALTER TABLE `role_option` DISABLE KEYS */;
INSERT INTO `role_option` VALUES ('2501c1a83e9044ebb9edd15fff4fa564','IMMU','true'),('5f14069dc45f4a088c78e7c76c684ecc','IMMU','true'),('84f33f20300f4d85b99e452791328a0e','IMMU','true'),('af32fc3a7a59422fb2f9226a3e58de5d','IMMU','true'),('b4e66749fe62464e978d797ecb5d0560','IMMU','true');
/*!40000 ALTER TABLE `role_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensitive_config`
--

DROP TABLE IF EXISTS `sensitive_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensitive_config` (
  `domain_id` varchar(64) NOT NULL,
  `group` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`domain_id`,`group`,`option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensitive_config`
--

LOCK TABLES `sensitive_config` WRITE;
/*!40000 ALTER TABLE `sensitive_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `sensitive_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id` varchar(64) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `extra` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES ('0b32be9b44984419903faaaeaae98d37','placement',1,'{\"name\": \"placement\", \"description\": \"Placement API\"}'),('23ac28554715470881cd3337519bb230','image',1,'{\"name\": \"glance\", \"description\": \"OpenStack Image\"}'),('90458425792b4fa9ad08cc89f8853bff','network',1,'{\"name\": \"neutron\", \"description\": \"OpenStack Networking\"}'),('bb6a0e6a91e7454980382682438adec1','compute',1,'{\"description\": \"OpenStack Compute\", \"name\": \"nova\"}'),('f2edaf77b2004174b16b8a9dbcd6b9a6','identity',1,'{\"name\": \"keystone\"}');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_provider`
--

DROP TABLE IF EXISTS `service_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_provider` (
  `auth_url` varchar(256) NOT NULL,
  `id` varchar(64) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `description` text,
  `sp_url` varchar(256) NOT NULL,
  `relay_state_prefix` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_provider`
--

LOCK TABLES `service_provider` WRITE;
/*!40000 ALTER TABLE `service_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_assignment`
--

DROP TABLE IF EXISTS `system_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_assignment` (
  `type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `target_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  `inherited` tinyint(1) NOT NULL,
  PRIMARY KEY (`type`,`actor_id`,`target_id`,`role_id`,`inherited`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_assignment`
--

LOCK TABLES `system_assignment` WRITE;
/*!40000 ALTER TABLE `system_assignment` DISABLE KEYS */;
INSERT INTO `system_assignment` VALUES ('UserSystem','7265478a70f44fb88b841b8682ddaca3','system','b4e66749fe62464e978d797ecb5d0560',0),('UserSystem','e4a1bca542d242da9db1cb54ff0f5d98','system','b4e66749fe62464e978d797ecb5d0560',0);
/*!40000 ALTER TABLE `system_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `id` varchar(64) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `extra` text,
  `valid` tinyint(1) NOT NULL,
  `trust_id` varchar(64) DEFAULT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_token_expires` (`expires`),
  KEY `ix_token_expires_valid` (`expires`,`valid`),
  KEY `ix_token_user_id` (`user_id`),
  KEY `ix_token_trust_id` (`trust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust`
--

DROP TABLE IF EXISTS `trust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trust` (
  `id` varchar(64) NOT NULL,
  `trustor_user_id` varchar(64) NOT NULL,
  `trustee_user_id` varchar(64) NOT NULL,
  `project_id` varchar(64) DEFAULT NULL,
  `impersonation` tinyint(1) NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `remaining_uses` int DEFAULT NULL,
  `extra` text,
  `expires_at_int` bigint DEFAULT NULL,
  `redelegated_trust_id` varchar(64) DEFAULT NULL,
  `redelegation_count` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `duplicate_trust_constraint` (`trustor_user_id`,`trustee_user_id`,`project_id`,`impersonation`,`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust`
--

LOCK TABLES `trust` WRITE;
/*!40000 ALTER TABLE `trust` DISABLE KEYS */;
/*!40000 ALTER TABLE `trust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust_role`
--

DROP TABLE IF EXISTS `trust_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trust_role` (
  `trust_id` varchar(64) NOT NULL,
  `role_id` varchar(64) NOT NULL,
  PRIMARY KEY (`trust_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust_role`
--

LOCK TABLES `trust_role` WRITE;
/*!40000 ALTER TABLE `trust_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `trust_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(64) NOT NULL,
  `extra` text,
  `enabled` tinyint(1) DEFAULT NULL,
  `default_project_id` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_active_at` date DEFAULT NULL,
  `domain_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ixu_user_id_domain_id` (`id`,`domain_id`),
  KEY `ix_default_project_id` (`default_project_id`),
  KEY `domain_id` (`domain_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('64eab5e5001a48cba2b889fc13ca464b','{}',1,NULL,'2026-02-23 10:45:28','2026-03-13','default'),('7265478a70f44fb88b841b8682ddaca3','{}',1,NULL,'2026-02-20 10:46:50','2026-03-13','default'),('8f4d6c74dd6d42f79fabe751ed752e2e','{\"description\": \"la seule fille de la DSI\"}',1,'df437f0b6fc84017aa8abc5fe30b9e26','2026-03-06 14:23:08','2026-03-11','default'),('9933ba75fe404b429df5fd0a9d2b3656','{}',1,NULL,'2026-02-23 08:27:24',NULL,'default'),('b1709cb0ab19482cb8b6fddb54864772','{}',1,NULL,'2026-03-13 12:22:47','2026-03-13','default'),('bf910b82fc3b4d40837c6cf287df2038','{\"mfa_enabled\": false, \"mfa_autorise\": true}',1,'df437f0b6fc84017aa8abc5fe30b9e26','2026-03-03 13:51:44','2026-03-11','default'),('d12569b8dc0742979c8bec3860b40fc4','{}',1,NULL,'2026-02-23 12:41:44','2026-03-13','default'),('d5bd48fe658a40dba6cca3c3962022e0','{\"description\": \"max\", \"mfa_autorise\": true}',1,'df437f0b6fc84017aa8abc5fe30b9e26','2026-03-04 17:36:14','2026-03-12','default'),('e4a1bca542d242da9db1cb54ff0f5d98','{}',1,NULL,'2025-11-30 16:02:33','2025-11-30','default');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_membership` (
  `user_id` varchar(64) NOT NULL,
  `group_id` varchar(64) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `fk_user_group_membership_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  CONSTRAINT `fk_user_group_membership_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_membership`
--

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_option`
--

DROP TABLE IF EXISTS `user_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_option` (
  `user_id` varchar(64) NOT NULL,
  `option_id` varchar(4) NOT NULL,
  `option_value` text,
  PRIMARY KEY (`user_id`,`option_id`),
  CONSTRAINT `user_option_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_option`
--

LOCK TABLES `user_option` WRITE;
/*!40000 ALTER TABLE `user_option` DISABLE KEYS */;
INSERT INTO `user_option` VALUES ('8f4d6c74dd6d42f79fabe751ed752e2e','1003','false'),('8f4d6c74dd6d42f79fabe751ed752e2e','MFAR','[]'),('bf910b82fc3b4d40837c6cf287df2038','MFAE','true'),('bf910b82fc3b4d40837c6cf287df2038','MFAR','[[\"password\"], [\"totp\"]]'),('d5bd48fe658a40dba6cca3c3962022e0','1003','false'),('d5bd48fe658a40dba6cca3c3962022e0','MFAR','[[\"password\", \"totp\"]]');
/*!40000 ALTER TABLE `user_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelisted_config`
--

DROP TABLE IF EXISTS `whitelisted_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whitelisted_config` (
  `domain_id` varchar(64) NOT NULL,
  `group` varchar(255) NOT NULL,
  `option` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`domain_id`,`group`,`option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelisted_config`
--

LOCK TABLES `whitelisted_config` WRITE;
/*!40000 ALTER TABLE `whitelisted_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `whitelisted_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-13 17:54:50
