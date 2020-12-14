-- EXERCICIO - CRIACAO E MODELAGEM --
/*
	1) Crie um banco de dados chamado 'oficina' e conecte-se ao banco;
	
	2) Faca a seguinte modelagem:
	
			Sr. Jose quer modernizar a sua oficina, e por enquanto, cadastrar os carros que entram para
			realizar servicos e os seus respectivos donos. Sr. Jose mencionou que cada cliente possui
			apenas um carro. Um carro possui uma marca. Sr. Jose tambem quer saber as cores dos carros
			para ter ideia de qual tinta comprar, e informar que um carro pode ter mais de uma cor. Sr.
			Jose necessita armazenar os telefones dos clientes, mas nao quer que eles sejam obrigatorios.
*/

-- EXECUCAO --
/*
	Tabelas:
	
		CARROS - MODELO
				 CLIENTE - ID
				 COR - ID
				 MARCA - ID
				 		
		MARCA - NOME
		
		COR - NOME
		
		CLIENTE - NOME
					   TELEFONE
*/


-- MODELAGEM, DATABASE E TABLES CRIADAS NO MYSQL WORKBENCH --

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `oficina` ;

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`marca` ;

CREATE TABLE IF NOT EXISTS `oficina`.`marca` (
  `IdMarca` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdMarca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`carro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`carro` ;

CREATE TABLE IF NOT EXISTS `oficina`.`carro` (
  `IdCarro` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NOT NULL,
  `Placa` VARCHAR(45) NOT NULL,
  `Id_Marca` INT NOT NULL,
  PRIMARY KEY (`IdCarro`, `Id_Marca`),
  INDEX `fk_carro_marca1_idx` (`Id_Marca` ASC),
  CONSTRAINT `fk_carro_marca1`
    FOREIGN KEY (`Id_Marca`)
    REFERENCES `oficina`.`marca` (`IdMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`cliente` ;

CREATE TABLE IF NOT EXISTS `oficina`.`cliente` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Sexo` ENUM('M', 'F') NOT NULL,
  `Id_Carro` INT NOT NULL,
  PRIMARY KEY (`IdCliente`, `Id_Carro`),
  INDEX `fk_cliente_carro_idx` (`Id_Carro` ASC),
  CONSTRAINT `fk_cliente_carro`
    FOREIGN KEY (`Id_Carro`)
    REFERENCES `oficina`.`carro` (`IdCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`telefone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`telefone` ;

CREATE TABLE IF NOT EXISTS `oficina`.`telefone` (
  `IdTelefone` INT NOT NULL AUTO_INCREMENT,
  `Numero` VARCHAR(20) NULL,
  `Tipo` ENUM('Residencial', 'Comercial', 'Celular') NULL,
  `Id_Cliente` INT NULL,
  PRIMARY KEY (`IdTelefone`, `Id_Cliente`),
  INDEX `fk_telefone_cliente1_idx` (`Id_Cliente` ASC),
  CONSTRAINT `fk_telefone_cliente`
    FOREIGN KEY (`Id_Cliente`)
    REFERENCES `oficina`.`cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Cor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Cor` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Cor` (
  `IdCor` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdCor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`carro_cor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`carro_cor` ;

CREATE TABLE IF NOT EXISTS `oficina`.`carro_cor` (
  `Id_Carro` INT NOT NULL,
  `Id_Cor` INT NOT NULL,
  PRIMARY KEY (`Id_Carro`, `Id_Cor`),
  INDEX `fk_carro_cor_Cor1_idx` (`Id_Cor` ASC),
  CONSTRAINT `fk_carro_cor_carro`
    FOREIGN KEY (`Id_Carro`)
    REFERENCES `oficina`.`carro` (`IdCarro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_carro_cor_Cor1`
    FOREIGN KEY (`Id_Cor`)
    REFERENCES `oficina`.`Cor` (`IdCor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
