-- MySQL Script generated by MySQL Workbench
-- Thu Jul 20 13:32:02 2023
-- Model: HR    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hr
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hr` ;

-- -----------------------------------------------------
-- Schema hr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hr` DEFAULT CHARACTER SET utf8 ;
USE `hr` ;

-- -----------------------------------------------------
-- Table `hr`.`job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hr`.`job` ;

CREATE TABLE IF NOT EXISTS `hr`.`job` (
  `JOB_IDENT` CHAR(9) NOT NULL,
  `JOB_TITLE` VARCHAR(45) NULL,
  `MIN_SALARY` DECIMAL(10,2) NULL,
  `MAX_SALARY` DECIMAL(10,2) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`JOB_IDENT`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hr`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hr`.`department` ;

CREATE TABLE IF NOT EXISTS `hr`.`department` (
  `DEPT_ID_DEP` CHAR(9) NOT NULL,
  `DEP_NAME` VARCHAR(15) NULL,
  `MANAGER_ID` CHAR(9) NULL,
  `LOC_ID` CHAR(9) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`DEPT_ID_DEP`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hr`.`job_history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hr`.`job_history` ;

CREATE TABLE IF NOT EXISTS `hr`.`job_history` (
  `EMPL_ID` CHAR(9) NOT NULL,
  `START_DATE` DATE NULL,
  `DEPT_ID` CHAR(9) NULL,
  `JOBS_ID` CHAR(9) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`EMPL_ID`),
  CONSTRAINT `fk_JOB_HISTORY_JOB1`
    FOREIGN KEY (`JOBS_ID`)
    REFERENCES `hr`.`job` (`JOB_IDENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JOB_HISTORY_DEPARTMENT1`
    FOREIGN KEY (`DEPT_ID`)
    REFERENCES `hr`.`department` (`DEPT_ID_DEP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hr`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hr`.`employee` ;

CREATE TABLE IF NOT EXISTS `hr`.`employee` (
  `EMP_ID` VARCHAR(9) NOT NULL,
  `F_NAME` VARCHAR(45) NULL,
  `L_NAME` VARCHAR(45) NULL,
  `SSN` CHAR(9) NULL,
  `B_DATE` DATE NULL,
  `SEX` CHAR(1) NULL,
  `ADDRESS` VARCHAR(45) NULL,
  `JOB_ID` CHAR(9) NOT NULL,
  `SALARY` DECIMAL(10,2) NULL,
  `MANAGER_ID` CHAR(9) NULL,
  `DEP_ID` CHAR(9) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  PRIMARY KEY (`EMP_ID`),
  CONSTRAINT `JOB_IDENT`
    FOREIGN KEY (`JOB_ID`)
    REFERENCES `hr`.`job` (`JOB_IDENT`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_DEPARTMENT1`
    FOREIGN KEY (`DEP_ID`)
    REFERENCES `hr`.`department` (`DEPT_ID_DEP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLOYEE_JOB_HISTORY1`
    FOREIGN KEY (`EMP_ID`)
    REFERENCES `hr`.`job_history` (`EMPL_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
