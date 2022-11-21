-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2022 a las 03:22:54
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comanda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `comentarioId` int(11) NOT NULL,
  `mesaId` int(11) NOT NULL,
  `puntuacionMesa` int(11) NOT NULL,
  `mozoId` int(11) NOT NULL,
  `puntuacionMozo` int(11) NOT NULL,
  `cocineroId` int(11) NOT NULL,
  `puntuacionCocinero` int(11) NOT NULL,
  `puntuacionRestaurante` int(11) NOT NULL,
  `comentarios` varchar(66) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`comentarioId`, `mesaId`, `puntuacionMesa`, `mozoId`, `puntuacionMozo`, `cocineroId`, `puntuacionCocinero`, `puntuacionRestaurante`, `comentarios`) VALUES
(8, 15, 9, 4, 7, 7, 7, 7, 'Buena comida, buena atencion'),
(9, 15, 7, 4, 8, 7, 8, 7, 'Buen servicio'),
(10, 15, 7, 4, 9, 7, 7, 7, 'Buena atencion!'),
(11, 15, 9, 4, 9, 7, 8, 9, 'Muy conforme'),
(12, 15, 1, 4, 5, 7, 8, 7, 'Muy mala la mesa, mala atencion del mozo'),
(13, 15, 8, 4, 5, 7, 2, 7, 'La comida estaba fria'),
(14, 15, 8, 4, 2, 7, 5, 7, 'El mozo nos dejo esperando el menu 30 minutos, la comida estaba fr'),
(15, 15, 2, 4, 2, 7, 1, 2, 'No vuelvo mas!'),
(16, 15, 2, 4, 2, 7, 1, 2, 'No vuelvo mas!');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedidos`
--

CREATE TABLE `detallespedidos` (
  `detallePedidoId` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `codigoAlfanumerico` varchar(5) NOT NULL,
  `empleadoId` int(11) DEFAULT NULL,
  `productoId` int(11) NOT NULL,
  `tiempoPreparacion` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `perfil` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallespedidos`
--

INSERT INTO `detallespedidos` (`detallePedidoId`, `estado`, `codigoAlfanumerico`, `empleadoId`, `productoId`, `tiempoPreparacion`, `cantidad`, `perfil`) VALUES
(183, 'listo para servir', '25d66', 7, 14, 0, 2, 'cocinero'),
(184, 'listo para servir', '25d66', 5, 10, 0, 2, 'cervecero'),
(185, 'listo para servir', '94164', 7, 12, 1668860320, 1, 'cocinero'),
(186, 'listo para servir', '94164', 6, 16, 1668860340, 2, 'bartender'),
(187, 'listo para servir', '94164', 5, 10, 1668860516, 3, 'cervecero'),
(188, 'listo para servir', 'ee2a0', 7, 12, 1668860320, 1, 'cocinero'),
(189, 'listo para servir', 'ee2a0', 6, 16, 1668860340, 2, 'bartender'),
(190, 'listo para servir', 'ee2a0', 5, 10, 1668860516, 3, 'cervecero'),
(191, 'listo para servir', '8f4be', 7, 12, 1668860767, 1, 'cocinero'),
(192, 'listo para servir', '8f4be', 6, 16, 1668860753, 2, 'bartender'),
(193, 'listo para servir', '8f4be', 5, 10, 1668860750, 3, 'cervecero'),
(194, 'listo para servir', '783a4', 7, 12, 1668860767, 1, 'cocinero'),
(195, 'listo para servir', '783a4', 6, 16, 1668860753, 2, 'bartender'),
(196, 'listo para servir', '783a4', 5, 10, 1668860750, 3, 'cervecero'),
(197, 'listo para servir', 'd654a', 7, 12, 1668861355, 1, 'cocinero'),
(198, 'listo para servir', 'd654a', 6, 16, 1668861364, 2, 'bartender'),
(199, 'listo para servir', 'd654a', 5, 10, 1668861352, 3, 'cervecero'),
(200, 'listo para servir', '5324b', 7, 12, 1668861583, 1, 'cocinero'),
(201, 'listo para servir', '5324b', 6, 16, 1668861568, 2, 'bartender'),
(202, 'listo para servir', '5324b', 5, 10, 1668861562, 3, 'cervecero'),
(203, 'listo para servir', '3607b', 7, 12, 1668862829, 1, 'cocinero'),
(204, 'listo para servir', '3607b', 6, 16, 1668862826, 2, 'bartender'),
(205, 'listo para servir', '3607b', 5, 10, 1668862820, 3, 'cervecero'),
(206, 'listo para servir', '5465f', 7, 12, 1668862829, 1, 'cocinero'),
(207, 'listo para servir', '5465f', 6, 16, 1668862826, 2, 'bartender'),
(208, 'listo para servir', '5465f', 5, 10, 1668862820, 3, 'cervecero'),
(209, 'listo para servir', '3f9fd', 7, 12, 1668864420, 1, 'cocinero'),
(210, 'listo para servir', '3f9fd', 6, 16, 1668864419, 2, 'bartender'),
(211, 'listo para servir', '3f9fd', 5, 10, 1668864419, 3, 'cervecero'),
(212, 'listo para servir', '974f5', 7, 12, 1668864517, 1, 'cocinero'),
(213, 'listo para servir', '974f5', 6, 16, 1668864530, 2, 'bartender'),
(214, 'listo para servir', '974f5', 5, 10, 1668864529, 3, 'cervecero'),
(215, 'listo para servir', 'f167b', 7, 12, 1668864517, 1, 'cocinero'),
(216, 'listo para servir', 'f167b', 6, 16, 1668864530, 2, 'bartender'),
(217, 'listo para servir', 'f167b', 5, 10, 1668864529, 3, 'cervecero'),
(218, 'listo para servir', 'fbf97', 7, 12, 1668864821, 1, 'cocinero'),
(219, 'listo para servir', 'fbf97', 6, 16, 1668864827, 2, 'bartender'),
(220, 'listo para servir', 'fbf97', 5, 10, 1668864820, 3, 'cervecero'),
(221, 'listo para servir', '64a35', 7, 12, 1668864821, 1, 'cocinero'),
(222, 'listo para servir', '64a35', 6, 16, 1668864827, 2, 'bartender'),
(223, 'listo para servir', '64a35', 5, 10, 1668864820, 3, 'cervecero'),
(224, 'listo para servir', 'b1d55', 7, 12, 1668864821, 1, 'cocinero'),
(225, 'listo para servir', 'b1d55', 6, 16, 1668864827, 2, 'bartender'),
(226, 'listo para servir', 'b1d55', 5, 10, 1668864820, 3, 'cervecero'),
(227, 'listo para servir', '5f1d8', 7, 12, 1668864892, 1, 'cocinero'),
(228, 'listo para servir', '5f1d8', 6, 16, 1668864883, 2, 'bartender'),
(229, 'listo para servir', '5f1d8', 5, 10, 1668864868, 3, 'cervecero'),
(230, 'listo para servir', '35833', 7, 12, 1668864961, 1, 'cocinero'),
(231, 'listo para servir', '35833', 6, 16, 1668864967, 2, 'bartender'),
(232, 'listo para servir', '35833', 5, 10, 1668864966, 3, 'cervecero'),
(233, 'listo para servir', 'b34ca', 7, 12, 1668865031, 1, 'cocinero'),
(234, 'listo para servir', 'b34ca', 6, 16, 1668865042, 2, 'bartender'),
(235, 'listo para servir', 'b34ca', 5, 10, 1668865031, 3, 'cervecero'),
(236, 'listo para servir', '9f293', 7, 12, 1668865162, 1, 'cocinero'),
(237, 'listo para servir', '9f293', 6, 16, 1668865153, 2, 'bartender'),
(238, 'listo para servir', '9f293', 5, 10, 1668865162, 3, 'cervecero'),
(239, 'listo para servir', '8e5a4', 7, 12, 1668865529, 1, 'cocinero'),
(240, 'listo para servir', '8e5a4', 6, 16, 1668865548, 2, 'bartender'),
(241, 'listo para servir', '8e5a4', 5, 10, 1668865558, 3, 'cervecero'),
(242, 'listo para servir', '85299', 7, 12, 1668865529, 1, 'cocinero'),
(243, 'listo para servir', '85299', 6, 16, 1668865548, 2, 'bartender'),
(244, 'listo para servir', '85299', 5, 10, 1668865558, 3, 'cervecero'),
(245, 'listo para servir', 'eaa86', 7, 12, 1668866195, 1, 'cocinero'),
(246, 'listo para servir', 'eaa86', 6, 16, 1668866188, 2, 'bartender'),
(247, 'listo para servir', 'eaa86', 5, 10, 1668866191, 3, 'cervecero'),
(248, 'listo para servir', 'a8fd1', 7, 12, 1668866195, 1, 'cocinero'),
(249, 'listo para servir', 'a8fd1', 6, 16, 1668866188, 2, 'bartender'),
(250, 'listo para servir', 'a8fd1', 5, 10, 1668866191, 3, 'cervecero'),
(251, 'listo para servir', '44e87', 7, 12, 1668866195, 1, 'cocinero'),
(252, 'listo para servir', '44e87', 6, 16, 1668866188, 2, 'bartender'),
(253, 'listo para servir', '44e87', 5, 10, 1668866191, 3, 'cervecero'),
(254, 'listo para servir', 'a8b94', 7, 12, 1668868061, 1, 'cocinero'),
(255, 'listo para servir', 'a8b94', 6, 16, 1668868058, 2, 'bartender'),
(256, 'listo para servir', 'a8b94', 5, 10, 1668868050, 3, 'cervecero'),
(257, 'listo para servir', '1f897', 7, 12, 1668993319, 1, 'cocinero'),
(258, 'listo para servir', '1f897', 6, 16, 1668993308, 2, 'bartender'),
(259, 'listo para servir', '1f897', 5, 10, 1668993310, 3, 'cervecero'),
(260, 'listo para servir', '9d3a2', 7, 12, 1668993319, 1, 'cocinero'),
(261, 'listo para servir', '9d3a2', 6, 16, 1668993308, 2, 'bartender'),
(262, 'listo para servir', '9d3a2', 5, 10, 1668993310, 3, 'cervecero'),
(263, 'listo para servir', 'ef42f', 7, 12, 1668993319, 1, 'cocinero'),
(264, 'listo para servir', 'ef42f', 6, 16, 1668993308, 2, 'bartender'),
(265, 'listo para servir', 'ef42f', 5, 10, 1668993310, 3, 'cervecero'),
(266, 'listo para servir', '36a76', 7, 12, 1668993319, 1, 'cocinero'),
(267, 'listo para servir', '36a76', 6, 16, 1668993308, 2, 'bartender'),
(268, 'listo para servir', '36a76', 5, 10, 1668993310, 3, 'cervecero'),
(269, 'listo para servir', '3e340', 7, 12, 1668996468, 1, 'cocinero'),
(270, 'listo para servir', '3e340', 6, 16, 1668996466, 2, 'bartender'),
(271, 'listo para servir', '3e340', 5, 10, 1668996469, 3, 'cervecero'),
(272, 'listo para servir', 'bb438', 7, 12, 1668996468, 1, 'cocinero'),
(273, 'listo para servir', 'bb438', 6, 16, 1668996466, 2, 'bartender'),
(274, 'listo para servir', 'bb438', 5, 10, 1668996469, 3, 'cervecero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `mesaId` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `codigoMesa` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`mesaId`, `estado`, `activo`, `codigoMesa`) VALUES
(14, 'cerrada', 1, '74ce6'),
(15, 'cerrada', 1, '6a1dc'),
(16, 'cerrada', 1, '82ea5'),
(17, 'cerrada', 1, '4093f'),
(18, 'cerrada', 1, '2a3e7'),
(19, 'cerrada', 1, '770d4'),
(20, 'cerrada', 1, 'd831c'),
(21, 'cerrada', 0, '2686d');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedidoId` int(11) NOT NULL,
  `codigoAlfanumerico` varchar(5) NOT NULL,
  `nombreCliente` varchar(25) NOT NULL,
  `mesaId` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `fotoUrl` varchar(255) DEFAULT NULL,
  `tiempoPreparacion` int(11) DEFAULT NULL,
  `mozoId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedidoId`, `codigoAlfanumerico`, `nombreCliente`, `mesaId`, `estado`, `fotoUrl`, `tiempoPreparacion`, `mozoId`) VALUES
(101, '25d66', 'DAn', 17, 'terminado', NULL, 0, 4),
(102, '94164', 'DAn', 17, 'Terminado', NULL, 1668860516, 4),
(103, 'ee2a0', 'DAn', 18, 'Terminado', NULL, 1668860516, 4),
(104, '8f4be', 'DAn', 18, 'Terminado', NULL, 1668860767, 4),
(105, '783a4', 'DAn', 19, 'Terminado', NULL, 1668860767, 4),
(106, 'd654a', 'DAn', 19, 'Terminado', NULL, 1668861364, 4),
(107, '5324b', 'DAn', 19, 'Terminado', NULL, 1668861583, 4),
(108, '3607b', 'DAn', 19, 'terminado', NULL, 1668862829, 4),
(109, '5465f', 'DAn', 20, 'terminado', NULL, 1668862829, 4),
(110, '3f9fd', 'DAn', 20, 'Terminado', NULL, 1668864420, 4),
(111, '974f5', 'DAn', 19, 'Terminado', NULL, 1668864530, 4),
(112, 'f167b', 'DAn', 20, 'Terminado', NULL, 1668864530, 4),
(113, 'fbf97', 'DAn', 20, 'Terminado', NULL, 1668864827, 4),
(114, '64a35', 'DAn', 19, 'Terminado', NULL, 1668864827, 4),
(115, 'b1d55', 'DAn', 18, 'Terminado', NULL, 1668864827, 4),
(116, '5f1d8', 'DAn', 17, 'Terminado', NULL, 1668864892, 4),
(117, '35833', 'DAn', 16, 'Terminado', NULL, 1668864967, 4),
(118, 'b34ca', 'DAn', 15, 'Terminado', NULL, 1668865042, 4),
(119, '9f293', 'DAn', 14, 'Terminado', NULL, 1668865162, 4),
(120, '8e5a4', 'DAn', 20, 'Terminado', NULL, 1668865558, 4),
(121, '85299', 'DAn', 19, 'Terminado', NULL, 1668865558, 4),
(122, 'eaa86', 'DAn', 19, 'Terminado', NULL, 1668866195, 4),
(123, 'a8fd1', 'DAn', 18, 'Terminado', NULL, 1668866195, 4),
(124, '44e87', 'DAn', 17, 'Terminado', './FotosPedidos/DAn-44e87.jpg', 1668866195, 4),
(125, 'a8b94', 'GonFZ', 18, 'Terminado', './FotosPedidos/cliente-GonFZ-codigoAlfanumericoPedido-a8b94.jpg', 1668868061, 4),
(126, '9d3a2', 'GonFZ', 19, 'Terminado', '4', 1668993319, 4),
(127, 'ef42f', 'GonFZ', 20, 'Terminado', NULL, 1668993319, 4),
(128, '36a76', 'GonFZ', 15, 'Terminado', NULL, 1668993319, 4),
(129, '3e340', 'GonFZ', 15, 'Terminado', NULL, 1668996469, 4),
(130, 'bb438', 'GonFZ', 14, 'Terminado', NULL, 1668996469, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `productoId` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `precio` double NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `perfil` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`productoId`, `nombre`, `precio`, `activo`, `perfil`) VALUES
(9, 'Lemon Pie', 250, 0, 'cocinero'),
(10, 'Cerveza', 100, 1, 'cervecero'),
(11, 'Daikiri', 95, 1, 'bartender'),
(12, 'pizza', 150, 1, 'cocinero'),
(13, 'milanesa', 130, 1, 'cocinero'),
(14, 'papas', 250, 1, 'cocinero'),
(15, 'papas', 13, 1, 'cocinero'),
(16, 'vino', 180, 1, 'bartender'),
(17, 'milanesa a caballo', 250, 1, 'cocinero'),
(18, 'hamburguesa de garbanzo', 200, 1, 'cocinero'),
(19, 'corona', 95, 1, 'cervecero'),
(22, 'daikiri', 95, 1, 'bartender'),
(23, 'tekila', 105, 1, 'bartender'),
(24, 'quimes', 98, 1, 'cervecero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `empleadoId` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `perfil` varchar(25) NOT NULL,
  `fechaIngreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(25) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`empleadoId`, `nombre`, `perfil`, `fechaIngreso`, `estado`, `clave`) VALUES
(1, 'gonza', 'socio', '2022-11-16 23:01:28', 'activo', '$2y$10$E2iMclcX/hDD5.AH4GrIJewF0vBUiLE0vWDLFB2m3ZkZKvFDG.wmi'),
(2, 'daniel', 'socio', '2022-11-16 23:01:38', 'activo', '$2y$10$bMAeSzJMm0K8Sa6J1orjvuGXLBQOHL5U1XzMMGpQWH5PNjzgr667S'),
(3, 'nicolas', 'socio', '2022-11-16 23:01:47', 'activo', '$2y$10$dq3WwGXgX/cb39PX6xrHfeb5W4YLlO/2n1ZO7aCcXwZRd0G5dk8Bm'),
(4, 'pris', 'mozo', '2022-11-16 23:02:14', 'activo', '$2y$10$u8jWAAZZfQLJfRYF902ppe6s17NnKRDqfXbhVF.MpObWAipdzLx02'),
(5, 'fabian', 'cervecero', '2022-11-16 23:02:44', 'activo', '$2y$10$yFCIC/hmb/QF7U6UAsxm7OIOKvmY0XiAcRrwckOPotGBddU6OSTgK'),
(6, 'juan', 'bartender', '2022-11-16 23:03:02', 'activo', '$2y$10$ct6s.dPi9FJ6xtn9cHY.9uWDEcuv7cPg1l9sxdBL9LSa4N6K0t9Du'),
(7, 'graciela', 'cocinero', '2022-11-16 23:12:11', 'activo', '$2y$10$..qr6OSQT0Dxv1/E7Bc3OuaLFJWEkqDpFG0X8Jf9PEiOyXt6BGbp6'),
(8, 'Priscila', 'bartender', '2022-11-16 23:13:07', 'Baja', '$2y$10$LZeUlvFXwyw5T7r98c'),
(9, 'Priscila', 'bartender', '2022-11-16 23:13:14', 'Baja', '$2y$10$u3mPHNrvYIyxmWOBuO'),
(10, 'Priscila', 'bartender', '2022-11-16 23:13:19', 'Baja', '$2y$10$D4gxvrv7IhBOcgnliy'),
(11, 'Sebastian', 'bartender', '2022-11-16 23:13:24', 'Baja', '$2y$10$v6Dsuw23y3QKYfFcfq'),
(12, 'Sebastian', 'bartender', '2022-11-16 23:13:28', 'Baja', '$2y$10$bVQ9K1lnxhV9B/HHga'),
(13, 'gonza2', 'bartender', '2020-12-11 03:00:00', 'activo', '$2y$10$3GiJwMH7G4Bcq1HQJnphT.tz41oO8pf9UvHygY0Gp0n25aE8xIKoy'),
(14, 'Andy', 'cocinero', '2022-11-19 11:29:50', 'Baja', '$2y$10$Gfo/0hUApB0LBV9RgcVtrOKleQF567E0BPDn48rL5r9YoJrriVtyS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`comentarioId`);

--
-- Indices de la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  ADD PRIMARY KEY (`detallePedidoId`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`mesaId`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedidoId`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`productoId`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`empleadoId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `comentarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `detallespedidos`
--
ALTER TABLE `detallespedidos`
  MODIFY `detallePedidoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `mesaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedidoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `productoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `empleadoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
