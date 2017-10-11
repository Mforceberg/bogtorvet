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
  pris NUMERIC(6) NOT NULL,
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
('Lars Løkke', 'Sverige');

INSERT INTO `bog` (`titel`,`sprog`,`sider`,`forlag`,`boghandel`,`bind`,`indbinding`,`tilstand`,`pris`, `udgivelsesaar`) VALUES
('Mordet på orientexpressen', 'Soumi', '1042', 'Gyldendal', 'Bog & idé', '2', 'Hardback', 'Fin', '125', '1832'),
('Lars: en morders bekændelser', 'Tysk', '10', 'Politikens Forlag', 'Bog & idé', '1', 'Paperback', 'Grim', '820', '2017');

INSERT INTO `forfatterbog` (`forfatterid`, `bogid`) VALUES
(1,1),
(2,2),
(2,1);