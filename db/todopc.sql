-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-09-2016 a las 18:28:18
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `todopc`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Motherboards'),
(2, 'Tarjetas Gráficas'),
(3, 'Almacenamiento'),
(4, 'Procesadores'),
(5, 'Entrada'),
(6, 'Salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componente`
--

CREATE TABLE `componente` (
  `id_componente` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `destacado` tinyint(1) NOT NULL DEFAULT '0',
  `fk_id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `componente`
--

INSERT INTO `componente` (`id_componente`, `nombre`, `destacado`, `fk_id_categoria`) VALUES
(1, 'ASUS X99-DELUXE II', 1, 1),
(2, 'ASRock N68-GS4 FX', 0, 1),
(3, 'Samsung 850 EVO', 1, 3),
(4, 'AMD Radeon RX 480', 0, 2),
(5, 'NVIDIA GeForce GTX 1080', 1, 2),
(6, 'MSI Z170A M6', 1, 1),
(7, 'ASUS Q87M-E', 0, 1),
(8, 'GIGABYTE Z170', 0, 1),
(9, 'AMD Radeon R7 360', 0, 2),
(10, 'NVIDIA GeForce GTX 950', 0, 2),
(11, 'NVIDIA Titan X', 1, 2),
(12, 'Seagate Barracuda', 0, 3),
(13, 'WD Caviar Black', 0, 3),
(14, 'Kingston SSDNow V300', 0, 3),
(15, 'WD Caviar Green', 0, 3),
(16, 'Intel Core i7-4930K', 0, 4),
(17, 'Intel Core i7-6950X', 1, 4),
(18, 'AMD FX-8350', 0, 4),
(19, 'Intel Core i7-6700K', 1, 4),
(20, 'AMD FX-8320', 0, 4),
(21, 'Logitech G900 Chaos Spectrum', 0, 5),
(22, 'Razer Mamba Chroma', 0, 5),
(23, 'SteelSeries Sensei', 0, 5),
(24, 'Corsair K95 RGB', 1, 5),
(25, 'Razer BlackWidow', 0, 5),
(26, 'Acer Predator X34', 0, 6),
(27, 'ASUS PG279Q', 1, 6),
(28, 'BenQ XL2420G', 0, 6),
(29, 'SteelSeries Siberia 350', 1, 6),
(30, 'Creative Sound BlasterX H7', 1, 6),
(31, 'Audio-Technica ATH-ADG1X', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(11) NOT NULL,
  `ruta` varchar(120) NOT NULL,
  `fk_id_componente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id_imagen`, `ruta`, `fk_id_componente`) VALUES
(1, 'images/57e5e19615eba_1_1.png', 1),
(2, 'images/57e5e1af2d082_2_1.png', 1),
(3, 'images/57e5e1bb0e48a_3_1.png', 1),
(4, 'images/57e5e38ad00f6_4_5.png', 5),
(5, 'images/57e5e3461561c_5_5.png', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_categoria` (`fk_id_categoria`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `componente`
--
ALTER TABLE `componente`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
