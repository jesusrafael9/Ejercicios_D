-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-03-2017 a las 03:17:37
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id_equipos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id_equipos`, `nombre`) VALUES
(1, 'San Lorenzo'),
(2, 'Boca Juniors'),
(3, 'Chacarita'),
(4, 'RiverPlate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id_jugadores` int(11) NOT NULL,
  `fk_equipos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id_jugadores`, `fk_equipos`, `nombre`, `fecha_nacimiento`) VALUES
(1, 1, '	DEVECCHI, JOSE ANTONIO', '1995-07-09 00:00:00'),
(2, 1, 'ANGELLERI, MARCOS ALBERTO', '1983-07-04 00:00:00'),
(3, 1, 'CARUZZO, MATIAS NICOLAS', '1984-08-15 00:00:00'),
(4, 1, 'COLOCCINI, FABRICIO', '1982-01-22 00:00:00'),
(5, 1, 'CORUJO, MATHIAS', '1986-05-08 00:00:00'),
(6, 1, 'BELLUSCHI, FERNANDO DANIEL', '1983-09-10 00:00:00'),
(7, 1, 'BOTTA, RUBEN ALEJANDRO', '1990-01-31 00:00:00'),
(8, 1, 'COSTA, ALBERTO FACUNDO', '1985-09-01 00:00:00'),
(9, 1, 'MERCIER, JUAN IGNACIO', '1980-02-02 00:00:00'),
(10, 1, 'BERGESSIO, GONZALO RUBEN', '1987-05-04 00:00:00'),
(11, 1, 'BLANDI, NICOLAS', '1990-01-31 00:00:00'),
(12, 3, '	FERNANDEZ, PEDRO NAHUEL', '1987-04-05 00:00:00'),
(13, 3, 'IBAÑEZ, JOAQUIN', '1995-07-18 00:00:00'),
(14, 3, 'PEDROSA, GONZALO JESUS', '1994-01-12 00:00:00'),
(15, 3, 'RE, GERMAN DAVID', '1981-11-02 00:00:00'),
(16, 3, 'ROSSO, FEDERICO GUILLERMO', '1987-07-01 00:00:00'),
(17, 3, 'AGUILAR, GERARDO', '1990-03-29 00:00:00'),
(18, 3, 'IBAÑEZ, DANIEL', '1995-03-29 00:00:00'),
(19, 3, '	MANSO, DAMIAN ALEJANDRO', '1979-06-06 00:00:00'),
(20, 3, 'ALDERETE, ELIAS', '1995-07-30 00:00:00'),
(21, 3, 'BARRERA, LEANDRO IVAN', '1991-02-22 00:00:00'),
(22, 3, 'CASA, MAXIMILIANO', '1993-02-18 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id_partidos` int(11) NOT NULL,
  `fk_equipo_local` int(11) NOT NULL,
  `fk_equipo_visitante` int(11) NOT NULL,
  `goles_local` int(11) NOT NULL,
  `goles_visitante` int(11) NOT NULL,
  `fecha_partido` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id_partidos`, `fk_equipo_local`, `fk_equipo_visitante`, `goles_local`, `goles_visitante`, `fecha_partido`) VALUES
(1, 1, 3, 3, 8, '2016-01-01 00:00:00'),
(2, 2, 1, 3, 4, '2016-02-12 00:00:00'),
(3, 1, 2, 2, 1, '2017-01-12 00:00:00'),
(4, 3, 2, 4, 1, '2017-02-12 00:00:00'),
(5, 3, 1, 3, 2, '2017-03-12 00:00:00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id_equipos`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id_jugadores`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id_partidos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id_equipos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id_jugadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id_partidos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
