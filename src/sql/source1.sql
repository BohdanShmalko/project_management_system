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
-- Table `project_management_system_v2`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`role` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`role` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`project` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`project` (
  `id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`task` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`task` (
  `id` INT UNSIGNED NOT NULL,
  `Project_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Task_Project1_idx` (`Project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `project_management_system_v2`.`project` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`worker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`worker` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`worker` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`association`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`association` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`association` (
  `id` INT UNSIGNED NOT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  `Role_id` INT UNSIGNED NOT NULL,
  `Worker_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Association_Task1_idx` (`Task_id` ASC) VISIBLE,
  INDEX `fk_Association_Role1_idx` (`Role_id` ASC) VISIBLE,
  INDEX `fk_Association_Worker1_idx` (`Worker_id` ASC) VISIBLE,
  CONSTRAINT `fk_Association_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `project_management_system_v2`.`role` (`id`),
  CONSTRAINT `fk_Association_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`task` (`id`),
  CONSTRAINT `fk_Association_Worker1`
    FOREIGN KEY (`Worker_id`)
    REFERENCES `project_management_system_v2`.`worker` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`state` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`state` (
  `id` INT UNSIGNED NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`event` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`event` (
  `id` INT UNSIGNED NOT NULL,
  `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `Task_id` INT UNSIGNED NOT NULL,
  `State_id` INT UNSIGNED NOT NULL,
  `Worker_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Event_Task1_idx` (`Task_id` ASC) VISIBLE,
  INDEX `fk_Event_State1_idx` (`State_id` ASC) VISIBLE,
  INDEX `fk_Event_Worker1_idx` (`Worker_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_State1`
    FOREIGN KEY (`State_id`)
    REFERENCES `project_management_system_v2`.`state` (`id`),
  CONSTRAINT `fk_Event_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`task` (`id`),
  CONSTRAINT `fk_Event_Worker1`
    FOREIGN KEY (`Worker_id`)
    REFERENCES `project_management_system_v2`.`worker` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`project_property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`project_property` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`project_property` (
  `key` VARCHAR(45) NULL DEFAULT NULL,
  `velue` VARCHAR(45) NULL DEFAULT NULL,
  `Project_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Project_Property_Project1_idx` (`Project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Project_Property_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `project_management_system_v2`.`project` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`report` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`report` (
  `id` INT UNSIGNED NOT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Report_Task1_idx` (`Task_id` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`task` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`report_property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`report_property` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`report_property` (
  `key` VARCHAR(45) NULL DEFAULT NULL,
  `value` VARCHAR(45) NULL DEFAULT NULL,
  `Report_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Report_Property_Report1_idx` (`Report_id` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Property_Report1`
    FOREIGN KEY (`Report_id`)
    REFERENCES `project_management_system_v2`.`report` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `project_management_system_v2`.`task_property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system_v2`.`task_property` ;

CREATE TABLE IF NOT EXISTS `project_management_system_v2`.`task_property` (
  `key` VARCHAR(45) NULL DEFAULT NULL,
  `value` VARCHAR(45) NULL DEFAULT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Task_Property_Task1_idx` (`Task_id` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Property_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system_v2`.`task` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
