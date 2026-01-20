-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: jaguares-db.c5esiyoi0f3c.us-east-2.rds.amazonaws.com    Database: jaguares_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Current Database: `jaguares_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jaguares_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jaguares_db`;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradores` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol` enum('super_admin','admin','profesor') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'admin',
  `estado` enum('activo','inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `ultimo_acceso` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_login` timestamp NULL DEFAULT NULL,
  `failed_login_attempts` int DEFAULT '0',
  `locked_until` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_usuario` (`usuario`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (2,'admin','$2b$10$pGu.cu.WCLrxuVwFBzSXGOQGEblksTZSiDlmrXpRz/pFiYSbN/zoq','Administrador','admin@jaguares.com','super_admin','activo','2026-01-18 05:07:42','2026-01-18 04:26:33','2026-01-18 05:07:42',NULL,0,NULL),(3,'nilton@jaguares.com','$2b$10$pY9Oe0S7NfPRqEINYK45ju/r2E2FcHF3jqYNutSFa2H3yCmNJJhei','Nilton','nilton@gmail.com','super_admin','activo','2026-01-20 04:55:44','2026-01-18 05:08:21','2026-01-20 04:55:44',NULL,0,NULL);
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumnos` (
  `alumno_id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_paterno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_materno` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` enum('Masculino','Femenino') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seguro_tipo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion_medica` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `apoderado` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono_apoderado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dni_frontal_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `dni_reverso_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `foto_carnet_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `comprobante_pago_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `estado` enum('activo','inactivo','suspendido') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `estado_pago` enum('pendiente','confirmado','rechazado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `fecha_pago` timestamp NULL DEFAULT NULL,
  `monto_pago` decimal(10,2) DEFAULT NULL,
  `numero_operacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notas_pago` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`alumno_id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `idx_dni` (`dni`),
  KEY `idx_nombres` (`nombres`,`apellido_paterno`),
  KEY `idx_estado_pago` (`estado_pago`),
  KEY `idx_alumnos_dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=760 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumnos`
--

LOCK TABLES `alumnos` WRITE;
/*!40000 ALTER TABLE `alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `asistencia_id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `horario_id` int NOT NULL,
  `fecha` date NOT NULL,
  `presente` tinyint(1) DEFAULT '0',
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `registrado_por` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`asistencia_id`),
  UNIQUE KEY `unique_asistencia` (`alumno_id`,`horario_id`,`fecha`),
  KEY `idx_alumno_fecha` (`alumno_id`,`fecha`),
  KEY `idx_horario_fecha` (`horario_id`,`fecha`),
  CONSTRAINT `asistencias_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE,
  CONSTRAINT `asistencias_ibfk_2` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `deporte_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Nombre de la categor??a (ej: 2011-2012, Juvenil)',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT 'Descripci??n adicional de la categor??a',
  `ano_min` int DEFAULT NULL COMMENT 'A??o de nacimiento m??nimo permitido',
  `ano_max` int DEFAULT NULL COMMENT 'A??o de nacimiento m??ximo permitido',
  `icono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orden` int DEFAULT '0' COMMENT 'Orden de visualizaci??n (menor primero)',
  `estado` enum('activo','inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria_id`),
  UNIQUE KEY `unique_deporte_categoria` (`deporte_id`,`nombre`),
  KEY `idx_deporte` (`deporte_id`),
  KEY `idx_estado` (`estado`),
  KEY `idx_rango_edad` (`ano_min`,`ano_max`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`deporte_id`) REFERENCES `deportes` (`deporte_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,1,'2008-2009-2010-2011','Categoría 2008-2009-2010-2011 - Fútbol',2008,2011,NULL,2008,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(2,1,'2008-2009','Categoría 2008-2009 - Fútbol',2008,2009,NULL,2008,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(3,1,'2009-2010','Categoría 2009-2010 - Fútbol',2009,2010,NULL,2009,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(4,1,'2009-2010-2011-2012','Categoría 2009-2010-2011-2012 - Fútbol',2009,2012,NULL,2009,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(5,1,'2010-2011','Categoría 2010-2011 - Fútbol',2010,2011,NULL,2010,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(6,1,'2011-2012','Categoría 2011-2012 - Fútbol',2011,2012,NULL,2011,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(7,1,'2012-2013','Categoría 2012-2013 - Fútbol',2012,2013,NULL,2012,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(8,1,'2014-2013-2012','Categoría 2014-2013-2012 - Fútbol',2012,2014,NULL,2012,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(9,1,'2013-2014-2015','Categoría 2013-2014-2015 - Fútbol',2013,2015,NULL,2013,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(10,1,'2014-2013','Categoría 2014-2013 - Fútbol',2013,2014,NULL,2013,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(11,1,'2014','Categoría 2014 - Fútbol',2014,2014,NULL,2014,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(12,1,'2015','Categoría 2015 - Fútbol',2015,2015,NULL,2015,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(13,1,'2016-2015','Categoría 2016-2015 - Fútbol',2015,2016,NULL,2015,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(14,1,'2017-2016','Categoría 2017-2016 - Fútbol',2016,2017,NULL,2016,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(15,1,'2016','Categoría 2016 - Fútbol',2016,2016,NULL,2016,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(16,1,'2018-2017','Categoría 2018-2017 - Fútbol',2017,2018,NULL,2017,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(17,1,'2017','Categoría 2017 - Fútbol',2017,2017,NULL,2017,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(18,1,'2018-2019','Categoría 2018-2019 - Fútbol',2018,2019,NULL,2018,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(19,1,'2019','Categoría 2019 - Fútbol',2019,2019,NULL,2019,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(20,1,'2019-2020','Categoría 2019-2020 - Fútbol',2019,2020,NULL,2019,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(21,1,'2020-2021','Categoría 2020-2021 - Fútbol',2020,2021,NULL,2020,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(22,2,'2010-2015','Categoría 2010-2015 - Fútbol Femenino',2010,2015,NULL,2010,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(23,3,'2009-2008','Categoría 2009-2008 - Vóley',2008,2009,NULL,2008,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(24,3,'2010-2009','Categoría 2010-2009 - Vóley',2009,2010,NULL,2009,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(25,3,'2010','Categoría 2010 - Vóley',2010,2010,NULL,2010,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(26,3,'2011-2010','Categoría 2011-2010 - Vóley',2010,2011,NULL,2010,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(27,3,'2011','Categoría 2011 - Vóley',2011,2011,NULL,2011,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(28,3,'2012-2011','Categoría 2012-2011 - Vóley',2011,2012,NULL,2011,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(29,3,'2013-2012','Categoría 2013-2012 - Vóley',2012,2013,NULL,2012,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(30,3,'2012-2013','Categoría 2012-2013 - Vóley',2012,2013,NULL,2012,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(31,3,'2013-2014','Categoría 2013-2014 - Vóley',2013,2014,NULL,2013,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(32,3,'2014','Categoría 2014 - Vóley',2014,2014,NULL,2014,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(33,3,'2015-2016','Categoría 2015-2016 - Vóley',2015,2016,NULL,2015,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(34,4,'2009-2008','Categoría 2009-2008 - Básquet',2008,2009,NULL,2008,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(35,4,'2009','Categoría 2009 - Básquet',2009,2009,NULL,2009,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(36,4,'2010-2011','Categoría 2010-2011 - Básquet',2010,2011,NULL,2010,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(37,4,'2010','Categoría 2010 - Básquet',2010,2010,NULL,2010,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(38,4,'2011','Categoría 2011 - Básquet',2011,2011,NULL,2011,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(39,4,'2012-2013','Categoría 2012-2013 - Básquet',2012,2013,NULL,2012,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(40,4,'2014','Categoría 2014 - Básquet',2014,2014,NULL,2014,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(41,4,'2015-2016','Categoría 2015-2016 - Básquet',2015,2016,NULL,2015,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(42,4,'2017','Categoría 2017 - Básquet',2017,2017,NULL,2017,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(43,5,'adulto +18','Categoría adulto +18 - MAMAS FIT',1900,2008,NULL,1900,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(44,6,'2009-2010','Categoría 2009-2010 - ASODE',2009,2010,NULL,2009,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(45,6,'2011-2012','Categoría 2011-2012 - ASODE',2011,2012,NULL,2011,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(46,6,'2012-2013','Categoría 2012-2013 - ASODE',2012,2013,NULL,2012,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(47,6,'2014','Categoría 2014 - ASODE',2014,2014,NULL,2014,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(48,6,'2015-2016','Categoría 2015-2016 - ASODE',2015,2016,NULL,2015,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(49,6,'2017','Categoría 2017 - ASODE',2017,2017,NULL,2017,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(50,7,'adulto +18','Categoría adulto +18 - Entrenamiento Funcional Mixto',1900,2008,NULL,1900,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34'),(51,8,'2005-2009','Categoría 2005-2009 - GYM JUVENIL',2005,2009,NULL,2005,'activo','2026-01-20 05:30:34','2026-01-20 05:30:34');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deportes`
--

DROP TABLE IF EXISTS `deportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deportes` (
  `deporte_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `icono` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('activo','inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `matricula` decimal(10,2) DEFAULT '20.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`deporte_id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `idx_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deportes`
--

LOCK TABLES `deportes` WRITE;
/*!40000 ALTER TABLE `deportes` DISABLE KEYS */;
INSERT INTO `deportes` VALUES (1,'Fútbol',NULL,'sports_soccer','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(2,'Fútbol Femenino',NULL,'sports_soccer','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(3,'Vóley',NULL,'sports_volleyball','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(4,'Básquet',NULL,'sports_basketball','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(5,'MAMAS FIT',NULL,'fitness_center','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(6,'ASODE',NULL,'sports','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(7,'Entrenamiento Funcional Mixto',NULL,'fitness_center','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29'),(8,'GYM JUVENIL',NULL,'fitness_center','activo',20.00,'2026-01-19 23:30:29','2026-01-19 23:30:29');
/*!40000 ALTER TABLE `deportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `horario_id` int NOT NULL AUTO_INCREMENT,
  `deporte_id` int NOT NULL,
  `dia` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `cupo_maximo` int NOT NULL DEFAULT '20',
  `cupos_ocupados` int NOT NULL DEFAULT '0',
  `estado` enum('activo','inactivo','suspendido') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  `categoria` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nivel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ano_min` int DEFAULT NULL,
  `ano_max` int DEFAULT NULL,
  `año_min` int DEFAULT NULL,
  `año_max` int DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Mixto') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Mixto',
  `precio` decimal(10,2) NOT NULL,
  `plan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`horario_id`),
  KEY `idx_deporte_dia` (`deporte_id`,`dia`),
  KEY `idx_horario` (`hora_inicio`,`hora_fin`),
  KEY `idx_estado` (`estado`),
  KEY `idx_dia` (`dia`),
  KEY `idx_categoria` (`categoria`),
  KEY `idx_horarios_cupos` (`estado`,`cupo_maximo`,`cupos_ocupados`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`deporte_id`) REFERENCES `deportes` (`deporte_id`) ON DELETE CASCADE,
  CONSTRAINT `chk_precio_positivo` CHECK ((`precio` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,5,'LUNES','06:30:00','07:40:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(2,5,'LUNES','07:45:00','09:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(3,1,'LUNES','08:10:00','09:20:00',20,0,'activo','2011-2012',NULL,2011,2012,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(4,1,'LUNES','08:10:00','09:20:00',20,0,'activo','2014-2013',NULL,2013,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(5,2,'LUNES','09:20:00','10:30:00',20,0,'activo','2010-2015',NULL,2010,2015,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(6,1,'LUNES','10:30:00','11:40:00',50,0,'activo','2016-2015',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(7,1,'LUNES','10:30:00','11:40:00',50,0,'activo','2009-2010',NULL,2009,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(8,1,'LUNES','11:40:00','12:50:00',20,0,'activo','2018-2017',NULL,2017,2018,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(9,5,'MIERCOLES','06:30:00','07:40:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(10,5,'MIERCOLES','07:45:00','09:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(11,1,'MIERCOLES','08:10:00','09:20:00',20,0,'activo','2011-2012',NULL,2011,2012,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(12,1,'MIERCOLES','08:10:00','09:20:00',20,0,'activo','2014-2013',NULL,2013,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(13,2,'MIERCOLES','09:20:00','10:30:00',20,0,'activo','2010-2015',NULL,2010,2015,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(14,1,'MIERCOLES','10:30:00','11:40:00',20,0,'activo','2016-2015',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(15,1,'MIERCOLES','10:30:00','11:40:00',20,0,'activo','2009-2010',NULL,2009,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(16,1,'MIERCOLES','11:40:00','12:50:00',20,0,'activo','2018-2017',NULL,2017,2018,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(17,3,'LUNES','08:30:00','09:40:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(18,3,'LUNES','08:30:00','09:40:00',20,0,'activo','2010',NULL,2010,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(19,3,'LUNES','09:40:00','10:50:00',20,0,'activo','2011',NULL,2011,2011,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(20,3,'LUNES','09:40:00','10:50:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(21,3,'LUNES','10:50:00','12:00:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(22,3,'LUNES','10:50:00','12:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(23,3,'MIERCOLES','08:30:00','09:40:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(24,3,'MIERCOLES','08:30:00','09:40:00',20,0,'activo','2010',NULL,2010,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(25,3,'MIERCOLES','09:40:00','10:50:00',20,0,'activo','2011',NULL,2011,2011,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(26,3,'MIERCOLES','09:40:00','10:50:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(27,3,'MIERCOLES','10:50:00','12:00:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(28,3,'MIERCOLES','10:50:00','12:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(29,5,'VIERNES','06:30:00','07:40:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(30,5,'VIERNES','07:45:00','09:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(31,3,'VIERNES','08:30:00','09:40:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(32,3,'VIERNES','08:30:00','09:40:00',20,0,'activo','2010',NULL,2010,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(33,3,'VIERNES','09:40:00','10:50:00',20,0,'activo','2011',NULL,2011,2011,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(34,3,'VIERNES','09:40:00','10:50:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(35,3,'VIERNES','10:50:00','12:00:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(36,3,'VIERNES','10:50:00','12:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(37,1,'VIERNES','08:10:00','09:20:00',20,0,'activo','2011-2012',NULL,2011,2012,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(38,1,'VIERNES','08:10:00','09:20:00',20,0,'activo','2014-2013',NULL,2013,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(39,2,'VIERNES','09:20:00','10:30:00',20,0,'activo','2010-2015',NULL,2010,2015,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(40,1,'VIERNES','10:30:00','11:40:00',20,0,'activo','2016-2015',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(41,1,'VIERNES','10:30:00','11:40:00',20,0,'activo','2009-2010',NULL,2009,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(42,1,'VIERNES','11:40:00','12:50:00',20,0,'activo','2018-2017',NULL,2017,2018,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(43,4,'MARTES','08:30:00','09:40:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(44,4,'MARTES','08:30:00','09:40:00',20,0,'activo','2010',NULL,2010,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(45,4,'MARTES','09:40:00','10:50:00',20,0,'activo','2011',NULL,2011,2011,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(46,4,'MARTES','09:40:00','10:50:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(47,4,'MARTES','10:50:00','12:00:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(48,4,'MARTES','10:50:00','12:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(49,4,'JUEVES','08:30:00','09:40:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(50,4,'JUEVES','08:30:00','09:40:00',20,0,'activo','2010',NULL,2010,2010,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(51,4,'JUEVES','09:40:00','10:50:00',20,0,'activo','2011',NULL,2011,2011,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(52,4,'JUEVES','09:40:00','10:50:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(53,4,'JUEVES','10:50:00','12:00:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(54,4,'JUEVES','10:50:00','12:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(55,6,'SABADO','15:30:00','16:30:00',20,0,'activo','2009-2010','PC',2009,2010,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(56,6,'SABADO','15:30:00','16:30:00',20,0,'activo','2011-2012','PC',2011,2012,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(57,6,'SABADO','16:30:00','17:30:00',20,0,'activo','2012-2013','PC',2012,2013,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(58,6,'SABADO','16:30:00','17:30:00',20,0,'activo','2014','PC',2014,2014,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(59,6,'SABADO','17:30:00','18:30:00',20,0,'activo','2015-2016','PC',2015,2016,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(60,6,'SABADO','17:30:00','18:30:00',20,0,'activo','2017','PC',2017,2017,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(61,1,'LUNES','15:30:00','16:55:00',20,0,'activo','2020-2021','NF',2020,2021,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(62,1,'LUNES','15:30:00','16:55:00',20,0,'activo','2019-2020','I',2019,2020,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(63,1,'LUNES','17:00:00','18:25:00',20,0,'activo','2017','PC',2017,2017,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(64,1,'LUNES','17:00:00','18:25:00',20,0,'activo','2016','PC',2016,2016,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(65,1,'LUNES','17:00:00','18:25:00',20,0,'activo','2014','I',2014,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(66,1,'LUNES','17:00:00','18:25:00',20,0,'activo','2015','NF',2015,2015,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(67,1,'LUNES','18:30:00','19:55:00',20,0,'activo','2014','PC',2014,2014,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(68,1,'LUNES','18:30:00','19:55:00',20,0,'activo','2015','PC',2015,2015,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(69,1,'LUNES','18:30:00','19:55:00',20,0,'activo','2013-2014-2015','PC',2013,2015,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(70,1,'MIERCOLES','15:30:00','16:55:00',20,0,'activo','2020-2021','NF',2020,2021,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(71,1,'MIERCOLES','15:30:00','16:55:00',20,0,'activo','2019','I',2019,2019,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(72,1,'MIERCOLES','17:00:00','18:25:00',20,0,'activo','2017','PC',2017,2017,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(73,1,'MIERCOLES','17:00:00','18:25:00',20,0,'activo','2016','PC',2016,2016,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(74,1,'MIERCOLES','17:00:00','18:25:00',20,0,'activo','2014','I',2014,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(75,1,'MIERCOLES','17:00:00','18:25:00',20,0,'activo','2015','NF',2015,2015,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(76,1,'MIERCOLES','18:30:00','19:55:00',20,0,'activo','2014','PC',2014,2014,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(77,1,'MIERCOLES','18:30:00','19:55:00',20,0,'activo','2015','PC',2015,2015,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(78,1,'MIERCOLES','18:30:00','19:55:00',20,0,'activo','2013-2014-2015','PREMIUM',2013,2015,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(79,1,'VIERNES','17:00:00','18:25:00',20,0,'activo','2017','PC',2017,2017,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(80,1,'VIERNES','17:00:00','18:25:00',20,0,'activo','2016','PC',2016,2016,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(81,1,'VIERNES','17:00:00','18:25:00',20,0,'activo','2014','I',2014,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(82,1,'VIERNES','17:00:00','18:25:00',20,0,'activo','2015','NF',2015,2015,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(83,1,'VIERNES','18:30:00','19:55:00',20,0,'activo','2014','PC',2014,2014,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(84,1,'VIERNES','18:30:00','19:55:00',20,0,'activo','2015','PC',2015,2015,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(85,1,'VIERNES','18:30:00','19:55:00',20,0,'activo','2013-2014-2015','PREMIUM',2013,2015,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-20 05:40:31'),(86,1,'MARTES','15:30:00','16:50:00',20,0,'activo','2018-2019','NF',2018,2019,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(87,1,'MARTES','15:30:00','16:50:00',20,0,'activo','2020-2021','NF',2020,2021,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(88,1,'MARTES','15:30:00','16:50:00',20,0,'activo','2008-2009-2010-2011','NF',2008,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(89,1,'MARTES','17:00:00','18:20:00',20,0,'activo','2017-2016','NF',2016,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(90,1,'MARTES','17:00:00','18:20:00',20,0,'activo','2017-2016','NF',2016,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(91,1,'MARTES','17:00:00','18:20:00',20,0,'activo','2014-2013-2012','NF',2012,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(92,1,'MARTES','18:30:00','19:50:00',20,0,'activo','2009-2010-2011-2012','PC',2009,2012,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(93,1,'JUEVES','15:30:00','16:50:00',20,0,'activo','2018-2019','NF',2018,2019,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(94,1,'JUEVES','15:30:00','16:50:00',20,0,'activo','2020-2021','NF',2020,2021,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(95,1,'JUEVES','15:30:00','16:50:00',20,0,'activo','2008-2009-2010-2011','NF',2008,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(96,1,'JUEVES','17:00:00','18:20:00',20,0,'activo','2017-2016','NF',2016,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(97,1,'JUEVES','17:00:00','18:20:00',20,0,'activo','2017-2016','NF',2016,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(98,1,'JUEVES','17:00:00','18:20:00',20,0,'activo','2014-2013-2012','NF',2012,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(99,1,'JUEVES','18:30:00','19:50:00',20,0,'activo','2009-2010-2011-2012','PREMIUM',2009,2012,NULL,NULL,'Mixto',200.00,'Premium','2026-01-19 23:30:29','2026-01-19 23:30:29'),(100,1,'SABADO','08:30:00','09:50:00',20,0,'activo','2008-2009',NULL,2008,2009,NULL,NULL,'Mixto',0.00,'','2026-01-19 23:30:29','2026-01-19 23:30:29'),(101,1,'SABADO','08:30:00','09:50:00',20,0,'activo','2010-2011','NF',2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(102,1,'SABADO','08:30:00','09:50:00',20,0,'activo','2012-2013','NF',2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(103,1,'SABADO','08:30:00','09:50:00',20,0,'activo','2014','NF',2014,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(104,1,'SABADO','10:00:00','11:20:00',20,0,'activo','2017-2016','NF',2016,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(105,1,'SABADO','10:00:00','11:20:00',20,0,'activo','2017-2016','NF',2016,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(106,3,'LUNES','14:30:00','16:00:00',20,0,'activo','2013-2014','BÁSICO',2013,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(107,3,'LUNES','14:30:00','16:00:00',20,0,'activo','2015-2016','BÁSICO',2015,2016,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(108,3,'LUNES','16:00:00','17:30:00',20,0,'activo','2010-2009','BÁSICO',2009,2010,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(109,3,'LUNES','16:00:00','17:30:00',20,0,'activo','2012-2011','BÁSICO',2011,2012,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(110,3,'LUNES','17:30:00','19:00:00',20,0,'activo','2011-2010','AVANZADO',2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(111,3,'LUNES','17:30:00','19:00:00',20,0,'activo','2013-2012','AVANZADO',2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(112,7,'LUNES','15:45:00','16:45:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Mixto',100.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(113,8,'LUNES','15:00:00','16:00:00',20,0,'activo','2005-2009','AVANZADO',2005,2009,NULL,NULL,'Mixto',100.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(114,5,'LUNES','16:00:00','17:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(115,3,'MIERCOLES','14:30:00','16:00:00',20,0,'activo','2013-2014','BÁSICO',2013,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(116,3,'MIERCOLES','14:30:00','16:00:00',20,0,'activo','2015-2016','BÁSICO',2015,2016,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(117,3,'MIERCOLES','16:00:00','17:30:00',20,0,'activo','2010-2009','BÁSICO',2009,2010,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(118,3,'MIERCOLES','16:00:00','17:30:00',20,0,'activo','2012-2011','BÁSICO',2011,2012,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(119,3,'MIERCOLES','17:30:00','19:00:00',20,0,'activo','2011-2010','AVANZADO',2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(120,3,'MIERCOLES','17:30:00','19:00:00',20,0,'activo','2013-2012','AVANZADO',2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(121,7,'MIERCOLES','15:45:00','16:45:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Mixto',100.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(122,3,'VIERNES','14:30:00','16:00:00',20,0,'activo','2013-2014','BÁSICO',2013,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(123,3,'VIERNES','14:30:00','16:00:00',20,0,'activo','2015-2016','BÁSICO',2015,2016,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(124,3,'VIERNES','16:00:00','17:30:00',20,0,'activo','2010-2009','BÁSICO',2009,2010,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(125,3,'VIERNES','16:00:00','17:30:00',20,0,'activo','2012-2011','BÁSICO',2011,2012,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(126,3,'VIERNES','17:30:00','19:00:00',20,0,'activo','2011-2010','AVANZADO',2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(127,3,'VIERNES','17:30:00','19:00:00',20,0,'activo','2013-2012','AVANZADO',2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(128,7,'VIERNES','15:45:00','16:45:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Mixto',100.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(129,8,'VIERNES','15:00:00','16:00:00',20,0,'activo','2005-2009',NULL,2005,2009,NULL,NULL,'Mixto',100.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(130,5,'VIERNES','16:00:00','17:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(131,4,'MARTES','14:30:00','16:00:00',20,0,'activo','2017',NULL,2017,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(132,4,'MARTES','14:30:00','16:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(133,4,'MARTES','16:00:00','17:30:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(134,4,'MARTES','16:00:00','17:30:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(135,4,'MARTES','17:30:00','19:00:00',20,0,'activo','2009',NULL,2009,2009,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(136,4,'MARTES','17:30:00','19:00:00',20,0,'activo','2010-2011',NULL,2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(137,4,'JUEVES','14:30:00','16:00:00',20,0,'activo','2017',NULL,2017,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(138,4,'JUEVES','14:30:00','16:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(139,4,'JUEVES','16:00:00','17:30:00',20,0,'activo','2011',NULL,2011,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(140,4,'JUEVES','16:00:00','17:30:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(141,4,'JUEVES','17:30:00','19:00:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(142,4,'JUEVES','17:30:00','19:00:00',20,0,'activo','2010-2011',NULL,2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(143,4,'SABADO','08:30:00','10:00:00',20,0,'activo','2009-2008',NULL,2008,2009,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-19 23:30:29'),(144,4,'SABADO','08:30:00','10:00:00',20,0,'activo','2010-2011',NULL,2010,2011,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(145,4,'SABADO','10:00:00','11:30:00',20,0,'activo','2012-2013',NULL,2012,2013,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(146,4,'SABADO','10:00:00','11:30:00',20,0,'activo','2014',NULL,2014,2014,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(147,4,'SABADO','11:30:00','13:00:00',20,0,'activo','2015-2016',NULL,2015,2016,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(148,4,'SABADO','11:30:00','13:00:00',20,0,'activo','2017',NULL,2017,2017,NULL,NULL,'Mixto',120.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(149,5,'LUNES','17:00:00','18:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-19 23:30:29'),(150,8,'MIERCOLES','15:00:00','16:00:00',20,0,'activo','2005-2009',NULL,2005,2009,NULL,NULL,'Mixto',100.00,'Estándar','2026-01-19 23:30:29','2026-01-20 05:40:31'),(151,5,'MIERCOLES','16:00:00','17:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(152,5,'MIERCOLES','17:00:00','18:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31'),(153,5,'VIERNES','17:00:00','18:00:00',20,0,'activo','adulto +18',NULL,1900,2008,NULL,NULL,'Femenino',60.00,'Económico','2026-01-19 23:30:29','2026-01-20 05:40:31');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion_horarios`
--

DROP TABLE IF EXISTS `inscripcion_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion_horarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inscripcion_id` int NOT NULL,
  `horario_id` int NOT NULL,
  `fecha_asignacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('activo','inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_inscripcion_horario` (`inscripcion_id`,`horario_id`),
  KEY `idx_inscripcion` (`inscripcion_id`),
  KEY `idx_horario` (`horario_id`),
  CONSTRAINT `inscripcion_horarios_ibfk_1` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripciones` (`inscripcion_id`) ON DELETE CASCADE,
  CONSTRAINT `inscripcion_horarios_ibfk_2` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion_horarios`
--

LOCK TABLES `inscripcion_horarios` WRITE;
/*!40000 ALTER TABLE `inscripcion_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripcion_horarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_inscripcion_horario_insert` AFTER INSERT ON `inscripcion_horarios` FOR EACH ROW BEGIN
    
    IF (SELECT estado FROM inscripciones WHERE inscripcion_id = NEW.inscripcion_id) != 'cancelada' THEN
        UPDATE horarios 
        SET cupos_ocupados = cupos_ocupados + 1
        WHERE horario_id = NEW.horario_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_inscripcion_horario_delete` AFTER DELETE ON `inscripcion_horarios` FOR EACH ROW BEGIN
    
    IF (SELECT estado FROM inscripciones WHERE inscripcion_id = OLD.inscripcion_id) != 'cancelada' THEN
        UPDATE horarios 
        SET cupos_ocupados = GREATEST(cupos_ocupados - 1, 0)
        WHERE horario_id = OLD.horario_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones` (
  `inscripcion_id` int NOT NULL AUTO_INCREMENT,
  `codigo_operacion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alumno_id` int NOT NULL,
  `deporte_id` int NOT NULL,
  `fecha_inscripcion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('pendiente','activa','cancelada','suspendida') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `plan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio_mensual` decimal(10,2) NOT NULL,
  `matricula_pagada` tinyint(1) DEFAULT '0',
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`inscripcion_id`),
  KEY `deporte_id` (`deporte_id`),
  KEY `idx_alumno` (`alumno_id`),
  KEY `idx_estado` (`estado`),
  KEY `idx_fecha_inscripcion` (`fecha_inscripcion`),
  KEY `idx_inscripciones_estado` (`estado`),
  KEY `idx_inscripciones_fecha` (`fecha_inscripcion`),
  CONSTRAINT `inscripciones_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE CASCADE,
  CONSTRAINT `inscripciones_ibfk_2` FOREIGN KEY (`deporte_id`) REFERENCES `deportes` (`deporte_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones`
--

LOCK TABLES `inscripciones` WRITE;
/*!40000 ALTER TABLE `inscripciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_inscripcion_update` AFTER UPDATE ON `inscripciones` FOR EACH ROW BEGIN
    
    IF OLD.estado != 'cancelada' AND NEW.estado = 'cancelada' THEN
        UPDATE horarios h
        JOIN inscripcion_horarios ih ON h.horario_id = ih.horario_id
        SET h.cupos_ocupados = GREATEST(h.cupos_ocupados - 1, 0)
        WHERE ih.inscripcion_id = NEW.inscripcion_id;
    END IF;
    
    
    IF OLD.estado = 'cancelada' AND NEW.estado != 'cancelada' THEN
        UPDATE horarios h
        JOIN inscripcion_horarios ih ON h.horario_id = ih.horario_id
        SET h.cupos_ocupados = h.cupos_ocupados + 1
        WHERE ih.inscripcion_id = NEW.inscripcion_id;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inscripciones_horarios`
--

DROP TABLE IF EXISTS `inscripciones_horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripciones_horarios` (
  `inscripcion_horario_id` int NOT NULL AUTO_INCREMENT,
  `inscripcion_id` int NOT NULL,
  `horario_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inscripcion_horario_id`),
  UNIQUE KEY `unique_inscripcion_horario` (`inscripcion_id`,`horario_id`),
  KEY `horario_id` (`horario_id`),
  CONSTRAINT `inscripciones_horarios_ibfk_1` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripciones` (`inscripcion_id`) ON DELETE CASCADE,
  CONSTRAINT `inscripciones_horarios_ibfk_2` FOREIGN KEY (`horario_id`) REFERENCES `horarios` (`horario_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1164 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripciones_horarios`
--

LOCK TABLES `inscripciones_horarios` WRITE;
/*!40000 ALTER TABLE `inscripciones_horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `inscripciones_horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs_actividad`
--

DROP TABLE IF EXISTS `logs_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_actividad` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `accion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tabla_afectada` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registro_id` int DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `idx_admin` (`admin_id`),
  KEY `idx_fecha` (`created_at`),
  CONSTRAINT `logs_actividad_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `administradores` (`admin_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_actividad`
--

LOCK TABLES `logs_actividad` WRITE;
/*!40000 ALTER TABLE `logs_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `inscripcion_id` int NOT NULL,
  `tipo_pago` enum('matricula','mensualidad','clase_extra') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `metodo_pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banco` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_operacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comprobante_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `estado` enum('pendiente','verificado','rechazado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `verificado_por` int DEFAULT NULL,
  `fecha_verificacion` timestamp NULL DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pago_id`),
  KEY `idx_inscripcion` (`inscripcion_id`),
  KEY `idx_estado` (`estado`),
  KEY `idx_fecha_pago` (`fecha_pago`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`inscripcion_id`) REFERENCES `inscripciones` (`inscripcion_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos_mensuales`
--

DROP TABLE IF EXISTS `pagos_mensuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_mensuales` (
  `pago_id` int NOT NULL AUTO_INCREMENT,
  `alumno_id` int NOT NULL,
  `mes` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `año` int NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `comprobante_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fecha_pago` datetime DEFAULT NULL,
  `estado` enum('pendiente','confirmado','rechazado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `metodo_pago` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pago_id`),
  UNIQUE KEY `unique_alumno_mes` (`alumno_id`,`mes`,`año`),
  CONSTRAINT `pagos_mensuales_ibfk_1` FOREIGN KEY (`alumno_id`) REFERENCES `alumnos` (`alumno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos_mensuales`
--

LOCK TABLES `pagos_mensuales` WRITE;
/*!40000 ALTER TABLE `pagos_mensuales` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos_mensuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `dni` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `edad` int DEFAULT NULL,
  `sexo` enum('Masculino','Femenino','Mixto') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apoderado` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `seguro_tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condicion_medica` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `telefono_apoderado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url_dni_frontal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_dni_reverso` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_foto_carnet` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_comprobante` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `estado_usuario` enum('pendiente','activo','inactivo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `estado_pago` enum('pendiente','confirmado','rechazado') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'pendiente',
  `fecha_pago` datetime DEFAULT NULL,
  `monto_pago` decimal(10,2) DEFAULT NULL,
  `numero_operacion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notas_pago` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `dni` (`dni`),
  KEY `idx_dni` (`dni`),
  KEY `idx_estado_pago` (`estado_pago`),
  KEY `idx_estado_usuario` (`estado_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_horarios_completos`
--

DROP TABLE IF EXISTS `vista_horarios_completos`;
/*!50001 DROP VIEW IF EXISTS `vista_horarios_completos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_horarios_completos` AS SELECT 
 1 AS `horario_id`,
 1 AS `deporte`,
 1 AS `dia`,
 1 AS `hora_inicio`,
 1 AS `hora_fin`,
 1 AS `cupo_maximo`,
 1 AS `cupos_ocupados`,
 1 AS `cupos_disponibles`,
 1 AS `estado`,
 1 AS `categoria`,
 1 AS `nivel`,
 1 AS `genero`,
 1 AS `precio`,
 1 AS `plan`,
 1 AS `año_min`,
 1 AS `año_max`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_inscripciones_activas`
--

DROP TABLE IF EXISTS `vista_inscripciones_activas`;
/*!50001 DROP VIEW IF EXISTS `vista_inscripciones_activas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inscripciones_activas` AS SELECT 
 1 AS `inscripcion_id`,
 1 AS `alumno_id`,
 1 AS `dni`,
 1 AS `nombre_completo`,
 1 AS `deporte`,
 1 AS `plan`,
 1 AS `precio_mensual`,
 1 AS `estado`,
 1 AS `fecha_inscripcion`,
 1 AS `cantidad_horarios`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'jaguares_db'
--

--
-- Dumping routines for database 'jaguares_db'
--

--
-- Current Database: `jaguares_db`
--

USE `jaguares_db`;

--
-- Final view structure for view `vista_horarios_completos`
--

/*!50001 DROP VIEW IF EXISTS `vista_horarios_completos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_horarios_completos` AS select `h`.`horario_id` AS `horario_id`,`d`.`nombre` AS `deporte`,`h`.`dia` AS `dia`,`h`.`hora_inicio` AS `hora_inicio`,`h`.`hora_fin` AS `hora_fin`,`h`.`cupo_maximo` AS `cupo_maximo`,`h`.`cupos_ocupados` AS `cupos_ocupados`,(`h`.`cupo_maximo` - `h`.`cupos_ocupados`) AS `cupos_disponibles`,`h`.`estado` AS `estado`,`h`.`categoria` AS `categoria`,`h`.`nivel` AS `nivel`,`h`.`genero` AS `genero`,`h`.`precio` AS `precio`,`h`.`plan` AS `plan`,`h`.`año_min` AS `año_min`,`h`.`año_max` AS `año_max` from (`horarios` `h` join `deportes` `d` on((`h`.`deporte_id` = `d`.`deporte_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_inscripciones_activas`
--

/*!50001 DROP VIEW IF EXISTS `vista_inscripciones_activas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inscripciones_activas` AS select `i`.`inscripcion_id` AS `inscripcion_id`,`a`.`alumno_id` AS `alumno_id`,`a`.`dni` AS `dni`,concat(`a`.`nombres`,' ',`a`.`apellido_paterno`,' ',`a`.`apellido_materno`) AS `nombre_completo`,`d`.`nombre` AS `deporte`,`i`.`plan` AS `plan`,`i`.`precio_mensual` AS `precio_mensual`,`i`.`estado` AS `estado`,`i`.`fecha_inscripcion` AS `fecha_inscripcion`,count(`ih`.`horario_id`) AS `cantidad_horarios` from (((`inscripciones` `i` join `alumnos` `a` on((`i`.`alumno_id` = `a`.`alumno_id`))) join `deportes` `d` on((`i`.`deporte_id` = `d`.`deporte_id`))) left join `inscripcion_horarios` `ih` on((`i`.`inscripcion_id` = `ih`.`inscripcion_id`))) where (`i`.`estado` = 'activa') group by `i`.`inscripcion_id`,`a`.`alumno_id`,`a`.`dni`,`a`.`nombres`,`a`.`apellido_paterno`,`a`.`apellido_materno`,`d`.`nombre`,`i`.`plan`,`i`.`precio_mensual`,`i`.`estado`,`i`.`fecha_inscripcion` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-20  0:44:26
