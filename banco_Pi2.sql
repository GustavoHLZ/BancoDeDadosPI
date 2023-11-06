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

insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0101,'Horton', 'Tomeo', '6/4/2023', '652-234-8658', 'htomeo0@desdev.cn', 1);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0202,'Barrett', 'Sinnott', '6/3/2023', '323-886-5627', 'bsinnott1@parallels.com', 2);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0303,'Antonius', 'Laughren', '2/27/2023', '163-243-3761', 'alaughren2@bloglines.com', 3);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0404,'Denise', 'Harower', '11/12/2022', '576-653-6087', 'dharower3@earthlink.net', 4);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0505,'Aguste', 'Bartak', '10/29/2023', '617-763-4740', 'abartak4@bandcamp.com', 5);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0606,'Cory', 'Knappitt', '3/31/2023', '384-434-2427', 'cknappitt5@sitemeter.com', 6);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0707,'Brianna', 'Richardsson', '8/17/2023', '962-264-8449', 'brichardsson6@virginia.edu', 7);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0808 ,'Amalle', 'Doble', '1/19/2023', '538-976-7385', 'adoble7@usda.gov', 8);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (0909,'Kurtis', 'Weyland', '7/29/2023', '917-298-6750', 'kweyland8@fc2.com', 9);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1010,'Dunstan', 'Marchi', '4/4/2023', '498-498-5794', 'dmarchi9@dot.gov', 10);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1111,'Pernell', 'Duck', '10/15/2023', '884-974-1427', 'pducka@xrea.com', 11);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1212,'Lydon', 'Shrigley', '11/1/2023', '552-156-9895', 'lshrigleyb@prweb.com', 12);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1313,'Gayler', 'Simonich', '4/3/2023', '322-186-7311', 'gsimonichc@jiathis.com', 13);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1414,'Park', 'Minghella', '10/17/2023', '386-930-9255', 'pminghellad@tamu.edu', 14);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1515 ,'Barton', 'Eddie', '1/29/2023', '716-568-3027', 'beddiee@deliciousdays.com', 15);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1616,'Nicky', 'Hame', '4/28/2023', '316-792-9614', 'nhamef@blogtalkradio.com', 16);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1717 ,'Tiffany', 'Bilfoot', '6/2/2023', '700-510-4923', 'tbilfootg@sakura.ne.jp', 17);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1818 ,'Lisle', 'Hutcheon', '2/28/2023', '134-834-3267', 'lhutcheonh@netvibes.com', 18);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (1919,'Kylynn', 'Bicknell', '3/8/2023', '583-881-0023', 'kbicknelli@ucsd.edu', 19);
insert into Hospedes (ID_Hospede,Nome_Hospede, sobrenome_hospede, nascimento_hospede, telefone_hospede, email_hospede, fk_id_usuario) values (2020,'Land', 'McKea', '6/1/2023', '686-127-3017', 'lmckeaj@xrea.com', 20);

insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Jessi', 'Johnson City', 'United States', 'Tennessee');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Wilt', 'Lubbock', 'United States', 'Texas');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Briney', 'Boca Raton', 'United States', 'Florida');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Orran', 'Bakersfield', 'United States', 'California');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Wren', 'Santa Ana', 'United States', 'California');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Eugenio', 'Las Vegas', 'United States', 'Nevada');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Elisabetta', 'Indianapolis', 'United States', 'Indiana');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Lancelot', 'White Plains', 'United States', 'New York');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Luther', 'Anchorage', 'United States', 'Alaska');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Fedora', 'Atlanta', 'United States', 'Georgia');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Sharron', 'Houston', 'United States', 'Texas');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Gawen', 'Fort Lauderdale', 'United States', 'Florida');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('King', 'Nashville', 'United States', 'Tennessee');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Annadiane', 'Santa Rosa', 'United States', 'California');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Sharon', 'Houston', 'United States', 'Texas');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Danna', 'New Haven', 'United States', 'Connecticut');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Maryanna', 'Fort Lauderdale', 'United States', 'Florida');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Marji', 'Tallahassee', 'United States', 'Florida');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Halley', 'Seattle', 'United States', 'Washington');
insert into Hotel (Nome_Hotel, Cidade_Hotel, Pais_Hotel, Estado_Hotel) values ('Corrie', 'Dallas', 'United States', 'Texas');
