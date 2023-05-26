-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: finalbanco
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `UID` varchar(50) NOT NULL,
  `dni` char(9) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `localidad` varchar(60) NOT NULL,
  `fechaNac` date NOT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('1','12345678A','John','Doe','123456789','123 Main St','Madrid','2000-01-01'),('10','01234567J','Olivia','Taylor','012345678','654 Cedar St','Bilbao','1991-08-20'),('11','12345678K','Matthew','Clark','123457890','987 Maple St','Alicante','1990-10-25'),('12','23456789L','Ava','Lewis','234578901','321 Elm St','Córdoba','1989-12-31'),('13','34567890M','Daniel','Walker','345689012','654 Oak St','Valladolid','1988-03-06'),('14','45678901N','Sophia','Hall','456790123','987 Pine St','Vigo','1987-05-11'),('15','56789012O','Christopher','Young','567891234','321 Cedar St','Gijón','1986-07-16'),('16','67890123P','Mia','Allen','678902345','654 Elm St','L\'Hospitalet de Llobregat','1985-09-21'),('17','78901234Q','James','Green','789012456','7890123456','Granada','1984-11-26'),('18','89012345R','Isabella','Baker','890134567','321 Pine St','A Coruña','1983-01-01'),('19','90123456S','Joseph','Adams','901234678','654 Cedar St','Vitoria-Gasteiz','1982-03-08'),('2','23456789B','Jane','Smith','234567890','456 Oak St','Barcelona','1999-05-15'),('20','01234567T','Charlotte','King','012456789','987 Maple St','Elche','1981-05-13'),('21','12345678U','Benjamin','Hill','123458901','321 Elm St','Oviedo','1980-07-18'),('22','23456789V','Amelia','Scott','234578912','654 Oak St','Badalona','1979-09-23'),('23','34567890W','Alexander','Morris','345689023','987 Pine St','Cartagena','1978-11-28'),('24','45678901X','Harper','Turner','456801234','321 Cedar St','Terrassa','1977-02-02'),('25','56789012Y','William','Carter','578901345','654 Elm St','Jerez de la Frontera','1976-04-07'),('26','67890123Z','Evelyn','Parker','679012345','987 Oak St','Sabadell','1975-06-12'),('27','78901234A','Michaela','Collins','789124567','321 Pine St','Santa Cruz de Tenerife','1974-08-17'),('28','89012345B','Daniel','Roberts','890134678','654 Cedar St','Pamplona','1973-10-22'),('29','90123456C','Samantha','Cook','901246789','987 Maple St','San Cristóbal de La Laguna','1972-12-27'),('3','34567890C','Robert','Johnson','345678901','789 Elm St','Valencia','1998-03-10'),('30','01234567D','Emily','Bell','012347890','321 Elm St','Fuenlabrada','1972-02-01'),('31','12345678E','Jackson','Ward','124568912','654 Oak St','Almería','1971-04-06'),('32','23456789F','Abigail','Watson','237890123','987 Pine St','Burgos','1970-06-11'),('33','34567890G','Ethan','Brooks','345678234','321 Cedar St','Alcalá de Henares','1969-08-16'),('34','45678901H','Scarlett','Price','456712345','654 Elm St','San Sebastián','1968-10-21'),('35','56789012I','Aiden','Foster','567012346','987 Oak St','Getafe','1967-12-26'),('36','67890123J','Grace','Bennett','679012567','321 Pine St','Santander','1967-02-01'),('37','78901234K','Lucas','Simmons','789034678','654 Cedar St','Pozuelo de Alarcón','1966-04-07'),('38','89012345L','Chloe','Reed','890125689','987 Maple St','Torrevieja','1965-06-12'),('39','90123456M','Henry','Sanders','901567890','321 Elm St','Ourense','1964-08-17'),('4','45678901D','Emily','Davis','456789012','987 Maple St','Sevilla','1997-07-20'),('40','01234567N','Lily','Cox','012346901','654 Oak St','Móstoles','1963-10-22'),('41','12345678O','Wyatt','Howard','123480123','987 Pine St','El Puerto de Santa María','1962-12-27'),('42','23456789P','Leah','Ward','234561234','321 Cedar St','Granollers','1962-02-01'),('43','34567890Q','Gabriel','Morgan','345012345','654 Elm St','La Línea de la Concepción','1961-04-06'),('44','45678901R','Violet','Cole','456789056','987 Oak St','Mataró','1960-06-11'),('45','56789012S','Nicholas','Foster','561234567','321 Pine St','Santa Lucía de Tirajana','1959-08-16'),('46','67890123T','Stella','Bennett','678945678','654 Cedar St','Torrent','1958-10-21'),('47','78901234U','Nathan','Simmons','783456789','987 Maple St','Jaén','1957-12-26'),('48','89012345V','Mila','Reed','890123450','321 Elm St','Orihuela','1957-02-01'),('49','90123456W','Oliver','Sanders','901456701','654 Oak St','Motril','1956-04-07'),('5','56789012E','Michael','Brown','567890123','654 Pine St','Zaragoza','1996-09-25'),('50','01234567X','Avery','Howard','012349012','987 Pine St','Manresa','1955-06-12'),('6','67890123F','Sarah','Miller','678901234','321 Cedar St','Málaga','1995-11-30'),('7','78901234G','David','Anderson','789012345','654 Elm St','Murcia','1994-02-05'),('8','89012345H','Jessica','Thomas','890123456','987 Oak St','Palma de Mallorca','1993-04-10'),('9','90123456I','Andrew','Wilson','901234567','321 Pine St','Las Palmas de Gran Canaria','1992-06-15');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentabancarias`
--

DROP TABLE IF EXISTS `cuentabancarias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentabancarias` (
  `IBAN` char(24) NOT NULL,
  `tipoCuenta` varchar(40) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `nomina` decimal(6,2) unsigned NOT NULL,
  `mediaNominas` decimal(6,2) unsigned NOT NULL,
  `idCliente` varchar(50) NOT NULL,
  PRIMARY KEY (`IBAN`,`idCliente`),
  KEY `fk_CuentaBancaria_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_CuentaBancaria_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentabancarias`
--

LOCK TABLES `cuentabancarias` WRITE;
/*!40000 ALTER TABLE `cuentabancarias` DISABLE KEYS */;
INSERT INTO `cuentabancarias` VALUES ('ES1111110000000000000001','Cuenta Corriente',15000.00,2000.00,1800.00,'1'),('ES1111110000000000000002','Cuenta Ahorros',12000.00,2500.00,2000.00,'2'),('ES1111110000000000000003','Cuenta Corriente',62400.00,3000.00,2500.00,'3'),('ES1111110000000000000004','Cuenta Ahorros',25000.00,1800.00,1600.00,'4'),('ES1111110000000000000005','Cuenta Corriente',20000.00,3500.00,3000.00,'5'),('ES1111110000000000000006','Cuenta Ahorros',22000.00,3200.00,2800.00,'6'),('ES1111110000000000000007','Cuenta Corriente',17000.00,2400.00,2200.00,'7'),('ES1111110000000000000008','Cuenta Ahorros',14000.00,1500.00,1300.00,'8'),('ES1111110000000000000009','Cuenta Corriente',16000.00,2800.00,2500.00,'9'),('ES1111110000000000000010','Cuenta Ahorros',19000.00,3100.00,2700.00,'10'),('ES1111110000000000000011','Cuenta Corriente',21000.00,3500.00,3200.00,'11'),('ES1111110000000000000012','Cuenta Ahorros',23000.00,2400.00,2200.00,'12'),('ES1111110000000000000013','Cuenta Corriente',25000.00,2800.00,2500.00,'13'),('ES1111110000000000000014','Cuenta Ahorros',27000.00,3200.00,2800.00,'14'),('ES1111110000000000000015','Cuenta Corriente',30000.00,3500.00,3200.00,'15'),('ES1111110000000000000016','Cuenta Ahorros',32000.00,2600.00,2300.00,'16'),('ES1111110000000000000017','Cuenta Corriente',28000.00,2900.00,2600.00,'17'),('ES1111110000000000000018','Cuenta Ahorros',26000.00,2200.00,2000.00,'18'),('ES1111110000000000000019','Cuenta Corriente',24000.00,1800.00,1600.00,'19'),('ES1111110000000000000020','Cuenta Ahorros',22000.00,1500.00,1300.00,'20'),('ES1111110000000000000021','Cuenta Corriente',20000.00,1900.00,1700.00,'21'),('ES1111110000000000000022','Cuenta Ahorros',18000.00,2200.00,2000.00,'22'),('ES1111110000000000000023','Cuenta Corriente',16000.00,2600.00,2300.00,'23'),('ES1111110000000000000024','Cuenta Ahorros',14000.00,2900.00,2600.00,'24'),('ES1111110000000000000025','Cuenta Corriente',12000.00,3300.00,3000.00,'25'),('ES1111110000000000000026','Cuenta Ahorros',10000.00,2600.00,2300.00,'26'),('ES1111110000000000000027','Cuenta Corriente',8000.00,2000.00,1800.00,'27'),('ES1111110000000000000028','Cuenta Ahorros',6000.00,1500.00,1300.00,'28'),('ES1111110000000000000029','Cuenta Corriente',4000.00,1900.00,1700.00,'29'),('ES1111110000000000000030','Cuenta Ahorros',2000.00,2200.00,2000.00,'30'),('ES1111110000000000000031','Cuenta Corriente',1000.00,2600.00,2300.00,'31'),('ES1111110000000000000032','Cuenta Ahorros',500.00,2900.00,2600.00,'32'),('ES1111110000000000000033','Cuenta Corriente',1500.00,3300.00,3000.00,'33'),('ES1111110000000000000034','Cuenta Ahorros',3000.00,2600.00,2300.00,'34'),('ES1111110000000000000035','Cuenta Corriente',5000.00,2000.00,1800.00,'35'),('ES1111110000000000000036','Cuenta Ahorros',7000.00,1500.00,1300.00,'36'),('ES1111110000000000000037','Cuenta Corriente',9000.00,1900.00,1700.00,'37'),('ES1111110000000000000038','Cuenta Ahorros',11000.00,2200.00,2000.00,'38'),('ES1111110000000000000039','Cuenta Corriente',13000.00,2600.00,2300.00,'39'),('ES1111110000000000000040','Cuenta Ahorros',15000.00,2900.00,2600.00,'40'),('ES1111110000000000000041','Cuenta Corriente',17000.00,3300.00,3000.00,'41'),('ES1111110000000000000042','Cuenta Ahorros',19000.00,2600.00,2300.00,'42'),('ES1111110000000000000043','Cuenta Corriente',21000.00,2000.00,1800.00,'43'),('ES1111110000000000000044','Cuenta Ahorros',23000.00,1500.00,1300.00,'44'),('ES1111110000000000000045','Cuenta Corriente',25000.00,1900.00,1700.00,'45'),('ES1111110000000000000046','Cuenta Ahorros',27000.00,2200.00,2000.00,'46'),('ES1111110000000000000047','Cuenta Corriente',29000.00,2600.00,2300.00,'47'),('ES1111110000000000000048','Cuenta Ahorros',31000.00,2900.00,2600.00,'48'),('ES1111110000000000000049','Cuenta Corriente',33000.00,3300.00,3000.00,'49'),('ES1111110000000000000050','Cuenta Ahorros',35000.00,2600.00,2300.00,'50');
/*!40000 ALTER TABLE `cuentabancarias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `numOperacion` int NOT NULL AUTO_INCREMENT,
  `idCliente` varchar(50) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `concepto` varchar(80) NOT NULL,
  `emisor` varchar(50) NOT NULL,
  `receptor` varchar(50) NOT NULL,
  `fechaMov` date NOT NULL,
  PRIMARY KEY (`numOperacion`,`idCliente`),
  KEY `fk_Movimiento_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_Movimiento_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`UID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,'1',1200.00,'nomina','John','Empresa B','2023-01-02'),(2,'1',1300.00,'nomina','John','Empresa C','2023-01-03'),(3,'1',1400.00,'nomina','John','Empresa D','2023-01-04'),(4,'1',1500.00,'nomina','John','Empresa E','2023-01-05'),(5,'1',1600.00,'nomina','John','Empresa F','2023-01-06'),(6,'1',1700.00,'nomina','John','Empresa G','2023-01-07'),(7,'1',1800.00,'nomina','John','Empresa H','2023-01-08'),(8,'1',1900.00,'nomina','John','Empresa I','2023-01-09'),(9,'1',1000.00,'nomina','John','Empresa J','2023-01-10'),(10,'1',1100.00,'nomina','John','Empresa K','2023-01-11'),(11,'1',1200.00,'nomina','John','Empresa L','2023-01-12'),(12,'1',1300.00,'nomina','John','Empresa M','2023-01-13'),(13,'2',1200.00,'nomina','Jane','Empresa B','2023-01-02'),(14,'2',1300.00,'nomina','Jane','Empresa C','2023-01-03'),(15,'2',1400.00,'nomina','Jane','Empresa D','2023-01-04'),(16,'2',1500.00,'nomina','Jane','Empresa E','2023-01-05'),(17,'2',1600.00,'nomina','Jane','Empresa F','2023-01-06'),(18,'2',1700.00,'nomina','Jane','Empresa G','2023-01-07'),(19,'2',1800.00,'nomina','Jane','Empresa H','2023-01-08'),(20,'2',1900.00,'nomina','Jane','Empresa I','2023-01-09'),(21,'2',1000.00,'nomina','Jane','Empresa J','2023-01-10'),(22,'2',1100.00,'nomina','Jane','Empresa K','2023-01-11'),(23,'2',1200.00,'nomina','Jane','Empresa L','2023-01-12'),(24,'2',1300.00,'nomina','Jane','Empresa M','2023-01-13'),(25,'3',1200.00,'nomina','Robert','Empresa B','2023-01-02'),(26,'3',1300.00,'nomina','Robert','Empresa C','2023-01-03'),(27,'3',1400.00,'nomina','Robert','Empresa D','2023-01-04'),(28,'3',1500.00,'nomina','Robert','Empresa E','2023-01-05'),(29,'3',1600.00,'nomina','Robert','Empresa F','2023-01-06'),(30,'3',1700.00,'nomina','Robert','Empresa G','2023-01-07'),(31,'3',1800.00,'nomina','Robert','Empresa H','2023-01-08'),(32,'3',1900.00,'nomina','Robert','Empresa I','2023-01-09'),(33,'3',1000.00,'nomina','Robert','Empresa J','2023-01-10'),(34,'3',1100.00,'nomina','Robert','Empresa K','2023-01-11'),(35,'3',1200.00,'nomina','Robert','Empresa L','2023-01-12'),(36,'3',1300.00,'nomina','Robert','Empresa M','2023-01-13'),(37,'4',1200.00,'nomina','Emily','Empresa B','2023-01-02'),(38,'4',1300.00,'nomina','Emily','Empresa C','2023-01-03'),(39,'4',1400.00,'nomina','Emily','Empresa D','2023-01-04'),(40,'4',1500.00,'nomina','Emily','Empresa E','2023-01-05'),(41,'4',1600.00,'nomina','Emily','Empresa F','2023-01-06'),(42,'4',1700.00,'nomina','Emily','Empresa G','2023-01-07'),(43,'4',1800.00,'nomina','Emily','Empresa H','2023-01-08'),(44,'4',1900.00,'nomina','Emily','Empresa I','2023-01-09'),(45,'4',1000.00,'nomina','Emily','Empresa J','2023-01-10'),(46,'4',1100.00,'nomina','Emily','Empresa K','2023-01-11'),(47,'4',1200.00,'nomina','Emily','Empresa L','2023-01-12'),(48,'4',1300.00,'nomina','Emily','Empresa M','2023-01-13'),(49,'5',1200.00,'nomina','Michael','Empresa B','2023-01-02'),(50,'5',1300.00,'nomina','Michael','Empresa C','2023-01-03'),(51,'5',1400.00,'nomina','Michael','Empresa D','2023-01-04'),(52,'5',1500.00,'nomina','Michael','Empresa E','2023-01-05'),(53,'5',1600.00,'nomina','Michael','Empresa F','2023-01-06'),(54,'5',1700.00,'nomina','Michael','Empresa G','2023-01-07'),(55,'5',1800.00,'nomina','Michael','Empresa H','2023-01-08'),(56,'5',1900.00,'nomina','Michael','Empresa I','2023-01-09'),(57,'5',1000.00,'nomina','Michael','Empresa J','2023-01-10'),(58,'5',1100.00,'nomina','Michael','Empresa K','2023-01-11'),(59,'5',1200.00,'nomina','Michael','Empresa L','2023-01-12'),(60,'5',1300.00,'nomina','Michael','Empresa M','2023-01-13'),(63,'3',15000.00,'ingresos','banco','Robert','2023-05-25'),(64,'4',5000.00,'ingresos','banco','Emily','2023-05-25'),(65,'4',5000.00,'ingresos','Emily','banco','2023-05-25'),(66,'3',15000.00,'ingresos','Robert','banco','2023-05-25'),(85,'3',2000.00,'gastos','Robert','banco','2023-05-25'),(86,'3',15000.00,'ingresos','Robert','banco','2023-05-25'),(90,'3',-600.00,'gastos','Robert','banco','2023-05-26'),(91,'3',-2000.00,'gastos','Robert','banco','2023-05-26');
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `movimientos_AFTER_INSERT` AFTER INSERT ON `movimientos` FOR EACH ROW BEGIN
declare aux1 double;
declare aux2 double;
declare auxid varchar(50);
set auxid=New.idCliente;
if NEW.cantidad>0 then
	update cuentaBancarias set saldo=saldo+new.cantidad where idCliente=auxid and IBAN=(select IBAN from (select * from cuentaBancarias)as a where idCliente=auxid);
else 
    update cuentaBancarias set saldo=saldo+new.cantidad where idCliente=auxid and IBAN=(select IBAN from (select * from cuentaBancarias)as a where idCliente=auxid);
end if;
if New.concepto="nomina" then
	select sum(cantidad) into aux1 from (select * from movimientos) as a where concepto="nomina" and fechamov between year(curdate()) and year(curdate()-1) limit 12;
	select count(cantidad) into aux2 from (select * from movimientos) as a where concepto="nomina" and fechamov between year(curdate()) and year(curdate()-1) limit 12;
	if aux2>=12 then
		update cuentaBancarias set nomina=New.cantidad and mediaNominas=aux1/aux2 where idCliente=auxid and IBAN=(select IBAN from (select * from cuentaBancarias)as a where idCliente=auxid);
	end if;
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `fechaPago` date NOT NULL,
  `cantidadPagada` decimal(10,2) NOT NULL,
  `idCliente` varchar(50) NOT NULL,
  `idPrestamo` varchar(45) NOT NULL,
  `idMovimiento` int NOT NULL,
  PRIMARY KEY (`idPago`,`idCliente`,`idPrestamo`,`idMovimiento`),
  KEY `fk_Pago_Prestamos1_idx` (`idCliente`,`idPrestamo`),
  KEY `fk_pago_movimiento1_idx` (`idMovimiento`,`idCliente`),
  CONSTRAINT `fk_pago_movimiento1` FOREIGN KEY (`idMovimiento`, `idCliente`) REFERENCES `movimientos` (`numOperacion`, `idCliente`),
  CONSTRAINT `fk_Pago_Prestamos1` FOREIGN KEY (`idCliente`, `idPrestamo`) REFERENCES `prestamos` (`idCliente`, `idPrestamo`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,'2023-05-25',2000.00,'3','3',63),(15,'2023-05-26',600.00,'3','3',63),(17,'2023-05-26',2000.00,'3','3',63);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagos_AFTER_INSERT` AFTER INSERT ON `pagos` FOR EACH ROW BEGIN
declare nomb varchar(50);
set nomb=(select nombre from clientes where UID=New.idCliente);
	update prestamos set cantidadAPagar=cantidadAPagar-New.cantidadPagada where idCliente=New.idCliente and idPrestamo=New.idPrestamo;
	insert into movimientos(idCliente,cantidad,emisor,receptor,concepto,fechaMov) values(New.idCliente,-New.cantidadPagada,nomb,"banco","gastos",curdate());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `perfiles`
--

DROP TABLE IF EXISTS `perfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfiles` (
  `idCliente` varchar(50) NOT NULL,
  `contraseña` varchar(80) NOT NULL,
  `situacionCivil` varchar(50) NOT NULL,
  `situacionLaboral` varchar(45) NOT NULL,
  `moroso` tinyint NOT NULL DEFAULT '0',
  `enJuicio` tinyint NOT NULL DEFAULT '0',
  `casado` varchar(20) NOT NULL DEFAULT 'soltero/a',
  `idPareja` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `fk_Perfil_Cliente_idx` (`idCliente`),
  KEY `fk_Perfil_Cliente1_idx` (`idPareja`),
  CONSTRAINT `fk_Perfil_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`UID`),
  CONSTRAINT `fk_Perfil_Cliente1` FOREIGN KEY (`idPareja`) REFERENCES `clientes` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfiles`
--

LOCK TABLES `perfiles` WRITE;
/*!40000 ALTER TABLE `perfiles` DISABLE KEYS */;
INSERT INTO `perfiles` VALUES ('1','12345678A','soltero','empleado',0,0,'0',NULL),('10','01234567J','soltero','estudiante',0,0,'0',NULL),('11','12345678K','casado','desempleado',1,0,'en separacion','5'),('12','23456789L','soltero','empleado',0,1,'0',NULL),('13','34567890M','casado','autonomo',1,0,'en gananciales','8'),('14','45678901N','soltero','pensionista',0,0,'0',NULL),('15','56789012O','casado','empleado',1,1,'en separacion','9'),('16','67890123P','soltero','estudiante',0,0,'0',NULL),('17','78901234Q','casado','desempleado',1,0,'en separacion','11'),('18','89012345R','soltero','empleado',0,1,'0',NULL),('19','90123456S','casado','autonomo',1,0,'en gananciales','13'),('2','23456789B','casado','autonomo',0,0,'en gananciales','6'),('20','01234567T','soltero','pensionista',0,0,'0',NULL),('21','12345678U','casado','empleado',1,1,'en separacion','15'),('22','23456789V','soltero','estudiante',0,0,'0',NULL),('23','34567890W','casado','desempleado',1,0,'en separacion','17'),('24','45678901X','soltero','empleado',0,1,'0',NULL),('25','56789012Y','casado','autonomo',1,0,'en gananciales','19'),('26','67890123Z','soltero','pensionista',0,0,'0',NULL),('27','78901234A','casado','empleado',1,1,'en separacion','21'),('28','89012345B','soltero','estudiante',0,0,'0',NULL),('29','90123456C','casado','desempleado',1,0,'en separacion','23'),('3','34567890C','soltero','estudiante',1,0,'0',NULL),('30','01234567D','soltero','empleado',0,1,'0',NULL),('31','12345678E','casado','autonomo',1,0,'en gananciales','25'),('32','23456789F','soltero','pensionista',0,0,'0',NULL),('33','34567890G','casado','empleado',1,1,'en separacion','27'),('34','45678901H','soltero','estudiante',0,0,'0',NULL),('35','56789012I','casado','desempleado',1,0,'en separacion','29'),('36','67890123J','soltero','empleado',0,1,'0',NULL),('37','78901234K','casado','autonomo',1,0,'en gananciales','31'),('38','89012345L','soltero','pensionista',0,0,'0',NULL),('39','90123456M','casado','empleado',1,1,'en separacion','33'),('4','45678901D','casado','empleado',0,1,'en separacion','7'),('40','01234567N','soltero','estudiante',0,0,'0',NULL),('41','12345678O','casado','desempleado',1,0,'en separacion','35'),('42','23456789P','soltero','empleado',0,1,'0',NULL),('43','34567890Q','casado','autonomo',1,0,'en gananciales','37'),('44','45678901R','soltero','pensionista',0,0,'0',NULL),('45','56789012S','casado','empleado',1,1,'en separacion','39'),('46','67890123T','soltero','estudiante',0,0,'0',NULL),('47','78901234U','casado','desempleado',1,0,'en separacion','41'),('48','89012345V','soltero','empleado',0,1,'0',NULL),('49','90123456W','casado','autonomo',1,0,'en gananciales','43'),('5','56789012E','soltero','desempleado',1,0,'0',NULL),('50','01234567X','soltero','pensionista',0,0,'0',NULL),('6','67890123F','soltero','pensionista',0,0,'0',NULL),('7','78901234G','casado','empleado',1,0,'en gananciales','2'),('8','89012345H','soltero','autonomo',0,0,'0',NULL),('9','90123456I','casado','empleado',1,1,'en separacion','4');
/*!40000 ALTER TABLE `perfiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `perfiles_AFTER_UPDATE` AFTER UPDATE ON `perfiles` FOR EACH ROW BEGIN
declare auxP varchar(50);
select idpareja into auxp from (select * from perfiles) as a where idCliente=New.idPareja;
if	auxP is null or auxP!=New.idCliente then
	update perfiles set idPareja=NEW.idCliente where idCliente=idPareja;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `idPrestamo` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `fechaOferta` date NOT NULL,
  `cantidadConceder` decimal(10,2) unsigned NOT NULL,
  `periodo` int unsigned NOT NULL,
  `interes` decimal(5,2) unsigned NOT NULL,
  `plazoDias` int unsigned NOT NULL,
  `fechaFirma` date DEFAULT NULL,
  `cantidadMensual` decimal(6,2) DEFAULT NULL,
  `idCliente` varchar(50) NOT NULL,
  `cantidadAPagar` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPrestamo`,`idCliente`),
  UNIQUE KEY `idPrestamo_UNIQUE` (`idPrestamo`),
  UNIQUE KEY `cantidadMensual_UNIQUE` (`cantidadMensual`),
  KEY `fk_Prestamos_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_Prestamos_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES ('1','preconcedido','Préstamo personal','2023-01-01',5000.00,12,8.50,365,NULL,NULL,'1',NULL),('2','preconcedido','Préstamo hipotecario','2023-02-01',10000.00,240,6.50,365,NULL,NULL,'2',NULL),('3','concedido','Préstamo automotriz','2023-03-01',15000.00,60,7.20,365,'2023-03-20',2000.00,'3',19400.00),('4','concedido','Préstamo estudiantil','2023-04-01',5000.00,36,5.50,365,'2023-04-25',750.00,'4',9000.00),('5','preconcedido','Préstamo empresarial','2023-05-01',15000.00,120,9.00,365,NULL,NULL,'5',NULL);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prestamos_AFTER_INSERT` AFTER INSERT ON `prestamos` FOR EACH ROW BEGIN
declare aux1 varchar(50);
select nombre into aux1 from clientes where UID=New.idCliente;
if new.estado="concedido" then
	insert into movimientos(idCliente,cantidad,concepto,emisor,receptor,fechaMov) values(New.idCliente,New.cantidadConceder,"ingresos","banco",aux1,curdate());
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'finalbanco'
--

--
-- Dumping routines for database 'finalbanco'
--
/*!50003 DROP PROCEDURE IF EXISTS `informeCPM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `informeCPM`()
BEGIN
select nombre, apellidos, telefono from clientes inner join prestamos on uid=idcliente where fechaOferta like "2023-05-%";
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

-- Dump completed on 2023-05-26 16:15:06
