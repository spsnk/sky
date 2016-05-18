-- MySQL dump 10.13  Distrib 5.5.45, for CYGWIN (x86_64)
--
-- Host: sps.heliohost.org    Database: spsnk_sky
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `administrativo`
--

DROP TABLE IF EXISTS `administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrativo` (
  `idEmpleado` int(11) NOT NULL,
  `Salario` double DEFAULT NULL,
  `Horas` int(11) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrativo`
--

LOCK TABLES `administrativo` WRITE;
/*!40000 ALTER TABLE `administrativo` DISABLE KEYS */;
INSERT INTO `administrativo` VALUES (41,13914.89,6,'pass'),(42,2098.96,1,'pass'),(43,6146.24,3,'pass'),(44,9387.97,7,'pass'),(45,4555.39,6,'pass'),(46,3560.61,4,'pass'),(47,13153.21,5,'pass'),(48,9365.54,8,'pass'),(49,16066.44,2,'pass'),(50,12472.6,3,'pass');
/*!40000 ALTER TABLE `administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canal`
--

DROP TABLE IF EXISTS `canal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canal` (
  `idCanal` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCanal`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canal`
--

LOCK TABLES `canal` WRITE;
/*!40000 ALTER TABLE `canal` DISABLE KEYS */;
INSERT INTO `canal` VALUES (1,'Entretenimiento real','FOX'),(2,'Musica para tus oidos','Mosaico Música y Audio'),(3,'Solo lo mejor de Latinoamérica','MTV Latino'),(4,'Lo mejor de la música del momento','MTV Hits'),(5,'The best for Europe','VH1 Classic Europe'),(6,'Escucha lo mejor de Latinoamérica','VH1 Latino'),(7,'Para bailar un rato','Ritmoson Latino'),(8,'Solo la mejor musica en español','Telehit'),(9,'Lo mejor de las bandas!!','Bandamax'),(10,'Siempre a la vanguardia de la información','FOX News'),(11,'Mantente informado','CNN en Español'),(12,'News for you','CNN International'),(13,'Worldwide News!!','BBC World News'),(14,'Only important news','Management TV'),(15,'National Football League','NFL'),(16,'Canal de las Estrellas México','Canal 2'),(17,'Solo entretenimiento','Canal 5'),(18,'Informado todo el dia','Foro TV'),(19,'Diviertete en grande...','Azteca 7'),(20,'Peliculas para pasar el rato!!','Galavisión'),(21,'Canal del IPN','Once TV'),(22,'Un canal cerca de ti','Azteca 13'),(23,'Todo bajo el análisis de los expertos','Milenio TV'),(24,'El canal de CONACULTA','Canal 22'),(25,'Un nuevo concepto de TV','Proyecto 40'),(26,'El mejor del norte','Canal 34 de Monterrey TV'),(27,'El más destacado de Guadalajara','Canal 4 de Guadalajara TV'),(28,'La mejor señal de Tv abierta del Golfo','Canal 3 Puebla-Veracruz'),(29,'Canal del gobierno del Estado de México','Canal 34 Televisión Mexiquense'),(30,'La TV más interesante!!','Teleantillas'),(31,'La mejor TV del centro de América','TVN-2 Panama'),(32,'Máximo entretenimiento','TV MAX'),(33,'The best movies, series...','BBC Entertainment'),(34,'Solo la mejor diversión','Unicable'),(35,'Las mejores películas!!!','Warner Channel México'),(36,'Entretenimiento puro!!!','E! Entertainment'),(37,'Pura diversion y ocio','FX Latino'),(38,'Calidad y diversión','Universal Channel América Latina'),(39,'Buen entretenimiento para todos','A&E Mundo'),(40,'Encontraste el mejor!!!','AXN Latinoamérica'),(41,'Distracción y pasatiempo','Telemundo Internacional'),(42,'Cuidandote y entreteniéndote...','Discovery Home & Health'),(43,'Una nueva idea de ocio','Fox Life'),(44,'Una nueva forma perder el tiempo','Glitz'),(45,'No dejaras de reír!!','Distrito Comedia'),(46,'El mundo real llevado a tus ojos','Reality Tv'),(47,'Descubre la naturaleza y más','Animal Planet'),(48,'Descubre tu mundo...','Discovery Channel'),(49,'Conoce tu pasado...','History Channel'),(50,'Descubre tu planeta','National Geographic'),(51,'El canal de la UNAM','TV UNAM'),(52,'Conoce la vida de importantes personajes','Biography Channel'),(53,'La televisión del futuro','Marlavision'),(54,'Comunicados con el presente','Enlace TBN'),(55,'Entretenimiento mundial','TVE International'),(56,'Descubre el nuevo entretenimiento','Antena 3'),(57,'...Una nueva forma de entretenerte','Galicia TV'),(58,'Conoce tu planeta','TV Globo Internacional'),(59,'Descubre tu mente','TV 5 Monde Latina'),(60,'Entretenimiento con un nuevo enfoque','Deutsche Welle'),(61,'La mejor de Italia','RAI UNO Italia'),(62,'Japón en tu pantalla','NHK Japon World Premium'),(63,'La mejor para niños','Mosaico Kids'),(64,'A challenge for kids','Discovery Kids'),(65,'Entertainment for kids','Nickelodeon'),(66,'Funny and fool!!','Disney XD'),(67,'The best for kids','Cartoon Network'),(68,'Diviértete como niño','Tiin'),(69,'Disney at your TV','Disney Channel'),(70,'...Destroy your TV!!','Boomerang Mexico'),(71,'The first in your life','Baby Tv'),(72,'For little kids!!!','Nick Jr'),(73,'Childs at the BBC','CBeebies BBC'),(74,'Entertainment for your baby','Disney Junior'),(75,'Para tus tardes...','De Pelicula'),(76,'Golden at your TV','Golden'),(77,'The best of Golden','Golden Edge'),(78,'The unique Golden','Golden Multiplex'),(79,'Real, and unique entertainment','TNT'),(80,'Mejorando tu día','Film & Arts'),(81,'An entertainment area','Film Zone'),(82,'The best movies','Moviecity Premieres'),(83,'Movies at your home','City Family'),(84,'Lo mejor de la temporada','Cinecanal'),(85,'HBO at your home','HBO 2 Latinoamerica'),(86,'Las mejores producciones para ti','HBO Plus'),(87,'Together... in family','HBO Family'),(88,'Premieres, cine... y diversión','Max Prime'),(89,'Disfruta del futbol','Planeta Futbol 1'),(90,'Lo mejor de los deportes','TDN'),(91,'Los deportes en otro enfoque','ESPN International'),(92,'TV con lo mejor del deporte','FOX Sports'),(93,'La fórmula 1 a tu alcance','Speed Latinoamerica'),(94,'Solo para los expertos','Golf Channel'),(95,'Lo mejor del basketball en tu TV','NBA'),(96,'Un mejor analisis de los deportes','ESPN 2'),(97,'Una TV con mas deporte','FOX Sports +'),(98,'Lo mejor seleccion del basketball','NBA Pass1'),(99,'El deporte es oficial','MLB'),(100,'Tu noticiario oficial','Mosaico Noticias');
/*!40000 ALTER TABLE `canal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `canalpaquete`
--

DROP TABLE IF EXISTS `canalpaquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canalpaquete` (
  `idPaquete` int(11) NOT NULL,
  `idCanal` int(11) NOT NULL,
  PRIMARY KEY (`idPaquete`,`idCanal`),
  KEY `idCanal_idx` (`idCanal`),
  CONSTRAINT `canalpaquete_ibfk_1` FOREIGN KEY (`idPaquete`) REFERENCES `paquete` (`idPaquete`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `canalpaquete_ibfk_2` FOREIGN KEY (`idCanal`) REFERENCES `canal` (`idCanal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canalpaquete`
--

LOCK TABLES `canalpaquete` WRITE;
/*!40000 ALTER TABLE `canalpaquete` DISABLE KEYS */;
INSERT INTO `canalpaquete` VALUES (1,1),(2,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(1,2),(2,2),(3,2),(4,2),(5,2),(7,2),(8,2),(9,2),(10,2),(1,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(1,4),(2,4),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(1,5),(3,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(1,6),(2,6),(4,6),(5,6),(6,6),(7,6),(9,6),(10,6),(1,7),(3,7),(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(1,8),(2,8),(3,8),(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(1,9),(2,9),(3,9),(4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(1,10),(2,10),(3,10),(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10),(1,11),(2,11),(3,11),(4,11),(5,11),(6,11),(7,11),(8,11),(9,11),(10,11),(1,12),(3,12),(5,12),(6,12),(8,12),(9,12),(10,12),(1,13),(3,13),(4,13),(6,13),(7,13),(9,13),(1,14),(2,14),(3,14),(4,14),(5,14),(6,14),(7,14),(8,14),(9,14),(10,14),(1,15),(2,15),(3,15),(4,15),(5,15),(6,15),(7,15),(8,15),(9,15),(10,15),(1,16),(2,16),(3,16),(4,16),(5,16),(7,16),(8,16),(9,16),(10,16),(1,17),(2,17),(3,17),(4,17),(5,17),(6,17),(7,17),(8,17),(9,17),(10,17),(1,18),(2,18),(3,18),(4,18),(5,18),(6,18),(7,18),(8,18),(9,18),(10,18),(2,19),(3,19),(4,19),(5,19),(6,19),(7,19),(8,19),(9,19),(10,19),(1,20),(3,20),(4,20),(6,20),(7,20),(8,20),(9,20),(1,21),(2,21),(3,21),(4,21),(6,21),(7,21),(8,21),(9,21),(10,21),(2,22),(3,22),(4,22),(5,22),(6,22),(7,22),(8,22),(10,22),(1,23),(3,23),(4,23),(6,23),(8,23),(9,23),(1,24),(3,24),(4,24),(6,24),(7,24),(8,24),(9,24),(10,24),(1,25),(2,25),(3,25),(4,25),(5,25),(6,25),(7,25),(9,25),(10,25),(1,26),(2,26),(3,26),(4,26),(6,26),(7,26),(8,26),(9,26),(10,26),(1,27),(2,27),(3,27),(4,27),(5,27),(8,27),(9,27),(10,27),(2,28),(3,28),(5,28),(6,28),(7,28),(8,28),(9,28),(10,28),(2,29),(3,29),(5,29),(6,29),(7,29),(8,29),(9,29),(10,29),(1,30),(2,30),(3,30),(5,30),(7,30),(8,30),(9,30),(10,30),(1,31),(2,31),(3,31),(5,31),(7,31),(8,31),(9,31),(10,31),(1,32),(2,32),(3,32),(4,32),(5,32),(6,32),(8,32),(9,32),(10,32),(2,33),(3,33),(4,33),(5,33),(6,33),(7,33),(8,33),(9,33),(10,33),(2,34),(4,34),(5,34),(6,34),(8,34),(9,34),(10,34),(1,35),(2,35),(3,35),(5,35),(6,35),(7,35),(8,35),(9,35),(10,35),(1,36),(2,36),(4,36),(5,36),(7,36),(8,36),(9,36),(10,36),(1,37),(2,37),(3,37),(4,37),(5,37),(6,37),(8,37),(9,37),(10,37),(1,38),(2,38),(3,38),(4,38),(5,38),(6,38),(7,38),(8,38),(9,38),(10,38),(2,39),(3,39),(5,39),(6,39),(7,39),(8,39),(9,39),(10,39),(1,40),(2,40),(3,40),(4,40),(5,40),(6,40),(7,40),(8,40),(9,40),(10,40),(1,41),(2,41),(3,41),(5,41),(6,41),(7,41),(8,41),(9,41),(10,41),(1,42),(2,42),(4,42),(5,42),(6,42),(7,42),(8,42),(9,42),(10,42),(1,43),(2,43),(3,43),(4,43),(5,43),(6,43),(9,43),(10,43),(1,44),(2,44),(3,44),(4,44),(5,44),(6,44),(7,44),(8,44),(9,44),(1,45),(2,45),(3,45),(4,45),(5,45),(7,45),(8,45),(9,45),(10,45),(1,46),(2,46),(3,46),(4,46),(5,46),(6,46),(7,46),(8,46),(9,46),(10,46),(2,47),(3,47),(5,47),(7,47),(8,47),(10,47),(1,48),(2,48),(3,48),(4,48),(6,48),(10,48),(1,49),(2,49),(4,49),(5,49),(6,49),(7,49),(8,49),(9,49),(10,49),(1,50),(2,50),(3,50),(4,50),(5,50),(6,50),(7,50),(8,50),(9,50),(10,50),(1,51),(3,51),(4,51),(5,51),(6,51),(7,51),(8,51),(9,51),(1,52),(2,52),(3,52),(4,52),(5,52),(6,52),(7,52),(8,52),(9,52),(1,53),(4,53),(5,53),(6,53),(8,53),(9,53),(1,54),(2,54),(3,54),(4,54),(5,54),(7,54),(9,54),(10,54),(2,55),(4,55),(8,55),(9,55),(10,55),(3,56),(4,56),(5,56),(6,56),(7,56),(9,56),(10,56),(1,57),(2,57),(3,57),(6,57),(8,57),(9,57),(10,57),(1,58),(2,58),(3,58),(4,58),(5,58),(6,58),(7,58),(10,58),(3,59),(4,59),(5,59),(6,59),(7,59),(8,59),(9,59),(10,59),(1,60),(2,60),(3,60),(4,60),(5,60),(6,60),(7,60),(8,60),(9,60),(10,60),(2,61),(3,61),(4,61),(5,61),(6,61),(7,61),(8,61),(9,61),(10,61),(1,62),(2,62),(3,62),(4,62),(5,62),(6,62),(7,62),(8,62),(9,62),(10,62),(1,63),(2,63),(3,63),(5,63),(6,63),(7,63),(8,63),(9,63),(10,63),(1,64),(2,64),(3,64),(4,64),(5,64),(6,64),(7,64),(9,64),(10,64),(1,65),(2,65),(4,65),(5,65),(7,65),(8,65),(9,65),(10,65),(1,66),(2,66),(4,66),(5,66),(6,66),(7,66),(9,66),(10,66),(1,67),(2,67),(3,67),(4,67),(5,67),(6,67),(7,67),(9,67),(10,67),(1,68),(2,68),(3,68),(4,68),(5,68),(6,68),(2,69),(3,69),(4,69),(5,69),(6,69),(7,69),(8,69),(9,69),(10,69),(1,70),(2,70),(3,70),(4,70),(5,70),(6,70),(7,70),(9,70),(10,70),(1,71),(2,71),(5,71),(6,71),(8,71),(9,71),(1,72),(2,72),(4,72),(5,72),(7,72),(8,72),(9,72),(10,72),(1,73),(3,73),(4,73),(5,73),(6,73),(7,73),(8,73),(9,73),(10,73),(1,74),(2,74),(3,74),(4,74),(5,74),(6,74),(7,74),(8,74),(9,74),(10,74),(1,75),(3,75),(5,75),(6,75),(7,75),(8,75),(9,75),(2,76),(3,76),(4,76),(6,76),(8,76),(9,76),(10,76),(1,77),(2,77),(3,77),(4,77),(5,77),(6,77),(9,77),(2,78),(3,78),(4,78),(5,78),(6,78),(7,78),(8,78),(9,78),(1,79),(2,79),(3,79),(4,79),(5,79),(6,79),(7,79),(8,79),(9,79),(10,79),(2,80),(3,80),(4,80),(5,80),(6,80),(7,80),(8,80),(9,80),(2,81),(3,81),(4,81),(6,81),(7,81),(8,81),(9,81),(10,81),(2,82),(3,82),(4,82),(5,82),(6,82),(7,82),(9,82),(10,82),(1,83),(2,83),(3,83),(4,83),(5,83),(6,83),(8,83),(9,83),(10,83),(2,84),(3,84),(4,84),(5,84),(6,84),(7,84),(8,84),(9,84),(10,84),(1,85),(3,85),(5,85),(6,85),(7,85),(8,85),(9,85),(10,85),(1,86),(2,86),(3,86),(4,86),(5,86),(6,86),(8,86),(9,86),(10,86),(1,87),(2,87),(3,87),(4,87),(5,87),(7,87),(8,87),(9,87),(10,87),(1,88),(2,88),(3,88),(5,88),(6,88),(7,88),(8,88),(9,88),(10,88),(1,89),(2,89),(3,89),(4,89),(6,89),(7,89),(8,89),(9,89),(10,89),(1,90),(2,90),(3,90),(4,90),(5,90),(6,90),(7,90),(8,90),(9,90),(1,91),(2,91),(3,91),(4,91),(5,91),(6,91),(7,91),(8,91),(9,91),(10,91),(1,92),(2,92),(3,92),(4,92),(5,92),(6,92),(7,92),(9,92),(10,92),(1,93),(2,93),(4,93),(5,93),(6,93),(7,93),(8,93),(9,93),(10,93),(1,94),(3,94),(4,94),(6,94),(7,94),(8,94),(9,94),(10,94),(1,95),(3,95),(4,95),(5,95),(6,95),(9,95),(10,95),(1,96),(2,96),(3,96),(4,96),(5,96),(6,96),(8,96),(9,96),(10,96),(1,97),(2,97),(3,97),(4,97),(5,97),(6,97),(7,97),(8,97),(9,97),(10,97),(1,98),(2,98),(3,98),(6,98),(7,98),(8,98),(9,98),(10,98),(1,99),(2,99),(3,99),(4,99),(5,99),(7,99),(8,99),(9,99),(1,100),(2,100),(3,100),(4,100),(5,100),(6,100),(7,100),(8,100),(9,100),(10,100);
/*!40000 ALTER TABLE `canalpaquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `noCuenta` int(11) NOT NULL AUTO_INCREMENT,
  `Telefono` varchar(45) DEFAULT NULL,
  `Calle` varchar(45) DEFAULT NULL,
  `Colonia` varchar(45) DEFAULT NULL,
  `CP` varchar(45) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `ap` varchar(45) DEFAULT NULL,
  `am` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`noCuenta`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'5533687309','AV CENTRAL','FRACC VILLAS DEL SOL I','55070','1994-12-08','Susana','Valencia','Rojas','Susana'),(2,'5517626693','PARCELA 124','EJIDOS DE TEQUISISTLAN','56020','1997-04-12','Rigoberto','Covarrubias','Ramirez','Rigoberto'),(3,'5538497112','AV BOSQUES ','FRACC VILLAS DE ECATEPEC','55056 ','1992-06-05','Alejandra','Nieves','Velazquez','Alejandra'),(4,'5528628350','TEPIC','SANTA MARIA TULPETLAC','55400','1987-01-15','Martha Marlen','Mendarte','Angeles','Martha'),(5,'7773799618','CALLE DOS','MEXICANOS UNIDOS II','55074','1996-01-30','Zenaida ','Mendosa','Jimenes','Zenaida'),(6,'5531046400','VALLE HUNDIDO','REAL DEL VALLE ','55882','1972-09-25','Mario Alberto','Diaz','Martinez','Mario'),(7,'5522959463','AV LAGO DE PATSCUARO','LAGUNA DE CHICONAUTLA','55070','1984-02-19','Jesus Lizbeth','Padron','Gonzalez','Jesus'),(8,'46305955','MONTE ESTANOBOY','FRACC JARDINES DE MORELOS','55070 ','1958-03-09','Gilberto','Oliver','Castañeda ','Gilberto'),(9,'57750756','HIDALGO','SANTA MARIA TULPETLAC','55400','1965-04-19','Veronica','Jimenez ','Ortega ','Veronica'),(10,'5524109704','RAMON LOPEZ VELARDE ','BENITO JUAREZ 3RA SECCION','55416','1975-05-06','Norma','Rodriguez','Pintor','Norma'),(11,'5549197079','RAMON LOPEZ VELARDE','BENITO JUAREZ 2DA SECCION','55416','1968-06-17','Edgar','Montes','Muñoz','Edgar'),(12,'7773799618','AV DE LAS BOMBAS ','MEXICANOS UNIDOS II','55074','1955-12-26','Zenaida','Jimenes','Mendosa','Zenaida'),(13,'5524095965','PLAYA TABACHINES','FRACC JARDINES DE MORELOS','55070','1975-05-13','Damian','Moraga','Ortega','Damian'),(14,'5533030840','AMAPOLA','NUEVA SANTA ROSA','56300','2000-12-18','Georgina Jacqueline','Melendez','Olivares','Georgina'),(15,'5524130734','HEBERTO CASTILLO','LAGUNA DE CHICONAUTLA','55070','1966-11-30','Maria Del Carmen','Hernandez','Yañez','Maria'),(16,'5545382971','MARGARITA','EJIDOS DE TEQUISISTLAN','56020','1989-09-15','Jose Isaias','Perez','Galvan','Jose'),(17,'5524480710','ABEDUL','LA PALMA','55507','1997-02-27','Alejandro','Cortes','Rios','Alejandro'),(18,'5521396408','PSO VALLE DE LAS FLORES','REAL DEL VALLE 2A SECC ','55883','1979-10-09','Maria Nieves','Albino','Cortez','Nieves'),(19,'5528628350','TEPIC','AMPL TULPETLAC','55400','1996-12-30','Martha Marlen','Mendarte','Angeles','Marlen'),(20,'5560418015','CLAUSTRO SAN ALBERTO','MISION SAN AGUSTIN','55885','1951-05-11','Mayra Alejandra','Hernandez','Peña','Mayra'),(21,'5514349417','TULIPAN','NUEVA SANTA ROSA','56300','1982-06-20','Dario','Perez','Soria','Dario'),(22,'5544754962','CDA IGNACIO MANUEL ALTAMIRANOselect','SAN ANTONIO XAHUENTO','54960','1960-05-02','Jose','Rodriguez','Resendiz','Jose'),(23,'5520438855','HORTENCIA','SANTA ROSA','56300','1980-08-06','Jose Luis','Contreras','Benitez','Luis'),(24,'5549453886','SANTOS DEGOLLADO','NUEVA SANTA ROSA GRANJAS EL ARENAL','56300','1957-06-17','Linda Pamela','Perez','Trujano','Linda'),(25,'6242293292','GUANAJUATO','AMPL TULPETLAC','55418','1985-12-26','Carolina','Cruzaley','Ramirez','Carolina'),(26,'29345169','AV LAGO DE TEXCOCO','FRACC GEOVILLAS DE TERRANOVA','55883','1995-11-29','Ma Asuncion','Garcia','Garcia','Asuncion'),(27,'5519370977','CTO VALLE DE LOMELINA','REAL DEL VALLE 2A SECC','55883','1965-01-31','Aldo','Aviles','Estrella','Aldo'),(28,'55133212','Diamante 130','Estrella','07810','1988-07-16','Salvador','Paz','Santos','Salvador'),(29,'5572979665','CTO LAGO XALTOCAN','REAL DEL VALLE','55883','1999-11-11','Diana Karina','Galicia','Palacios','Diana'),(30,'5539382322','CERRITO','SANTA MARIA TULPETLAC','55400','1955-05-05','Erendira Paola','Reymundo','Santoyo','Erendida'),(31,'5533184574','MARAVILLAS','EJIDOS DE TEQUISISTLAN','56020','1987-11-08','Nadia Suhgey','Caballero','Avila','Nadia'),(32,'5538853754','HUEHUETOCA','EL OSTOR','55089','1955-12-06','Jose Mauricio','Cobielles','Gaona','Mauricio'),(33,'5544760906','AV NACIONAL','SANTA MARIA CHICONAUTLA','55066','1992-02-20','Miriam','Jimenez','Luna','Miriam'),(34,'5546616639','BOSQUE DE VARONA','EJIDOS DE TEQUISISTLAN','56020','1991-01-01','Leticia','Durazno','Romero','Leticia'),(35,'5544754962','CDA IGNACIO MANUEL ALTAMIRANO','BARRIO SAN ANTONIO XAHUENTO','54960','1984-04-04','Jose','Rodriguez','Resendiz','Jose'),(36,'5523422439','ATLACOMULCO','ALMARCIGO NTE','55415','1988-08-08','Arturo','Vazquez','Jimenez','Arturo'),(37,'2361008076','CHAPULTEPEC','HIDALGO','68540','1991-10-10','Josefina','Rojas','Pereda','Josefina'),(38,'5549132383','AV TOLUCA','EL OSTOR','55400','1952-12-12','Jose Alejandro','Rubio','Reyes','Jose'),(39,'5520675131','SANTA FRANCISCA','LA PANORAMICA','55036','1965-01-13','Francisco Arturo','Martinez ','Alvarado ','Francisco'),(40,'5559542730','PROL ACAMBAY','AREA NUEVA','55400','1970-02-14','Giovani','Vite','Alvarez','Giovani'),(41,'5538488453','OCOTE','VIVEROS DE TULPETLAC','55080','1999-11-16','David','Ramirez','Suarez','David'),(42,'5538276565','2A PRIV CTO 43','HEROES DE TECAMAC SEXTA SECC','55765','1956-05-17','Gloria','Elvira','Torres','Gloria'),(43,'4271362641','CALLE 4','EL TEJOCOTE','55017','1968-08-18','Laura','Salinas','Mira','Laura'),(44,'5542646121','REFORMA','EJIDOS DE TEQUISISTLAN','56020','1974-12-19','Linda Marlene ','Ruiz','Alamo','Linda'),(45,'5524471779','PERLAS NEGRAS','LA JOYA ','55016','1973-01-20','Jose Antonio','Ortiz','Alvarado','Antonio'),(46,'5531010315','DURAZNO','AMPL LOS ANGELES','55885','1969-05-21','Maria Guadalupe','Martinez','Gonzalez','Guadalupe'),(47,'5569891387','1A CDA PIRULES','LA JOYA','55016','1952-09-22','Nallely','Pineda','Lopez','Nallely'),(48,'51267993','PARQ DE LOS VENADOS','EL PARQUE','55414','1990-06-23','Antonio De Jesus','Torres','Tapia','Antonio'),(49,'5565791567','NARDO','EJIDOS DE TEQUISISTLAN','56020','1994-04-24','Jose Manuel ','Islas','Ruiz',''),(50,'5510208792','3 AMORES','CONTITUCION EL SALADO','56300','1995-05-25','Regina','Davalos','Garcia','Regina');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dopaquete`
--

DROP TABLE IF EXISTS `dopaquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dopaquete` (
  `noCuenta` int(11) NOT NULL,
  `idPaquete` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  `fechaSubscripcion` date NOT NULL,
  `fechaCancelacion` date DEFAULT NULL,
  PRIMARY KEY (`noCuenta`,`idPaquete`,`idEquipo`,`fechaSubscripcion`),
  KEY `idPaquete_idx` (`idPaquete`),
  KEY `idEquipo_idx` (`idEquipo`),
  CONSTRAINT `dopaquete_ibfk_1` FOREIGN KEY (`noCuenta`) REFERENCES `cliente` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dopaquete_ibfk_2` FOREIGN KEY (`idPaquete`) REFERENCES `paquete` (`idPaquete`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dopaquete_ibfk_3` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dopaquete`
--

LOCK TABLES `dopaquete` WRITE;
/*!40000 ALTER TABLE `dopaquete` DISABLE KEYS */;
INSERT INTO `dopaquete` VALUES (1,4,44,'2016-04-02',NULL),(1,9,9,'2016-03-14',NULL),(2,7,33,'2016-04-19',NULL),(2,7,100,'2016-05-05',NULL),(3,2,1,'2016-03-27',NULL),(3,3,24,'2016-03-19',NULL),(3,7,59,'2016-05-04',NULL),(4,6,91,'2016-04-08',NULL),(5,6,98,'2016-03-30',NULL),(5,9,89,'2016-03-24',NULL),(6,6,54,'2016-04-29',NULL),(7,3,8,'2016-03-29',NULL),(8,1,15,'2016-03-14','2016-05-12'),(9,2,62,'2016-04-15',NULL),(9,3,13,'2016-03-21',NULL),(10,1,61,'2016-03-20',NULL),(10,3,80,'2016-03-20',NULL),(10,7,43,'2016-04-08',NULL),(10,7,78,'2016-03-31',NULL),(10,9,12,'2016-04-11',NULL),(11,3,46,'2016-03-28',NULL),(11,3,92,'2016-03-21',NULL),(11,5,48,'2016-03-28',NULL),(12,10,58,'2016-04-30',NULL),(13,7,77,'2016-04-17',NULL),(14,2,5,'2016-03-14',NULL),(16,1,35,'2016-05-08',NULL),(16,3,84,'2016-05-07',NULL),(16,6,22,'2016-05-09',NULL),(17,3,2,'2016-04-16',NULL),(18,5,30,'2016-03-16',NULL),(18,7,66,'2016-04-22',NULL),(19,6,71,'2016-04-06',NULL),(20,7,28,'2016-03-18','2016-05-12'),(20,7,49,'2016-03-17','2016-05-12'),(20,10,74,'2016-04-12','2016-05-12'),(21,3,72,'2016-05-10',NULL),(21,7,3,'2016-05-08',NULL),(21,8,4,'2016-03-30',NULL),(21,8,36,'2016-04-04',NULL),(22,2,97,'2016-04-25',NULL),(22,10,19,'2016-03-31',NULL),(22,10,73,'2016-04-02',NULL),(24,2,17,'2016-04-19',NULL),(24,2,18,'2016-04-20',NULL),(24,6,95,'2016-04-30',NULL),(24,8,96,'2016-04-22',NULL),(24,9,82,'2016-03-21',NULL),(24,9,86,'2016-05-10',NULL),(25,4,26,'2016-04-18',NULL),(25,5,6,'2016-03-21',NULL),(25,8,93,'2016-04-15',NULL),(27,1,81,'2016-04-12',NULL),(27,5,23,'2016-04-02',NULL),(27,6,87,'2016-04-27',NULL),(28,2,14,'2016-03-20',NULL),(28,9,31,'2016-04-02',NULL),(28,10,65,'2016-05-11',NULL),(28,10,88,'2016-05-01',NULL),(29,7,20,'2016-03-27',NULL),(29,9,10,'2016-04-13',NULL),(30,4,55,'2016-03-28',NULL),(30,4,57,'2016-05-08',NULL),(31,9,79,'2016-04-09',NULL),(32,4,38,'2016-03-30',NULL),(32,7,51,'2016-04-09',NULL),(33,1,39,'2016-04-16',NULL),(33,3,67,'2016-05-05',NULL),(34,2,70,'2016-03-28',NULL),(35,1,60,'2016-04-26',NULL),(35,2,63,'2016-04-17',NULL),(35,5,16,'2016-04-19',NULL),(36,1,90,'2016-04-27',NULL),(38,3,75,'2016-03-18',NULL),(39,1,29,'2016-05-05',NULL),(39,2,52,'2016-04-27',NULL),(39,3,83,'2016-03-26',NULL),(40,9,32,'2016-05-04',NULL),(41,9,64,'2016-04-07','2016-05-12'),(42,8,21,'2016-04-24',NULL),(42,10,42,'2016-04-17',NULL),(43,1,56,'2016-04-11',NULL),(44,5,50,'2016-03-25',NULL),(44,7,25,'2016-04-01',NULL),(45,4,34,'2016-03-23',NULL),(45,8,76,'2016-03-21',NULL),(46,2,41,'2016-05-09',NULL),(46,7,37,'2016-04-25',NULL),(47,4,27,'2016-05-06',NULL),(48,3,11,'2016-04-19',NULL),(48,5,47,'2016-04-11',NULL),(48,5,68,'2016-04-27',NULL),(48,10,53,'2016-05-12',NULL),(50,3,69,'2016-05-09',NULL),(50,6,94,'2016-04-07',NULL);
/*!40000 ALTER TABLE `dopaquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doservicio`
--

DROP TABLE IF EXISTS `doservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doservicio` (
  `idServicio` int(11) NOT NULL,
  `noCuenta` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaServicio` date NOT NULL,
  PRIMARY KEY (`noCuenta`,`idEmpleado`,`fechaServicio`,`idServicio`),
  KEY `noCuenta_idx` (`noCuenta`),
  KEY `idEmpleado_idx` (`idEmpleado`),
  KEY `idServicio` (`idServicio`),
  CONSTRAINT `doservicio_ibfk_1` FOREIGN KEY (`noCuenta`) REFERENCES `cliente` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doservicio_ibfk_2` FOREIGN KEY (`idServicio`) REFERENCES `servicio` (`idServicio`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `doservicio_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `tecnico` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doservicio`
--

LOCK TABLES `doservicio` WRITE;
/*!40000 ALTER TABLE `doservicio` DISABLE KEYS */;
INSERT INTO `doservicio` VALUES (9,1,19,'2016-01-24'),(8,3,1,'2015-06-15'),(8,3,5,'2015-12-20'),(1,3,7,'2015-09-26'),(4,3,14,'2015-10-26'),(7,3,15,'2015-09-21'),(2,4,1,'2015-07-13'),(8,4,8,'2015-08-06'),(4,4,10,'2016-05-08'),(3,4,26,'2015-06-14'),(6,4,29,'2015-12-31'),(9,4,35,'2016-03-18'),(2,5,5,'2016-01-23'),(4,5,21,'2016-01-27'),(9,5,40,'2015-08-26'),(5,6,12,'2016-03-11'),(6,6,31,'2015-11-09'),(6,6,32,'2015-09-21'),(2,7,5,'2016-02-20'),(8,7,14,'2016-01-18'),(8,7,15,'2015-11-26'),(5,7,17,'2015-09-05'),(8,8,16,'2015-10-29'),(8,8,17,'2015-09-29'),(2,8,17,'2015-10-15'),(10,8,31,'2015-11-30'),(2,9,10,'2015-08-11'),(2,9,20,'2015-06-28'),(3,10,5,'2016-04-23'),(8,10,32,'2015-12-10'),(4,11,5,'2015-06-14'),(9,11,22,'2016-03-29'),(5,11,30,'2016-05-05'),(7,12,8,'2016-01-10'),(10,12,18,'2015-12-08'),(1,12,40,'2016-02-26'),(10,13,16,'2016-03-13'),(10,13,19,'2015-11-01'),(5,14,1,'2016-02-13'),(1,15,7,'2015-05-18'),(4,15,17,'2016-03-14'),(4,15,20,'2015-10-23'),(3,15,27,'2015-11-02'),(6,15,32,'2016-04-03'),(2,15,34,'2016-01-12'),(5,15,40,'2016-04-01'),(2,16,1,'2016-03-29'),(5,16,13,'2015-10-09'),(8,16,18,'2016-03-02'),(6,16,33,'2016-03-29'),(1,17,18,'2016-03-05'),(7,17,26,'2016-03-20'),(9,17,38,'2015-08-24'),(8,18,26,'2016-03-15'),(1,18,30,'2015-10-03'),(7,18,36,'2015-12-31'),(7,18,38,'2015-10-09'),(2,19,11,'2016-03-15'),(8,20,28,'2016-02-02'),(1,20,30,'2015-11-18'),(10,21,9,'2015-07-08'),(6,21,12,'2016-02-18'),(6,21,13,'2015-12-27'),(3,21,15,'2015-10-07'),(9,21,19,'2016-03-16'),(9,21,21,'2016-01-28'),(5,21,35,'2015-05-13'),(4,22,1,'2015-08-06'),(8,22,4,'2016-03-31'),(7,22,6,'2015-12-27'),(7,22,15,'2015-10-22'),(6,22,26,'2015-07-10'),(5,22,33,'2015-07-23'),(2,22,35,'2015-05-22'),(8,22,36,'2016-04-09'),(1,23,4,'2016-03-20'),(6,23,22,'2015-12-24'),(10,23,23,'2015-11-23'),(6,23,26,'2015-07-18'),(2,23,34,'2015-07-22'),(5,24,1,'2015-10-09'),(1,24,3,'2015-06-05'),(7,24,17,'2015-09-03'),(6,24,22,'2016-01-07'),(10,24,25,'2015-08-30'),(3,24,25,'2015-09-02'),(10,24,26,'2015-07-24'),(10,24,26,'2015-08-23'),(2,24,34,'2015-07-05'),(5,25,5,'2016-04-13'),(6,25,31,'2015-12-23'),(1,26,14,'2016-03-31'),(4,26,28,'2015-07-01'),(3,26,33,'2015-10-28'),(6,26,36,'2015-05-27'),(5,27,10,'2015-10-08'),(7,27,29,'2015-06-03'),(6,27,38,'2016-04-18'),(3,28,6,'2016-05-03'),(3,28,8,'2016-02-15'),(4,28,33,'2015-12-21'),(3,28,34,'2015-10-05'),(7,28,36,'2015-07-21'),(10,28,39,'2016-02-20'),(9,29,10,'2015-11-22'),(3,29,11,'2015-10-23'),(2,29,14,'2015-06-19'),(1,29,22,'2015-05-20'),(8,29,30,'2016-04-30'),(4,29,37,'2015-06-25'),(2,30,17,'2016-02-25'),(5,30,20,'2015-09-18'),(7,31,3,'2015-11-08'),(7,31,3,'2015-11-11'),(6,31,10,'2015-12-20'),(9,31,16,'2016-03-30'),(9,31,22,'2015-07-02'),(4,33,2,'2016-01-22'),(3,33,16,'2016-05-03'),(3,33,18,'2016-02-24'),(4,34,6,'2015-08-28'),(5,34,6,'2015-08-30'),(1,34,13,'2015-11-09'),(7,34,20,'2015-12-19'),(10,34,27,'2016-01-20'),(6,34,27,'2016-02-12'),(8,35,7,'2015-08-15'),(7,35,18,'2016-04-10'),(3,35,29,'2015-10-27'),(9,36,4,'2016-02-02'),(2,36,8,'2015-08-10'),(5,36,9,'2015-06-16'),(5,36,11,'2016-03-06'),(8,36,15,'2015-08-13'),(1,36,17,'2015-06-13'),(7,36,28,'2016-01-25'),(3,36,30,'2015-10-17'),(9,36,40,'2015-06-24'),(5,37,8,'2015-07-30'),(9,37,10,'2015-05-30'),(2,37,12,'2016-02-09'),(8,37,23,'2015-10-01'),(3,37,33,'2015-06-07'),(3,37,35,'2016-03-12'),(6,38,3,'2016-04-24'),(6,38,7,'2015-10-30'),(2,38,12,'2016-03-07'),(2,38,14,'2015-11-13'),(2,38,15,'2015-10-15'),(8,38,25,'2015-08-04'),(3,39,3,'2016-05-03'),(1,39,26,'2015-06-13'),(7,39,37,'2016-02-06'),(10,40,7,'2015-11-29'),(5,40,27,'2015-06-02'),(7,41,5,'2016-03-11'),(3,41,8,'2015-11-27'),(2,41,22,'2016-02-04'),(5,41,25,'2015-09-12'),(1,42,4,'2015-05-19'),(7,42,4,'2015-06-10'),(7,42,5,'2016-05-01'),(4,42,8,'2015-11-14'),(7,42,12,'2015-05-14'),(10,42,12,'2015-05-29'),(10,42,16,'2015-12-21'),(2,42,31,'2016-02-11'),(1,42,36,'2015-05-13'),(7,43,7,'2016-02-11'),(7,43,20,'2015-06-25'),(3,43,25,'2015-11-20'),(6,43,28,'2015-05-26'),(9,43,28,'2015-07-12'),(9,43,32,'2015-12-22'),(7,44,13,'2015-05-20'),(6,44,28,'2015-07-05'),(6,44,28,'2015-07-26'),(9,44,30,'2016-04-20'),(5,44,39,'2016-03-01'),(1,45,15,'2016-03-19'),(10,45,27,'2015-09-19'),(6,45,29,'2015-06-13'),(2,45,34,'2015-10-05'),(9,45,34,'2015-10-22'),(9,45,40,'2016-02-10'),(2,46,39,'2016-03-27'),(7,47,33,'2016-01-31'),(10,47,35,'2015-11-15'),(3,48,1,'2016-03-11'),(1,48,23,'2015-05-25'),(7,48,36,'2015-09-17'),(10,49,6,'2015-08-07'),(2,49,17,'2016-03-24'),(4,49,30,'2015-07-19'),(4,49,32,'2015-05-26'),(4,49,34,'2016-02-07'),(4,50,1,'2016-03-16'),(10,50,6,'2015-08-07'),(3,50,7,'2015-07-17'),(1,50,32,'2015-05-18');
/*!40000 ALTER TABLE `doservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `ap` varchar(45) DEFAULT NULL,
  `am` varchar(45) DEFAULT NULL,
  `fechaContratacion` date DEFAULT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Rogelio','Contreras','Salazar','2014-01-23','T'),(2,'Julio Cesar','Paredes','Carmona','2014-07-11','T'),(3,'Darío','Gómez','Hernández','2014-08-05','T'),(4,'Guillermo','Álvarez','Torres','2016-03-14','T'),(5,'Kevin Josué','Romero','Ayala','2015-07-23','T'),(6,'Carolina','Gutiérrez','Mora','2015-09-01','T'),(7,'Marco Antonio','Rodríguez','Molina','2015-10-09','T'),(8,'Pedro','Arellano','Zaragoza','2014-12-10','T'),(9,'Jorge','Carmona','Arzate','2016-05-09','T'),(10,'Luis Armando','Torres','Rico','2014-11-25','T'),(11,'Gudalupe','Estrada','Jimenez','2015-06-03','T'),(12,'Rogelio','Mora','Domínguez','2015-09-28','T'),(13,'Hugo','Serrano','Paredes','2014-04-01','T'),(14,'Julián Alfaro','Juaréz','Cisneros','2016-02-10','T'),(15,'Iván','Díaz','Delgado','2014-07-22','T'),(16,'Johan','Pelaez','Uribe','2014-05-29','T'),(17,'Bryan','García','Bonilla','2015-03-18','T'),(18,'Teodolfo Uriel','Carrillo','Sánchez','2015-07-31','T'),(19,'Christian Yamil','Orozco','Villar','2016-04-04','T'),(20,'Javier','Morales','Martínez','2014-12-05','T'),(21,'Flavio Cesár','Tellez','Rubio','2015-08-22','T'),(22,'Carlos','Beltrán','Rojas','2014-01-14','T'),(23,'Armando','Jimenez','Vera','2016-04-25','T'),(24,'Rogelio Uriel','Romero','Sánchez','2015-11-19','T'),(25,'José Luis','Beltrán','Echeverría','2015-09-21','T'),(26,'Andrés','Lopéz','Contreras','2015-02-20','T'),(27,'Ramón','Arzate','Salazar','2015-12-15','T'),(28,'Eduardo','Costa','Sánchez','2015-01-09','T'),(29,'Alan','Pascual','Ruiz','2014-07-02','T'),(30,'Israel','Gómez','Gutiérrez','2016-04-08','T'),(31,'José Ignacio','Duarte','Iglesias','2014-10-28','T'),(32,'Oscar','Barrientos','Suárez','2014-12-01','T'),(33,'Julián','Cisneros','Carmona','2014-01-17','T'),(34,'Francisco','Rojas','Tovias','2015-02-11','T'),(35,'Cesár','Álvarez','Torres','2015-05-11','T'),(36,'Alfredo','Domínguez','García','2015-07-06','T'),(37,'Carlos','Molina','Gallego','2016-02-15','T'),(38,'Javier','Barranco','Díaz','2016-04-01','T'),(39,'Fernando','Velez','Pérez','2015-06-24','T'),(40,'Raúl','Castañon','Díaz','2015-10-08','T'),(41,'Cynthia Aylin','Serna','Vázquez','2014-09-02','A'),(42,'Carmen','Rojas','Rodríguez','2015-03-09','A'),(43,'Julieta','Ruiz','Estrada','2014-01-10','A'),(44,'Helena','Romero','Villaseñor','2014-01-08','A'),(45,'Johanna','Rodríguez','Castro','2015-06-03','A'),(46,'Jennifer','Salas','Veloz','2014-08-14','A'),(47,'Katia','Uribe','Gómez','2014-08-29','A'),(48,'Genaro','Roman','Lopéz','2015-02-06','A'),(49,'Lydia','Muñoz','Duarte','2015-12-07','A'),(50,'Marisol','Díaz','Juaréz','2014-06-06','A');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `noTarjeta` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `idProveedor_idx` (`idProveedor`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,446949,5),(2,279014,6),(3,378729,9),(4,184730,1),(5,101323,9),(6,262558,4),(8,394492,9),(9,504957,6),(10,643753,3),(11,486698,5),(12,753499,5),(13,936194,4),(14,206211,5),(15,892265,1),(16,697133,2),(17,715142,1),(18,113518,1),(19,220557,6),(20,468936,4),(21,624778,9),(22,450355,5),(23,233747,4),(24,388006,6),(25,768391,1),(26,307386,9),(27,724824,9),(28,205187,1),(29,975139,7),(30,480960,2),(31,361997,2),(32,749309,3),(33,178901,7),(34,255342,9),(35,541396,1),(36,788454,7),(37,208067,6),(38,457185,4),(39,513923,4),(41,122354,5),(42,975835,7),(43,339680,5),(44,371418,3),(46,653968,4),(47,726948,6),(48,726296,9),(49,957093,4),(50,848119,2),(51,300426,7),(52,775031,7),(53,321753,2),(54,938035,3),(55,526893,7),(56,668659,4),(57,762481,8),(58,369212,4),(59,152710,2),(60,478592,8),(61,518859,1),(62,150997,1),(63,899214,5),(64,426104,6),(65,903044,7),(66,722916,5),(67,208017,3),(68,146080,5),(69,903371,3),(70,549341,8),(71,507132,9),(72,191452,9),(73,873401,8),(74,471550,7),(75,198840,6),(76,434018,3),(77,156781,7),(78,872690,5),(79,770080,4),(80,477314,2),(81,338260,1),(82,331114,3),(83,546836,8),(84,209861,5),(86,162218,6),(87,689586,6),(88,842171,5),(89,794981,6),(90,325111,8),(91,822275,9),(92,997236,4),(93,747004,6),(94,717970,8),(95,618388,7),(96,787656,8),(97,399977,5),(98,510657,9),(100,655500,4);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `idTransaccion` int(11) NOT NULL AUTO_INCREMENT,
  `Monto` float DEFAULT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `idEmpleado` int(11) DEFAULT NULL,
  `noCuenta` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTransaccion`),
  KEY `idEmpleado_idx` (`idEmpleado`),
  KEY `noCuenta_idx` (`noCuenta`),
  KEY `idProveedor_idx` (`idProveedor`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`noCuenta`) REFERENCES `cliente` (`noCuenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,914.3,'cobro renta','2016-04-18 19:28:44',NULL,14,NULL),(2,155.21,'cobro renta','2016-04-26 18:28:44',NULL,5,NULL),(3,730.73,'cobro renta','2016-04-26 12:28:44',NULL,3,NULL),(4,268.03,'cobro renta','2016-05-04 00:28:44',NULL,18,NULL),(5,712.87,'cobro renta','2016-05-09 19:28:44',NULL,25,NULL),(6,793.4,'cobro renta','2016-04-30 18:28:45',NULL,10,NULL),(7,224.68,'cobro renta','2016-04-20 02:28:45',NULL,24,NULL),(8,553.11,'cobro renta','2016-04-13 21:28:46',NULL,48,NULL),(9,182.45,'cobro renta','2016-04-14 00:28:46',NULL,50,NULL),(10,662.5,'cobro renta','2016-05-10 10:28:47',NULL,5,NULL),(11,73.98,'cobro renta','2016-04-22 13:28:47',NULL,13,NULL),(12,30.89,'cobro renta','2016-05-06 11:28:47',NULL,50,NULL),(13,474.15,'cobro renta','2016-04-12 21:28:47',NULL,41,NULL),(14,98.43,'cobro renta','2016-05-02 21:28:47',NULL,20,NULL),(15,72.75,'cobro renta','2016-04-18 07:28:47',NULL,10,NULL),(16,162.35,'cobro renta','2016-04-20 18:28:47',NULL,36,NULL),(17,24.4,'cobro renta','2016-05-10 13:28:47',NULL,2,NULL),(18,568.75,'cobro renta','2016-04-29 01:28:47',NULL,7,NULL),(19,841.8,'cobro renta','2016-04-13 17:28:47',NULL,22,NULL),(20,987.96,'cobro renta','2016-04-28 00:28:47',NULL,8,NULL),(21,308.63,'cobro renta','2016-04-25 22:28:47',NULL,17,NULL),(22,15.33,'cobro renta','2016-04-14 09:28:47',NULL,37,NULL),(23,893.52,'cobro renta','2016-04-15 06:28:47',NULL,27,NULL),(24,68.36,'cobro renta','2016-05-08 14:28:47',NULL,38,NULL),(25,343.91,'cobro renta','2016-04-20 06:28:47',NULL,17,NULL),(26,667.41,'cobro renta','2016-04-22 13:28:47',NULL,29,NULL),(27,107.45,'cobro renta','2016-04-14 07:28:47',NULL,11,NULL),(28,576.34,'cobro renta','2016-05-09 07:28:47',NULL,14,NULL),(29,206.33,'cobro renta','2016-04-13 03:28:47',NULL,35,NULL),(30,945.42,'cobro renta','2016-05-04 16:28:47',NULL,9,NULL),(31,63.18,'cobro renta','2016-05-04 08:28:47',NULL,18,NULL),(32,528.12,'cobro renta','2016-04-27 13:28:47',NULL,3,NULL),(33,544.28,'cobro renta','2016-05-01 16:28:47',NULL,40,NULL),(34,283.58,'cobro renta','2016-05-04 16:28:47',NULL,3,NULL),(35,990.9,'cobro renta','2016-04-13 21:28:47',NULL,18,NULL),(36,615.46,'cobro renta','2016-05-10 20:28:47',NULL,35,NULL),(37,482.88,'cobro renta','2016-04-27 20:28:47',NULL,16,NULL),(38,13.41,'cobro renta','2016-04-29 05:28:47',NULL,45,NULL),(39,35.43,'cobro renta','2016-05-11 19:28:47',NULL,3,NULL),(40,472.18,'cobro renta','2016-04-21 12:28:47',NULL,45,NULL),(41,817.94,'cobro renta','2016-05-06 10:28:47',NULL,49,NULL),(42,686.74,'cobro renta','2016-05-08 21:28:47',NULL,23,NULL),(43,854.76,'cobro renta','2016-04-12 07:28:47',NULL,22,NULL),(44,839.38,'cobro renta','2016-05-08 04:28:47',NULL,18,NULL),(45,72.4,'cobro renta','2016-05-08 19:28:47',NULL,5,NULL),(46,129.21,'cobro renta','2016-04-18 05:28:47',NULL,15,NULL),(47,382.09,'cobro renta','2016-05-03 21:28:47',NULL,28,NULL),(48,79.03,'cobro renta','2016-04-15 15:28:47',NULL,9,NULL),(49,6.32,'cobro renta','2016-04-22 02:28:48',NULL,7,NULL),(50,372.03,'cobro renta','2016-05-10 05:28:48',NULL,14,NULL),(51,591.65,'pago salario','2016-04-26 14:29:36',8,NULL,NULL),(52,287.31,'pago salario','2016-05-07 07:29:36',39,NULL,NULL),(53,10.7,'pago salario','2016-04-30 13:29:37',45,NULL,NULL),(54,99.17,'pago salario','2016-04-13 00:29:37',43,NULL,NULL),(55,644.72,'pago salario','2016-04-20 14:29:37',26,NULL,NULL),(56,900.26,'pago salario','2016-04-21 05:29:37',31,NULL,NULL),(57,613.52,'pago salario','2016-04-15 22:29:37',37,NULL,NULL),(58,774.73,'pago salario','2016-04-28 03:29:37',24,NULL,NULL),(59,413.83,'pago salario','2016-05-05 20:29:37',48,NULL,NULL),(60,188.98,'pago salario','2016-04-21 16:29:37',38,NULL,NULL),(61,944.92,'pago salario','2016-05-01 09:29:37',40,NULL,NULL),(62,491.31,'pago salario','2016-04-19 19:29:37',46,NULL,NULL),(63,792.17,'pago salario','2016-04-30 22:29:37',10,NULL,NULL),(64,108.6,'pago salario','2016-05-05 02:29:37',22,NULL,NULL),(65,299.3,'pago salario','2016-05-08 10:29:37',40,NULL,NULL),(66,12.3,'pago salario','2016-05-10 08:29:37',34,NULL,NULL),(67,903.35,'pago salario','2016-04-15 06:29:37',11,NULL,NULL),(68,936.08,'pago salario','2016-04-26 02:29:37',36,NULL,NULL),(69,495.91,'pago salario','2016-05-10 16:29:37',41,NULL,NULL),(70,399.27,'pago salario','2016-04-15 04:29:37',36,NULL,NULL),(71,552.09,'pago salario','2016-05-10 22:29:37',13,NULL,NULL),(72,387.2,'pago salario','2016-04-28 08:29:37',25,NULL,NULL),(73,70.09,'pago salario','2016-05-08 19:29:38',5,NULL,NULL),(74,153.33,'pago salario','2016-04-15 00:29:38',15,NULL,NULL),(75,374.28,'pago salario','2016-04-16 17:29:38',1,NULL,NULL),(76,802.54,'pago salario','2016-04-17 02:29:38',4,NULL,NULL),(77,97.92,'pago salario','2016-05-01 10:29:38',36,NULL,NULL),(78,165.28,'pago salario','2016-04-26 18:29:38',23,NULL,NULL),(79,578.5,'pago salario','2016-04-16 14:29:38',1,NULL,NULL),(80,818.16,'pago salario','2016-04-21 05:29:38',24,NULL,NULL),(81,833.23,'pago salario','2016-05-04 22:29:38',49,NULL,NULL),(82,568.7,'pago salario','2016-04-15 04:29:38',33,NULL,NULL),(83,998.59,'pago salario','2016-04-17 22:29:38',37,NULL,NULL),(84,532.29,'pago salario','2016-04-20 13:29:38',50,NULL,NULL),(85,622.03,'pago salario','2016-05-04 00:29:38',48,NULL,NULL),(86,390.44,'pago salario','2016-04-22 08:29:38',22,NULL,NULL),(87,440.38,'pago salario','2016-04-12 19:29:38',4,NULL,NULL),(88,689.26,'pago salario','2016-04-15 02:29:38',26,NULL,NULL),(89,250.81,'pago salario','2016-05-08 19:29:38',20,NULL,NULL),(90,455.01,'pago salario','2016-05-11 05:29:38',38,NULL,NULL),(91,629.07,'pago salario','2016-04-13 21:29:38',37,NULL,NULL),(92,40.41,'pago salario','2016-04-14 18:29:38',39,NULL,NULL),(93,248.07,'pago salario','2016-05-09 19:29:38',20,NULL,NULL),(94,754.91,'pago salario','2016-05-11 19:29:38',30,NULL,NULL),(95,694.83,'pago salario','2016-05-04 03:29:38',37,NULL,NULL),(96,204.1,'pago salario','2016-04-28 16:29:38',10,NULL,NULL),(97,567.74,'pago salario','2016-05-08 12:29:38',29,NULL,NULL),(98,908.71,'pago salario','2016-04-11 20:29:38',43,NULL,NULL),(99,367.81,'pago salario','2016-05-11 06:29:38',14,NULL,NULL),(100,890.29,'pago salario','2016-04-27 07:29:38',50,NULL,NULL),(101,292.32,'cobro instalacion','2016-05-05 09:30:19',NULL,38,NULL),(102,347.89,'cobro instalacion','2016-05-07 12:30:19',NULL,10,NULL),(103,938.79,'cobro instalacion','2016-04-21 15:30:19',NULL,34,NULL),(104,710.64,'cobro instalacion','2016-04-14 08:30:19',NULL,28,NULL),(105,504.34,'cobro instalacion','2016-05-06 18:30:19',NULL,23,NULL),(106,160.42,'cobro instalacion','2016-04-17 19:30:19',NULL,17,NULL),(107,216.19,'cobro instalacion','2016-04-26 13:30:19',NULL,27,NULL),(108,964.04,'cobro instalacion','2016-05-08 02:30:19',NULL,45,NULL),(109,286.08,'cobro instalacion','2016-05-04 19:30:19',NULL,37,NULL),(110,857.37,'cobro instalacion','2016-05-01 07:30:19',NULL,16,NULL),(111,865.85,'cobro instalacion','2016-04-18 12:30:19',NULL,10,NULL),(112,119.35,'cobro instalacion','2016-04-20 01:30:19',NULL,15,NULL),(113,170.45,'cobro instalacion','2016-05-10 12:30:19',NULL,14,NULL),(114,414.01,'cobro instalacion','2016-04-13 13:30:19',NULL,36,NULL),(115,518.56,'cobro instalacion','2016-05-06 06:30:19',NULL,24,NULL),(116,307.2,'cobro instalacion','2016-04-29 07:30:19',NULL,19,NULL),(117,575.27,'cobro instalacion','2016-04-30 10:30:19',NULL,9,NULL),(118,727.31,'cobro instalacion','2016-05-08 08:30:19',NULL,9,NULL),(119,652.8,'cobro instalacion','2016-05-09 22:30:19',NULL,21,NULL),(120,587.11,'cobro instalacion','2016-04-15 17:30:19',NULL,18,NULL),(121,343.63,'cobro instalacion','2016-04-13 11:30:19',NULL,30,NULL),(122,638.72,'cobro instalacion','2016-05-08 13:30:19',NULL,35,NULL),(123,820.17,'cobro instalacion','2016-05-05 11:30:19',NULL,32,NULL),(124,368.25,'cobro instalacion','2016-05-10 16:30:19',NULL,31,NULL),(125,315.76,'cobro instalacion','2016-05-02 05:30:19',NULL,5,NULL),(126,318.37,'cobro instalacion','2016-04-23 02:30:19',NULL,33,NULL),(127,943.97,'cobro instalacion','2016-05-04 21:30:19',NULL,9,NULL),(128,921.64,'cobro instalacion','2016-04-22 15:30:19',NULL,17,NULL),(129,244.28,'cobro instalacion','2016-04-14 02:30:19',NULL,22,NULL),(130,658.76,'cobro instalacion','2016-04-22 18:30:19',NULL,45,NULL),(131,105.71,'cobro instalacion','2016-04-14 05:30:19',NULL,11,NULL),(132,670.47,'cobro instalacion','2016-04-27 01:30:19',NULL,15,NULL),(133,783.41,'cobro instalacion','2016-04-25 00:30:19',NULL,23,NULL),(134,570.09,'cobro instalacion','2016-04-26 19:30:19',NULL,23,NULL),(135,455.14,'cobro instalacion','2016-04-14 18:30:19',NULL,40,NULL),(136,19.43,'cobro instalacion','2016-04-21 23:30:19',NULL,8,NULL),(137,265.5,'cobro instalacion','2016-04-24 12:30:19',NULL,13,NULL),(138,715.5,'cobro instalacion','2016-05-02 13:30:19',NULL,5,NULL),(139,71.62,'cobro instalacion','2016-05-07 01:30:19',NULL,20,NULL),(140,411.77,'cobro instalacion','2016-05-02 00:30:19',NULL,29,NULL),(141,8,'cobro instalacion','2016-04-16 09:30:19',NULL,20,NULL),(142,522.24,'cobro instalacion','2016-04-12 15:30:19',NULL,11,NULL),(143,563.15,'cobro instalacion','2016-04-14 00:30:19',NULL,15,NULL),(144,952.14,'cobro instalacion','2016-04-14 05:30:19',NULL,48,NULL),(145,966.19,'cobro instalacion','2016-04-23 23:30:19',NULL,38,NULL),(146,587.41,'cobro instalacion','2016-04-20 09:30:19',NULL,4,NULL),(147,905.77,'cobro instalacion','2016-05-08 20:30:19',NULL,41,NULL),(148,601.69,'cobro instalacion','2016-04-21 18:30:19',NULL,40,NULL),(149,679.88,'cobro instalacion','2016-04-18 04:30:19',NULL,27,NULL),(150,144.73,'cobro instalacion','2016-05-11 07:30:19',NULL,46,NULL),(151,221.67,'cobro instalacion','2016-05-07 12:30:19',NULL,33,NULL),(152,826.58,'cobro instalacion','2016-04-12 11:30:19',NULL,3,NULL),(153,141.56,'cobro instalacion','2016-04-28 00:30:19',NULL,21,NULL),(154,7.19,'cobro instalacion','2016-04-29 17:30:19',NULL,44,NULL),(155,753.46,'cobro instalacion','2016-04-18 03:30:19',NULL,50,NULL),(156,83.08,'cobro instalacion','2016-05-01 12:30:19',NULL,35,NULL),(157,303.42,'cobro instalacion','2016-05-08 07:30:19',NULL,24,NULL),(158,30.61,'cobro instalacion','2016-05-08 03:30:19',NULL,34,NULL),(159,256.46,'cobro instalacion','2016-04-20 15:30:19',NULL,27,NULL),(160,691.04,'cobro instalacion','2016-05-06 18:30:19',NULL,39,NULL),(161,359.18,'cobro instalacion','2016-04-27 13:30:19',NULL,39,NULL),(162,76.43,'cobro instalacion','2016-04-27 10:30:19',NULL,16,NULL),(163,416.79,'cobro instalacion','2016-04-24 17:30:19',NULL,9,NULL),(164,279.9,'cobro instalacion','2016-04-23 15:30:19',NULL,30,NULL),(165,138.91,'cobro instalacion','2016-05-08 05:30:19',NULL,10,NULL),(166,555.93,'cobro instalacion','2016-05-04 22:30:19',NULL,10,NULL),(167,723.73,'cobro instalacion','2016-05-06 17:30:19',NULL,25,NULL),(168,888.47,'cobro instalacion','2016-04-29 17:30:19',NULL,34,NULL),(169,536.98,'cobro instalacion','2016-04-22 17:30:19',NULL,18,NULL),(170,969.65,'cobro instalacion','2016-05-08 06:30:19',NULL,29,NULL),(171,74.18,'cobro instalacion','2016-05-02 11:30:19',NULL,35,NULL),(172,754.3,'cobro instalacion','2016-04-19 02:30:19',NULL,17,NULL),(173,341.54,'cobro instalacion','2016-05-07 15:30:19',NULL,27,NULL),(174,957.62,'cobro instalacion','2016-04-18 23:30:19',NULL,34,NULL),(175,388.46,'cobro instalacion','2016-05-07 16:30:19',NULL,47,NULL),(176,220.92,'cobro instalacion','2016-04-26 03:30:19',NULL,27,NULL),(177,185.29,'cobro instalacion','2016-05-09 14:30:19',NULL,48,NULL),(178,858.67,'cobro instalacion','2016-04-16 12:30:19',NULL,41,NULL),(179,690.77,'pago equipos','2016-04-26 05:30:41',NULL,NULL,7),(180,77.81,'pago equipos','2016-04-17 15:30:41',NULL,NULL,6),(181,574.19,'pago equipos','2016-04-27 14:30:41',NULL,NULL,8),(182,834.66,'pago equipos','2016-05-05 07:30:41',NULL,NULL,7),(183,269.68,'pago equipos','2016-04-23 23:30:41',NULL,NULL,6),(184,38.86,'pago equipos','2016-04-20 19:30:41',NULL,NULL,2),(185,828.06,'pago equipos','2016-04-12 08:30:41',NULL,NULL,4),(186,195.93,'pago equipos','2016-04-21 00:30:41',NULL,NULL,5),(187,317.13,'pago equipos','2016-04-13 10:30:41',NULL,NULL,9),(188,80.15,'pago equipos','2016-05-10 09:30:41',NULL,NULL,8),(190,844.34,'pago equipos','2016-05-10 02:30:41',NULL,NULL,8),(191,594.52,'pago equipos','2016-04-20 10:30:41',NULL,NULL,8),(192,764.56,'pago equipos','2016-04-27 09:30:41',NULL,NULL,8),(193,113.13,'pago equipos','2016-05-04 20:30:41',NULL,NULL,2),(194,407.38,'pago equipos','2016-04-24 14:30:41',NULL,NULL,9),(195,536.12,'pago equipos','2016-04-20 02:30:41',NULL,NULL,7),(196,891.02,'pago equipos','2016-04-29 07:30:41',NULL,NULL,1),(197,806.46,'pago equipos','2016-04-17 21:30:41',NULL,NULL,5),(198,459.6,'pago equipos','2016-04-24 06:30:41',NULL,NULL,6),(199,993.61,'cobro reparacion','2016-05-02 07:35:15',NULL,28,NULL),(200,79.96,'cobro reparacion','2016-04-24 10:35:16',NULL,31,NULL),(201,569.71,'cobro reparacion','2016-04-15 23:35:16',NULL,34,NULL),(202,418.32,'cobro reparacion','2016-05-03 03:35:16',NULL,31,NULL),(203,83.98,'cobro reparacion','2016-04-16 08:35:16',NULL,10,NULL),(204,424,'cobro reparacion','2016-05-07 17:35:16',NULL,50,NULL),(205,652.5,'cobro reparacion','2016-05-11 02:35:16',NULL,21,NULL),(206,752.09,'cobro reparacion','2016-05-03 21:35:16',NULL,9,NULL),(207,549.88,'cobro reparacion','2016-04-25 13:35:16',NULL,4,NULL),(208,684.32,'cobro reparacion','2016-05-04 18:35:16',NULL,4,NULL),(209,899.05,'cobro reparacion','2016-05-07 19:35:16',NULL,7,NULL),(210,447.53,'cobro reparacion','2016-05-01 23:35:16',NULL,49,NULL),(211,528.06,'cobro reparacion','2016-04-19 21:35:16',NULL,16,NULL),(212,161.79,'cobro reparacion','2016-04-23 22:35:16',NULL,4,NULL),(213,686.23,'cobro reparacion','2016-04-13 10:35:16',NULL,25,NULL),(214,529.82,'cobro reparacion','2016-04-23 00:35:16',NULL,34,NULL),(215,857.55,'cobro reparacion','2016-04-22 12:35:16',NULL,28,NULL),(216,299.29,'cobro reparacion','2016-04-25 02:35:16',NULL,33,NULL),(217,789.43,'cobro reparacion','2016-05-03 18:35:16',NULL,45,NULL),(218,74.2,'cobro reparacion','2016-04-28 13:35:16',NULL,49,NULL),(219,621.59,'cobro reparacion','2016-05-07 16:35:16',NULL,50,NULL),(220,724.3,'cobro reparacion','2016-05-07 16:35:16',NULL,42,NULL),(221,161.01,'cobro reparacion','2016-05-04 00:35:16',NULL,26,NULL),(222,324.73,'cobro reparacion','2016-05-07 01:35:16',NULL,42,NULL),(223,631.58,'cobro reparacion','2016-04-21 01:35:16',NULL,42,NULL),(224,758.93,'cobro reparacion','2016-05-09 01:35:16',NULL,29,NULL),(225,662.14,'cobro reparacion','2016-04-19 10:35:16',NULL,10,NULL),(226,480.57,'cobro reparacion','2016-05-06 16:35:16',NULL,38,NULL),(227,567.72,'cobro reparacion','2016-04-24 03:35:16',NULL,21,NULL),(228,442.75,'cobro reparacion','2016-04-27 04:35:16',NULL,13,NULL),(229,91.92,'cobro reparacion','2016-05-08 01:35:16',NULL,6,NULL),(230,399.39,'cobro reparacion','2016-04-13 22:35:16',NULL,18,NULL),(231,469.42,'cobro reparacion','2016-04-12 02:35:16',NULL,23,NULL),(232,770.09,'cobro reparacion','2016-05-05 17:35:16',NULL,28,NULL),(233,933.6,'cobro reparacion','2016-04-25 14:35:16',NULL,36,NULL),(234,895.45,'cobro reparacion','2016-04-18 20:35:16',NULL,46,NULL),(235,429.37,'cobro reparacion','2016-04-20 13:35:16',NULL,8,NULL),(236,172.84,'cobro reparacion','2016-05-09 08:35:16',NULL,14,NULL),(237,234.32,'cobro reparacion','2016-04-27 09:35:17',NULL,45,NULL),(238,79.42,'cobro reparacion','2016-05-03 08:35:17',NULL,36,NULL),(239,26.8,'cobro reparacion','2016-04-23 13:35:17',NULL,9,NULL),(240,999.98,'cobro reparacion','2016-05-08 17:35:17',NULL,49,NULL),(241,274.83,'cobro reparacion','2016-04-17 03:35:17',NULL,26,NULL),(242,986.91,'cobro reparacion','2016-05-10 00:35:17',NULL,15,NULL),(243,532.4,'cobro reparacion','2016-04-22 20:35:17',NULL,18,NULL),(244,945.89,'cobro reparacion','2016-05-11 04:35:17',NULL,29,NULL),(245,296.46,'cobro reparacion','2016-04-21 21:35:17',NULL,14,NULL),(246,178.47,'cobro reparacion','2016-04-24 04:35:17',NULL,22,NULL),(247,273.66,'cobro reparacion','2016-05-07 11:35:17',NULL,21,NULL),(248,74.04,'cobro reparacion','2016-04-21 20:35:17',NULL,46,NULL),(249,534.36,'cobro reparacion','2016-05-01 05:35:17',NULL,6,NULL),(250,750.24,'cobro reparacion','2016-05-03 20:35:17',NULL,9,NULL);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paquete` (
  `idPaquete` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Renta` float DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPaquete`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES (1,'Paquete Básico',290.5,'La mejor selección para tu familia'),(2,'Paquete Básico+',350,'Canales adicionales a menor costo'),(3,'Paquete Fun',429.5,'Podrás sumar a tu diversión programación exclusiva'),(4,'Paquete FOX+',589.5,'Además del  paquete FUN, con el paquete FOX+'),(5,'Paquete HBO/MAX',599,'Para que los que les gusta estar a la vanguardia del entretenimiento'),(6,'Paquete Universe',799,'Para el que le gusta tener todo, contrata paquete Universe'),(7,'Paquete Universe+',999,'Canales exclusivos para ti'),(8,'Paquete Selección Jovenes y niños',400,'Canales exclusivos para ellos '),(9,'Paquete Deportes',255.5,'Los mejores canales de deportes para ti'),(10,'Paquete Selección Noticias',647.5,'La mejor selección para estar informado');
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Calle Morelos No. 191, Col. La pradera, Pachuca','55-59-57-56','Cortes Lopez Roberto'),(2,'Avenida Poniente No. 123, Col. Nuevo México, Guadalajara','54-34-23-23','Buendía Gómez Eduardo'),(3,'Avenida Del Chamizal No. 239, Col. Correos, Tlaxcala','55-00-00-99','López Benítez Alicia María'),(4,'Avenida 16 de Septiembre No. 100, Col. Vista Hermosa, Coahuila','54-78-23-00','Martínez López Juan Carlos'),(5,'Calle Pedregal No. 19, Col. Buena Vista, Puebla','55-59-57-56','Cortes Lopez Roberto'),(6,'Avenida De las Fuentes No. 334, Col. Prados, Baja California','23-34-56-78','Ruíz Jiménez Laura Fabiola'),(7,'Calle Cocodrilos No. 544, Col. El Dorado, Monterrey','21-34-56-78','Ortega Palacios Adela'),(8,'Calle Cascada No. 2, Col. Selva, Guanajuato','55-34-34-32','Estrada Campos Luis Alberto'),(9,'Avenida Las Torres No. 2345, Col. Lomas de Chapultepec, Ciudad de México','55-12-54-76','Galicia Serna César Alejandro'),(31,'Avenida De Los Reptiles No. 234, Col. San Juan, Ciudad de México','56-45-36-37','Cortés Díaz Javier');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicio` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `Costo` float DEFAULT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (1,'Cancelación','Cancelar un paquete o el servicio de SKY',150),(2,'Crecimiento','Adquirir un nuevo paquete o canal a tu servicio SKY',150),(3,'Internet','Contrata el servicio de Interner que te ofrece SKY',599),(4,'Pago por evento','Paga para ver y disfrutar en vivo y en directo algún evento musical, deportivo o artístico privado',200),(5,'Instalación','Información sobre la instalación de nuestros servicios',200),(6,'Reparación','Visita de técnico certificado para reparación de tu equipo o instalación',150),(7,'Cambio de Antena','Cambiar la antena receptora de señal para obtener otra y disfrutar de tus canales favoritos en HD',300),(8,'Controles Remotos','Comprar un nuevo control remoto para tu equipo SKY',100),(9,'Skyview','Comprar la revista mensual de SKY',24),(10,'Servicios en línea','Portal en el que podrás navegar en cualquier lugar para disfrutar desde tu PC, MAC o Smartphone nuestros servicios',0);
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico` (
  `idEmpleado` int(11) NOT NULL,
  `Area` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
INSERT INTO `tecnico` VALUES (1,'Norte'),(2,'Norte'),(3,'Norte'),(4,'Norte'),(5,'Norte'),(6,'Norte'),(7,'Norte'),(8,'Norte'),(9,'Norte'),(10,'Norte'),(11,'Sur'),(12,'Sur'),(13,'Sur'),(14,'Sur'),(15,'Sur'),(16,'Sur'),(17,'Sur'),(18,'Sur'),(19,'Sur'),(20,'Sur'),(21,'Este'),(22,'Este'),(23,'Este'),(24,'Este'),(25,'Este'),(26,'Este'),(27,'Este'),(28,'Este'),(29,'Este'),(30,'Este'),(31,'Oeste'),(32,'Oeste'),(33,'Oeste'),(34,'Oeste'),(35,'Oeste'),(36,'Oeste'),(37,'Oeste'),(38,'Oeste'),(39,'Oeste'),(40,'Oeste');
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'spsnk_sky'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_admin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_admin`(IN num int,IN st int)
BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into administrativo values (
st+cnt,
truncate(1500+rand()*15000,2),
FLOOR( 1 + RAND( ) *8 ),
"pass"
);
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_canpaq` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_canpaq`(IN num int)
BEGIN
DECLARE cnt INT DEFAULT 0;
DECLARE exi INT DEFAULT 0;
DECLARE idp INT DEFAULT 0;
DECLARE idc INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
set idp = FLOOR( 1 + RAND( ) *10 );
set idc = FLOOR( 1 + RAND( ) *100 );
set exi = (select count(*) from canalpaquete where idpaquete=idp and idcanal = idc );
if exi = 0 then
   insert into canalpaquete values (idp,idc);
    SET cnt = cnt + 1;
end if;
END WHILE;
set foreign_key_checks=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_dopaquete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_dopaquete`(IN num int,in st int)
BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into dopaquete values (
FLOOR( 1 + RAND( ) *50 ),
FLOOR( 1 + RAND( ) *10 ),
st+cnt,
(SELECT NOW() - INTERVAL FLOOR(RAND() * 60) DAY),
NULL
);
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_doservicio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_doservicio`(IN num int)
BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into doservicio values (
    (FLOOR( 1 + RAND( ) *10 )),
    (FLOOR( 1 + RAND( ) *50 )),
    (FLOOR( 1 + RAND( ) *40 )),
    (SELECT NOW() - INTERVAL FLOOR(RAND() * 365) DAY));
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_equipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_equipo`(IN num int,IN provnum int)
BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into equipo values (NULL,(FLOOR( 100000 + RAND()*900000)),(FLOOR( 1 + RAND() * provnum )) );
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_pago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_pago`(IN concept varchar(45), IN tipo int, IN num int)
BEGIN
DECLARE cont INT DEFAULT 0;
DECLARE ide INT DEFAULT NULL;
DECLARE idc INT DEFAULT NULL;
DECLARE idp INT DEFAULT NULL;
set foreign_key_checks = 0;
WHILE cont < num DO
if tipo = 1 then set ide = (FLOOR( 1 + RAND( ) *50 ));
elseif tipo = 2 then set idc = (FLOOR( 1 + RAND( ) *50 ));
elseif tipo = 3 then set idp = (FLOOR( 1 + RAND( ) *10 ));
end if;
    insert into pago values (NULL, truncate(rand()*1000,2), concept ,(SELECT TIMESTAMP(NOW())-INTERVAL FLOOR(RAND()*720) Hour),ide,idc,idp);
    SET cont = cont + 1;
END WHILE;
set foreign_key_checks = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_tecnico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`spsnk_sps`@`%` PROCEDURE `insert_tecnico`(IN num int,IN area varchar(45),IN st int)
BEGIN
DECLARE cnt INT DEFAULT 0;
set foreign_key_checks=0;
WHILE cnt < num DO
    insert into tecnico values (
st+cnt,
area
);
    SET cnt = cnt + 1;
END WHILE;
set foreign_key_checks=1;
END ;;
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

-- Dump completed on 2016-05-12 20:52:20
