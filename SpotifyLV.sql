-- MariaDB dump 10.17  Distrib 10.4.6-MariaDB, for Win64 (AMD64)
--
-- Host: 40.84.190.148    Database: Spotify
-- ------------------------------------------------------
-- Server version	10.5.3-MariaDB-1:10.5.3+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Artista`
--

DROP TABLE IF EXISTS `Artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Artista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_artistico` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `numero_sub` int(11) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artista`
--

LOCK TABLES `Artista` WRITE;
/*!40000 ALTER TABLE `Artista` DISABLE KEYS */;
INSERT INTO `Artista` (`id`, `nombre_artistico`, `apellido`, `nacionalidad`, `numero_sub`, `fecha_actualizacion`, `nombre`) VALUES (1,'Guaynaa','Santiago Pérez','Puerto Rico',8247241,'2020-05-29 22:12:30','Jean Carlos');
/*!40000 ALTER TABLE `Artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `albumes`
--

DROP TABLE IF EXISTS `albumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `albumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_lanzamiento` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_disquera` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_disquera` (`id_disquera`),
  CONSTRAINT `albumes_ibfk_1` FOREIGN KEY (`id_disquera`) REFERENCES `discografia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albumes`
--

LOCK TABLES `albumes` WRITE;
/*!40000 ALTER TABLE `albumes` DISABLE KEYS */;
INSERT INTO `albumes` (`id`, `nombre`, `fecha_creacion`, `fecha_lanzamiento`, `fecha_actualizacion`, `id_disquera`) VALUES (1,'Rebota','2020-05-29 22:31:04','2020-05-29 22:31:06','2020-05-29 22:31:07',1);
/*!40000 ALTER TABLE `albumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas_favoritos`
--

DROP TABLE IF EXISTS `artistas_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artistas_favoritos` (
  `id_artista` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  KEY `id_artista` (`id_artista`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `artistas_favoritos_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `Artista` (`id`),
  CONSTRAINT `artistas_favoritos_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas_favoritos`
--

LOCK TABLES `artistas_favoritos` WRITE;
/*!40000 ALTER TABLE `artistas_favoritos` DISABLE KEYS */;
INSERT INTO `artistas_favoritos` (`id_artista`, `id_user`) VALUES (1,3);
/*!40000 ALTER TABLE `artistas_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `numero_reproduccion` int(11) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `id_lista_artista` int(11) DEFAULT NULL,
  `id_album` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_album` (`id_album`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `canciones_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `albumes` (`id`),
  CONSTRAINT `canciones_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` (`id`, `name`, `numero_reproduccion`, `fecha_actualizacion`, `duracion`, `id_genero`, `id_lista_artista`, `id_album`) VALUES (1,'Rebota',114543056,'2020-05-29 22:23:44','04:22:00',1,1,1);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canciones_favoritos`
--

DROP TABLE IF EXISTS `canciones_favoritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones_favoritos` (
  `id_user` int(11) DEFAULT NULL,
  `id_cancion` int(11) DEFAULT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `canciones_favoritos_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`),
  CONSTRAINT `canciones_favoritos_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones_favoritos`
--

LOCK TABLES `canciones_favoritos` WRITE;
/*!40000 ALTER TABLE `canciones_favoritos` DISABLE KEYS */;
INSERT INTO `canciones_favoritos` (`id_user`, `id_cancion`) VALUES (3,1);
/*!40000 ALTER TABLE `canciones_favoritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle` (
  `num_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` double NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio_U` double NOT NULL,
  `precio_T` double NOT NULL,
  PRIMARY KEY (`num_detalle`),
  KEY `id_factura` (`id_factura`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`num_factura`),
  CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` (`num_detalle`, `id_factura`, `id_producto`, `cantidad`, `descripcion`, `precio_U`, `precio_T`) VALUES (4,2,1,1,'Premium Individual',7.99,7.99);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discografia`
--

DROP TABLE IF EXISTS `discografia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discografia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_album` int(11) DEFAULT NULL,
  `fecha_creacio` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_artista` int(11) DEFAULT NULL,
  `nombre_discografia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artista` (`id_artista`),
  CONSTRAINT `discografia_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `Artista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discografia`
--

LOCK TABLES `discografia` WRITE;
/*!40000 ALTER TABLE `discografia` DISABLE KEYS */;
INSERT INTO `discografia` (`id`, `numero_album`, `fecha_creacio`, `fecha_actualizacion`, `id_artista`, `nombre_discografia`) VALUES (1,2,'2020-05-29 22:27:50','2020-05-29 22:27:51',1,'ADVM');
/*!40000 ALTER TABLE `discografia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `num_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_pago` int(11) DEFAULT NULL,
  `id_modo_pago` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `Subtotal` double NOT NULL,
  `Total` double NOT NULL,
  PRIMARY KEY (`num_factura`),
  KEY `id_pago` (`id_pago`),
  KEY `id_modo_pago` (`id_modo_pago`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`num_pago`),
  CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_modo_pago`) REFERENCES `modo_pago` (`id_modo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` (`num_factura`, `id_pago`, `id_modo_pago`, `fecha`, `Subtotal`, `Total`) VALUES (2,1,1,'2020-05-29',15,18);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` (`id`, `nombre`, `fecha_actualizacion`) VALUES (1,'Reggeton','2020-05-29 22:18:56'),(2,'Bachata','2020-05-29 22:19:04'),(3,'Rock','2020-05-29 22:19:09'),(4,'Balada','2020-05-29 22:19:18');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identificador_rol`
--

DROP TABLE IF EXISTS `identificador_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identificador_rol` (
  `id_user` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `identificador_rol_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`),
  CONSTRAINT `identificador_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identificador_rol`
--

LOCK TABLES `identificador_rol` WRITE;
/*!40000 ALTER TABLE `identificador_rol` DISABLE KEYS */;
INSERT INTO `identificador_rol` (`id_user`, `id_rol`, `activo`) VALUES (2,1,1),(3,2,1),(4,3,1);
/*!40000 ALTER TABLE `identificador_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_artista`
--

DROP TABLE IF EXISTS `lista_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_artista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificador` int(11) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_artista` int(11) DEFAULT NULL,
  `id_cancion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_artista` (`id_artista`),
  KEY `id_cancion` (`id_cancion`),
  KEY `identificador` (`identificador`),
  CONSTRAINT `lista_artista_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `Artista` (`id`),
  CONSTRAINT `lista_artista_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`),
  CONSTRAINT `lista_artista_ibfk_3` FOREIGN KEY (`identificador`) REFERENCES `rol_artista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_artista`
--

LOCK TABLES `lista_artista` WRITE;
/*!40000 ALTER TABLE `lista_artista` DISABLE KEYS */;
INSERT INTO `lista_artista` (`id`, `identificador`, `fecha_actualizacion`, `id_artista`, `id_cancion`) VALUES (3,1,'2020-05-29 22:19:41',1,1);
/*!40000 ALTER TABLE `lista_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_canciones_escuchadas`
--

DROP TABLE IF EXISTS `lista_canciones_escuchadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_canciones_escuchadas` (
  `id_usuario` int(11) DEFAULT NULL,
  `id_cancion` int(11) DEFAULT NULL,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `lista_canciones_escuchadas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `lista_canciones_escuchadas_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_canciones_escuchadas`
--

LOCK TABLES `lista_canciones_escuchadas` WRITE;
/*!40000 ALTER TABLE `lista_canciones_escuchadas` DISABLE KEYS */;
INSERT INTO `lista_canciones_escuchadas` (`id_usuario`, `id_cancion`) VALUES (3,1);
/*!40000 ALTER TABLE `lista_canciones_escuchadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modo_pago`
--

DROP TABLE IF EXISTS `modo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modo_pago` (
  `id_modo_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_modo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modo_pago`
--

LOCK TABLES `modo_pago` WRITE;
/*!40000 ALTER TABLE `modo_pago` DISABLE KEYS */;
INSERT INTO `modo_pago` (`id_modo_pago`, `nombre`) VALUES (1,'tarjeta'),(2,'paypal');
/*!40000 ALTER TABLE `modo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `num_pago` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_pago`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` (`num_pago`, `fecha`, `id_user`) VALUES (1,'2020-05-29 21:16:08',3);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` (`id`, `nombre`) VALUES (1,'Ecuador'),(2,'Colombia'),(3,'Brazil');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` (`id`, `nombre`, `fecha_creacion`, `id_usuario`) VALUES (1,'Rebota','2020-05-29 22:35:35',3);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_canciones`
--

DROP TABLE IF EXISTS `playlist_canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_canciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_lista` int(11) DEFAULT NULL,
  `id_cancion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_lista` (`id_lista`),
  KEY `id_cancion` (`id_cancion`),
  CONSTRAINT `playlist_canciones_ibfk_1` FOREIGN KEY (`id_lista`) REFERENCES `playlist` (`id`),
  CONSTRAINT `playlist_canciones_ibfk_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_canciones`
--

LOCK TABLES `playlist_canciones` WRITE;
/*!40000 ALTER TABLE `playlist_canciones` DISABLE KEYS */;
INSERT INTO `playlist_canciones` (`id`, `id_lista`, `id_cancion`) VALUES (1,1,1);
/*!40000 ALTER TABLE `playlist_canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `producto_cuenta` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `producto_cuenta`) VALUES (1,'Premium Individual',7.99,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_tarifa`
--

DROP TABLE IF EXISTS `producto_tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_tarifa` (
  `id_tarifa` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  KEY `producto_fk` (`id_tarifa`),
  KEY `producto_tarifa_producto_id_producto_fk` (`id_producto`),
  CONSTRAINT `producto_fk` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_tarifa`
--

LOCK TABLES `producto_tarifa` WRITE;
/*!40000 ALTER TABLE `producto_tarifa` DISABLE KEYS */;
INSERT INTO `producto_tarifa` (`id_tarifa`, `id_producto`) VALUES (2,1);
/*!40000 ALTER TABLE `producto_tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_artista`
--

DROP TABLE IF EXISTS `rol_artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol_artista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_role_artista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_artista`
--

LOCK TABLES `rol_artista` WRITE;
/*!40000 ALTER TABLE `rol_artista` DISABLE KEYS */;
INSERT INTO `rol_artista` (`id`, `rol`, `fecha_actualizacion`, `id_role_artista`) VALUES (1,'Cantante Principal','2020-05-29 22:20:10',1),(2,'Cantante Colaborador','2020-05-29 22:20:28',NULL);
/*!40000 ALTER TABLE `rol_artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_tarifa` int(11) DEFAULT NULL,
  `Cantidad` int(11) NOT NULL,
  `Descripcion` varchar(59) NOT NULL,
  `precio` double DEFAULT NULL,
  `precioTotal` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tarifa` (`id_tarifa`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`id_tarifa`) REFERENCES `tarifa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `nombre`, `fecha_actualizacion`, `id_tarifa`, `Cantidad`, `Descripcion`, `precio`, `precioTotal`) VALUES (1,'free','2020-05-29 20:20:34',1,0,'',NULL,0),(2,'Premium Individual','2020-05-29 20:20:43',2,0,'',NULL,0),(3,'Premium Duo','2020-05-29 20:20:51',3,0,'',NULL,0),(4,'Premium Familiar','2020-05-29 20:20:59',4,0,'',NULL,0),(5,'Premium Universitario','2020-05-29 20:21:06',5,0,'',NULL,0);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifa`
--

DROP TABLE IF EXISTS `tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarifa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cuota` varchar(50) DEFAULT NULL,
  `divisa` varchar(50) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `impursto` float DEFAULT NULL,
  `publicidad` tinyint(1) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pais` (`id_pais`),
  CONSTRAINT `tarifa_ibfk_1` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifa`
--

LOCK TABLES `tarifa` WRITE;
/*!40000 ALTER TABLE `tarifa` DISABLE KEYS */;
INSERT INTO `tarifa` (`id`, `cuota`, `divisa`, `monto`, `impursto`, `publicidad`, `fecha_actualizacion`, `id_pais`) VALUES (1,'mes','dolar',0,0,1,'2020-05-29 20:19:13',1),(2,'mes','dolar',5.99,2,0,'2020-05-29 20:19:32',3),(3,'mes','dolar',7.99,2,0,'2020-05-29 20:19:41',1),(4,'mes','dolar',8.99,2,0,'2020-05-29 20:19:49',1),(5,'mes','dolar',2.99,0,0,'2020-05-29 20:20:01',3);
/*!40000 ALTER TABLE `tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_login`
--

DROP TABLE IF EXISTS `tipo_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `empresa` varchar(50) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_login`
--

LOCK TABLES `tipo_login` WRITE;
/*!40000 ALTER TABLE `tipo_login` DISABLE KEYS */;
INSERT INTO `tipo_login` (`id`, `nombre`, `empresa`, `activo`) VALUES (1,'Spotify','Spotify',1),(2,'Facebook','Facebook',1),(3,'App','App',1);
/*!40000 ALTER TABLE `tipo_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `name_user` varchar(50) DEFAULT NULL,
  `correo_electronico` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `fecha_nacimiento` datetime DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `id_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_login` (`id_login`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_login`) REFERENCES `tipo_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `name_user`, `correo_electronico`, `contrasena`, `fecha_creacion`, `fecha_nacimiento`, `token`, `id_login`) VALUES (2,'Lady','Lady_liss','lady.vargas@gmail.com','12345','2020-05-29 20:14:27','1999-12-24 20:15:10','',1),(3,'Oswaldo','Swaldyns','jaime.leon@gmail.com',NULL,'2020-05-29 20:15:06','1994-04-24 20:15:18','lfsoxfkwegwe99234',2),(4,'Meyvi','LissMey','liss.mey@hotmail.com','1234567','2020-05-29 20:15:47','2004-01-13 20:15:49','wefsterdfhty6875',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-30 19:03:09
