CREATE TABLE forfatter
(
  forfatterid INT NOT NULL AUTO_INCREMENT, 
  forfatternavn VARCHAR(60) NOT NULL,
  land VARCHAR(60) NOT NULL,
  PRIMARY KEY (forfatterid)
);

CREATE TABLE bog
(
  bogid INT NOT NULL AUTO_INCREMENT,
  titel VARCHAR(60) NOT NULL,
  sprog VARCHAR(60) NOT NULL,
  sider INT NOT NULL,
  forlag VARCHAR(60) NOT NULL,
  boghandel VARCHAR(60) NOT NULL,
  bind INT NOT NULL,
  indbinding VARCHAR(60) NOT NULL,
  tilstand VARCHAR(60) NOT NULL,
  pris FLOAT NOT NULL,
  udgivelsesaar INT NOT NULL,
  PRIMARY KEY (bogid)
);

CREATE TABLE forfatterbog
(
  forfatterid INT NOT NULL,
  bogid INT NOT NULL,
  FOREIGN KEY (forfatterid) REFERENCES forfatter(forfatterid),
  FOREIGN KEY (bogid) REFERENCES bog(bogid)
);

INSERT INTO `forfatter` (`forfatternavn`, `land`) VALUES 
('Morten Frost', 'Danmark'),
('Lars Løkke', 'Sverige'),
('J.K. Rowling', 'England'),
('George Orwell', 'USA'),
('Dan Brown', 'USA'),
('William Golding', 'England'),
('Byron Bernstien', 'Israel'),
('Thomas Chance Morris', 'Japan'),
('Karen Blixen', 'Danmark');


INSERT INTO `bog` (`titel`,`sprog`,`sider`,`forlag`,`boghandel`,`bind`,`indbinding`,`tilstand`,`pris`, `udgivelsesaar`) VALUES
('Mordet på orientexpressen', 'Soumi', '1042', 'Gyldendal', 'Bog & idé', '2', 'Hardback', 'Fin', '125', '1832'),
('Lars: en morders bekændelser', 'Tysk', '10', 'Politikens Forlag', 'Bog & idé', '1', 'Paperback', 'Grim', '819.95', '2017'),
('Animal Farm', 'Engelsk', '120', 'Gyldendal', 'Arnold Busck', '1', 'Paperback', 'Fin', '99.50', '1960'),
('Harry Potter - Og de vise sten', 'Dansk', '342', 'Gyldendal', 'SAXO', '2', 'Hardback', 'Ny', '250', '1999'),
('Life of Brian', 'Engelsk', '541', 'Gyldendal', 'Bog & idé', '1', 'Paperback', 'Slidt', '199.95', '1975'),
('Engle og Dæmoner', 'Engelsk', '999', 'Gyldendal', 'Bog & idé', '3', 'Hardback', 'Slidt', '100', '2000'),
('Da Vinci Mysteriet', 'Dansk', '874', 'Gyldendal', 'Bog & idé', '1', 'Hardback', 'Fin', '200', '1998'),
('Den Afrikanske Farm', 'Dansk', '230', 'Politikens Forlag', 'Arnold Busck', '4', 'Paperback', 'Fin', '199', '1937'),
('Fluernes Herre', 'Tysk', '312', 'Gyldendal', 'Bog & idé', '3', 'Hardback', 'Fin', '299.50', '1956'),
('Livestreaming Tokyo', 'Japansk', '189', 'Forlaget Carlsen', 'SAXO', '1', 'Hardback', 'Fin', '49.95', '2017');

INSERT INTO `forfatterbog` (`forfatterid`, `bogid`) VALUES
(1,1),
(2,2),
(2,1),
(6, 10),
(6, 2),
(3, 4),
(4, 3),
(7, 5),
(5, 6),
(5, 7),
(9, 8),
(8, 10),
(7, 10);