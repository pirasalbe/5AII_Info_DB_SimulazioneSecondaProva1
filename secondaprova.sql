-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2017 at 10:55 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `secondaprova`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `codCat` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `centro`
--

CREATE TABLE `centro` (
  `codCen` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `citta` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `cf` varchar(20) NOT NULL,
  `nome` int(11) NOT NULL,
  `cognome` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `risorse`
--

CREATE TABLE `risorse` (
  `num` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `disponibile` enum('si','no') NOT NULL,
  `tipo` enum('sw','hw') NOT NULL,
  `codCat` int(11) NOT NULL,
  `codCen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `storico`
--

CREATE TABLE `storico` (
  `cod` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `cf` varchar(20) NOT NULL,
  `dataPrestito` date NOT NULL,
  `dataRestituzione` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `utente`
--

CREATE TABLE `utente` (
  `cf` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codCat`);

--
-- Indexes for table `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`codCen`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`cf`);

--
-- Indexes for table `risorse`
--
ALTER TABLE `risorse`
  ADD PRIMARY KEY (`num`),
  ADD UNIQUE KEY `num` (`num`,`codCat`,`codCen`),
  ADD KEY `codCat` (`codCat`),
  ADD KEY `codCen` (`codCen`);

--
-- Indexes for table `storico`
--
ALTER TABLE `storico`
  ADD PRIMARY KEY (`cod`),
  ADD UNIQUE KEY `cod` (`cod`,`num`,`cf`),
  ADD KEY `num` (`num`),
  ADD KEY `cf` (`cf`);

--
-- Indexes for table `utente`
--
ALTER TABLE `utente`
  ADD PRIMARY KEY (`cf`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codCat` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `centro`
--
ALTER TABLE `centro`
  MODIFY `codCen` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `risorse`
--
ALTER TABLE `risorse`
  MODIFY `num` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `storico`
--
ALTER TABLE `storico`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `risorse`
--
ALTER TABLE `risorse`
  ADD CONSTRAINT `risorse_ibfk_1` FOREIGN KEY (`codCat`) REFERENCES `categoria` (`codCat`),
  ADD CONSTRAINT `risorse_ibfk_2` FOREIGN KEY (`codCen`) REFERENCES `centro` (`codCen`);

--
-- Constraints for table `storico`
--
ALTER TABLE `storico`
  ADD CONSTRAINT `storico_ibfk_1` FOREIGN KEY (`num`) REFERENCES `risorse` (`num`),
  ADD CONSTRAINT `storico_ibfk_2` FOREIGN KEY (`cf`) REFERENCES `persona` (`cf`);

--
-- Constraints for table `utente`
--
ALTER TABLE `utente`
  ADD CONSTRAINT `utente_ibfk_1` FOREIGN KEY (`cf`) REFERENCES `persona` (`cf`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
