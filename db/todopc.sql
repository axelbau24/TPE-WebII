-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2016 a las 21:59:32
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

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
-- Estructura de tabla para la tabla `accion`
--

CREATE TABLE `accion` (
  `id_accion` int(11) NOT NULL,
  `accion` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accion`
--

INSERT INTO `accion` (`id_accion`, `accion`, `nombre`) VALUES
(2, 'mostrar_componente', 'Ver un componente'),
(3, 'admin_componentes', 'Ver administración de componen'),
(4, 'eliminar_componente', 'Eliminación de componentes'),
(5, 'agregar_componente', 'Adición de componentes'),
(6, 'editar_componente', 'Edición de componentes'),
(7, 'filtrar_categoria', 'Filtro de categorías'),
(8, 'admin_categorias', 'Ver administración de categorí'),
(9, 'eliminar_categoria', 'Eliminación de categorías'),
(10, 'agregar_categoria', 'Adición de categorías'),
(11, 'mostrar_formulario_consulta', 'Ver formulario de consultas'),
(12, 'agregar_consulta', 'Envío de consultas'),
(13, 'mostrar_consultas', 'Ver listado de consultas recib'),
(14, 'eliminar_consulta', 'Eliminación de consultas'),
(15, 'editar_categoria', 'Edición de categorias'),
(16, 'admin_usuarios', 'Ver administración de usuarios'),
(17, 'eliminar_usuario', 'Eliminar usuarios'),
(18, 'editar_usuario', 'Editar usuarios'),
(19, 'agregar_usuario', 'Agregar usuarios'),
(20, 'update_permisos', 'Editar permisos de rol'),
(21, 'eliminar_rol', 'Eliminar roles'),
(22, 'agregar_rol', 'Agregar roles');

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
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `fk_id_componente` int(11) NOT NULL,
  `fk_id_usuario` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `puntaje` tinyint(1) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `fk_id_componente`, `fk_id_usuario`, `comentario`, `puntaje`, `fecha`) VALUES
(1, 1, 9, 'Esta motherboard esta muy buena!', 4, '2016-11-21 20:44:14'),
(2, 1, 15, 'La compré y se me rompió a la semana.', 1, '2016-11-21 20:46:39'),
(5, 5, 15, 'Esta rinde muy bien!', 4, '2016-11-21 20:48:22'),
(6, 3, 15, 'Muy veloz!', 4, '2016-11-21 20:50:35'),
(7, 8, 15, 'Estaría bueno poner una foto', 3, '2016-11-21 20:51:37'),
(8, 1, 12, 'Si, la verdad que esta mother no rinde mucho', 3, '2016-11-21 20:52:57'),
(9, 2, 12, 'De 10!', 5, '2016-11-21 20:53:11');

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
-- Estructura de tabla para la tabla `consulta`
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
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id_consulta`, `nombre`, `mail`, `consulta`, `notificacion`, `fecha`) VALUES
(2, 'Ezequiel ', 'ezfs@gmail.com', 'Hola, si, muy, buena, la pág. Gracias!', 1, '2016-09-29 04:05:02'),
(3, 'Juan', 'pacopedro@delamar.es', 'Mi nombre así, y cuando yo \r\nme voy, me dicen al pasar,\r\nJuan paco pedro de la mar\r\nlalalalalaa..', 0, '2016-09-29 04:08:59'),
(4, 'Sean', 'elmaildeSean@gmail.com', 'Muy buenos productos, entro todos los días a su página para chequear las novedades! Es genial!', 0, '2016-09-29 05:50:11'),
(5, 'Fiona', 'Fionas@mail.com', 'Acá estámos con Shrek viendo su página, muy buena, muchas gracias!', 1, '2016-09-29 05:52:50');

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
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE `permiso` (
  `id_permiso` int(11) NOT NULL,
  `fk_id_accion` int(11) NOT NULL,
  `fk_id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`id_permiso`, `fk_id_accion`, `fk_id_rol`) VALUES
(14, 3, 4),
(15, 4, 4),
(16, 5, 4),
(17, 6, 4),
(18, 8, 4),
(19, 9, 4),
(20, 10, 4),
(21, 13, 4),
(22, 14, 4),
(23, 15, 4),
(24, 3, 2),
(35, 16, 4),
(36, 3, 2),
(37, 3, 2),
(67, 3, 3),
(68, 4, 3),
(69, 5, 3),
(70, 6, 3),
(71, 8, 3),
(72, 9, 3),
(73, 10, 3),
(74, 13, 3),
(75, 14, 3),
(76, 15, 3),
(77, 16, 3),
(78, 3, 2),
(79, 4, 2),
(80, 5, 2),
(81, 6, 2),
(83, 3, 2),
(84, 4, 2),
(85, 5, 2),
(86, 6, 2),
(87, 9, 2),
(88, 10, 2),
(89, 3, 2),
(90, 4, 2),
(91, 5, 2),
(92, 6, 2),
(93, 9, 2),
(94, 10, 2),
(95, 17, 2),
(96, 18, 2),
(97, 20, 2),
(98, 21, 2),
(99, 22, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Moderador'),
(3, 'Normal'),
(4, 'Visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fk_id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `password`, `fk_id_rol`) VALUES
(9, 'axelbau24', 'latinga.web@gmail.com', '$2y$10$zOWuWGx./3fkpunQcOUMpuqf4yTSCIZpDMu3PD7xXutlDK.9b/3dW', 1),
(10, 'santii35', 'santii_35@gmail.com', '$2y$10$OgZ98guEhTv1yJpIZTTGG.A/q0bn3hx6S/leKM5EkgXAhL0A1MlCq', 3),
(11, '93_sherman', 'sher_93@gmail.com', '$2y$10$nnLhK7Z7V7F8tT7qLMDnFe2LE3eCbmYVKz9Famr2bza.m2.zcHNwq', 3),
(12, 'usuario53', 'user_53@gmail.com', '$2y$10$TDkM7Ch8FcIj2Ppk40TkWe.ARp4T.SICpPksKx3DQerzJF8i87XZu', 3),
(13, 'ezefz', 'ezefazio@gmail.com', '$2y$10$S3PBHbdK9Ml2OLq.Wl3VzeVTdJlZwsXo4GiiH3sMblnMw.lrQXNdy', 1),
(14, 'XpedritoX', 'x_xp3drito@gmail.com', '$2y$10$kGdz2XhtFSKCZZzzPhD4JelvtMuRnOsIjQ19mbUMGM3I.5fFuOV8.', 2),
(15, 'Maestro_L', 'masterl32@hotmail.com', '$2y$10$HPGBhaTanLOwkI.eyZ9TQ.nBq9AHZ9CcY/WbXbzdgw1Zp3z7tzzHW', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accion`
--
ALTER TABLE `accion`
  ADD PRIMARY KEY (`id_accion`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `fk_id_usuario` (`fk_id_usuario`),
  ADD KEY `fk_id_componente` (`fk_id_componente`);

--
-- Indices de la tabla `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`id_componente`),
  ADD KEY `fk_id_categoria` (`fk_id_categoria`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id_consulta`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imagen`),
  ADD KEY `imagen_ibfk_1` (`fk_id_componente`);

--
-- Indices de la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD PRIMARY KEY (`id_permiso`),
  ADD KEY `fk_id_rol` (`fk_id_rol`),
  ADD KEY `fk_id_accion` (`fk_id_accion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_id_rol` (`fk_id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accion`
--
ALTER TABLE `accion`
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `componente`
--
ALTER TABLE `componente`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comp` FOREIGN KEY (`fk_id_componente`) REFERENCES `componente` (`id_componente`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`fk_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `componente`
--
ALTER TABLE `componente`
  ADD CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`fk_id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE;

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `imagen_ibfk_1` FOREIGN KEY (`fk_id_componente`) REFERENCES `componente` (`id_componente`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permiso`
--
ALTER TABLE `permiso`
  ADD CONSTRAINT `fk_accion` FOREIGN KEY (`fk_id_accion`) REFERENCES `accion` (`id_accion`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`fk_id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `rol_User` FOREIGN KEY (`fk_id_rol`) REFERENCES `rol` (`id_rol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
