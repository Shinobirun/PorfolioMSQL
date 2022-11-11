-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`telefono` (
  `id` INT NOT NULL,
  `linea` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `contacto` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`domicilio` (
  `id` INT NOT NULL,
  `calle` VARCHAR(45) NULL,
  `altura` INT NULL,
  `ciudad` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `telefono_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_domicilio_telefono1_idx` (`telefono_id` ASC) VISIBLE,
  CONSTRAINT `fk_domicilio_telefono1`
    FOREIGN KEY (`telefono_id`)
    REFERENCES `mydb`.`telefono` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `sobre_mi` VARCHAR(400) NULL,
  `url_foto` VARCHAR(100) NULL,
  `domicilio_id` INT NOT NULL,
  PRIMARY KEY (`id`, `domicilio_id`),
  INDEX `fk_persona_domicilio1_idx` (`domicilio_id` ASC) VISIBLE,
  CONSTRAINT `fk_persona_domicilio1`
    FOREIGN KEY (`domicilio_id`)
    REFERENCES `mydb`.`domicilio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id` INT NOT NULL,
  `nombre_de_usuario` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_persona_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`experiencia` (
  `id` INT NOT NULL,
  `tecnologia` VARCHAR(45) NULL,
  `porcentaje` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experiencia_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`trabajo` (
  `id` INT NOT NULL,
  `actual` TINYINT NULL,
  `empresa` VARCHAR(45) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  `descripcion` VARCHAR(500) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_trabajo_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_trabajo_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estudio` (
  `id` INT NOT NULL,
  `institucion` VARCHAR(45) NULL,
  `fecha_final` DATE NULL,
  `titulo` VARCHAR(100) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estudio_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`proyectos` (
  `id` INT NOT NULL,
  `nombre:proyecto` VARCHAR(45) NULL,
  `url_proyecto` VARCHAR(100) NULL,
  `descripcion` VARCHAR(500) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proyectos_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `mydb`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
