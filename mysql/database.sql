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
-- Table `mydb`.`Genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Genres` (
  `idGenre` INT NOT NULL AUTO_INCREMENT,
  `genreName` VARCHAR(45) NULL,
  PRIMARY KEY (`idGenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Actors` (
  `idActor` INT NOT NULL AUTO_INCREMENT,
  `actorName` VARCHAR(45) NULL,
  PRIMARY KEY (`idActor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Films` (
  `idFilm` INT NOT NULL AUTO_INCREMENT,
  `filmName` VARCHAR(45) NOT NULL,
  `releaseYear` INT NULL,
  `rating` INT NULL,
  `description` VARCHAR(200) NULL,
  `idGenre` INT NOT NULL,
  `idActor` INT NOT NULL,
  PRIMARY KEY (`idFilm`, `idGenre`, `idActor`),
  INDEX `fk_Films_Genres_idx` (`idGenre` ASC) VISIBLE,
  INDEX `fk_Films_Actors1_idx` (`idActor` ASC) VISIBLE,
  CONSTRAINT `fk_Films_Genres`
    FOREIGN KEY (`idGenre`)
    REFERENCES `mydb`.`Genres` (`idGenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Films_Actors1`
    FOREIGN KEY (`idActor`)
    REFERENCES `mydb`.`Actors` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Users` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
