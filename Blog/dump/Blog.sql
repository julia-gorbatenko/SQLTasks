-- MySQL Script generated by MySQL Workbench
-- Mon Feb 26 20:57:26 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `userID_UNIQUE` (`userID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`posts` (
  `postID` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `text` TEXT(1000) NOT NULL,
  `date` DATE NOT NULL,
  `author` INT NOT NULL,
  PRIMARY KEY (`postID`),
  UNIQUE INDEX `postID_UNIQUE` (`postID` ASC),
  INDEX `fk_posts_users1_idx` (`author` ASC),
  CONSTRAINT `fk_posts_users1`
    FOREIGN KEY (`author`)
    REFERENCES `mydb`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tags` (
  `tagID` INT NOT NULL AUTO_INCREMENT,
  `tagName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tagID`),
  UNIQUE INDEX `tagID_UNIQUE` (`tagID` ASC),
  UNIQUE INDEX `tagName_UNIQUE` (`tagName` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag-post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tag-post` (
  `tags_tagID` INT NOT NULL,
  `posts_postID` INT NOT NULL,
  INDEX `fk_tag-post_tags1_idx` (`tags_tagID` ASC),
  UNIQUE INDEX `post-tag UNIQUE` (`tags_tagID` ASC, `posts_postID` ASC),
  PRIMARY KEY (`posts_postID`, `tags_tagID`),
  INDEX `fk_tag-post_posts1_idx` (`posts_postID` ASC),
  CONSTRAINT `fk_tag-post_tags1`
    FOREIGN KEY (`tags_tagID`)
    REFERENCES `mydb`.`tags` (`tagID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag-post_posts1`
    FOREIGN KEY (`posts_postID`)
    REFERENCES `mydb`.`posts` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
