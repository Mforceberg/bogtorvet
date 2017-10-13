-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 13. 10 2017 kl. 15:05:53
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bogtorvetdb`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `bog`
--

CREATE TABLE `bog` (
  `bogid` int(11) NOT NULL,
  `titel` varchar(60) NOT NULL,
  `sprog` varchar(60) NOT NULL,
  `sider` int(11) NOT NULL,
  `forlag` varchar(60) NOT NULL,
  `boghandel` varchar(60) NOT NULL,
  `bind` int(11) NOT NULL,
  `indbinding` varchar(60) NOT NULL,
  `tilstand` varchar(60) NOT NULL,
  `pris` float NOT NULL,
  `udgivelsesaar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `bog`
--

INSERT INTO `bog` (`bogid`, `titel`, `sprog`, `sider`, `forlag`, `boghandel`, `bind`, `indbinding`, `tilstand`, `pris`, `udgivelsesaar`) VALUES
(1, 'Mordet på orientexpressen', 'dansk', 1042, 'Gyldendal', 'Bog & idé', 2, 'Hardback', 'Fin', 125, 1832),
(2, 'Lars: en morders bekændelser', 'Tysk', 10, 'Politikens Forlag', 'Bog & idé', 1, 'Paperback', 'Grim', 819.95, 2017),
(3, 'Animal Farm', 'Engelsk', 120, 'Gyldendal', 'Arnold Busck', 1, 'Paperback', 'Fin', 99.5, 1960),
(4, 'Harry Potter - Og de vise sten', 'Dansk', 342, 'Gyldendal', 'SAXO', 2, 'Hardback', 'Ny', 250, 1999),
(5, 'Life of Brian', 'Engelsk', 541, 'Gyldendal', 'Bog & idé', 1, 'Paperback', 'Slidt', 199.95, 1975),
(6, 'Engle og Dæmoner', 'Engelsk', 999, 'Gyldendal', 'Bog & idé', 3, 'Hardback', 'Slidt', 100, 2000),
(7, 'Da Vinci Mysteriet', 'Dansk', 874, 'Gyldendal', 'Bog & idé', 1, 'Hardback', 'Fin', 200, 1998),
(8, 'Den Afrikanske Farm', 'Dansk', 230, 'Politikens Forlag', 'Arnold Busck', 4, 'Paperback', 'Fin', 199, 1937),
(9, 'Fluernes Herre', 'Tysk', 312, 'Gyldendal', 'Bog & idé', 3, 'Hardback', 'Fin', 299.5, 1956);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `forfatter`
--

CREATE TABLE `forfatter` (
  `forfatterid` int(11) NOT NULL,
  `forfatternavn` varchar(60) NOT NULL,
  `land` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `forfatter`
--

INSERT INTO `forfatter` (`forfatterid`, `forfatternavn`, `land`) VALUES
(1, 'Morten Frost', 'Danmark'),
(2, 'Lars Løkke', 'Sverige'),
(3, 'J.K. Rowling', 'England'),
(4, 'George Orwell', 'USA'),
(5, 'Dan Brown', 'USA'),
(6, 'William Golding', 'England'),
(7, 'Byron Bernstien', 'Israel'),
(8, 'Thomas Chance Morris', 'Japan'),
(9, 'Karen Blixen', 'Danmark');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `forfatterbog`
--

CREATE TABLE `forfatterbog` (
  `forfatterid` int(11) NOT NULL,
  `bogid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `forfatterbog`
--

INSERT INTO `forfatterbog` (`forfatterid`, `bogid`) VALUES
(1, 1),
(2, 2),
(2, 1),
(6, 2),
(3, 4),
(4, 3),
(7, 5),
(5, 6),
(5, 7),
(9, 8);

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `bog`
--
ALTER TABLE `bog`
  ADD PRIMARY KEY (`bogid`);

--
-- Indeks for tabel `forfatter`
--
ALTER TABLE `forfatter`
  ADD PRIMARY KEY (`forfatterid`);

--
-- Indeks for tabel `forfatterbog`
--
ALTER TABLE `forfatterbog`
  ADD KEY `forfatterid` (`forfatterid`),
  ADD KEY `bogid` (`bogid`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `bog`
--
ALTER TABLE `bog`
  MODIFY `bogid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Tilføj AUTO_INCREMENT i tabel `forfatter`
--
ALTER TABLE `forfatter`
  MODIFY `forfatterid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `forfatterbog`
--
ALTER TABLE `forfatterbog`
  ADD CONSTRAINT `forfatterbog_ibfk_1` FOREIGN KEY (`forfatterid`) REFERENCES `forfatter` (`forfatterid`),
  ADD CONSTRAINT `forfatterbog_ibfk_2` FOREIGN KEY (`bogid`) REFERENCES `bog` (`bogid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
