-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema banco
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema banco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `banco` DEFAULT CHARACTER SET latin1 ;
USE `banco` ;

-- -----------------------------------------------------
-- Table `banco`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`clientes` (
  `UID` VARCHAR(50) NOT NULL,
  `dni` CHAR(9) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `apellidos` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(9) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `localidad` VARCHAR(60) NOT NULL,
  `fechaNac` DATE NOT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`cuentabancarias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`cuentabancarias` (
  `IBAN` CHAR(24) NOT NULL,
  `tipoCuenta` VARCHAR(40) NOT NULL,
  `saldo` DECIMAL(10,2) NOT NULL,
  `nomina` DECIMAL(6,2) UNSIGNED NOT NULL,
  `mediaNominas` DECIMAL(6,2) UNSIGNED NOT NULL,
  `idCliente` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IBAN`, `idCliente`),
  INDEX `fk_CuentaBancaria_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_CuentaBancaria_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`movimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`movimientos` (
  `numOperacion` INT(11) NOT NULL AUTO_INCREMENT,
  `idCliente` VARCHAR(50) NOT NULL,
  `cantidad` DECIMAL(10,2) NOT NULL,
  `concepto` VARCHAR(80) NOT NULL,
  `emisor` VARCHAR(50) NOT NULL,
  `receptor` VARCHAR(50) NOT NULL,
  `fechaMov` DATE NOT NULL,
  PRIMARY KEY (`numOperacion`, `idCliente`),
  INDEX `fk_Movimiento_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Movimiento_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
AUTO_INCREMENT = 92
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`prestamos` (
  `idPrestamo` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(80) NOT NULL,
  `fechaOferta` DATE NOT NULL,
  `cantidadConceder` DECIMAL(10,2) UNSIGNED NOT NULL,
  `periodo` INT(10) UNSIGNED NOT NULL,
  `interes` DECIMAL(5,2) UNSIGNED NOT NULL,
  `plazoDias` INT(10) UNSIGNED NOT NULL,
  `fechaFirma` DATE NULL DEFAULT NULL,
  `cantidadMensual` DECIMAL(6,2) NULL DEFAULT NULL,
  `idCliente` VARCHAR(50) NOT NULL,
  `cantidadAPagar` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idPrestamo`, `idCliente`),
  UNIQUE INDEX `idPrestamo_UNIQUE` (`idPrestamo` ASC) VISIBLE,
  UNIQUE INDEX `cantidadMensual_UNIQUE` (`cantidadMensual` ASC) VISIBLE,
  INDEX `fk_Prestamos_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamos_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`pagos` (
  `idPago` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPago` DATE NOT NULL,
  `cantidadPagada` DECIMAL(10,2) NOT NULL,
  `idCliente` VARCHAR(50) NOT NULL,
  `idPrestamo` VARCHAR(45) NOT NULL,
  `idMovimiento` INT(11) NOT NULL,
  PRIMARY KEY (`idPago`, `idCliente`, `idPrestamo`, `idMovimiento`),
  INDEX `fk_Pago_Prestamos1_idx` (`idCliente` ASC, `idPrestamo` ASC) VISIBLE,
  INDEX `fk_pago_movimiento1_idx` (`idMovimiento` ASC, `idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pago_Prestamos1`
    FOREIGN KEY (`idCliente` , `idPrestamo`)
    REFERENCES `banco`.`prestamos` (`idCliente` , `idPrestamo`),
  CONSTRAINT `fk_pago_movimiento1`
    FOREIGN KEY (`idMovimiento` , `idCliente`)
    REFERENCES `banco`.`movimientos` (`numOperacion` , `idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `banco`.`perfiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`perfiles` (
  `idCliente` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(80) NOT NULL,
  `situacionCivil` VARCHAR(50) NOT NULL,
  `situacionLaboral` VARCHAR(45) NOT NULL,
  `moroso` TINYINT(4) NOT NULL DEFAULT '0',
  `enJuicio` TINYINT(4) NOT NULL DEFAULT '0',
  `casado` VARCHAR(20) NULL DEFAULT 'soltero/a',
  `idPareja` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Perfil_Cliente_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `banco` ;

-- -----------------------------------------------------
-- procedure informeCPM
-- -----------------------------------------------------

DELIMITER $$
USE `banco`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `informeCPM`()
BEGIN
select nombre, apellidos, telefono from clientes inner join prestamos on uid=idcliente where fechaOferta like "2023-05-%";
END$$

DELIMITER ;
USE `banco`;

DELIMITER $$
USE `banco`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `banco`.`movimientos_AFTER_INSERT`
AFTER INSERT ON `banco`.`movimientos`
FOR EACH ROW
BEGIN
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

END$$

USE `banco`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `banco`.`prestamos_AFTER_INSERT`
AFTER INSERT ON `banco`.`prestamos`
FOR EACH ROW
BEGIN
declare aux1 varchar(50);
select nombre into aux1 from clientes where UID=New.idCliente;
if new.estado="concedido" then
	insert into movimientos(idCliente,cantidad,concepto,emisor,receptor,fechaMov) values(New.idCliente,New.cantidadConceder,"ingresos","banco",aux1,curdate());
end if;
END$$

USE `banco`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `banco`.`pagos_AFTER_INSERT`
AFTER INSERT ON `banco`.`pagos`
FOR EACH ROW
BEGIN
declare nomb varchar(50);
set nomb=(select nombre from clientes where UID=New.idCliente);
	update prestamos set cantidadAPagar=cantidadAPagar-New.cantidadPagada where idCliente=New.idCliente and idPrestamo=New.idPrestamo;
	insert into movimientos(idCliente,cantidad,emisor,receptor,concepto,fechaMov) values(New.idCliente,-New.cantidadPagada,nomb,"banco","gastos",curdate());
END$$

USE `banco`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `banco`.`perfiles_AFTER_UPDATE`
AFTER UPDATE ON `banco`.`perfiles`
FOR EACH ROW
BEGIN
declare auxP varchar(50);
select idpareja into auxp from (select * from perfiles) as a where idCliente=New.idPareja;
if	auxP is null or auxP!=New.idCliente then
	update perfiles set idPareja=NEW.idCliente where idCliente=idPareja;
end if;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
