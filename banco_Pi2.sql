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
DROP DATABASE IF EXISTS `mydb`;

CREATE DATABASE IF NOT EXISTS `mydb`;
USE `mydb` ;

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
  PRIMARY KEY (`ID_Espaco_reservado`, `FK_ID_Hospede`),
  CONSTRAINT `fk_Quartos_Reservados_Hospedes1`
    FOREIGN KEY (`FK_ID_Hospede`)
    REFERENCES `Hospedes` (`ID_Hospede`));

-- -----------------------------------------------------
-- Table `Quartos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Quartos` (
  `ID_Quarto` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Quarto` VARCHAR(45) NOT NULL,
  `Preco_Diaria` FLOAT NOT NULL,
  `Dispo_Quarto` TINYINT NOT NULL,
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
  PRIMARY KEY (`ID_Servico_Consumido`, `FK_Hospedes_ID`, `FK_Servicos_ID`),
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
  `Temp_Alugado` INT NOT NULL,
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

insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0101,'Horton', 'Tomeo', '1996-04-23', '652-234-8658', 'htomeo0@desdev.cn', 1);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0202,'Barrett', 'Sinnott', '1996-03-06', '323-886-5627', 'bsinnott1@parallels.com', 2);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0303,'Antonius', 'Laughren', '2002-12-09', '163-243-3761', 'alaughren2@bloglines.com', 3);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0404,'Denise', 'Harower', '1990-12-08', '576-653-6087', 'dharower3@earthlink.net', 4);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0505,'Aguste', 'Bartak', '1993-05-29', '617-763-4740', 'abartak4@bandcamp.com', 5);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0606,'Cory', 'Knappitt', '1983-12-07', '384-434-2427', 'cknappitt5@sitemeter.com', 6);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0707,'Brianna', 'Richardsson', '1988-11-06', '962-264-8449', 'brichardsson6@virginia.edu', 7);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0808 ,'Amalle', 'Doble', '1991-09-01', '538-976-7385', 'adoble7@usda.gov', 8);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0909,'Kurtis', 'Weyland', '1987-08-02', '917-298-6750', 'kweyland8@fc2.com', 9);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1010,'Dunstan', 'Marchi', '1994-04-09', '498-498-5794', 'dmarchi9@dot.gov', 10);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1111,'Pernell', 'Duck', '1998-12-03', '884-974-1427', 'pducka@xrea.com', 11);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1212,'Lydon', 'Shrigley', '2011-11-03', '552-156-9895', 'lshrigleyb@prweb.com', 12);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1313,'Gayler', 'Simonich', '2004-03-08', '322-186-7311', 'gsimonichc@jiathis.com', 13);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1414,'Park', 'Minghella', '2010-07-10', '386-930-9255', 'pminghellad@tamu.edu', 14);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1515 ,'Barton', 'Eddie', '1991-07-07', '716-568-3027', 'beddiee@deliciousdays.com', 15);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1616,'Nicky', 'Hame', '1984-01-11', '316-792-9614', 'nhamef@blogtalkradio.com', 16);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1717 ,'Tiffany', 'Bilfoot', '1986-02-06', '700-510-4923', 'tbilfootg@sakura.ne.jp', 17);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1818 ,'Lisle', 'Hutcheon', '1992-09-12', '134-834-3267', 'lhutcheonh@netvibes.com', 18);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1919,'Kylynn', 'Bicknell', '1993-08-11', '583-881-0023', 'kbicknelli@ucsd.edu', 19);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (2020,'Land', 'McKea', '1986-01-12', '686-127-3017', 'lmckeaj@xrea.com', 20);

insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (101, 1, 1, 'Frigobar');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (102, 2, 2, 'Jack Daniels');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (103, 3, 3, 'Shot de Jack');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (104, 4, 4, 'Whiskey Tenessey');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (105, 5, 5, 'Shot Blue Label');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (106, 6, 6, 'Combo de Heineken');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (107, 7, 7, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (108, 8, 8, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (109, 9, 9, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (110, 10, 10, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (111, 11, 11, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (112, 12, 12, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (113, 13, 13, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (114, 14, 14, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (115, 15, 15, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (116, 16, 16, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (117, 17, 17, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (118, 18, 18, '');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (119, 19, 19, '‫');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (120, 20, 20, '');