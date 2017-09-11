-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Xerado en: 16 de Mar de 2015 ás 01:42
-- Versión do servidor: 5.6.21
-- Versión do PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `captcha`
--

-- --------------------------------------------------------

--
-- Estrutura da táboa `idiomas`
--

CREATE TABLE IF NOT EXISTS `idiomas` (
`idIdioma` tinyint(3) NOT NULL,
  `idioma` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `tituloInstrucion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `textoInstrucion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `renovar` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `enviar` varchar(12) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- A extraer os datos da táboa `idiomas`
--

INSERT INTO `idiomas` (`idIdioma`, `idioma`, `tituloInstrucion`, `textoInstrucion`, `renovar`, `enviar`) VALUES
(1, 'galego', 'Instrucións', 'Para poder acceder debes colocar a imaxe correspondente na zona requirida', 'Renovar', 'Enviar'),
(2, 'castellano', 'Instrucciones', 'Para poder acceder debes colocar la imagen correspondiente en la zona requerida', 'Renovar', 'Enviar'),
(3, 'english', 'Instructions', 'To qualify you must place the corresponding image in the required area', 'Renew', 'Send');

-- --------------------------------------------------------

--
-- Estrutura da táboa `traducions`
--

CREATE TABLE IF NOT EXISTS `traducions` (
`idTraducion` tinyint(2) NOT NULL,
  `galego` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `castellano` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `english` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `solucion` tinyint(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- A extraer os datos da táboa `traducions`
--

INSERT INTO `traducions` (`idTraducion`, `galego`, `castellano`, `english`, `solucion`) VALUES
(1, 'abella', 'abeja', 'bee', 4),
(2, 'cabalo', 'caballo', 'horse', 7),
(3, 'camaleón', 'camaleón', 'chamaleon', 1),
(4, 'caracol', 'caracol', 'snail', 12),
(5, 'cempés', 'ciempiés', 'centipede', 100),
(6, 'galiña', 'gallina', 'hen', 15),
(7, 'peixe', 'pez', 'fish', 5),
(8, 'pitiño', 'pollito', 'chicken', 123),
(9, 'porco', 'cerdo', 'pig', 6),
(10, 'raposo', 'zorro', 'fox', 10),
(11, 'tartaruga', 'tortuga', 'turtle', 99),
(12, 'vaca', 'vaca', 'cow', 66);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `idiomas`
--
ALTER TABLE `idiomas`
 ADD PRIMARY KEY (`idIdioma`);

--
-- Indexes for table `traducions`
--
ALTER TABLE `traducions`
 ADD PRIMARY KEY (`idTraducion`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `idiomas`
--
ALTER TABLE `idiomas`
MODIFY `idIdioma` tinyint(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `traducions`
--
ALTER TABLE `traducions`
MODIFY `idTraducion` tinyint(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
