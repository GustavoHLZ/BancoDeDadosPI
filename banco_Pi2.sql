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

insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (101, true, 149.99, 'Frigobar1');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (102, true, 249.99, 'Frigobar2');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (103, false, 399.99, 'Frigobar3');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (104, true, 29.99, 'Reposição1');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (105, false, 59.99, 'Reposição2');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (106, false, 99.99, 'Reposição3');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (107, true, 34.99, 'Café da manhã');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (108, false, 44.99, 'Almoço');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (109, false, 44.99, 'Jantar');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (110, true, 28.99, 'Espumante Salton Brut');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (111, true, 188.99, 'Vinho Villaggio');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (112, false, 39.99, 'Espumante Casa Perini Moscatel');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (113, false, 76.99, 'Whisky Johnnie Walker Red Label');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (114, true, 99.99, 'Whiskey Bourbon Jim Beam White');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (115, false, 17.99, 'Cerveja Belgian Blond Ale');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (116, true, 28.99, 'Cerveja Duvel Belgian Golden Ale');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (117, true, 20.99, 'Cerveja Belgian Dark Strong Ale');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (118, false, 26.80, 'Bloody Mary');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (119, true, 28.60, 'Cuervo Margarita‫');
insert into Servicos (ID_Servico, Pag_Efetuado, Preco_Servico, Nome_Servico) values (120, false, 28.60, 'Negroni');

insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (121, 7.0, 'Horton', 0101);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (122, 2.0, 'Barrett', 0202);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (123, 5.0, 'Antonius', 0303);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (124, 7.0, 'Denise', 0404);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (125, 8.9, 'Aguste', 0505);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (126, 8.8, 'Cory', 0606);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (127, 9.9, 'Brianna', 0707);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (128, 8.6, 'Amalle', 0808);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (129, 10.0, 'Kurtis', 0909);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (130, 10.0, 'Dunstan', 1010);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (131, 1.1, 'Pernell', 1111);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (132, 2.2, 'Lydon', 1212);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (133, 7.7, 'Gayler', 1313);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (134, 8.9, 'Park', 1414);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (135, 8.3, 'Barton', 1515);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (136, 6.0, 'Nicky', 1616);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (137, 7.0, 'Tiffany', 1717);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (138, 7.7, 'Lisle', 1818);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (139, 8.8, 'Kylynn', 1919);
insert into Avaliacoes (ID_Avaliacao, Avaliacao, Avaliador, FK_ID_Hospede) values (140, 10.0, 'Land', 2020);

insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (141, 1, '2023-05-18', '2023-06-18 ', 0101);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (142, 2, '2023-11-03', '2023-12-01 ', 0202);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (143, 1, '2022-12-16', '2023-12-19 ', 0303);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (144, 2, '2023-01-03', '2023-02-07 ', 0404);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (145, 2, '2023-03-15', '2023-03-17 ', 0505);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (146, 2, '2023-05-14', '2023-05-19 ', 0606);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (147, 2, '2023-03-01', '2023-04-09 ', 0707);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (148, 1, '2023-01-14', '2023-02-01 ', 0808);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (149, 3, '2023-01-17', '2023-01-20 ', 0909);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (150, 1, '2023-02-24', '2023-03-01', 1010);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (151, 1, '2023-03-11', '2022-03-17 ', 1111);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (152, 2, '2023-04-15', '2023-04-19', 1212);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (153, 3, '2023-01-16', '2023-01-18 ', 1313);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (154, 2, '2023-05-02', '2023-05-05 ', 1414);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (155, 1, '2022-11-13', '2023-11-16 ', 1515);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (156, 1, '2022-10-01', '2023-10-05 ', 1616);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (157, 2, '2022-09-01', '2023-09-07 ', 1717);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (158, 1, '2023-02-01', '2023-02-04 ', 1818);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (159, 1, '2023-03-02', '2023-03-10 ', 1919);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (160, 2, '2023-02-10', '2023-02-15 ', 2020);

insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (81, '$4099427424.22', false, 1, 141);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (82, '$8174618376.73', true, 2, 142);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (83, '$3440196511.28', true, 3, 143);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (84, '$6803365501.62', true, 4, 144);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (85, '$5808994985.61', false, 3, 145);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (86, '$5706131096.03', false, 3, 146);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (87, '$4867550475.94', false, 2, 147);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (88, '$1088227692.06', false, 2, 148);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (89, '$2388249698.15', true, 3, 149);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (90, '$393493386.23', true, 1, 150);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (91, '$8015993029.39', false, 1, 151);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (92, '$6177861157.81', false, 4, 152);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (93, '$7330932083.33', false, 4, 153);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (94, '$6314751111.59', true, 2, 154);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (95, '$750962244.65', false, 1, 155);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (96, '$529583171.97', false, 1, 156);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (97, '$490544772.94', true, 3, 157);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (98, '$8261645856.87', true, 2, 158);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (99, '$4504021984.02', false, 1, 159);
insert into Quartos (ID_Quarto, Preco_Diaria, Disp_Quarto, Cap_max, FK_ID_Espaco_reservado) values (100, '$7209148493.83', false, 2, 160);

insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (161, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (162, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (163, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (164, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (165, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (166, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (167, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (168, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (169, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (170, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (171, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (172, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (173, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (174, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (175, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (176, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (177, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (178, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (179, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (180, 0, '0000-00-00', '0000-00-00', 0000);

insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (181, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (182, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (183, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (184, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (185, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (186, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (187, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (188, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (189, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (190, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (191, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (192, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (193, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (194, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (195, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (196, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (197, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (198, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (199, 0, '0000-00-00', '0000-00-00', 0000);
insert into Espacos_Reservados (ID_Espaco_reservado, Ocupante_Espaco, Check_In, Check_Out, FK_ID_Hospede) values (200, 0, '0000-00-00', '0000-00-00', 0000);

