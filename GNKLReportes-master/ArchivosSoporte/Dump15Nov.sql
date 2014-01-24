CREATE DATABASE  IF NOT EXISTS `gnklogistica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gnklogistica`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: soriana4
-- ------------------------------------------------------
-- Server version	5.1.60-community

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
-- Table structure for table `beneficiario`
--

DROP TABLE IF EXISTS `beneficiario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beneficiario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `num_seguro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beneficiario`
--

LOCK TABLES `beneficiario` WRITE;
/*!40000 ALTER TABLE `beneficiario` DISABLE KEYS */;
INSERT INTO `beneficiario` VALUES (1,'DE LEON ROMERO LAURA',NULL,NULL);
/*!40000 ALTER TABLE `beneficiario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cie`
--

DROP TABLE IF EXISTS `cie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cie` (
  `id` varchar(5) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cie`
--

LOCK TABLES `cie` WRITE;
/*!40000 ALTER TABLE `cie` DISABLE KEYS */;
/*!40000 ALTER TABLE `cie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenido_receta`
--

DROP TABLE IF EXISTS `contenido_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenido_receta` (
  `id` int(11) NOT NULL,
  `folio_receta` int(11) NOT NULL,
  `clave_medicamento` varchar(15) NOT NULL,
  `cant_solicitada` int(11) DEFAULT NULL,
  `cant_surtida` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folio_receta` (`folio_receta`),
  KEY `clave_medicamento` (`clave_medicamento`),
  CONSTRAINT `contenido_receta_ibfk_1` FOREIGN KEY (`folio_receta`) REFERENCES `receta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contenido_receta_ibfk_2` FOREIGN KEY (`clave_medicamento`) REFERENCES `insumo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenido_receta`
--

LOCK TABLES `contenido_receta` WRITE;
/*!40000 ALTER TABLE `contenido_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `contenido_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_log`
--

DROP TABLE IF EXISTS `error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error_log` (
  `error_mesaage` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_log`
--

LOCK TABLES `error_log` WRITE;
/*!40000 ALTER TABLE `error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excel`
--

DROP TABLE IF EXISTS `excel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `excel` (
  `folio_rec` int(11) DEFAULT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `hora` varchar(20) DEFAULT NULL,
  `jurisdiccion` varchar(50) DEFAULT NULL,
  `no_juris` varchar(5) DEFAULT NULL,
  `unidad_atencion_nom` varchar(50) DEFAULT NULL,
  `paciente_nom` varchar(200) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `programa_id` int(11) DEFAULT NULL,
  `programa_nombre_ini` varchar(20) DEFAULT NULL,
  `medico_universidad` varchar(50) DEFAULT NULL,
  `medico_cedula` int(11) DEFAULT NULL,
  `medico_nombre` varchar(200) DEFAULT NULL,
  `causes` varchar(20) DEFAULT NULL,
  `insumo_clave` varchar(15) DEFAULT NULL,
  `insumo_descripcion` text,
  `cantidad_solicitada` int(11) DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `surtido` varchar(5) DEFAULT NULL,
  `encargado` varchar(200) DEFAULT NULL,
  `unidad_clave` int(11) DEFAULT NULL,
  `insumo_tipo` varchar(80) DEFAULT NULL,
  `cv_uni_dgo` int(11) DEFAULT NULL,
  `cv_tipo_unidad` int(11) DEFAULT NULL,
  `cv_finan` int(11) DEFAULT NULL,
  `nombre_programa` varchar(100) DEFAULT NULL,
  `layout` varchar(50) DEFAULT NULL,
  `origen_id` int(11) DEFAULT NULL,
  `presentacion` varchar(20) DEFAULT NULL,
  `cantidad_pendiente` int(11) DEFAULT NULL,
  `status_receta` varchar(50) DEFAULT NULL,
  `tipo_receta` varchar(5) DEFAULT NULL,
  `precio` decimal(9,3) DEFAULT NULL,
  `precio_tt` varchar(14) DEFAULT NULL,
  `lote` varchar(14) DEFAULT NULL,
  `caducidad` varchar(15) DEFAULT NULL,
  `carnet` varchar(15) DEFAULT NULL,
  `servicio` varchar(50) DEFAULT NULL,
  `dia` varchar(10) DEFAULT NULL,
  `cuase_descripcion` varchar(200) DEFAULT NULL,
  `unidad_tipo` varchar(20) DEFAULT NULL,
  `ap` varchar(5) DEFAULT NULL,
  `aq` varchar(5) DEFAULT NULL,
  `ar` varchar(5) DEFAULT NULL,
  `campanis` varchar(20) DEFAULT NULL,
  `municipio_nombre` varchar(50) DEFAULT NULL,
  `costo_u` decimal(9,3) DEFAULT NULL,
  `costo` decimal(9,3) DEFAULT NULL,
  `cedis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excel`
--

LOCK TABLES `excel` WRITE;
/*!40000 ALTER TABLE `excel` DISABLE KEYS */;
/*!40000 ALTER TABLE `excel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `clave` varchar(15) NOT NULL,
  `id_origen` int(11) DEFAULT NULL,
  `descripcion` text,
  `presentacion` varchar(50) DEFAULT NULL,
  `tipo` enum('Psicotropico','Material de Curacion','Medicamento','Antibiotico','Otro') DEFAULT NULL,
  `precio_unitario` decimal(9,3) DEFAULT NULL,
  `lab` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`clave`),
  KEY `id_origen` (`id_origen`),
  CONSTRAINT `insumo_ibfk_1` FOREIGN KEY (`id_origen`) REFERENCES `origen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES ('2128',2,'AMOXICILINA CAPSULAS DE 500MG.  ENVASE  C/12 O 15 CAPSULAS','CAJA','Psicotropico',NULL,'MARLEX HEALTH CARE S DE RL DE CV');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_unidad` varchar(10) NOT NULL,
  `clave_insumo` varchar(15) NOT NULL,
  `existencias` int(11) DEFAULT NULL,
  `stock_min` int(11) DEFAULT NULL,
  `stock_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_unidad`,`clave_insumo`),
  KEY `clave_insumo` (`clave_insumo`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidad_atencion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`clave_insumo`) REFERENCES `insumo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_mensual`
--

DROP TABLE IF EXISTS `inventario_mensual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_mensual` (
  `id_unidad` varchar(10) NOT NULL,
  `clave_insumo` varchar(15) NOT NULL,
  `mes` int(11) NOT NULL,
  `existencias` int(11) DEFAULT NULL,
  `stock_min` int(11) DEFAULT NULL,
  `stock_max` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_unidad`,`clave_insumo`,`mes`),
  KEY `clave_insumo` (`clave_insumo`),
  CONSTRAINT `inventario_mensual_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidad_atencion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventario_mensual_ibfk_2` FOREIGN KEY (`clave_insumo`) REFERENCES `insumo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_mensual`
--

LOCK TABLES `inventario_mensual` WRITE;
/*!40000 ALTER TABLE `inventario_mensual` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_mensual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurisdiccion`
--

DROP TABLE IF EXISTS `jurisdiccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurisdiccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurisdiccion`
--

LOCK TABLES `jurisdiccion` WRITE;
/*!40000 ALTER TABLE `jurisdiccion` DISABLE KEYS */;
INSERT INTO `jurisdiccion` VALUES (1,'JURISDICCION SANITARIA I'),(2,'JURISDICCION SANITARIA II'),(3,'JURISDICCION SANITARIA III'),(4,'JURISDICCION SANITARIA IV');
/*!40000 ALTER TABLE `jurisdiccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `cedula_profesional` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `domicilio` text,
  PRIMARY KEY (`cedula_profesional`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_unidad`
--

DROP TABLE IF EXISTS `medico_unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_unidad` (
  `cedula_medico` int(11) NOT NULL,
  `id_unidad` varchar(10) NOT NULL,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`cedula_medico`,`id_unidad`,`fecha`),
  KEY `id_unidad` (`id_unidad`),
  CONSTRAINT `medico_unidad_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidad_atencion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medico_unidad_ibfk_2` FOREIGN KEY (`cedula_medico`) REFERENCES `medico` (`cedula_profesional`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_unidad`
--

LOCK TABLES `medico_unidad` WRITE;
/*!40000 ALTER TABLE `medico_unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_jurisdiccion` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_jurisdiccion` (`id_jurisdiccion`),
  CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`id_jurisdiccion`) REFERENCES `jurisdiccion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,1,'DURANGO'),(2,1,'MEZQUITAL'),(3,1,'VICENTE GUERRERO'),(4,1,'POANAS'),(5,1,'PUEBLO NUEVO'),(6,1,'SAN DIMAS'),(7,1,'SUCHIL'),(8,1,'TAMAZULA'),(9,1,'NOMBRE DE DIOS'),(10,1,'PANUCO DE CORONADO'),(11,1,'GUADALUPE VICTORIA'),(12,2,'CUENCAME'),(13,2,'GOMEZ PALACIO'),(14,2,'LERDO'),(15,2,'MAPIMI'),(16,2,'NAZAS'),(17,2,'PE¥ON BLANCO'),(18,2,'TLAHUALILO'),(19,3,'CANATLAN'),(20,3,'GUANACEVI'),(21,3,'SANTIAGO PAPASQUIARO'),(22,3,'TEPEHUANES'),(23,3,'NUEVO IDEAL'),(24,4,'INDE'),(25,4,'EL ORO'),(26,4,'RODEO'),(27,4,'SAN JUAN DEL RIO'),(28,4,'OCAMPO');
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origen`
--

DROP TABLE IF EXISTS `origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origen`
--

LOCK TABLES `origen` WRITE;
/*!40000 ALTER TABLE `origen` DISABLE KEYS */;
INSERT INTO `origen` VALUES (1,'SSD'),(2,'Soriana');
/*!40000 ALTER TABLE `origen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `id_unidad` varchar(10) NOT NULL,
  `clave_insumo` varchar(15) NOT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `fecha_abasto` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_unidad` (`id_unidad`),
  KEY `clave_insumo` (`clave_insumo`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_unidad`) REFERENCES `unidad_atencion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`clave_insumo`) REFERENCES `insumo` (`clave`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_receta`
--

DROP TABLE IF EXISTS `pedido_receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido_receta` (
  `id` int(11) NOT NULL,
  `folio_receta` int(11) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_abasto` date DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folio_receta` (`folio_receta`),
  CONSTRAINT `pedido_receta_ibfk_1` FOREIGN KEY (`folio_receta`) REFERENCES `receta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_receta`
--

LOCK TABLES `pedido_receta` WRITE;
/*!40000 ALTER TABLE `pedido_receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,'Seguro Popular'),(2,'Poblacion Abierta'),(3,'Oportunidades');
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta` (
  `folio` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_programa` int(11) DEFAULT NULL,
  `cedula_medico` int(11) DEFAULT NULL,
  `id_beneficiario` int(11) DEFAULT NULL,
  `tipo_receta` enum('Receta Farmacia','Receta Colectiva') DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_causes` varchar(5) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`folio`),
  KEY `id_programa` (`id_programa`),
  KEY `cedula_medico` (`cedula_medico`),
  KEY `id_causes` (`id_causes`),
  KEY `id_servicio` (`id_servicio`),
  KEY `id_beneficiario` (`id_beneficiario`),
  CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`cedula_medico`) REFERENCES `medico` (`cedula_profesional`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receta_ibfk_3` FOREIGN KEY (`id_causes`) REFERENCES `cie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receta_ibfk_4` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `receta_ibfk_5` FOREIGN KEY (`id_beneficiario`) REFERENCES `beneficiario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida_medicamento`
--

DROP TABLE IF EXISTS `salida_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salida_medicamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio_receta` int(11) DEFAULT NULL,
  `clave_medicamento` varchar(15) DEFAULT NULL,
  `cant_solicitada` int(11) DEFAULT NULL,
  `cant_surtida` int(11) DEFAULT NULL,
  `saldo_insumo` int(11) DEFAULT NULL,
  `retiene_receta` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `folio_receta` (`folio_receta`),
  KEY `clave_medicamento` (`clave_medicamento`),
  CONSTRAINT `salida_medicamento_ibfk_1` FOREIGN KEY (`folio_receta`) REFERENCES `receta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salida_medicamento_ibfk_2` FOREIGN KEY (`clave_medicamento`) REFERENCES `inventario` (`clave_insumo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida_medicamento`
--

LOCK TABLES `salida_medicamento` WRITE;
/*!40000 ALTER TABLE `salida_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `salida_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'ADMINISTRACION'),(2,'ANESTESIOLOGIA'),(3,'ANTIALACRAN'),(4,'BANCO DE SANGRE'),(5,'CENDIS'),(6,'CENTRAL DE MEZCLAS'),(7,'CEYE'),(8,'CIRUGIA'),(9,'CITOLOGIA'),(10,'CLINICA DE CATETER ADULTO'),(11,'CLINICA DE CATETER PEDIATRICO'),(12,'CLINICA DE DISPLASIAS'),(13,'CLINICA DE MAMA'),(14,'CONSULTA'),(15,'CONSULTA EXTERNA'),(16,'CONSULTORIO 1'),(17,'CONSULTORIO 2'),(18,'CONSULTORIO 3'),(19,'CONSULTORIO 5'),(20,'COORDINADOR DE SERV. DE SALUD.'),(21,'CURACIONES'),(22,'DENTAL'),(23,'DENTAL Y ADMINISTRACION'),(24,'DENTISTA'),(25,'DIETETICA'),(26,'DIRECCION'),(27,'DONACION'),(28,'ELECTROENCEFALOGRAFIA'),(29,'EMODINAMIA'),(30,'ENDOSCOPIA'),(31,'ENFERMERIA'),(32,'GINECOLOGIA'),(33,'HEMODIALISIS'),(34,'HEMODINAMIA'),(35,'HINALOTERAPIA'),(36,'HOMBRES'),(37,'HOSPITALIZACION'),(38,'INGENIERIA BIOMEDICA'),(39,'INHALOTERAPIA'),(40,'JEFATURA DE ENFERMERIA'),(41,'JEFATURA DE URGENCIAS ENFERMERIA'),(42,'LABORATORIO'),(43,'LABORATORIO DE ANALISIS CLINICOS'),(44,'LABORATORIO DE MICROBIOLOGIA'),(45,'LABORATORIO Y EXPULSION'),(46,'LAPAROSCOPIA'),(47,'MEDICINA INTERNA'),(48,'MEDICINA PREVENTIVA'),(49,'MEZCLAS'),(50,'MODULO OPORTUNIDADES'),(51,'MUJER'),(52,'NEONATOS'),(53,'OFTALMOLOGIA'),(54,'ORTOPEDIA'),(55,'PATOLOGIA'),(56,'PEDIATRIA'),(57,'PLANIFICACION'),(58,'PLANIFICACION FAMILIAR'),(59,'PROCEDIMIENTOS'),(60,'QUIROFANO'),(61,'QUIROFANO DE OFTALMOLOGIA'),(62,'QUIROFANO Y ANESTESIA'),(63,'RADIOLOGIA'),(64,'RAYOS X'),(65,'REHABILITACION'),(66,'RESONANCIA MAGNETICA'),(67,'SALUD REPRODUCTIVA'),(68,'SEGURO POPULAR'),(69,'SUBDIRECCION ADMINISTRATIVA'),(70,'SUBDIRECCION MEDICA'),(71,'SUPERVISION DE ENFERMERIA'),(72,'TERAPIA INTENSIVA'),(73,'TOCOCIRUGIA'),(74,'TOMOGRAFIA'),(75,'TRANSFUSION SANGUINEA'),(76,'TRANSPLANTES'),(77,'UCI'),(78,'ULTRASONIDO'),(79,'UNIDAD CORONARIA'),(80,'UNIDAD MEDICA'),(81,'URGENCIAS'),(82,'UTIA'),(83,'UTIP'),(84,'VACUNACION'),(85,'VACUNAS'),(86,'VASECTOMIAS'),(87,'YESO Y CURACIONES');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_hospital`
--

DROP TABLE IF EXISTS `servicio_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio_hospital` (
  `id_servicio` int(11) NOT NULL DEFAULT '0',
  `id_unidad` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_servicio`,`id_unidad`),
  KEY `id_unidad` (`id_unidad`),
  CONSTRAINT `servicio_hospital_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `servicio_hospital_ibfk_2` FOREIGN KEY (`id_unidad`) REFERENCES `unidad_atencion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_hospital`
--

LOCK TABLES `servicio_hospital` WRITE;
/*!40000 ALTER TABLE `servicio_hospital` DISABLE KEYS */;
INSERT INTO `servicio_hospital` VALUES (3,'u1001'),(6,'u1001'),(7,'u1001'),(8,'u1001'),(10,'u1001'),(11,'u1001'),(12,'u1001'),(13,'u1001'),(15,'u1001'),(21,'u1001'),(25,'u1001'),(28,'u1001'),(30,'u1001'),(32,'u1001'),(33,'u1001'),(34,'u1001'),(35,'u1001'),(43,'u1001'),(44,'u1001'),(46,'u1001'),(47,'u1001'),(52,'u1001'),(54,'u1001'),(55,'u1001'),(56,'u1001'),(60,'u1001'),(61,'u1001'),(64,'u1001'),(65,'u1001'),(66,'u1001'),(69,'u1001'),(70,'u1001'),(71,'u1001'),(73,'u1001'),(74,'u1001'),(75,'u1001'),(78,'u1001'),(79,'u1001'),(81,'u1001'),(82,'u1001'),(83,'u1001'),(87,'u1001');
/*!40000 ALTER TABLE `servicio_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_atencion`
--

DROP TABLE IF EXISTS `unidad_atencion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_atencion` (
  `id` varchar(10) NOT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_municipio` (`id_municipio`),
  CONSTRAINT `unidad_atencion_ibfk_1` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_atencion`
--

LOCK TABLES `unidad_atencion` WRITE;
/*!40000 ALTER TABLE `unidad_atencion` DISABLE KEYS */;
INSERT INTO `unidad_atencion` VALUES ('u1001',1,'HOSPITAL GENERAL DE DURANGO (INTRAHOSPITALARIA)'),('u1002',1,'HOSPITAL GENERAL DE DURANGO (ALMACEN)'),('u1021',1,'CENTRO DE SALUD JARDINES DE CANCUN'),('u1030',1,'CENTRO DE SALUD DE GUADALUPE VICTORIA'),('u1034',1,'CENTRO DE SALUD DE NOMBRE DE DIOS'),('u1040',1,'HOSPITAL INTEGRAL DE FRANCISCO I. MADERO'),('u1041',1,'CENTRO ESTATAL DE CANCEROLOGIA'),('u1062',1,'CENTRO DE SALUD BOSQUES DEL VALLE'),('u1063',1,'CENTRO DE SALUD LA VIRGEN'),('u1071',1,'HOSPITAL DE SALUD MENTAL'),('u1144',1,'FARMACIA SEGURO POPULAR DURANGO'),('u1145',1,'CENTRO DE SALUD No. 1'),('u1146',1,'CENTRO DE SALUD No. 2');
/*!40000 ALTER TABLE `unidad_atencion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime DEFAULT NULL,
  `usuario` varchar(128) DEFAULT NULL,
  `actividad` varchar(256) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `rol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,NULL,'admin',NULL,'d033e22ae348aeb5660fc2140aec35850c4da997','administrador');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'soriana4'
--
/*!50003 DROP PROCEDURE IF EXISTS `agregarUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `agregarUser`(in usuario_in varchar(100), in rol_in varchar(50), in pass_in varchar(100))
BEGIN
	INSERT INTO usuario(usuario, pass, rol) VALUES
	(usuario_in, SHA(pass_in), rol_in);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `autenticar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `autenticar`(in usuario_in varchar(50), in pass_in varchar(50))
SELECT * FROM usuario WHERE usuario=usuario_in AND pass=SHA(pass_in) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `beneficiario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `beneficiario`(in id_in varchar(10), in fechaI_in date, in fechaF_in date)
SELECT b.id, b.nombre FROM medico m INNER JOIN medico_unidad medu ON m.cedula_profesional=medu.cedula_medico
	INNER JOIN unidad_atencion ua ON medu.id_unidad=ua.id
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
	INNER JOIN beneficiario b ON r.id_beneficiario=b.id
	WHERE ua.id=id_in AND r.fecha BETWEEN fechaI_in AND fechaF_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `contenido_receta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `contenido_receta`(in folio_in int)
SELECT i.clave, i.id_origen, i.descripcion, cr.cant_solicitada, cr.cant_surtida FROM receta r INNER JOIN contenido_receta cr ON r.folio=cr.folio_receta
	INNER JOIN insumo i ON cr.clave_medicamento=i.clave WHERE r.folio=folio_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminarUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `eliminarUsers`(in id_in int)
BEGIN
	delete from usuario where id=id_in;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insumo_r11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `insumo_r11`(in id_in varchar(10))
SELECT inv.clave_insumo, i.descripcion FROM inventario inv INNER JOIN insumo i ON inv.clave_insumo=i.clave
	WHERE inv.id_unidad=id_in AND i.tipo<>'Psicotropico' AND i.tipo<>'Otro' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `jurisdiccion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `jurisdiccion`()
SELECT * FROM jurisdiccion */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `medico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `medico`(in id_in varchar(10), in fechaI_in date, in fechaF_in date)
SELECT m.cedula_profesional, m.nombre FROM unidad_atencion ua 
	INNER JOIN medico_unidad medu ON ua.id=_medu.id_unidad 
	INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional 
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
	WHERE ua.id=id_in AND r.fecha BETWEEN fechaI_in AND fechaF_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `medico_psico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `medico_psico`(in id_in varchar(10))
SELECT m.cedula_profesional, m.nombre FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=_medu.id_unidad
	INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico INNER JOIN contenido_receta cr ON r.folio=cr.folio_receta
	INNER JOIN insumo i ON cr.clave_medicamento=i.clave
	WHERE ua.id=id_in AND i.tipo='Psicotropico' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mostrarUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `mostrarUsers`()
BEGIN
	select id, usuario, rol from usuario;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `municipio`(in id_in int)
SELECT * FROM municipio WHERE id_jurisdiccion = id_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `programa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `programa`()
SELECT * FROM programa */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `psico_todos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `psico_todos`()
SELECT clave FROM insumo WHERE tipo = 'Psicotropico' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `psico_uno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `psico_uno`(in id_in int)
SELECT clave, lab, descripcion, presentacion FROM insumo WHERE clave = id_in AND tipo = 'Psicotropico' */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recetaF` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `recetaF`(in folio_in int)
SELECT r.folio, ua.id AS id_unidad, r.fecha, p.nombre AS programa_, m.cedula_profesional, m.nombre AS medico_, b.nombre AS paciente,
	b.edad, b.num_seguro, r.tipo_receta, ua.nombre AS unidad, j.id FROM jurisdiccion j INNER JOIN municipio mu ON j.id=mu.id_jurisdiccion
	INNER JOIN unidad_atencion ua ON mu.id=ua.id_municipio INNER JOIN medico_unidad meun ON ua.id=meun.id_unidad
	INNER JOIN medico m ON meun.cedula_medico=m.cedula_profesional INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
	INNER JOIN beneficiario b ON r.id_beneficiario=b.id INNER JOIN programa p ON r.id_programa = p.id WHERE r.folio=folio_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte10` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte10`(in unidad_in varchar(10), in mes_in int)
BEGIN
	SELECT i.clave, i.descripcion, inv.existencias, inv.stock_min, inv.stock_max FROM unidad_atencion ua
	INNER JOIN inventario_mensual inv ON ua.id=inv.id_unidad INNER JOIN insumo i ON inv.clave_insumo=i.clave
	WHERE ua.id = unidad_in AND inv.mes=mes_in;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte11`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date)
BEGIN
	SELECT i.clave, i.descripcion, cr.cant_surtida FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
	INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico INNER JOIN contenido_receta cr ON r.folio=cr.folio_receta
	INNER JOIN insumo i ON cr.clave_medicamento=i.clave WHERE i.tipo<>'Psicotropico' AND i.tipo<>'Otro' AND ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte12` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte12`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date)
BEGIN
	SELECT r.id_causes, c.nombre, count(*) AS incidencia from unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
	INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico INNER JOIN cie c ON r.id_causes=c.id
	WHERE ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY r.id_causes;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte13` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte13`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date)
BEGIN
	SELECT pr.folio_receta, cr.clave_medicamento, i.descripcion, cr.cant_solicitada, pr.fecha_solicitud, pr.fecha_abasto, i.id_origen,
	i.precio_unitario, (cr.cant_solicitada * i.precio_unitario) AS IMPORTE, DATEDIFF(pr.fecha_entrega, pr.fecha_abasto) AS ATRASO
	FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico 
	INNER JOIN contenido_receta cr ON r.folio=cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento=i.clave INNER JOIN pedido_receta pr
	ON r.folio=pr.folio_receta
	WHERE ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte14` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte14`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in programa_in int)
BEGIN
	IF programa_in = 10 THEN
		SELECT ua.nombre, pr.folio_receta, cr.clave_medicamento, i.descripcion, cr.cant_solicitada, pr.fecha_solicitud,
		i.precio_unitario, (cr.cant_solicitada * i.precio_unitario) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico 
		INNER JOIN contenido_receta cr ON r.folio=cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento=i.clave INNER JOIN pedido_receta pr
		ON r.folio=pr.folio_receta
		WHERE ua.id = unidad_in AND pr.fecha_abasto IS NULL AND r.fecha BETWEEN fechaI_in AND fechaF_in;
	ELSE
		SELECT ua.nombre, pr.folio_receta, cr.clave_medicamento, i.descripcion, cr.cant_solicitada, pr.fecha_solicitud,
		i.precio_unitario, (cr.cant_solicitada * i.precio_unitario) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico 
		INNER JOIN contenido_receta cr ON r.folio=cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento=i.clave INNER JOIN pedido_receta pr
		ON r.folio=pr.folio_receta
		WHERE ua.id = unidad_in AND pr.fecha_abasto IS NULL AND r.id_programa=programa_in AND r.fecha BETWEEN fechaI_in AND fechaF_in;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte15` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte15`(in unidad_in varchar(10), in cedula_in int)
BEGIN
	select sm.id, m.nombre, m.cedula_profesional, m.domicilio, sm.cant_surtida, sm.saldo_insumo, i.clave FROM unidad_atencion ua
	INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico INNER JOIN salida_medicamento sm
	ON r.folio=sm.folio_receta INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo INNER JOIN insumo i ON inv.clave_insumo=i.clave
	WHERE ua.id=unidad_in AND r.cedula_medico=cedula_in;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte16` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte16`(in clave_in varchar(15), in unidad_in varchar(10), in fechaI_in date, in fechaF_in date)
BEGIN
	SELECT r.fecha, sm.cant_solicitada, sm.cant_surtida, i.descripcion, r.folio, b.nombre AS PACIENTE, m.nombre AS MEDICO, m.cedula_profesional, sm.retiene_receta
	FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico INNER JOIN salida_medicamento sm
	ON r.folio=sm.folio_receta INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo INNER JOIN insumo i ON inv.clave_insumo=i.clave
	INNER JOIN beneficiario b ON r.id_beneficiario=b.id WHERE sm.clave_medicamento=clave_in AND ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte18` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte18`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date)
BEGIN
	SELECT sm.clave_medicamento, i.descripcion, i.precio_unitario, sum(sm.cant_surtida) as CANTIDAD, (sum(sm.cant_surtida) * (i.precio_unitario + 7.45)) as TOTAL, i.id_origen,
	(sum(sm.cant_surtida) * i.precio_unitario) as IMPORTE_L, (sum(sm.cant_surtida) * 7.45) as IMPORTE_A FROM unidad_atencion ua
	INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico INNER JOIN salida_medicamento sm ON r.folio=sm.folio_receta 
	INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo INNER JOIN insumo i ON inv.clave_insumo=i.clave
	WHERE i.tipo <> 'Psicotropico' AND ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY sm.clave_medicamento;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte19` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte19`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date)
BEGIN
	SELECT i.tipo, sm.clave_medicamento, i.descripcion, i.presentacion, sum(sm.cant_solicitada) AS SOLICITADO, sum(sm.cant_surtida) AS SURTIDO
	FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
	INNER JOIN salida_medicamento sm ON r.folio=sm.folio_receta INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo
	INNER JOIN insumo i ON inv.clave_insumo=i.clave WHERE i.tipo <> 'Psicotropico' AND i.tipo <> 'Antibiotico' AND i.tipo <> 'Otro'
	AND ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY sm.clave_medicamento;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte20` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte20`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in id_origen_in int)
BEGIN
	SELECT i.tipo, j.nombre AS JUR, mun.nombre AS MUNI, ua.nombre AS UNIDAD, sm.clave_medicamento, i.descripcion, sum(sm.cant_surtida) AS CANTIDAD, i.precio_unitario, (sum(sm.cant_surtida) * i.precio_unitario) AS IMPORTE
	FROM jurisdiccion j
	INNER JOIN municipio mun ON j.id=mun.id_jurisdiccion
	INNER JOIN unidad_atencion ua ON mun.id=ua.id_municipio
	INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
	INNER JOIN salida_medicamento sm ON r.folio=sm.folio_receta
	INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo
	INNER JOIN insumo i ON inv.clave_insumo = i.clave
	WHERE i.tipo <> 'Psicotropico' AND i.tipo <> 'Antibiotico' AND i.id_origen = id_origen_in AND ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY sm.clave_medicamento ORDER BY CANTIDAD LIMIT 50;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte21` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte21`(in opcd_in int, in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in id_origen_in int)
BEGIN
	IF opc_in=1 THEN
		SELECT i.tipo, sm.clave_medicamento, i.descripcion, sum(sm.cant_surtida) AS CANTIDAD, i.precio_unitario, (sum(sm.cant_surtida) * i.precio_unitario) AS IMPORTE
		FROM receta r
		INNER JOIN salida_medicamento sm ON r.folio=sm.folio_receta
		INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo
		INNER JOIN insumo i ON inv.clave_insumo = i.clave
		WHERE i.tipo <> 'Psicotropico' AND i.tipo <> 'Antibiotico' AND i.id_origen = id_origen_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY sm.clave_medicamento ORDER BY CANTIDAD DESC LIMIT 50;
	ELSE
		IF opc_in=2 THEN
			SELECT i.tipo, sm.clave_medicamento, i.descripcion, sum(sm.cant_surtida) AS CANTIDAD, i.precio_unitario, (sum(sm.cant_surtida) * i.precio_unitario) AS IMPORTE
			FROM jurisdiccion j
			INNER JOIN municipio mun ON j.id=mun.id_jurisdiccion
			INNER JOIN unidad_atencion ua ON mun.id=ua.id_municipio
			INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
			INNER JOIN salida_medicamento sm ON r.folio=sm.folio_receta
			INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo
			INNER JOIN insumo i ON inv.clave_insumo = i.clave
			WHERE i.tipo <> 'Psicotropico' AND  i.tipo <> 'Antibiotico' AND i.id_origen = id_origen_in AND j.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY sm.clave_medicamento ORDER BY CANTIDAD DESC LIMIT 50;
		ELSE
			SELECT i.tipo, sm.clave_medicamento, i.descripcion, sum(sm.cant_surtida) AS CANTIDAD, i.precio_unitario, (sum(sm.cant_surtida) * i.precio_unitario) AS IMPORTE
			FROM jurisdiccion j
			INNER JOIN municipio mun ON j.id=mun.id_jurisdiccion
			INNER JOIN unidad_atencion ua ON mun.id=ua.id_municipio
			INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional=r.cedula_medico
			INNER JOIN salida_medicamento sm ON r.folio=sm.folio_receta
			INNER JOIN inventario inv ON sm.clave_medicamento=inv.clave_insumo
			INNER JOIN insumo i ON inv.clave_insumo = i.clave
			WHERE i.tipo <> 'Psicotropico' AND i.tipo <> 'Antibiotico' AND i.id_origen = id_origen_in AND ua.id=unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY sm.clave_medicamento ORDER BY CANTIDAD DESC LIMIT 50;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte2SOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte2SOR`(in unidad_in varchar(10), in programa_in int, in fechaI_in date, in fechaF_in date)
BEGIN
	IF programa_in=10 THEN
		SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
		(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
		INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
		INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=2 AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in
		AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
	ELSE
		SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
		(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
		INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
		INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=2 AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND p.id= programa_in
		AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte2SSD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte2SSD`(in unidad_in varchar(10), in programa_in int, in fechaI_in date, in fechaF_in date)
BEGIN
	IF programa_in=10 THEN
		SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
		(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
		INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
		INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=1 AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in
		AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
	ELSE
		SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
		(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
		INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
		INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=1 AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND p.id= programa_in
		AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte3`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in tipo_in int)
BEGIN
	SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
	(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
	INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
	INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
	INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
	INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=tipo_in AND i.tipo <> 'Psicotropico' AND ua.id = unidad_in
	AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte4`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in tipo_in int, in programa_in int)
BEGIN
	IF programa_in = 10 THEN
		SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
		(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
		INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
		INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=tipo_in AND i.tipo <> 'Psicotropico'
		AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
	ELSE
		SELECT i.tipo, i.clave, i.descripcion, i.presentacion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario,
		(i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad
		INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
		INNER JOIN origen o ON i.id_origen = o.id WHERE i.id_origen=tipo_in AND p.id=programa_in AND i.tipo <> 'Psicotropico'
		AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte5`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in servicio_in int, in programa_in int, in tipo_receta_in varchar(20))
BEGIN
	IF tipo_receta_in = 'Receta Farmacia' THEN
		IF programa_in = 10 THEN
			SELECT i.tipo, cr.id, r.folio, r.fecha, b.nombre AS BENEFICIARIO, i.descripcion, i.presentacion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
			INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
			INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN beneficiario b ON r.id_beneficiario=b.id
			WHERE r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
		ELSE
			SELECT i.tipo, cr.id, r.folio, r.fecha, b.nombre AS BENEFICIARIO, i.descripcion, i.presentacion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
			INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
			INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN beneficiario b ON r.id_beneficiario=b.id
			WHERE p.id=programa_in AND r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
		END IF;
	ELSE
		IF programa_in = 10 && servicio_in = 200 THEN
			SELECT i.tipo, cr.id, r.folio, r.fecha, s.nombre AS BENEFICIARIO, i.descripcion, i.presentacion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
			INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
			INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
			WHERE r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
		ELSE
			IF programa_in = 10 && servicio_in <> 200 THEN
				SELECT i.tipo, cr.id, r.folio, r.fecha, s.nombre AS BENEFICIARIO, i.descripcion, i.presentacion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
				FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
				INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
				INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
				INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
				WHERE r.id_servicio = servicio_in AND r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
			ELSE
				IF programa_in <> 10 && servicio_in = 200 THEN
					SELECT i.tipo, cr.id, r.folio, r.fecha, s.nombre AS BENEFICIARIO, i.descripcion, i.presentacion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
					FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
					INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
					INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
					INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
					WHERE p.id=programa_in AND r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
				ELSE
					SELECT i.tipo, cr.id, r.folio, r.fecha, s.nombre AS BENEFICIARIO, i.descripcion, i.presentacion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
					FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
					INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
					INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
					INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
					WHERE r.id_servicio = servicio_in AND p.id=programa_in AND r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro' AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
				END IF;
			END IF;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte6`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in tipo_in varchar(20), in programa_in int, in servicio_in int)
BEGIN
	IF tipo_in = 'Receta Farmacia' THEN
		IF programa_in = 10 THEN
			select i.tipo, i.clave, i.descripcion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
			INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
			INNER JOIN origen o ON i.id_origen = o.id WHERE r.tipo_receta=tipo_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro'
			AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
		ELSE
			select i.tipo, i.clave, i.descripcion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
			INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
			INNER JOIN origen o ON i.id_origen = o.id WHERE r.tipo_receta=tipo_in AND r.id_programa=programa_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro'
			AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
		END IF;
	ELSE
		IF programa_in = 10 && servicio_in = 200 THEN
			select i.tipo, i.clave, i.descripcion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
			INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
			INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
			WHERE r.tipo_receta=tipo_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro'
			AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
		ELSE
			IF programa_in = 10 && servicio_in <> 200 THEN
				select i.tipo, i.clave, i.descripcion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
				FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
				INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
				INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
				INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
				WHERE r.id_servicio = servicio_in AND r.tipo_receta=tipo_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro'
				AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
			ELSE
				IF programa_in <> 10 && servicio_in = 200 THEN
					select i.tipo, i.clave, i.descripcion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
					FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
					INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
					INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
					INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
					WHERE r.id_programa = programa_in AND r.tipo_receta=tipo_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro'
					AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
				ELSE
					select i.tipo, i.clave, i.descripcion, sum(cr.cant_surtida) AS CANTIDAD, i.precio_unitario, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
					FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
					INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico INNER JOIN programa p ON r.id_programa = p.id
					INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta INNER JOIN insumo i ON cr.clave_medicamento = i.clave
					INNER JOIN origen o ON i.id_origen = o.id INNER JOIN servicio s ON r.id_servicio=s.id
					WHERE r.id_programa = programa_in AND r.id_servicio = servicio_in AND r.tipo_receta=tipo_in AND i.tipo <> 'Psicotropico' AND i.tipo<>'Otro'
					AND ua.id = unidad_in AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY i.clave;
				END IF;
			END IF;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte7`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in cedula_in int)
BEGIN
	IF cedula_in = 9999999 THEN
		select r.folio, r.fecha, b.nombre, i.descripcion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * cr.cant_surtida) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
		INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN beneficiario b ON r.id_beneficiario=b.id
		WHERE ua.id = unidad_in AND i.tipo <> 'Psicotropico' AND i.tipo <> 'Otro' AND r.fecha BETWEEN fechaI_in AND fechaF_in;
	ELSE
		select r.folio, r.fecha, b.nombre, i.descripcion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * cr.cant_surtida) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
		INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN beneficiario b ON r.id_beneficiario=b.id
		WHERE ua.id = unidad_in AND i.tipo <> 'Psicotropico' AND i.tipo <> 'Otro' AND m.cedula_profesional=cedula_in AND r.fecha BETWEEN fechaI_in AND fechaF_in;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte8`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in id_bene_in int)
BEGIN
	IF id_bene_in = 0 THEN
		select r.folio, r.fecha, i.descripcion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * cr.cant_surtida) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
		INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN beneficiario b ON r.id_beneficiario=b.id
		WHERE ua.id = unidad_in AND i.tipo <> 'Psicotropico' AND i.tipo <> 'Otro' AND r.fecha BETWEEN fechaI_in AND fechaF_in;
	ELSE
		select r.folio, r.fecha, i.descripcion, i.id_origen, i.precio_unitario, cr.cant_surtida, (i.precio_unitario * cr.cant_surtida) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
		INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
		INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN beneficiario b ON r.id_beneficiario=b.id
		WHERE ua.id = unidad_in AND i.tipo <> 'Psicotropico' AND i.tipo <> 'Otro' AND b.id=id_bene_in AND r.fecha BETWEEN fechaI_in AND fechaF_in;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `reporte9`(in unidad_in varchar(10), in fechaI_in date, in fechaF_in date, in programa_in int, in tipo_receta_in varchar(20), in servicio_in int)
BEGIN
	IF servicio_in = 200 && programa_in = 10 THEN
		SELECT i.tipo, cr.id, r.folio, r.fecha, b.nombre AS BENEFICIARIO, i.descripcion, i.id_origen, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
		FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
		INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
		INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
		INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN beneficiario b ON r.id_beneficiario=b.id
		WHERE r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND ua.id = unidad_in	AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
	ELSE 
		IF servicio_in = 200 && programa_in <> 10 THEN
			SELECT i.tipo, cr.id, r.folio, r.fecha, b.nombre AS BENEFICIARIO, i.descripcion, i.id_origen, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
			FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
			INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
			INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
			INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN beneficiario b ON r.id_beneficiario=b.id
			WHERE p.id=programa_in AND r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND ua.id = unidad_in	AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
		ELSE 
			IF servicio_in <> 200 && programa_in = 10 THEN
				SELECT i.tipo, cr.id, r.folio, r.fecha, b.nombre AS BENEFICIARIO, i.descripcion, i.id_origen, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
				FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
				INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
				INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
				INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN beneficiario b ON r.id_beneficiario=b.id
				WHERE r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND ua.id = unidad_in	AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
			ELSE
				SELECT i.tipo, cr.id, r.folio, r.fecha, b.nombre AS BENEFICIARIO, i.descripcion, i.id_origen, cr.cant_surtida, (i.precio_unitario * sum(cr.cant_surtida)) AS IMPORTE
				FROM unidad_atencion ua INNER JOIN medico_unidad medu ON ua.id=medu.id_unidad INNER JOIN medico m ON medu.cedula_medico=m.cedula_profesional
				INNER JOIN receta r ON m.cedula_profesional = r.cedula_medico
				INNER JOIN programa p ON r.id_programa = p.id INNER JOIN contenido_receta cr ON r.folio = cr.folio_receta
				INNER JOIN insumo i ON cr.clave_medicamento = i.clave INNER JOIN origen o ON i.id_origen = o.id INNER JOIN beneficiario b ON r.id_beneficiario=b.id
				WHERE p.id=programa_in AND r.tipo_receta=tipo_receta_in AND i.tipo <> 'Psicotropico' AND ua.id = unidad_in	AND r.fecha BETWEEN fechaI_in AND fechaF_in GROUP BY cr.id;
			END IF;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `servicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `servicio`(in id_in varchar(10))
SELECT s.id, s.nombre FROM servicio s INNER JOIN servicio_hospital sh ON sh.id_servicio=s.id WHERE sh.id_unidad=id_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `unidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`consultor.extern`@`%`*/ /*!50003 PROCEDURE `unidad`(in id_in int)
SELECT * FROM unidad_atencion WHERE id_municipio = id_in */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-15  4:07:28
