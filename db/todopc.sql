-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2016 at 12:45 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todopc`
--

-- --------------------------------------------------------

--
-- Table structure for table `accion`
--

CREATE TABLE `accion` (
  `id_accion` int(11) NOT NULL,
  `accion` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accion`
--

INSERT INTO `accion` (`id_accion`, `accion`, `nombre`) VALUES
(1, 'home', 'Ver lista de componentes'),
(2, 'mostrar_componente', 'Ver un componente'),
(3, 'mostrar_componentes', 'Ver administración de componen'),
(4, 'eliminar_componente', 'Eliminación de componentes'),
(5, 'agregar_componente', 'Adición de componentes'),
(6, 'editar_componente', 'Edición de componentes'),
(7, 'filtrar_categoria', 'Filtro de categorías'),
(8, 'mostrar_categorias', 'Ver administración de categorí'),
(9, 'eliminar_categoria', 'Eliminación de categorías'),
(10, 'agregar_categoria', 'Adición de categorías'),
(11, 'mostrar_formulario_consulta', 'Ver formulario de consultas'),
(12, 'agregar_consulta', 'Envío de consultas'),
(13, 'mostrar_consultas', 'Ver listado de consultas recib'),
(14, 'eliminar_consulta', 'Eliminación de consultas'),
(15, 'editar_categoria', 'Edición de categorias');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria`
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
-- Table structure for table `componente`
--

CREATE TABLE `componente` (
  `id_componente` int(11) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `destacado` tinyint(1) NOT NULL DEFAULT '0',
  `fk_id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `componente`
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
(22, 'Razer Mamba Chromah', 0, 5),
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
-- Table structure for table `consulta`
--

CREATE TABLE `consulta` (
  `id_consulta` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `consulta` text NOT NULL,
  `notificacion` tinyint(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `nombre`, `mail`, `consulta`, `notificacion`, `fecha`) VALUES
(2, 'Ezequiel ', 'ezfs@gmail.com', 'Hola, si, muy, buena, la pág. Gracias!', 1, '2016-09-29 01:05:02'),
(3, 'Juan', 'pacopedro@delamar.es', 'Mi nombre así, y cuando yo \r\nme voy, me dicen al pasar,\r\nJuan paco pedro de la mar\r\nlalalalalaa..', 0, '2016-09-29 01:08:59'),
(5, 'Fiona', 'Fionas@mail.com', 'Acá estámos con Shrek viendo su página, muy buena, muchas gracias!', 1, '2016-09-29 02:52:50'),
(6, 'Sean', 'elmaildeSean@gmail.com', 'Muy buenos productos, entro todos los días a su página para chequear las novedades! Es genial!', 0, '2016-11-11 13:23:38');

-- --------------------------------------------------------

--
-- Table structure for table `imagen`
--

CREATE TABLE `imagen` (
  `id_imagen` int(11) NOT NULL,
  `ruta` varchar(120) NOT NULL,
  `fk_id_componente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `imagen`
--

INSERT INTO `imagen` (`id_imagen`, `ruta`, `fk_id_componente`) VALUES
(6, 'images/580573c8876ac_1.png', 1),
(7, 'images/580573c8882ee_1.png', 1),
(8, 'images/580573c888d60_1.png', 1),
(9, 'images/580573d9d5c76_5.png', 5),
(10, 'images/580573d9d6962_5.png', 5),
(11, 'images/580575340b088_3.png', 3),
(12, 'images/580575340baae_3.png', 3),
(13, 'images/580575d7366ec_30.png', 30),
(15, 'images/58057741edb6d_17.png', 17);

-- --------------------------------------------------------

--
-- Table structure for table `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `fk_id_accion` varchar(35) NOT NULL,
  `fk_id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `fk_id_accion`, `fk_id_rol`) VALUES
(1, '3', 3),
(2, '4', 3),
(3, '5', 3),
(4, '6', 3),
(5, '8', 3),
(6, '9', 3),
(7, '10', 3),
(8, '15', 3),
(9, '13', 3),
(10, '12', 3),
(14, '3', 4),
(15, '4', 4),
(16, '5', 4),
(17, '6', 4),
(18, '8', 4),
(19, '9', 4),
(20, '10', 4),
(21, '13', 4),
(22, '14', 4),
(23, '15', 4),
(24, '3', 2),
(25, '4', 2),
(26, '5', 2),
(27, '6', 2),
(31, '9', 2),
(32, '10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Moderador'),
(3, 'Normal'),
(4, 'Visitante');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fk_id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `password`, `fk_id_rol`) VALUES
(1, 'axelbau24', 'axelbau24@gmail.com', '$2y$10$8dzhZh6LfY4sOca3oLHps.8YvA0AV3JM3/pchM9IWrnEMpBrr4nbC', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id_accion`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_categoria` (`fk_id_categoria`);

--
-- Indexes for table `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indexes for table `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `imagen_ibfk_1` (`fk_id_componente`);

--
-- Indexes for table `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accion`
--
ALTER TABLE `accion`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `componente`
--
ALTER TABLE `componente`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `componente`
--
ALTER TABLE `componente`
  ADD CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`fk_id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE;

--
-- Constraints for table `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`fk_id_componente`) REFERENCES `componente` (`id_componente`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
