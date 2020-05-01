-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema project_management_system_v2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `project_management_system_v2` ;

-- -----------------------------------------------------
-- Schema project_management_system_v2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project_management_system_v2` DEFAULT CHARACTER SET utf8 ;
USE `project_management_system_v2` ;

-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Project` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Project` (
  `id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Project_Property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Project_Property` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Project_Property` (
  `key` VARCHAR(45) NULL,
  `velue` VARCHAR(45) NULL,
  `Project_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Project_Property_Project1_idx` (`Project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Project_Property_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `project_management_system_v2`.`Project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Task` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Task` (
  `id` INT UNSIGNED NOT NULL,
  `Project_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Task_Project1_idx` (`Project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `project_management_system_v2`.`Project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Task_Property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Task_Property` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Task_Property` (
  `key` VARCHAR(45) NULL,
  `value` VARCHAR(45) NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Task_Property_Task1_idx` (`Task_id` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Property_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`State` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`State` (
  `id` INT UNSIGNED NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Worker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Worker` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Worker` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Event` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Event` (
  `id` INT UNSIGNED NOT NULL,
  `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Task_id` INT UNSIGNED NOT NULL,
  `State_id` INT UNSIGNED NOT NULL,
  `Worker_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Event_Task1_idx` (`Task_id` ASC) VISIBLE,
  INDEX `fk_Event_State1_idx` (`State_id` ASC) VISIBLE,
  INDEX `fk_Event_Worker1_idx` (`Worker_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_State1`
    FOREIGN KEY (`State_id`)
    REFERENCES `project_management_system_v2`.`State` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Worker1`
    FOREIGN KEY (`Worker_id`)
    REFERENCES `project_management_system_v2`.`Worker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Role` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Role` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Association`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Association` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Association` (
  `id` INT UNSIGNED NOT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  `Role_id` INT UNSIGNED NOT NULL,
  `Worker_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Association_Task1_idx` (`Task_id` ASC) VISIBLE,
  INDEX `fk_Association_Role1_idx` (`Role_id` ASC) VISIBLE,
  INDEX `fk_Association_Worker1_idx` (`Worker_id` ASC) VISIBLE,
  CONSTRAINT `fk_Association_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Association_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `project_management_system_v2`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Association_Worker1`
    FOREIGN KEY (`Worker_id`)
    REFERENCES `project_management_system_v2`.`Worker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Report` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Report` (
  `id` INT UNSIGNED NOT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Report_Task1_idx` (`Task_id` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`Report_Property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`Report_Property` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`Report_Property` (
  `key` VARCHAR(45) NULL,
  `value` VARCHAR(45) NULL,
  `Report_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Report_Property_Report1_idx` (`Report_id` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Property_Report1`
    FOREIGN KEY (`Report_id`)
    REFERENCES `project_management_system_v2`.`Report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
