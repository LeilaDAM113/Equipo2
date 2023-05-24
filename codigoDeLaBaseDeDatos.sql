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
CREATE SCHEMA IF NOT EXISTS `banco` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
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
DEFAULT CHARACTER SET = utf8mb3;


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
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`movimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`movimientos` (
  `numOperacion` INT NOT NULL AUTO_INCREMENT,
  `idCliente` VARCHAR(50) NOT NULL,
  `cantidad` DECIMAL(6,2) NOT NULL,
  `concepto` VARCHAR(80) NOT NULL,
  `emisor` VARCHAR(50) NOT NULL,
  `receptor` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`numOperacion`, `idCliente`),
  INDEX `fk_Movimiento_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Movimiento_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`prestamos` (
  `idPrestamo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(80) NOT NULL DEFAULT '"Aún no esta concedido"',
  `fechaOferta` DATE NOT NULL,
  `cantidadConceder` DECIMAL(10,2) UNSIGNED NOT NULL,
  `periodo` INT UNSIGNED NOT NULL,
  `interes` DECIMAL(5,2) UNSIGNED NOT NULL,
  `plazoDias` INT UNSIGNED NOT NULL,
  `fechaFirma` DATE NULL DEFAULT NULL,
  `cantidadMensual` DECIMAL(6,2) NULL DEFAULT NULL,
  `idCliente` VARCHAR(50) NOT NULL,
  `cantidadAPagar` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`, `idPrestamo`),
  UNIQUE INDEX `cantidadMensual_UNIQUE` (`cantidadMensual` ASC) VISIBLE,
  INDEX `fk_Prestamos_Cliente1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Prestamos_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`pagos` (
  `idPago` INT NOT NULL,
  `fechaPago` DATE NOT NULL,
  `cantidadPagada` DECIMAL(6,2) NOT NULL,
  `idCliente` VARCHAR(50) NOT NULL,
  `idPrestamo` VARCHAR(45) NOT NULL,
  `idMovimiento` INT NOT NULL,
  PRIMARY KEY (`idPago`, `idCliente`, `idPrestamo`, `idMovimiento`),
  INDEX `fk_Pago_Prestamos1_idx` (`idCliente` ASC, `idPrestamo` ASC) VISIBLE,
  INDEX `fk_pago_movimiento1_idx` (`idMovimiento` ASC, `idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pago_movimiento1`
    FOREIGN KEY (`idMovimiento` , `idCliente`)
    REFERENCES `banco`.`movimientos` (`numOperacion` , `idCliente`),
  CONSTRAINT `fk_Pago_Prestamos1`
    FOREIGN KEY (`idCliente` , `idPrestamo`)
    REFERENCES `banco`.`prestamos` (`idCliente` , `idPrestamo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `banco`.`perfiles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banco`.`perfiles` (
  `Id` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(80) NOT NULL,
  `situacionCivil` VARCHAR(50) NOT NULL,
  `situacionLaboral` VARCHAR(45) NOT NULL,
  `moroso` TINYINT NOT NULL DEFAULT '0',
  `enJuicio` TINYINT NOT NULL DEFAULT '0',
  `casado` TINYINT NOT NULL,
  `idPareja` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_Perfil_Cliente_idx` (`Id` ASC) VISIBLE,
  INDEX `fk_Perfil_Cliente1_idx` (`idPareja` ASC) VISIBLE,
  CONSTRAINT `fk_Perfil_Cliente`
    FOREIGN KEY (`Id`)
    REFERENCES `banco`.`clientes` (`UID`),
  CONSTRAINT `fk_Perfil_Cliente1`
    FOREIGN KEY (`idPareja`)
    REFERENCES `banco`.`clientes` (`UID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
