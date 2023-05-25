-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: banco
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
  `cantidad` decimal(6,2) NOT NULL,
  `concepto` varchar(80) NOT NULL,
  `emisor` varchar(50) NOT NULL,
  `receptor` varchar(50) NOT NULL,
  `fechaMov` date NOT NULL,
  PRIMARY KEY (`numOperacion`,`idCliente`),
  KEY `fk_Movimiento_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_Movimiento_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
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
if concepto="nomina" then 
select cantidad into aux1 from movimientos where concepto="nomina" order by numOperacion asc limit 1;
elseif cantidad>0 then
	update cuentaBancarias set saldo=saldo+new.cantidad where idCliente=New.idCliente;
elseif cantidad<0 then
	update cuentaBancarias set saldo=saldo+new.cantidad where idCliente=New.idCliente;
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
  `idPago` int NOT NULL,
  `fechaPago` date NOT NULL,
  `cantidadPagada` decimal(6,2) NOT NULL,
  `idCliente` varchar(50) NOT NULL,
  `idPrestamo` varchar(45) NOT NULL,
  `idMovimiento` int NOT NULL,
  PRIMARY KEY (`idPago`,`idCliente`,`idPrestamo`,`idMovimiento`),
  KEY `fk_Pago_Prestamos1_idx` (`idCliente`,`idPrestamo`),
  KEY `fk_pago_movimiento1_idx` (`idMovimiento`,`idCliente`),
  CONSTRAINT `fk_pago_movimiento1` FOREIGN KEY (`idMovimiento`, `idCliente`) REFERENCES `movimientos` (`numOperacion`, `idCliente`),
  CONSTRAINT `fk_Pago_Prestamos1` FOREIGN KEY (`idCliente`, `idPrestamo`) REFERENCES `prestamos` (`idCliente`, `idPrestamo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
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
select nombre into nomb from clientes where UID=New.idCliente;
insert into movimiento(idCliente,cantidad,emisor,receptor,concepto) values(New.idCliente,New.cantidadPagada,nomb,"banco","gastos");
update prestamos set cantidadAPagar=cantidadAPagar-New.cantidadPagada where idCliente=New.idCliente and idPrestamo=New.idPrestamo;
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
  `casado` tinyint NOT NULL,
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
update perfiles set idPareja=NEW.idCliente where idCliente=idPareja;
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
select nombre into aux1 from usuarios where UID=New.idCliente;
if new.estado="concedido" then
insert into movimientos(idCliente,cantidad,concepto,emisor,receptor) values(New.idCliente,New.cantidadConceder,"ingresos","banco",aux1);
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prestamos_AFTER_UPDATE` AFTER UPDATE ON `prestamos` FOR EACH ROW BEGIN
declare aux1 varchar(50);
select nombre into aux1 from usuarios where UID=New.idCliente;
if new.estado="concedido" then
insert into movimientos(idCliente,cantidad,concepto,emisor,receptor) values(New.idCliente,New.cantidadConceder,"ingresos",aux1,"banco");
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'banco'
--

--
-- Dumping routines for database 'banco'
--
/*!50003 DROP PROCEDURE IF EXISTS `informeCPM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
/*!50003 DROP PROCEDURE IF EXISTS `new_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_procedure`()
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

-- Dump completed on 2023-05-24 19:59:04
