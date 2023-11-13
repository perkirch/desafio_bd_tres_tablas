-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2023 a las 16:37:03
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ropa_2023`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
('12345715', 'Pablo', 'Avelluti'),
('22897614', 'Nicolás', 'Santos'),
('23489761', 'Mariano', 'Herron'),
('30425679', 'Marcos', 'Brunetti'),
('33467890', 'Julián ', 'Merlher'),
('4716189', 'Laura', 'Quiñones'),
('5467887', 'Mariana', 'Castañeiras'),
('7865901', 'Paula', 'Suárez'),
('8765420', 'Juan', 'Fornaseri'),
('8765490', 'Roberto', 'Caballero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `conceptos` varchar(40) NOT NULL,
  `clientes_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `conceptos`, `clientes_dni`) VALUES
(1, 'Responsable Inscript', '4716189'),
(2, 'Consumidor Final', '5467887'),
(3, 'Consumidor Final', '7865901'),
(4, 'Responsable Inscript', '12345715'),
(5, 'IVA Exento', '7865901'),
(6, 'IVA Exento', '23489761'),
(7, 'Responsable Inscript', '22897614'),
(8, 'Responsable Inscripto', '23489761'),
(9, 'IVA Exento', '23489761'),
(10, 'Consumidor Final', '12345715');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_compra`
--

CREATE TABLE `lineas_compra` (
  `numero` int(11) NOT NULL,
  `compras_id` int(11) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineas_compra`
--

INSERT INTO `lineas_compra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 7, 'Remera manga corta', 10000),
(2, 2, 'Remera manga corta', 15000),
(3, 9, 'Jean elastizado', 35000),
(4, 3, 'Jean Skinny', 40000),
(5, 1, 'Remera manga larga', 15000),
(6, 9, 'Bermuda Jean', 35000),
(7, 2, 'Jean Skinny Large', 35000),
(8, 6, 'Campera Cuero L', 10000),
(9, 2, 'Bermuda Jean L', 40000),
(10, 1, 'Remera manga corta S', 10000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineas_compra`
--
ALTER TABLE `lineas_compra`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lineas_compra`
--
ALTER TABLE `lineas_compra`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`);

--
-- Filtros para la tabla `lineas_compra`
--
ALTER TABLE `lineas_compra`
  ADD CONSTRAINT `lineas_compra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
