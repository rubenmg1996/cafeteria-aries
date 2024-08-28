-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bbddbar
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.7-MariaDB

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
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `unidades` int(11) DEFAULT NULL,
  `precio_unitario` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_pedido`,`codigo_producto`),
  KEY `contiene` (`codigo_producto`),
  CONSTRAINT `contiene` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo`),
  CONSTRAINT `referentea` FOREIGN KEY (`codigo_pedido`) REFERENCES `pedidos` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (1,14,4,10.00),(1,39,4,12.00),(1,56,1,6.00),(2,14,4,10.00),(2,39,4,12.00),(2,56,1,6.00),(3,14,4,10.00),(3,39,4,12.00),(3,56,1,6.00),(4,14,4,10.00),(4,39,4,12.00),(4,56,1,6.00),(5,14,4,10.00),(5,39,4,12.00),(5,56,1,6.00),(6,14,4,10.00),(6,39,4,12.00),(6,56,1,6.00),(7,14,4,10.00),(7,39,4,12.00),(7,56,1,6.00),(8,14,4,10.00),(8,39,4,12.00),(8,56,1,6.00),(9,14,4,10.00),(9,39,4,12.00),(9,56,1,6.00),(10,14,4,10.00),(10,39,4,12.00),(10,56,1,6.00),(11,14,4,10.00),(11,39,4,12.00),(11,56,1,6.00),(12,14,4,10.00),(12,39,4,12.00),(12,56,1,6.00),(13,14,4,10.00),(13,39,4,12.00),(13,56,1,6.00),(14,14,4,10.00),(14,39,4,12.00),(14,56,1,6.00),(15,14,4,10.00),(15,39,4,12.00),(15,56,1,6.00),(16,14,4,10.00),(16,39,4,12.00),(16,56,1,6.00),(17,14,4,10.00),(17,39,4,12.00),(17,56,1,6.00),(18,14,4,10.00),(18,39,4,12.00),(18,56,1,6.00),(19,14,4,10.00),(19,39,4,12.00),(19,56,1,6.00),(20,14,4,10.00),(20,39,4,12.00),(20,56,1,6.00),(21,14,4,10.00),(21,39,4,12.00),(21,56,1,6.00),(22,14,4,10.00),(22,39,4,12.00),(22,56,1,6.00),(23,14,4,10.00),(23,39,4,12.00),(23,56,1,6.00),(24,14,4,10.00),(24,39,4,12.00),(24,56,1,6.00),(25,14,4,10.00),(25,39,4,12.00),(25,56,1,6.00),(26,14,4,10.00),(26,39,4,12.00),(26,56,1,6.00),(27,14,4,10.00),(27,39,4,12.00),(27,56,1,6.00),(28,14,4,10.00),(28,39,4,12.00),(28,56,1,6.00),(29,14,4,10.00),(29,39,4,12.00),(29,56,1,6.00),(31,14,5,10.00),(31,17,5,5.50),(31,39,4,12.00),(31,56,1,6.00),(32,14,5,10.00),(32,17,5,5.50),(32,39,4,12.00),(32,56,1,6.00),(33,14,5,10.00),(33,17,5,5.50),(33,39,4,12.00),(33,56,1,6.00),(34,14,5,10.00),(34,17,5,5.50),(34,39,4,12.00),(34,56,1,6.00),(59,14,1,10.00),(59,17,1,5.50),(61,39,1,12.00),(75,17,1,5.50),(75,55,1,8.50),(76,39,1,12.00),(76,55,1,8.50),(79,17,1,5.50),(79,39,4,12.00),(83,14,1,10.00),(83,42,1,6.00),(83,56,1,6.00);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `persona` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `pedidopor` (`persona`),
  KEY `enestado` (`estado`),
  CONSTRAINT `enestado` FOREIGN KEY (`estado`) REFERENCES `estados` (`codigo`),
  CONSTRAINT `pedidopor` FOREIGN KEY (`persona`) REFERENCES `usuarios` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,NULL,94.00,NULL),(2,1,NULL,94.00,NULL),(3,1,NULL,94.00,NULL),(4,1,NULL,94.00,NULL),(5,1,NULL,94.00,NULL),(6,1,NULL,94.00,NULL),(7,1,NULL,94.00,NULL),(8,1,NULL,94.00,NULL),(9,1,NULL,94.00,NULL),(10,1,NULL,94.00,NULL),(11,1,NULL,94.00,NULL),(12,1,NULL,94.00,NULL),(13,1,NULL,94.00,NULL),(14,1,NULL,94.00,NULL),(15,1,NULL,94.00,NULL),(16,1,NULL,94.00,NULL),(17,1,NULL,94.00,NULL),(18,1,NULL,94.00,NULL),(19,1,NULL,94.00,NULL),(20,1,NULL,94.00,NULL),(21,1,NULL,94.00,NULL),(22,1,NULL,94.00,NULL),(23,1,NULL,94.00,NULL),(24,1,NULL,94.00,NULL),(25,1,NULL,94.00,NULL),(26,1,NULL,94.00,NULL),(27,1,NULL,94.00,NULL),(28,1,NULL,94.00,NULL),(29,1,NULL,94.00,NULL),(30,1,NULL,131.50,NULL),(31,1,NULL,131.50,NULL),(32,1,NULL,131.50,NULL),(33,1,NULL,131.50,NULL),(34,1,NULL,131.50,NULL),(35,1,NULL,0.00,NULL),(36,1,NULL,0.00,NULL),(37,1,NULL,0.00,NULL),(38,1,NULL,0.00,NULL),(39,1,NULL,0.00,NULL),(40,1,NULL,0.00,NULL),(41,1,NULL,0.00,NULL),(42,1,NULL,0.00,NULL),(43,1,NULL,0.00,NULL),(44,1,NULL,0.00,NULL),(45,1,NULL,0.00,NULL),(46,1,NULL,0.00,NULL),(47,1,NULL,0.00,NULL),(48,1,NULL,0.00,NULL),(49,1,NULL,0.00,NULL),(50,1,NULL,0.00,NULL),(51,1,NULL,0.00,NULL),(52,1,NULL,0.00,NULL),(53,1,NULL,0.00,NULL),(54,1,NULL,0.00,NULL),(55,1,NULL,0.00,NULL),(56,1,NULL,0.00,NULL),(57,1,NULL,0.00,NULL),(58,1,NULL,0.00,NULL),(59,1,NULL,15.50,NULL),(60,1,NULL,0.00,NULL),(61,1,NULL,12.00,NULL),(62,1,NULL,0.00,NULL),(63,1,NULL,0.00,NULL),(64,1,NULL,0.00,NULL),(65,1,NULL,0.00,NULL),(66,1,NULL,0.00,NULL),(67,1,NULL,0.00,NULL),(68,1,NULL,0.00,NULL),(69,1,NULL,0.00,NULL),(70,1,NULL,0.00,NULL),(71,1,NULL,0.00,NULL),(72,1,NULL,0.00,NULL),(73,1,NULL,0.00,NULL),(74,1,NULL,0.00,NULL),(75,1,NULL,14.00,NULL),(76,1,NULL,20.50,NULL),(77,1,NULL,0.00,NULL),(78,1,NULL,0.00,NULL),(79,1,NULL,53.50,NULL),(83,9,NULL,22.00,NULL);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `existencias` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `novedad` tinyint(1) DEFAULT NULL,
  `ingredientes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'San Miguel',1.80,500,'sanmiguel.png','bebida',0,NULL),(2,'Alhambra',1.80,500,'alhambra.png','bebida',0,NULL),(3,'Turia',1.90,500,'turia.png','bebida',NULL,NULL),(4,'Mahou',2.00,500,'mahou.png','bebida',NULL,NULL),(5,'Alhambra Gran Reserva',2.30,500,'alhambragr.png','bebida',NULL,NULL),(6,'Jarra Alhambra',1.80,500,'jarra.jpg','bebida',NULL,NULL),(7,'Jarra Radler',1.80,500,'radler.png','bebida',NULL,NULL),(8,'Mahou Sin Gluten',2.00,500,'singluten.jpg','bebida',NULL,NULL),(9,'Botella de Vino Blanco Antares',5.00,100,'antaresblanco.jpg','bebida',NULL,NULL),(10,'Botella de Vino Rosado Antares',5.00,100,'antaresrosao.jpg','bebida',NULL,NULL),(11,'Botella de Vino Tinto Antares',5.00,100,'antarestinto.jpg','bebida',NULL,NULL),(12,'Heineken',1.80,100,'heineken.png','bebida',NULL,NULL),(13,'Mahou 00',2.00,500,'mahou00.jpg','bebida',NULL,NULL),(14,'Croquetas',10.00,100,'croquetas.jpg','aperitivo',1,'Jamón ibérico, rabo de toro, cecina, pulpo, gambón y chistorra'),(15,'Tacos de bacalao rebozados',8.50,100,'bacalao.jpg','aperitivo',NULL,NULL),(16,'Zamburiñas (u)',2.00,100,'zamburinhas.jpg','aperitivo',NULL,NULL),(17,'Alitas',5.50,100,'alitas.jpg','aperitivo',1,NULL),(18,'Hojaldre de queso de cabra',3.00,100,'hojaldre.jpg','aperitivo',NULL,NULL),(19,'Patatas Bravas',5.00,100,'bravas.jpg','aperitivo',NULL,NULL),(20,'Patatas foster\'s',6.50,100,'fosters.png','aperitivo',NULL,NULL),(21,'Queso frito',9.00,500,'quesofrito.jpg','aperitivo',NULL,NULL),(22,'Oreja',6.50,200,'oreja.jpg','aperitivo',NULL,NULL),(23,'Rabo de cerdo',7.00,200,'rabo.jpg','aperitivo',NULL,NULL),(24,'Higadillos de pollo',5.00,200,'higadillos.jpg','aperitivo',NULL,NULL),(25,'Chipirones',9.00,100,'chipirones.jpg','aperitivo',NULL,NULL),(26,'Sepia',10.50,50,'sepia.jpg','aperitivo',NULL,NULL),(27,'Gambas al montón',9.00,50,'gambas.jpeg','aperitivo',NULL,NULL),(28,'Calamares a la romana',9.00,100,'calamares.jpg','aperitivo',NULL,NULL),(29,'Codillo asado',12.00,50,'codillo.jpg','plato',NULL,'Con patatas'),(30,'Presa ibérica',11.00,50,'presa.jpg','plato',NULL,'Con huevo frito, patatas y ensalada'),(31,'Muslo de pollo deshuesado',8.50,100,'muslo.jpg','plato',NULL,'Con huevo frito, patatas y ensalada'),(32,'Solomillo de cerdo a la plancha',10.00,50,'solomillo.webp','plato',NULL,'Con huevo frito, patatas y ensalada'),(33,'Suela de jamón a la plancha',9.00,100,'suela.jpg','plato',NULL,'Con huevo frito, patatas y ensalada'),(34,'Chuletas de cordero manchego',12.50,50,'chuletas.webp','plato',NULL,'Con huevo frito, patatas y ensalada'),(35,'Pinchos morunos',7.50,50,'pinchos.jpeg','plato',NULL,'Con huevo frito, patatas y ensalada'),(36,'Sepionet a la plancha',13.00,100,'sepionet.jpg','plato',NULL,'Con tortilla francesa, patatas y ensalada'),(37,'Lubina a la plancha',11.00,100,'lubina.jpg','plato',NULL,'Con tortilla francesa, patatas y ensalada'),(38,'Emperador a la plancha',10.50,100,'emperador.jpg','plato',NULL,'Con tortilla francesa, patatas  y ensalada'),(39,'Costillar a la barbacoa',12.00,5000,'costillar.jpeg','plato',1,'Con huevo frito y patatas'),(40,'Entrecot de ternera madurada',22.00,50,'entrecot.jpg','plato',NULL,'400 gr. Con patatas'),(41,'Chivito',6.00,80,'chivito.jpg','bocadillo',NULL,NULL),(42,'Submarino',6.00,50,'submarino.webp','bocadillo',NULL,'Lomo, anchoas, tomate, lechuga y mayonesa'),(43,'Chupadedos',5.50,80,'chupadedos.jpg','bocadillo',NULL,'Bacon, queso, huevo, lechuga y mayonesa'),(44,'Jugosito',6.00,400,'jugosito.jpg','bocadillo',NULL,'Lomo, huevo, queso y tomate'),(45,'Vegetal',4.50,60,'vegetal.jpg','bocadillo',NULL,'Lechuga, tomate, atún, huevo y mayonesa'),(46,'Semáforo',5.00,600,'semaforo.webp','bocadillo',NULL,'Francesa, sobrasada, bacon y queso'),(47,'Granjero',5.50,300,'granjero.jpg','bocadillo',NULL,'Pechuga, bacon, queso, tomate y mayonesa'),(48,'Hamburguesa Normal',4.50,600,'hamburguesanormal.jpg','hamburguesa',NULL,'Con tomate, lechuga y cebolla'),(49,'Hamburguesa especial',5.50,600,'hamburguesaespecial.jpg','hamburguesa',NULL,'Con bacon, huevo, queso, tomate, lechuga y cebolla'),(50,'Portofino (130g)',7.50,600,'portofino.webp','hamburguesa',NULL,'Ternera, queso brie y hierbas, tomate, lechuga, queso, bacon'),(51,'Hamburguesa de Buey',8.50,50,'buey.jfif','hamburguesa',NULL,'Tomate, lechuga, queso, cebolla, bacon y huevo'),(52,'Ternera Texas (110g)',7.00,50,'texas.jfif','hamburguesa',NULL,'Tomate, lechuga, cebolla y bacon'),(53,'La Picante (110g)',7.50,100,'picante.jpg','hamburguesa',NULL,'Pollo de corral y cerdo con cayena, tomate, lechuga, queso, bacon y huevo'),(54,'Pollo country (130g)',7.00,200,'pollo.jpg','hamburguesa',NULL,'Pollo, bacon y salsa barbacoa con tomate, lechuga, queso y cebolla'),(55,'Hamburguesa de chuletón (180g)',8.50,400,'chuleton.webp','hamburguesa',1,'Chuletón de ternera, tomate, lechuga, queso, cebolla, bacon y huevo'),(56,'Hamburguesa de aguacate (150g) ',6.00,90,'aguacate.jpg','hamburguesa',1,'VEGANA. Con tomate, lechuga y cebolla'),(57,'Ensalada caprichosa',7.50,200,'caprichosa.jpg','ensalada',NULL,'Lechuga, tomates, salmón, anchoas, frutos secos, crema de vinagre balsámico'),(58,'Ensalada especial',7.50,60,'especial.jpg','ensalada',NULL,'Lechuga, tomate, maíz, manzana, piña, quesos variados, reducción de PX'),(59,'Ensalada Mediterránea',8.50,0,'mediterranea.jpg','ensalada',NULL,'Lechuga, tomate, maíz, manzana, piña, quesos variados, reducción de PX'),(60,'Pizza Margarita',7.00,100,'margarita.jpg','pizza',NULL,'Tomate y queso'),(61,'Pizza Prosciutto',7.00,100,'prosciutto.jfif','pizza',NULL,'Tomate, queso, jamón y champiñón'),(62,'Pizza Cuatro Quesos',7.00,100,'4quesos.jpeg','pizza',NULL,'Tomate y cuatro quesos'),(63,'Pizza Al Tonno',7.00,100,'tonno.jpg','pizza',NULL,'Tomate, queso, atún y cebolla'),(64,'Pizza Barbacoa',7.00,100,'bbq.jpg','pizza',NULL,'Ternera, pollo, bacon, cebolla y salsa barbacoa'),(65,'Pizza Pepperoni',7.00,100,'peperoni.jpg','pizza',NULL,'Tomate, queso, pepperoni y bacon'),(66,'Pizza Tropical',7.00,100,'tropical.jpg','pizza',NULL,'Tomate, queso, bacon, piña y orégano'),(67,'Natillas caseras',3.50,200,'natillas.jpg','postre',NULL,NULL),(68,'Profiteroles con chocolate caliente',3.50,200,'profiteroles.jpg','postre',NULL,NULL),(69,'Coulant con helado de vainilla',4.00,200,'coulant.jpg','postre',NULL,NULL),(70,'Tarta de queso',4.00,200,'tartaqueso.jpg','postre',NULL,NULL),(71,'Torrija de pan de brioche con helado de vainilla',5.00,200,'torrija.jpg','postre',NULL,NULL),(72,'Piña natural',3.50,200,'pina.jpg','postre',NULL,NULL),(73,'Biscuit al caramelo',3.50,200,'biscuit.jpg','postre',NULL,NULL),(74,'Helado de turrón',3.00,200,'helado.jpg','postre',NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `activo` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `usuario` varchar(32) DEFAULT NULL,
  `clave` varchar(32) DEFAULT NULL,
  `nombre` varchar(64) DEFAULT NULL,
  `apellidos` varchar(128) DEFAULT NULL,
  `direccion` varchar(128) DEFAULT NULL,
  `poblacion` varchar(64) DEFAULT NULL,
  `provincia` varchar(32) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,NULL,0,'ruben','fbc71ce36cc20790f2eeed2197898e71','Ruben Martinez',NULL,'C/Carmen 40 4ºA, Albacete',NULL,NULL,NULL,'676138583','margonru@alumni.uv.es'),(2,NULL,0,'juan','fbc71ce36cc20790f2eeed2197898e71','juan',NULL,'direccion',NULL,NULL,NULL,'658966541','adxfl@adfsjd.es'),(4,NULL,0,'fads','6a09965fb1ad7f14539e569c264b15ef','adfs',NULL,'',NULL,NULL,NULL,'661631312','fdsa@dfda.se'),(6,NULL,0,'adsf','28a9492f23a8a2b19291e46ea7ee8ae1','adfs',NULL,'adfsfdas',NULL,NULL,NULL,'965874123','dfsa@sdfa.dfa'),(7,NULL,0,'asdfj�l','fdfc094b2963d74770cc1c40adb50d16','hola',NULL,'cl�kjavc',NULL,NULL,NULL,'698547125','fdj@dd.es'),(8,NULL,0,'sinPedidos','fbc71ce36cc20790f2eeed2197898e71','dsfaj�lk',NULL,'adfsdsafdsa',NULL,NULL,NULL,'687452135','afjds@dfa.es'),(9,NULL,0,'prueba','fbc71ce36cc20790f2eeed2197898e71','ds�aflkj',NULL,'afdsj�kfdas',NULL,NULL,NULL,'698547889','ads@df.es');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

--
-- Dumping routines for database 'bbddbar'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-05 23:37:38
