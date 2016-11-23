-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2016 a las 03:14:29
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
(11, 'agregar_consulta', 'Enviar consultas'),
(13, 'mostrar_consultas', 'Ver listado de consultas recib'),
(14, 'eliminar_consulta', 'Eliminación de consultas'),
(15, 'editar_categoria', 'Edición de categorias'),
(16, 'admin_usuarios', 'Ver administración de usuarios'),
(17, 'eliminar_usuario', 'Eliminar usuarios'),
(18, 'editar_usuario', 'Editar usuarios'),
(19, 'agregar_usuario', 'Agregar usuarios'),
(20, 'update_permisos', 'Editar permisos de rol'),
(21, 'eliminar_rol', 'Eliminar roles'),
(22, 'agregar_rol', 'Agregar roles'),
(23, 'agregar_comentario', 'Publicar comentarios'),
(24, 'eliminar_comentario', 'Eliminar comentarios'),
(25, 'admin_roles', 'Ver administración de roles');

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
(13, 1, 4, 'Esta motherboard esta muy buena!', 5, '2016-11-23 01:49:49'),
(14, 1, 1, 'Una de las mejores!', 4, '2016-11-21 23:44:14'),
(15, 1, 3, 'La compré y se me rompió a la semana.', 1, '2016-11-21 23:46:39'),
(16, 5, 4, 'Esta rinde muy bien!', 4, '2016-11-21 23:48:22'),
(17, 3, 1, 'Muy veloz!', 4, '2016-11-21 23:50:35'),
(18, 8, 2, 'Estaría bueno poner una foto', 3, '2016-11-21 23:51:37'),
(19, 1, 5, 'Si, la verdad que esta mother no rinde mucho', 3, '2016-11-21 23:52:57'),
(20, 2, 6, 'De 10!', 5, '2016-11-21 23:53:11');

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
(1, 3, 4),
(2, 4, 4),
(3, 5, 4),
(4, 6, 4),
(5, 8, 4),
(6, 9, 4),
(7, 10, 4),
(8, 13, 4),
(9, 14, 4),
(10, 15, 4),
(11, 16, 4),
(12, 17, 4),
(13, 18, 4),
(14, 19, 4),
(15, 20, 4),
(16, 21, 4),
(17, 22, 4),
(18, 23, 4),
(19, 24, 4),
(20, 25, 4),
(21, 3, 3),
(22, 4, 3),
(23, 5, 3),
(24, 6, 3),
(25, 8, 3),
(26, 9, 3),
(27, 10, 3),
(28, 13, 3),
(29, 14, 3),
(30, 15, 3),
(31, 16, 3),
(32, 17, 3),
(33, 18, 3),
(34, 19, 3),
(35, 20, 3),
(36, 21, 3),
(37, 22, 3),
(38, 24, 3),
(39, 25, 3),
(40, 3, 2),
(41, 4, 2),
(42, 5, 2),
(43, 6, 2),
(44, 9, 2),
(45, 10, 2),
(46, 17, 2),
(47, 18, 2),
(48, 20, 2),
(49, 21, 2),
(50, 22, 2),
(51, 25, 2),
(53, 3, 4),
(54, 4, 4),
(55, 5, 4),
(56, 6, 4),
(57, 8, 4),
(58, 9, 4),
(59, 10, 4),
(60, 13, 4),
(61, 14, 4),
(62, 15, 4),
(63, 16, 4),
(64, 17, 4),
(65, 18, 4),
(66, 19, 4),
(67, 20, 4),
(68, 21, 4),
(69, 22, 4),
(70, 23, 4),
(71, 24, 4),
(72, 25, 4),
(73, 3, 4),
(74, 4, 4),
(75, 5, 4),
(76, 6, 4),
(77, 8, 4),
(78, 9, 4),
(79, 10, 4),
(80, 13, 4),
(81, 14, 4),
(82, 15, 4),
(83, 16, 4),
(84, 17, 4),
(85, 18, 4),
(86, 19, 4),
(87, 20, 4),
(88, 21, 4),
(89, 22, 4),
(90, 23, 4),
(91, 24, 4),
(92, 25, 4);

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
  `avatar` varchar(50) NOT NULL DEFAULT 'images/avatar/default.png',
  `fk_id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `password`, `avatar`, `fk_id_rol`) VALUES
(1, 'axelbau24', 'axelbau24@gmail.com', '$2y$10$yUdJQJ/cAGEnkzhKL/hpdOPHhX3Ku7UWqBeQOUcbsTnQKQcx.Ch6m', 'images/avatar/5834fb7747075_user_1.png', 1),
(2, 'eze', 'ezefazio@gmail.com', '$2y$10$aYD9Yhg/r3B7svmTZpJ7X.C7RfTWewaSwyHv3ZvHAlFAI5fn7KTDO', 'images/avatar/default.png', 1),
(3, 'santii35', 'santii_35@gmail.com', '$2y$10$o1cfUKVxNWgfSKB17ul39.t8CxtvBe1.nqobZzsPY6yeOoh3aG.bS', 'images/avatar/default.png', 3),
(4, '93_sherman', 'sher_93@gmail.com', '$2y$10$WF20Z76Pu3fbN3AMdqCDMeurvAfUWRvJR264SqQlEKkHxv0mF6HSG', 'images/avatar/default.png', 2),
(5, 'usuario53', 'user_53@gmail.com', '$2y$10$kR7EAKupD7irI6VIEbezb.8cKWNRjOdnDGUjgWwp6Ydec559X2LXe', 'images/avatar/default.png', 3),
(6, 'XpedritoX', 'x_xp3drito@gmail.com', '$2y$10$R9OLyC4NYpNlcpN9jIM53uIbEfkUxK6PVQ2Ys5AzlhJ3kYRhjWLhe', 'images/avatar/default.png', 3),
(7, 'Maestro_L', 'masterl32@hotmail.com', '$2y$10$G5.DgQ7EBpxgLfEeP.VrLubuZc7aOlF0mKOugRhZcNvoscFOevm5W', 'images/avatar/default.png', 3);

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
  MODIFY `id_accion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `componente`
--
ALTER TABLE `componente`
  MODIFY `id_componente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id_consulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imagen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `permiso`
--
ALTER TABLE `permiso`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
