-- MySQL Script generated by MySQL Workbench
-- Mon Nov  6 08:27:13 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE `mydb`;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel` (
  `ID_Hotel` INT NOT NULL,
  `Nome_Hotel` VARCHAR(50) NOT NULL,
  `Cidade_Hotel` VARCHAR(50) NOT NULL,
  `Pais_Hotel` VARCHAR(50) NOT NULL,
  `Estado_Hotel` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_Hotel`));


-- -----------------------------------------------------
-- Table `Info_Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Info_Login` (
  `ID_usuario` INT NOT NULL,
  `Login` VARCHAR(50) NOT NULL,
  `Senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_usuario`));


-- -----------------------------------------------------
-- Table `Hospedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hospedes` (
  `ID_Hospede` INT NOT NULL AUTO_INCREMENT,
  `Nome_Hospede` VARCHAR(45) NOT NULL,
  `sobrenome_hospede` VARCHAR(45) NOT NULL,
  `nascimento_hospede` DATE NOT NULL,
  `telefone_hospede` CHAR(14) NOT NULL,
  `email_hospede` VARCHAR(255) NOT NULL,
  `FK_ID_usuario` INT NOT NULL,
  PRIMARY KEY (`ID_Hospede`, `FK_ID_usuario`),
  CONSTRAINT `fk_Hospedes_Info_Login1`
    FOREIGN KEY (`FK_ID_usuario`)
    REFERENCES `Info_Login` (`ID_usuario`));


-- -----------------------------------------------------
-- Table `Avaliacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Avaliacoes` (
  `ID_Avaliacao` INT NOT NULL AUTO_INCREMENT,
  `Avaliacao` FLOAT NOT NULL,
  `Avaliador` VARCHAR(45) NOT NULL,
  `FK_ID_Hospede` INT NOT NULL,
  PRIMARY KEY (`ID_Avaliacao`, `FK_ID_Hospede`),
  CONSTRAINT `fk_Avaliacoes_Hospedes1`
    FOREIGN KEY (`FK_ID_Hospede`)
    REFERENCES `Hospedes` (`ID_Hospede`));


-- -----------------------------------------------------
-- Table `Espacos_Reservados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Espacos_Reservados` (
  `ID_Espaco_reservado` INT NOT NULL AUTO_INCREMENT,
  `Ocupante_Espaco` INT NOT NULL,
  `Check_In` DATE NOT NULL,
  `Check_Out` DATE NOT NULL,
  `FK_ID_Hospede` INT NOT NULL,
  `Hotel_ID_Endereco` INT NOT NULL,
  PRIMARY KEY (`ID_Espaco_reservado`, `FK_ID_Hospede`, `Hotel_ID_Endereco`),
  CONSTRAINT `fk_Quartos_Reservados_Hospedes1`
    FOREIGN KEY (`FK_ID_Hospede`)
    REFERENCES `Hospedes` (`ID_Hospede`)
    
    ,
  CONSTRAINT `fk_Espacos_Reservados_Hotel1`
    FOREIGN KEY (`Hotel_ID_Endereco`)
    REFERENCES `Hotel` (`ID_Hotel`));


-- -----------------------------------------------------
-- Table `Quartos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Quartos` (
  `ID_Quarto` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Quarto` VARCHAR(45) NOT NULL,
  `Preco_Diaria` FLOAT NOT NULL,
  `Dispo_Quarto` TINYINT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Cap_max` INT NOT NULL,
  `FK_ID_Espaco_reservado` INT NOT NULL,
  PRIMARY KEY (`ID_Quarto`, `FK_ID_Espaco_reservado`),
  CONSTRAINT `fk_Quartos_Espacos_Reservados1`
    FOREIGN KEY (`FK_ID_Espaco_reservado`)
    REFERENCES `Espacos_Reservados` (`ID_Espaco_reservado`));


-- -----------------------------------------------------
-- Table `Servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servicos` (
  `ID_Servico` INT NOT NULL,
  `Nome_Servico` VARCHAR(45) NOT NULL,
  `Preco_Servico` FLOAT NOT NULL,
  `Pag_Efetuado` TINYINT NOT NULL,
  PRIMARY KEY (`ID_Servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Servicos_Consumidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Servicos_Consumidos` (
  `ID_Servico_Consumido` INT NOT NULL,
  `FK_Hospedes_ID` INT NOT NULL,
  `FK_Servicos_ID` INT NOT NULL,
  `FK_ID_Hotel` INT NOT NULL,
  PRIMARY KEY (`ID_Servico_Consumido`, `FK_Hospedes_ID`, `FK_Servicos_ID`, `FK_ID_Hotel`),
  CONSTRAINT `fk_Servicos_Consumidos_Hospedes1`
    FOREIGN KEY (`FK_Hospedes_ID`)
    REFERENCES `Hospedes` (`ID_Hospede`),
  CONSTRAINT `fk_Servicos_Consumidos_Servicos1`
    FOREIGN KEY (`FK_Servicos_ID`)
    REFERENCES `Servicos` (`ID_Servico`));


-- -----------------------------------------------------
-- Table `Computadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Computadores` (
  `ID_PC` INT NOT NULL,
  `Num_PC` INT NOT NULL,
  `Temp_Alugado` INT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FK_ID_Espaco_reservado` INT NOT NULL,
  PRIMARY KEY (`ID_PC`, `FK_ID_Espaco_reservado`),
  CONSTRAINT `fk_Computadores_Espacos_Reservados1`
    FOREIGN KEY (`FK_ID_Espaco_reservado`)
    REFERENCES `Espacos_Reservados` (`ID_Espaco_reservado`));


-- -----------------------------------------------------
-- Table `Sala_Reunioes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sala_Reunioes` (
  `ID_Sala` INT NOT NULL,
  `Disp_Sala` TINYINT NOT NULL,
  `Temp_Alugado` INT NOT NULL,
  `Cap_Max` INT NOT NULL,
  `FK_ID_Espaco_reservado` INT NOT NULL,
  PRIMARY KEY (`ID_Sala`, `FK_ID_Espaco_reservado`),
  CONSTRAINT `fk_Sala_Reunioes_Espacos_Reservados1`
    FOREIGN KEY (`FK_ID_Espaco_reservado`)
    REFERENCES `Espacos_Reservados` (`ID_Espaco_reservado`));


insert into Info_Login (ID_usuario, Login, Senha) values (1, 'Allayne', 'kR1&)\g*_9"');
insert into Info_Login (ID_usuario, Login, Senha) values (2, 'Remus', 'aI7_|Z{&sml+_Fv');
insert into Info_Login (ID_usuario, Login, Senha) values (3, 'Shanie', 'gR0?x#|in(34');
insert into Info_Login (ID_usuario, Login, Senha) values (4, 'Rica', 'dF7=O_2YpJ');
insert into Info_Login (ID_usuario, Login, Senha) values (5, 'Keary', 'aK4"Vql`j');
insert into Info_Login (ID_usuario, Login, Senha) values (6, 'Curtice', 'qZ4}Lu$Nqu!1Xc');
insert into Info_Login (ID_usuario, Login, Senha) values (7, 'Siobhan', 'tX5>Tl{_cd&Nc0eg');
insert into Info_Login (ID_usuario, Login, Senha) values (8, 'Phedra', 'dC4&i4Q5||1Kp');
insert into Info_Login (ID_usuario, Login, Senha) values (9, 'Timmie', 'zS2~3EH~6z');
insert into Info_Login (ID_usuario, Login, Senha) values (10, 'Cornela', 'zM1@2_/Z7&');
insert into Info_Login (ID_usuario, Login, Senha) values (11, 'Casar', 'jK6/YPcGe9');
insert into Info_Login (ID_usuario, Login, Senha) values (12, 'Radcliffe', 'lZ8=F4`C36');
insert into Info_Login (ID_usuario, Login, Senha) values (13, 'Christoffer', 'rL8={A)g28bz0''');
insert into Info_Login (ID_usuario, Login, Senha) values (14, 'Olenka', 'vR9\wMo6e6');
insert into Info_Login (ID_usuario, Login, Senha) values (15, 'Ajay', 'hS4|x%jgY(t''e9');
insert into Info_Login (ID_usuario, Login, Senha) values (16, 'Brier', 'rA1&B''HgF`6');
insert into Info_Login (ID_usuario, Login, Senha) values (17, 'Fionnula', 'eM3~8_7gn(');
insert into Info_Login (ID_usuario, Login, Senha) values (18, 'Tremaine', 'lY5=''C2M&Sj!+Y6J');
insert into Info_Login (ID_usuario, Login, Senha) values (19, 'Latrina', 'pY6~@Ll%B,#7(/~f');
insert into Info_Login (ID_usuario, Login, Senha) values (20, 'Hadley', 'mY0#rEz#hoLV$A');

