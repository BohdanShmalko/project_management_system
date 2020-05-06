-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema project_management_system
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `project_management_system` ;

-- -----------------------------------------------------
-- Schema project_management_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `project_management_system` DEFAULT CHARACTER SET utf8 ;
USE `project_management_system` ;

-- -----------------------------------------------------
-- Table `project_management_system`.`Project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Project` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Project` (
  `id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Project_Property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Project_Property` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Project_Property` (
  `key` VARCHAR(45) NULL DEFAULT NULL,
  `value` VARCHAR(45) NULL DEFAULT NULL,
  `Project_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Project_Property_Project1_idx` (`Project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Project_Property_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `project_management_system`.`Project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Task` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Task` (
  `id` INT UNSIGNED NOT NULL,
  `Project_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Task_Project1_idx` (`Project_id` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Project1`
    FOREIGN KEY (`Project_id`)
    REFERENCES `project_management_system`.`Project` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Task_Property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Task_Property` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Task_Property` (
  `key` VARCHAR(45) NULL DEFAULT NULL,
  `value` VARCHAR(45) NULL DEFAULT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Task_Property_Task1_idx` (`Task_id` ASC) VISIBLE,
  CONSTRAINT `fk_Task_Property_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`State`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`State` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`State` (
  `id` INT UNSIGNED NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Worker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Worker` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Worker` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Event` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Event` (
  `id` INT UNSIGNED NOT NULL,
  `date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Task_id` INT UNSIGNED NOT NULL,
  `State_id` INT UNSIGNED NOT NULL,
  `Worker_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Event_Task1_idx` (`Task_id` ASC) VISIBLE,
  INDEX `fk_Event_State1_idx` (`State_id` ASC) VISIBLE,
  INDEX `fk_Event_Worker1_idx` (`Worker_id` ASC) VISIBLE,
  CONSTRAINT `fk_Event_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_State1`
    FOREIGN KEY (`State_id`)
    REFERENCES `project_management_system`.`State` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Event_Worker1`
    FOREIGN KEY (`Worker_id`)
    REFERENCES `project_management_system`.`Worker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Role` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Role` (
  `id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Association`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Association` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Association` (
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
    REFERENCES `project_management_system`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Association_Role1`
    FOREIGN KEY (`Role_id`)
    REFERENCES `project_management_system`.`Role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Association_Worker1`
    FOREIGN KEY (`Worker_id`)
    REFERENCES `project_management_system`.`Worker` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Report` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Report` (
  `id` INT UNSIGNED NOT NULL,
  `Task_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Report_Task1_idx` (`Task_id` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Task1`
    FOREIGN KEY (`Task_id`)
    REFERENCES `project_management_system`.`Task` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project_management_system`.`Report_Property`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project_management_system`.`Report_Property` ;

CREATE TABLE IF NOT EXISTS `project_management_system`.`Report_Property` (
  `key` VARCHAR(45) NULL DEFAULT NULL,
  `value` VARCHAR(45) NULL DEFAULT NULL,
  `Report_id` INT UNSIGNED NOT NULL,
  INDEX `fk_Report_Property_Report1_idx` (`Report_id` ASC) VISIBLE,
  CONSTRAINT `fk_Report_Property_Report1`
    FOREIGN KEY (`Report_id`)
    REFERENCES `project_management_system`.`Report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `project_management_system`.`Project`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Project` (`id`) VALUES (1);
INSERT INTO `project_management_system`.`Project` (`id`) VALUES (2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Project_Property`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Project_Property` (`key`, `value`, `Project_id`) VALUES ('Name', 'Run App iOS', 1);
INSERT INTO `project_management_system`.`Project_Property` (`key`, `value`, `Project_id`) VALUES ('Client', 'Nike', 1);
INSERT INTO `project_management_system`.`Project_Property` (`key`, `value`, `Project_id`) VALUES ('Name', 'Run App Android', 2);
INSERT INTO `project_management_system`.`Project_Property` (`key`, `value`, `Project_id`) VALUES ('Client', 'Nike', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Task`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Task` (`id`, `Project_id`) VALUES (1, 1);
INSERT INTO `project_management_system`.`Task` (`id`, `Project_id`) VALUES (2, 1);
INSERT INTO `project_management_system`.`Task` (`id`, `Project_id`) VALUES (3, 1);
INSERT INTO `project_management_system`.`Task` (`id`, `Project_id`) VALUES (4, 1);
INSERT INTO `project_management_system`.`Task` (`id`, `Project_id`) VALUES (5, 2);
INSERT INTO `project_management_system`.`Task` (`id`, `Project_id`) VALUES (6, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Task_Property`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Name', 'Hire personel', 1);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Specialty', 'SwiftUI', 1);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Candidate1', 'John Doe', 1);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Candidate2', 'Will Smith', 1);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Name', 'Fix crash', 2);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Info', 'Crash occurs when opening \"About\" screen', 2);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Name', 'Add support for Apple Watch', 3);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Info', 'Move to Xcode 11.4', 3);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Name', 'Fix Bug', 4);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Info', 'Bug is on line 167', 4);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Name', 'Improve Performance', 5);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Info', 'Decrease time complexity', 5);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Name', 'Refactoring', 6);
INSERT INTO `project_management_system`.`Task_Property` (`key`, `value`, `Task_id`) VALUES ('Info', 'Network Manager class should be refactored', 6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`State`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`State` (`id`, `description`) VALUES (4, 'Done');
INSERT INTO `project_management_system`.`State` (`id`, `description`) VALUES (3, 'Waiting for Review');
INSERT INTO `project_management_system`.`State` (`id`, `description`) VALUES (2, 'In process');
INSERT INTO `project_management_system`.`State` (`id`, `description`) VALUES (1, 'Created');

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Worker`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (1, 'Kiany Sleeves');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (2, 'Johny Capp');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (3, 'Steven Works');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (4, 'Billy Poulter-Gates');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (5, 'Snoopard Doggett');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (6, 'Elongated Mustard');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (7, 'Blueray Williams');
INSERT INTO `project_management_system`.`Worker` (`id`, `name`) VALUES (8, 'Half Dollaren');

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Event`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (1, '2020-05-01 15:15:00', 1, 1, 1);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (2, '2020-05-01 15:15:00', 1, 2, 1);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (3, '2020-05-01 15:15:00', 1, 3, 1);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (4, '2020-05-01 15:15:00', 1, 4, 1);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (5, '2020-05-01 15:15:00', 2, 1, 3);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (6, '2020-05-01 15:15:00', 2, 2, 2);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (7, '2020-05-01 15:15:00', 2, 3, 2);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (8, '2020-05-01 15:15:00', 2, 4, 3);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (9, '2020-05-01 15:15:00', 3, 1, 3);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (10, '2020-05-01 15:15:00', 4, 1, 5);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (11, '2020-05-01 15:15:00', 5, 1, 7);
INSERT INTO `project_management_system`.`Event` (`id`, `date`, `Task_id`, `State_id`, `Worker_id`) VALUES (12, '2020-05-01 15:15:00', 6, 1, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Role`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Role` (`id`, `name`, `description`) VALUES (1, 'Worker', 'Do task');
INSERT INTO `project_management_system`.`Role` (`id`, `name`, `description`) VALUES (2, 'Reviewer', 'Accepts or declines task completion');
INSERT INTO `project_management_system`.`Role` (`id`, `name`, `description`) VALUES (3, 'HR', 'Human resources');

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Association`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (1, 1, 3, 1);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (2, 2, 1, 2);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (3, 2, 2, 3);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (4, 3, 1, 4);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (5, 4, 2, 3);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (6, 5, 1, 6);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (7, 5, 2, 7);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (8, 6, 1, 8);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (9, 6, 2, 7);
INSERT INTO `project_management_system`.`Association` (`id`, `Task_id`, `Role_id`, `Worker_id`) VALUES (10, 1, 2, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Report`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Report` (`id`, `Task_id`) VALUES (1, 1);
INSERT INTO `project_management_system`.`Report` (`id`, `Task_id`) VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `project_management_system`.`Report_Property`
-- -----------------------------------------------------
START TRANSACTION;
USE `project_management_system`;
INSERT INTO `project_management_system`.`Report_Property` (`key`, `value`, `Report_id`) VALUES ('Summary', 'John Doe is Hired', 1);
INSERT INTO `project_management_system`.`Report_Property` (`key`, `value`, `Report_id`) VALUES ('Cause', 'Obsolete method', 2);
INSERT INTO `project_management_system`.`Report_Property` (`key`, `value`, `Report_id`) VALUES ('Summary', 'Crash is Fixed', 2);

COMMIT;

