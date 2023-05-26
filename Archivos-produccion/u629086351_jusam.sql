-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2023 a las 02:40:31
-- Versión del servidor: 10.5.19-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u629086351_jusam`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesores`
--

CREATE TABLE `asesores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imei` varchar(100) NOT NULL,
  `unable` varchar(500) DEFAULT NULL,
  `time_blocked` varchar(10) NOT NULL,
  `tipo_usuario` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asesores`
--

INSERT INTO `asesores` (`id`, `nombre`, `imei`, `unable`, `time_blocked`, `tipo_usuario`) VALUES
(1, 'Delcy2023', 'Samjo3007', '', '', 'administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito_compras`
--

CREATE TABLE `carrito_compras` (
  `id` int(11) NOT NULL,
  `cod` int(10) UNSIGNED NOT NULL,
  `producto` varchar(100) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `valor` varchar(50) NOT NULL,
  `cantidad` varchar(50) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `fecha` varchar(20) DEFAULT NULL,
  `subtotal` varchar(20) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `carrito_compras`
--

INSERT INTO `carrito_compras` (`id`, `cod`, `producto`, `imagen`, `valor`, `cantidad`, `cliente`, `fecha`, `subtotal`, `descripcion`) VALUES
(13, 147, 'Dama oro rosa', 'da58.jpg', '90000', '1', 'pedrovillanueva26@hotmail.com', '2023-05-12', NULL, NULL),
(14, 77, 'Cronografos cuero1', 'lotocu5.jpg', '160000', '1', 'vicivanman@hotmail.com', '2023-05-18', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `imagen`) VALUES
(42, 'Relojes dama ', 'ImagenesCategorias/Screenshot_20221222_174601.jpg'),
(43, 'Catalogo caballero ', 'ImagenesCategorias/Screenshot_20221222_174454.jpg'),
(44, 'Catalogo pareja', 'ImagenesCategorias/Screenshot_20221220_184937.jpg'),
(45, 'Yess caballero ', 'ImagenesCategorias/Screenshot_20220504_065555.jpg'),
(46, 'Yess dama', 'ImagenesCategorias/Screenshot_20220701_134046.jpg'),
(47, 'Deportivo caballero ', 'ImagenesCategorias/IMG_20220421_092207.jpg'),
(48, 'Deportivo dama', 'ImagenesCategorias/IMG_20211127_102019.jpg'),
(49, 'Casio original ', 'ImagenesCategorias/ca1.jpg'),
(50, 'Digital caballero ', 'ImagenesCategorias/di.jpg'),
(51, 'Cronografos caballero ', 'ImagenesCategorias/lot9cro4.jpg'),
(52, 'Protech caballero', 'ImagenesCategorias/pro4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) DEFAULT '',
  `cedula` varchar(20) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `info_direccion` varchar(2000) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `departamento` varchar(30) DEFAULT NULL,
  `direccion_trabajo` varchar(200) DEFAULT NULL,
  `telefono_trabajo` varchar(100) DEFAULT NULL,
  `otro_rifa` varchar(100) DEFAULT NULL,
  `fecha_ingreso` varchar(10) DEFAULT '',
  `otros` varchar(100) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`nombre`, `apellidos`, `cedula`, `direccion`, `info_direccion`, `telefono`, `ciudad`, `departamento`, `direccion_trabajo`, `telefono_trabajo`, `otro_rifa`, `fecha_ingreso`, `otros`) VALUES
('Pedro ', 'Villanueva', '1044394327', 'Calle 6n634 Juan de Acosta Atlántico ', '', NULL, '131', '2', NULL, NULL, NULL, '', ''),
('Victor ', 'Manzano ', '80160210', 'Calle 2 #93d30', 'Torre3 apartamento 403', NULL, '149', '3', NULL, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `crear_clave`
--

CREATE TABLE `crear_clave` (
  `id` int(100) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `lugarexp` varchar(100) DEFAULT '',
  `fechaexp` varchar(100) DEFAULT '',
  `usuario` varchar(50) DEFAULT NULL,
  `clave` varchar(50) DEFAULT NULL,
  `correo` varchar(100) DEFAULT '',
  `credito` varchar(10) DEFAULT '',
  `cartera` varchar(50) DEFAULT NULL,
  `fecha_ingreso` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `crear_clave`
--

INSERT INTO `crear_clave` (`id`, `nombre`, `cedula`, `lugarexp`, `fechaexp`, `usuario`, `clave`, `correo`, `credito`, `cartera`, `fecha_ingreso`) VALUES
(2, NULL, NULL, '', '', 'Delcy Andrea corredor Pérez ', '2108sj', 'Zuluaga-91@hotmail.com ', '', NULL, '2023-01-10'),
(3, NULL, '1044394327', '', '', 'Pedro Villanueva ', '122426pv', 'pedrovillanueva26@hotmail.com', '', NULL, '2023-05-12'),
(4, NULL, '80160210', '', '', 'Victor ', '7855', 'vicivanman@hotmail.com', '', NULL, '2023-05-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `codigo` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `codigo`) VALUES
(1, 'Antioquia', 5),
(2, 'Atlantico', 8),
(3, 'D. C. Santa Fe de Bogotá', 11),
(4, 'Bolivar', 13),
(5, 'Boyaca', 15),
(6, 'Caldas', 17),
(7, 'Caqueta', 18),
(8, 'Cauca', 19),
(9, 'Cesar', 20),
(10, 'Cordova', 23),
(11, 'Cundinamarca', 25),
(12, 'Choco', 27),
(13, 'Huila', 41),
(14, 'La Guajira', 44),
(15, 'Magdalena', 47),
(16, 'Meta', 50),
(17, 'Nariño', 52),
(18, 'Norte de Santander', 54),
(19, 'Quindio', 63),
(20, 'Risaralda', 66),
(21, 'Santander', 68),
(22, 'Sucre', 70),
(23, 'Tolima', 73),
(24, 'Valle', 76),
(25, 'Arauca', 81),
(26, 'Casanare', 85),
(27, 'Putumayo', 86),
(28, 'San Andres', 88),
(29, 'Amazonas', 91),
(30, 'Guainia', 94),
(31, 'Guaviare', 95),
(32, 'Vaupes', 97),
(33, 'Vichada', 99);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Imagenes_productos`
--

CREATE TABLE `Imagenes_productos` (
  `id` int(11) NOT NULL,
  `nombre_imagen` varchar(300) NOT NULL,
  `fk_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `Imagenes_productos`
--

INSERT INTO `Imagenes_productos` (`id`, `nombre_imagen`, `fk_producto`) VALUES
(12, 'Screenshot_20221222_174601.jpg', 12),
(13, 'Screenshot_20230106_064036.jpg', 13),
(14, 'Screenshot_20221222_174609.jpg', 14),
(15, 'Screenshot_20221220_185224.jpg', 15),
(18, 'IMG_20221112_114525.jpg', 18),
(19, 'IMG_20221112_100513.jpg', 19),
(20, 'Screenshot_20221220_184937.jpg', 20),
(21, 'Screenshot_20221220_184944.jpg', 21),
(22, 'Screenshot_20221220_184955.jpg', 22),
(24, 'Screenshot_20221111_113306.jpg', 24),
(25, 'Screenshot_20221111_113255.jpg', 25),
(26, 'Screenshot_20220902_115640.jpg', 26),
(27, 'Screenshot_20230106_064406.jpg', 22),
(30, 'Screenshot_20230106_064007.jpg', 30),
(31, 'Screenshot_20230106_063956.jpg', 31),
(32, 'Screenshot_20221220_185007.jpg', 32),
(34, 'Screenshot_20230110_130107.jpg', 34),
(35, 'Screenshot_20230106_071859.jpg', 35),
(36, 'Screenshot_20220411_145055.jpg', 36),
(37, 'Screenshot_20220322_120340.jpg', 34),
(38, 'Screenshot_20220322_120415.jpg', 38),
(39, 'IMG_20211214_094745.jpg', 39),
(44, 'pa3.jpg', 46),
(47, 'pa25.jpg', 49),
(48, 'pa28.jpg', 50),
(49, 'pa14.jpg', 51),
(50, 'pa20.jpg', 52),
(51, 'pa21.jpg', 53),
(52, 'pa22.jpg', 54),
(53, 'pa23.jpg', 55),
(54, 'pa24.jpg', 56),
(55, 'modelo1.jpg', 57),
(56, 'modelo2.jpg', 58),
(57, 'modelo5.jpg', 59),
(58, 'modelo7.jpg', 60),
(59, 'modelo21.jpg', 61),
(60, 'modelo48.jpg', 62),
(61, 'modelo58.jpg', 63),
(62, 'ca1.jpg', 64),
(64, 'ca3.jpg', 66),
(65, 'ca4.jpg', 67),
(66, 'lot9cro4.jpg', 68),
(67, 'lotocro2.jpg', 69),
(68, 'lotocro3.jpg', 70),
(70, 'lotcu1.jpg', 72),
(71, 'lotocu2.jpg', 73),
(72, 'lotocu3.jpg', 74),
(73, 'lotocu6.jpg', 75),
(74, 'lotocu4.jpg', 76),
(75, 'lotocu5.jpg', 77),
(76, 'ye4.jpg', 78),
(77, 'ye3.jpg', 79),
(78, 'ye8.jpg', 80),
(79, 'ye14.jpg', 81),
(80, 'ye20.jpg', 82),
(81, 'ye21.jpg', 83),
(82, 'ye26.jpg', 84),
(85, 'ye1.jpg', 87),
(86, 'ye2.jpg', 88),
(87, 'ye6.jpg', 89),
(88, 'ye7.jpg', 90),
(90, 'ye10.jpg', 92),
(92, 'ye18.jpg', 94),
(93, 'ye23.jpg', 95),
(94, 'ye25.jpg', 96),
(95, 'ye30.jpg', 97),
(99, 'ye36.jpg', 101),
(100, 'ye38.jpg', 102),
(101, 'lda4.jpg', 103),
(102, 'lda5.jpg', 104),
(103, 'lda3.jpg', 105),
(104, 'lda2.jpg', 106),
(105, 'lda1.jpg', 107),
(106, 'lda6.jpg', 108),
(107, 'lda7.jpg', 109),
(108, 'lda8.jpg', 110),
(109, 'lda9.jpg', 111),
(110, 'lda13.jpg', 112),
(111, 'lda12.jpg', 113),
(112, 'lda15.jpg', 114),
(113, 'di1.jpg', 115),
(114, 'di2.jpg', 117),
(115, 'di 2.jpg', 118),
(116, 'di.jpg', 119),
(117, 'di6.jpg', 120),
(118, 'di7.jpg', 121),
(119, 'día.jpg', 122),
(120, 'di4.jpg', 123),
(121, 'di5.jpg', 124),
(122, 'rd1.jpg', 125),
(123, 'rd2.jpg', 126),
(124, 'rd3.jpg', 127),
(125, 'rd5.jpg', 128),
(126, 'lo26.jpg', 129),
(127, 'lo27.jpg', 130),
(128, 'lo28.jpg', 131),
(129, 'lo30.jpg', 132),
(130, 'lo31.jpg', 133),
(131, 'lo32.jpg', 134),
(132, 'lo17.jpg', 135),
(133, 'lo1.jpg', 136),
(134, 'lo2.jpg', 137),
(135, 'lo3.jpg', 138),
(136, 'lo4.jpg', 139),
(137, 'lo5.jpg', 140),
(138, 'lo6.jpg', 141),
(139, 'lo7.jpg', 142),
(140, 'lo8.jpg', 143),
(141, 'lo9.jpg', 144),
(142, 'da56.jpg', 145),
(143, 'da57.jpg', 146),
(144, 'da58.jpg', 147),
(145, 'da59.jpg', 148),
(146, 'da60.jpg', 149),
(147, 'da61.jpg', 150),
(148, 'da64.jpg', 151),
(149, 'da63.jpg', 152),
(150, 'da97.jpg', 153),
(151, 'da96.jpg', 154),
(152, 'da114.jpg', 155),
(153, 'da86.jpg', 156),
(154, 'da15.jpg', 157),
(155, 'da14.jpg', 158),
(156, 'da62.jpg', 159),
(157, 'da23.jpg', 160),
(158, 'da21.jpg', 161),
(159, 'da24.jpg', 162),
(160, 'Screenshot_20230515_183113_com.facebook.katana_edit_300548301900493.jpg', 28),
(161, 'Screenshot_20230505_144538_com.whatsapp.w4b_edit_125449117250649.jpg', 29),
(162, 'IMG-20230507-WA0079.jpg', 163),
(163, 'IMG-20230507-WA0078.jpg', 164),
(164, 'IMG-20230507-WA0084.jpg', 165),
(165, 'IMG-20230507-WA0076.jpg', 166),
(166, 'blend130423033948_edit_170096223510502.png', 167),
(167, 'blend160423025507_edit_289110080361613.png', 168),
(168, 'IMG-20221013-WA0354.jpg', 169);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_pagina`
--

CREATE TABLE `info_pagina` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion_pagina` varchar(500) DEFAULT NULL,
  `direccion_pagina` varchar(500) DEFAULT NULL,
  `color_pagina` varchar(50) DEFAULT NULL,
  `correo` varchar(200) DEFAULT NULL,
  `linkfb` varchar(200) DEFAULT NULL,
  `linkinsta` varchar(200) DEFAULT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `comision` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `info_pagina`
--

INSERT INTO `info_pagina` (`id`, `nombre`, `descripcion_pagina`, `direccion_pagina`, `color_pagina`, `correo`, `linkfb`, `linkinsta`, `logo`, `imagen`, `comision`) VALUES
(9, 'JUSAM STORE', 'Somos Jusam Store, una tienda en línea que ofrece productos de alta calidad, ofrecemos pagos contra entrega con las transportadoras Envía, Servientrega, Interrapidisimo y TCC, Envíos rápidos y seguros.', 'Cra 11 w 60 bis 12 barrio Brisas del mutis\r\nBucaramanga Santander.', '#0a0a0a', 'JUSAMSTORE@HOTMAIL.COM', NULL, NULL, 'logo192.png', 'logo192.png', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_compras`
--

CREATE TABLE `lista_compras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cliente` varchar(50) NOT NULL,
  `compra_n` varchar(100) DEFAULT '0',
  `fecha` varchar(10) NOT NULL,
  `total_compra` varchar(100) NOT NULL,
  `descripcion_credito` varchar(100) DEFAULT '0',
  `n_cuotas` varchar(10) DEFAULT '',
  `periodicidad` varchar(20) DEFAULT 'No aplica',
  `domicilio` varchar(200) DEFAULT '',
  `medio_de_pago` varchar(100) DEFAULT '',
  `comentarios` varchar(500) DEFAULT NULL,
  `cambio` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT 'Entregada',
  `vendedor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_productos_comprados`
--

CREATE TABLE `lista_productos_comprados` (
  `id` bigint(20) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `compra_n` varchar(20) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `descripcion` varchar(500) DEFAULT '',
  `cantidad` varchar(20) NOT NULL,
  `precio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_05_12_203401_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `id` bigint(20) NOT NULL,
  `departamento_id` bigint(20) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`id`, `departamento_id`, `codigo`, `nombre`) VALUES
(1, 1, 1, 'MEDELLIN'),
(2, 1, 2, 'ABEJORRAL'),
(3, 1, 4, 'ABRIAQUI'),
(4, 1, 21, 'ALEJANDRIA'),
(5, 1, 30, 'AMAGA'),
(6, 1, 31, 'AMALFI'),
(7, 1, 34, 'ANDES'),
(8, 1, 36, 'ANGELOPOLIS'),
(9, 1, 38, 'ANGOSTURA'),
(10, 1, 40, 'ANORI'),
(11, 1, 42, 'ANTIOQUIA'),
(12, 1, 44, 'ANZA'),
(13, 1, 45, 'APARTADO'),
(14, 1, 51, 'ARBOLETES'),
(15, 1, 55, 'ARGELIA'),
(16, 1, 59, 'ARMENIA'),
(17, 1, 79, 'BARBOSA'),
(18, 1, 86, 'BELMIRA'),
(19, 1, 88, 'BELLO'),
(20, 1, 91, 'BETANIA'),
(21, 1, 93, 'BETULIA'),
(22, 1, 101, 'BOLIVAR'),
(23, 1, 107, 'BRICEÑO'),
(24, 1, 113, 'BURITICA'),
(25, 1, 120, 'CACERES'),
(26, 1, 125, 'CAICEDO'),
(27, 1, 129, 'CALDAS'),
(28, 1, 134, 'CAMPAMENTO'),
(29, 1, 138, 'CAÑASGORDAS'),
(30, 1, 142, 'CARACOLI'),
(31, 1, 145, 'CARAMANTA'),
(32, 1, 147, 'CAREPA'),
(33, 1, 148, 'CARMEN DE VIBORAL'),
(34, 1, 150, 'CAROLINA'),
(35, 1, 154, 'CAUCASIA'),
(36, 1, 172, 'CHIGORODO'),
(37, 1, 190, 'CISNEROS'),
(38, 1, 197, 'COCORNA'),
(39, 1, 206, 'CONCEPCION'),
(40, 1, 209, 'CONCORDIA'),
(41, 1, 212, 'COPACABANA'),
(42, 1, 234, 'DABEIBA'),
(43, 1, 237, 'DON MATIAS'),
(44, 1, 240, 'EBEJICO'),
(45, 1, 250, 'EL BAGRE'),
(46, 1, 264, 'ENTRERRIOS'),
(47, 1, 266, 'ENVIGADO'),
(48, 1, 282, 'FREDONIA'),
(49, 1, 284, 'FRONTINO'),
(50, 1, 306, 'GIRALDO'),
(51, 1, 308, 'GIRARDOTA'),
(52, 1, 310, 'GOMEZ PLATA'),
(53, 1, 313, 'GRANADA'),
(54, 1, 315, 'GUADALUPE'),
(55, 1, 318, 'GUARNE'),
(56, 1, 321, 'GUATAPE'),
(57, 1, 347, 'HELICONIA'),
(58, 1, 353, 'HISPANIA'),
(59, 1, 360, 'ITAGUI'),
(60, 1, 361, 'ITUANGO'),
(61, 1, 364, 'JARDIN'),
(62, 1, 368, 'JERICO'),
(63, 1, 376, 'LA CEJA'),
(64, 1, 380, 'LA ESTRELLA'),
(65, 1, 390, 'LA PINTADA'),
(66, 1, 400, 'LA UNION'),
(67, 1, 411, 'LIBORINA'),
(68, 1, 425, 'MACEO'),
(69, 1, 440, 'MARINILLA'),
(70, 1, 467, 'MONTEBELLO'),
(71, 1, 475, 'MURINDO'),
(72, 1, 480, 'MUTATA'),
(73, 1, 483, 'NARIÑO'),
(74, 1, 490, 'NECOCLI'),
(75, 1, 495, 'NECHI'),
(76, 1, 501, 'OLAYA'),
(77, 1, 541, 'PEÑOL'),
(78, 1, 543, 'PEQUE'),
(79, 1, 576, 'PUEBLORRICO'),
(80, 1, 579, 'PUERTO BERRIO'),
(81, 1, 585, 'PUERTO NARE (LA MAGDALENA)'),
(82, 1, 591, 'PUERTO TRIUNFO'),
(83, 1, 604, 'REMEDIOS'),
(84, 1, 607, 'RETIRO'),
(85, 1, 615, 'RIONEGRO'),
(86, 1, 628, 'SABANALARGA'),
(87, 1, 631, 'SABANETA'),
(88, 1, 642, 'SALGAR'),
(89, 1, 647, 'SAN ANDRES'),
(90, 1, 649, 'SAN CARLOS'),
(91, 1, 652, 'SAN FRANCISCO'),
(92, 1, 656, 'SAN JERONIMO'),
(93, 1, 658, 'SAN JOSE DE LA MONTAÑA'),
(94, 1, 659, 'SAN JUAN DE URABA'),
(95, 1, 660, 'SAN LUIS'),
(96, 1, 664, 'SAN PEDRO'),
(97, 1, 665, 'SAN PEDRO DE URABA'),
(98, 1, 667, 'SAN RAFAEL'),
(99, 1, 670, 'SAN ROQUE'),
(100, 1, 674, 'SAN VICENTE'),
(101, 1, 679, 'SANTA BARBARA'),
(102, 1, 686, 'SANTA ROSA DE OSOS'),
(103, 1, 690, 'SANTO DOMINGO'),
(104, 1, 697, 'SANTUARIO'),
(105, 1, 736, 'SEGOVIA'),
(106, 1, 756, 'SONSON'),
(107, 1, 761, 'SOPETRAN'),
(108, 1, 789, 'TAMESIS'),
(109, 1, 790, 'TARAZA'),
(110, 1, 792, 'TARSO'),
(111, 1, 809, 'TITIRIBI'),
(112, 1, 819, 'TOLEDO'),
(113, 1, 837, 'TURBO'),
(114, 1, 842, 'URAMITA'),
(115, 1, 847, 'URRAO'),
(116, 1, 854, 'VALDIVIA'),
(117, 1, 856, 'VALPARAISO'),
(118, 1, 858, 'VEGACHI'),
(119, 1, 861, 'VENECIA'),
(120, 1, 873, 'VIGIA DEL FUERTE'),
(121, 1, 885, 'YALI'),
(122, 1, 887, 'YARUMAL'),
(123, 1, 890, 'YOLOMBO'),
(124, 1, 893, 'YONDO'),
(125, 1, 895, 'ZARAGOZA'),
(126, 2, 1, 'BARRANQUILLA (DISTRITO ESPECIAL INDUSTRIAL Y PORTUARIO DE BARRANQUILLA)'),
(127, 2, 78, 'BARANOA'),
(128, 2, 137, 'CAMPO DE LA CRUZ'),
(129, 2, 141, 'CANDELARIA'),
(130, 2, 296, 'GALAPA'),
(131, 2, 372, 'JUAN DE ACOSTA'),
(132, 2, 421, 'LURUACO'),
(133, 2, 433, 'MALAMBO'),
(134, 2, 436, 'MANATI'),
(135, 2, 520, 'PALMAR DE VARELA'),
(136, 2, 549, 'PIOJO'),
(137, 2, 558, 'POLO NUEVO'),
(138, 2, 560, 'PONEDERA'),
(139, 2, 573, 'PUERTO COLOMBIA'),
(140, 2, 606, 'REPELON'),
(141, 2, 634, 'SABANAGRANDE'),
(142, 2, 638, 'SABANALARGA'),
(143, 2, 675, 'SANTA LUCIA'),
(144, 2, 685, 'SANTO TOMAS'),
(145, 2, 758, 'SOLEDAD'),
(146, 2, 770, 'SUAN'),
(147, 2, 832, 'TUBARA'),
(148, 2, 849, 'USIACURI'),
(149, 3, 1, 'Santa Fe de Bogotá'),
(150, 3, 1, 'USAQUEN'),
(151, 3, 2, 'CHAPINERO'),
(152, 3, 3, 'SANTA FE'),
(153, 3, 4, 'SAN CRISTOBAL'),
(154, 3, 5, 'USME'),
(155, 3, 6, 'TUNJUELITO'),
(156, 3, 7, 'BOSA'),
(157, 3, 8, 'KENNEDY'),
(158, 3, 9, 'FONTIBON'),
(159, 3, 10, 'ENGATIVA'),
(160, 3, 11, 'SUBA'),
(161, 3, 12, 'BARRIOS UNIDOS'),
(162, 3, 13, 'TEUSAQUILLO'),
(163, 3, 14, 'MARTIRES'),
(164, 3, 15, 'ANTONIO NARIÑO'),
(165, 3, 16, 'PUENTE ARANDA'),
(166, 3, 17, 'CANDELARIA'),
(167, 3, 18, 'RAFAEL URIBE'),
(168, 3, 19, 'CIUDAD BOLIVAR'),
(169, 3, 20, 'SUMAPAZ'),
(170, 4, 1, 'CARTAGENA (DISTRITO TURISTICO Y CULTURAL DE CARTAGENA)'),
(171, 4, 6, 'ACHI'),
(172, 4, 30, 'ALTOS DEL ROSARIO'),
(173, 4, 42, 'ARENAL'),
(174, 4, 52, 'ARJONA'),
(175, 4, 62, 'ARROYOHONDO'),
(176, 4, 74, 'BARRANCO DE LOBA'),
(177, 4, 140, 'CALAMAR'),
(178, 4, 160, 'CANTAGALLO'),
(179, 4, 188, 'CICUCO'),
(180, 4, 212, 'CORDOBA'),
(181, 4, 222, 'CLEMENCIA'),
(182, 4, 244, 'EL CARMEN DE BOLIVAR'),
(183, 4, 248, 'EL GUAMO'),
(184, 4, 268, 'EL PEÑON'),
(185, 4, 300, 'HATILLO DE LOBA'),
(186, 4, 430, 'MAGANGUE'),
(187, 4, 433, 'MAHATES'),
(188, 4, 440, 'MARGARITA'),
(189, 4, 442, 'MARIA LA BAJA'),
(190, 4, 458, 'MONTECRISTO'),
(191, 4, 468, 'MOMPOS'),
(192, 4, 473, 'MORALES'),
(193, 4, 549, 'PINILLOS'),
(194, 4, 580, 'REGIDOR'),
(195, 4, 600, 'RIO VIEJO'),
(196, 4, 620, 'SAN CRISTOBAL'),
(197, 4, 647, 'SAN ESTANISLAO'),
(198, 4, 650, 'SAN FERNANDO'),
(199, 4, 654, 'SAN JACINTO'),
(200, 4, 655, 'SAN JACINTO DEL CAUCA'),
(201, 4, 657, 'SAN JUAN NEPOMUCENO'),
(202, 4, 667, 'SAN MARTIN DE LOBA'),
(203, 4, 670, 'SAN PABLO'),
(204, 4, 673, 'SANTA CATALINA'),
(205, 4, 683, 'SANTA ROSA'),
(206, 4, 688, 'SANTA ROSA DEL SUR'),
(207, 4, 744, 'SIMITI'),
(208, 4, 760, 'SOPLAVIENTO'),
(209, 4, 780, 'TALAIGUA NUEVO'),
(210, 4, 810, 'TIQUISIO (PUERTO RICO)'),
(211, 4, 836, 'TURBACO'),
(212, 4, 838, 'TURBANA'),
(213, 4, 873, 'VILLANUEVA'),
(214, 4, 894, 'ZAMBRANO'),
(215, 5, 1, 'TUNJA'),
(216, 5, 22, 'ALMEIDA'),
(217, 5, 47, 'AQUITANIA'),
(218, 5, 51, 'ARCABUCO'),
(219, 5, 87, 'BELEN'),
(220, 5, 90, 'BERBEO'),
(221, 5, 92, 'BETEITIVA'),
(222, 5, 97, 'BOAVITA'),
(223, 5, 104, 'BOYACA'),
(224, 5, 106, 'BRICEÑO'),
(225, 5, 109, 'BUENAVISTA'),
(226, 5, 114, 'BUSBANZA'),
(227, 5, 131, 'CALDAS'),
(228, 5, 135, 'CAMPOHERMOSO'),
(229, 5, 162, 'CERINZA'),
(230, 5, 172, 'CHINAVITA'),
(231, 5, 176, 'CHIQUINQUIRA'),
(232, 5, 180, 'CHISCAS'),
(233, 5, 183, 'CHITA'),
(234, 5, 185, 'CHITARAQUE'),
(235, 5, 187, 'CHIVATA'),
(236, 5, 189, 'CIENEGA'),
(237, 5, 204, 'COMBITA'),
(238, 5, 212, 'COPER'),
(239, 5, 215, 'CORRALES'),
(240, 5, 218, 'COVARACHIA'),
(241, 5, 223, 'CUBARA'),
(242, 5, 224, 'CUCAITA'),
(243, 5, 226, 'CUITIVA'),
(244, 5, 232, 'CHIQUIZA'),
(245, 5, 236, 'CHIVOR'),
(246, 5, 238, 'DUITAMA'),
(247, 5, 244, 'EL COCUY'),
(248, 5, 248, 'EL ESPINO'),
(249, 5, 272, 'FIRAVITOBA'),
(250, 5, 276, 'FLORESTA'),
(251, 5, 293, 'GACHANTIVA'),
(252, 5, 296, 'GAMEZA'),
(253, 5, 299, 'GARAGOA'),
(254, 5, 317, 'GUACAMAYAS'),
(255, 5, 322, 'GUATEQUE'),
(256, 5, 325, 'GUAYATA'),
(257, 5, 332, 'GUICAN'),
(258, 5, 362, 'IZA'),
(259, 5, 367, 'JENESANO'),
(260, 5, 368, 'JERICO'),
(261, 5, 377, 'LABRANZAGRANDE'),
(262, 5, 380, 'LA CAPILLA'),
(263, 5, 401, 'LA VICTORIA'),
(264, 5, 403, 'LA UVITA'),
(265, 5, 407, 'VILLA DE LEIVA'),
(266, 5, 425, 'MACANAL'),
(267, 5, 442, 'MARIPI'),
(268, 5, 455, 'MIRAFLORES'),
(269, 5, 464, 'MONGUA'),
(270, 5, 466, 'MONGUI'),
(271, 5, 469, 'MONIQUIRA'),
(272, 5, 476, 'MOTAVITA'),
(273, 5, 480, 'MUZO'),
(274, 5, 491, 'NOBSA'),
(275, 5, 494, 'NUEVO COLON'),
(276, 5, 500, 'OICATA'),
(277, 5, 507, 'OTANCHE'),
(278, 5, 511, 'PACHAVITA'),
(279, 5, 514, 'PAEZ'),
(280, 5, 516, 'PAIPA'),
(281, 5, 518, 'PAJARITO'),
(282, 5, 522, 'PANQUEBA'),
(283, 5, 531, 'PAUNA'),
(284, 5, 533, 'PAYA'),
(285, 5, 537, 'PAZ DEL RIO'),
(286, 5, 542, 'PESCA'),
(287, 5, 550, 'PISBA'),
(288, 5, 572, 'PUERTO BOYACA'),
(289, 5, 580, 'QUIPAMA'),
(290, 5, 599, 'RAMIRIQUI'),
(291, 5, 600, 'RAQUIRA'),
(292, 5, 621, 'RONDON'),
(293, 5, 632, 'SABOYA'),
(294, 5, 638, 'SACHICA'),
(295, 5, 646, 'SAMACA'),
(296, 5, 660, 'SAN EDUARDO'),
(297, 5, 664, 'SAN JOSE DE PARE'),
(298, 5, 667, 'SAN LUIS DE GACENO'),
(299, 5, 673, 'SAN MATEO'),
(300, 5, 676, 'SAN MIGUEL DE SEMA'),
(301, 5, 681, 'SAN PABLO DE BORBUR'),
(302, 5, 686, 'SANTANA'),
(303, 5, 690, 'SANTA MARIA'),
(304, 5, 693, 'SANTA ROSA DE VITERBO'),
(305, 5, 696, 'SANTA SOFIA'),
(306, 5, 720, 'SATIVANORTE'),
(307, 5, 723, 'SATIVASUR'),
(308, 5, 740, 'SIACHOQUE'),
(309, 5, 753, 'SOATA'),
(310, 5, 755, 'SOCOTA'),
(311, 5, 757, 'SOCHA'),
(312, 5, 759, 'SOGAMOSO'),
(313, 5, 761, 'SOMONDOCO'),
(314, 5, 762, 'SORA'),
(315, 5, 763, 'SOTAQUIRA'),
(316, 5, 764, 'SORACA'),
(317, 5, 774, 'SUSACON'),
(318, 5, 776, 'SUTAMARCHAN'),
(319, 5, 778, 'SUTATENZA'),
(320, 5, 790, 'TASCO'),
(321, 5, 798, 'TENZA'),
(322, 5, 804, 'TIBANA'),
(323, 5, 806, 'TIBASOSA'),
(324, 5, 808, 'TINJACA'),
(325, 5, 810, 'TIPACOQUE'),
(326, 5, 814, 'TOCA'),
(327, 5, 816, 'TOGUI'),
(328, 5, 820, 'TOPAGA'),
(329, 5, 822, 'TOTA'),
(330, 5, 832, 'TUNUNGUA'),
(331, 5, 835, 'TURMEQUE'),
(332, 5, 837, 'TUTA'),
(333, 5, 839, 'TUTASA'),
(334, 5, 842, 'UMBITA'),
(335, 5, 861, 'VENTAQUEMADA'),
(336, 5, 879, 'VIRACACHA'),
(337, 5, 897, 'ZETAQUIRA'),
(338, 6, 1, 'MANIZALES'),
(339, 6, 13, 'AGUADAS'),
(340, 6, 42, 'ANSERMA'),
(341, 6, 50, 'ARANZAZU'),
(342, 6, 88, 'BELALCAZAR'),
(343, 6, 174, 'CHINCHINA'),
(344, 6, 272, 'FILADELFIA'),
(345, 6, 380, 'LA DORADA'),
(346, 6, 388, 'LA MERCED'),
(347, 6, 433, 'MANZANARES'),
(348, 6, 442, 'MARMATO'),
(349, 6, 444, 'MARQUETALIA'),
(350, 6, 446, 'MARULANDA'),
(351, 6, 486, 'NEIRA'),
(352, 6, 495, 'NORCASIA'),
(353, 6, 513, 'PACORA'),
(354, 6, 524, 'PALESTINA'),
(355, 6, 541, 'PENSILVANIA'),
(356, 6, 614, 'RIOSUCIO'),
(357, 6, 616, 'RISARALDA'),
(358, 6, 653, 'SALAMINA'),
(359, 6, 662, 'SAMANA'),
(360, 6, 665, 'SAN JOSE'),
(361, 6, 777, 'SUPIA'),
(362, 6, 867, 'VICTORIA'),
(363, 6, 873, 'VILLAMARIA'),
(364, 6, 877, 'VITERBO'),
(365, 7, 1, 'FLORENCIA'),
(366, 7, 29, 'ALBANIA'),
(367, 7, 94, 'BELEN DE LOS ANDAQUIES'),
(368, 7, 150, 'CARTAGENA DEL CHAIRA'),
(369, 7, 205, 'CURILLO'),
(370, 7, 247, 'EL DONCELLO'),
(371, 7, 256, 'EL PAUJIL'),
(372, 7, 410, 'LA MONTAÑITA'),
(373, 7, 460, 'MILAN'),
(374, 7, 479, 'MORELIA'),
(375, 7, 592, 'PUERTO RICO'),
(376, 7, 610, 'SAN JOSE DE FRAGUA'),
(377, 7, 753, 'SAN VICENTE DEL CAGUAN'),
(378, 7, 756, 'SOLANO'),
(379, 7, 785, 'SOLITA'),
(380, 7, 860, 'VALPARAISO'),
(381, 8, 1, 'POPAYAN'),
(382, 8, 22, 'ALMAGUER'),
(383, 8, 50, 'ARGELIA'),
(384, 8, 75, 'BALBOA'),
(385, 8, 100, 'BOLIVAR'),
(386, 8, 110, 'BUENOS AIRES'),
(387, 8, 130, 'CAJIBIO'),
(388, 8, 137, 'CALDONO'),
(389, 8, 142, 'CALOTO'),
(390, 8, 212, 'CORINTO'),
(391, 8, 256, 'EL TAMBO'),
(392, 8, 290, 'FLORENCIA'),
(393, 8, 318, 'GUAPI'),
(394, 8, 355, 'INZA'),
(395, 8, 364, 'JAMBALO'),
(396, 8, 392, 'LA SIERRA'),
(397, 8, 397, 'LA VEGA'),
(398, 8, 418, 'LOPEZ (MICAY)'),
(399, 8, 450, 'MERCADERES'),
(400, 8, 455, 'MIRANDA'),
(401, 8, 473, 'MORALES'),
(402, 8, 513, 'PADILLA'),
(403, 8, 517, 'PAEZ (BELALCAZAR)'),
(404, 8, 532, 'PATIA (EL BORDO)'),
(405, 8, 533, 'PIAMONTE'),
(406, 8, 548, 'PIENDAMO'),
(407, 8, 573, 'PUERTO TEJADA'),
(408, 8, 585, 'PURACE (COCONUCO)'),
(409, 8, 622, 'ROSAS'),
(410, 8, 693, 'SAN SEBASTIAN'),
(411, 8, 698, 'SANTANDER DE QUILICHAO'),
(412, 8, 701, 'SANTA ROSA'),
(413, 8, 743, 'SILVIA'),
(414, 8, 760, 'SOTARA (PAISPAMBA)'),
(415, 8, 780, 'SUAREZ'),
(416, 8, 807, 'TIMBIO'),
(417, 8, 809, 'TIMBIQUI'),
(418, 8, 821, 'TORIBIO'),
(419, 8, 824, 'TOTORO'),
(420, 8, 845, 'VILLARICA'),
(421, 9, 1, 'VALLEDUPAR'),
(422, 9, 11, 'AGUACHICA'),
(423, 9, 13, 'AGUSTIN CODAZZI'),
(424, 9, 32, 'ASTREA'),
(425, 9, 45, 'BECERRIL'),
(426, 9, 60, 'BOSCONIA'),
(427, 9, 175, 'CHIMICHAGUA'),
(428, 9, 178, 'CHIRIGUANA'),
(429, 9, 228, 'CURUMANI'),
(430, 9, 238, 'EL COPEY'),
(431, 9, 250, 'EL PASO'),
(432, 9, 295, 'GAMARRA'),
(433, 9, 310, 'GONZALEZ'),
(434, 9, 383, 'LA GLORIA'),
(435, 9, 400, 'LA JAGUA IBIRICO'),
(436, 9, 443, 'MANAURE (BALCON DEL CESAR)'),
(437, 9, 517, 'PAILITAS'),
(438, 9, 550, 'PELAYA'),
(439, 9, 570, 'PUEBLO BELLO'),
(440, 9, 614, 'RIO DE ORO'),
(441, 9, 621, 'LA PAZ (ROBLES)'),
(442, 9, 710, 'SAN ALBERTO'),
(443, 9, 750, 'SAN DIEGO'),
(444, 9, 770, 'SAN MARTIN'),
(445, 9, 787, 'TAMALAMEQUE'),
(446, 10, 1, 'MONTERIA'),
(447, 10, 68, 'AYAPEL'),
(448, 10, 79, 'BUENAVISTA'),
(449, 10, 90, 'CANALETE'),
(450, 10, 162, 'CERETE'),
(451, 10, 168, 'CHIMA'),
(452, 10, 182, 'CHINU'),
(453, 10, 189, 'CIENAGA DE ORO'),
(454, 10, 300, 'COTORRA'),
(455, 10, 350, 'LA APARTADA'),
(456, 10, 417, 'LORICA'),
(457, 10, 419, 'LOS CORDOBAS'),
(458, 10, 464, 'MOMIL'),
(459, 10, 466, 'MONTELIBANO'),
(460, 10, 500, 'MOÑITOS'),
(461, 10, 555, 'PLANETA RICA'),
(462, 10, 570, 'PUEBLO NUEVO'),
(463, 10, 574, 'PUERTO ESCONDIDO'),
(464, 10, 580, 'PUERTO LIBERTADOR'),
(465, 10, 586, 'PURISIMA'),
(466, 10, 660, 'SAHAGUN'),
(467, 10, 670, 'SAN ANDRES SOTAVENTO'),
(468, 10, 672, 'SAN ANTERO'),
(469, 10, 675, 'SAN BERNARDO DEL VIENTO'),
(470, 10, 678, 'SAN CARLOS'),
(471, 10, 686, 'SAN PELAYO'),
(472, 10, 807, 'TIERRALTA'),
(473, 10, 855, 'VALENCIA'),
(474, 11, 1, 'AGUA DE DIOS'),
(475, 11, 19, 'ALBAN'),
(476, 11, 35, 'ANAPOIMA'),
(477, 11, 40, 'ANOLAIMA'),
(478, 11, 53, 'ARBELAEZ'),
(479, 11, 86, 'BELTRAN'),
(480, 11, 95, 'BITUIMA'),
(481, 11, 99, 'BOJACA'),
(482, 11, 120, 'CABRERA'),
(483, 11, 123, 'CACHIPAY'),
(484, 11, 126, 'CAJICA'),
(485, 11, 148, 'CAPARRAPI'),
(486, 11, 151, 'CAQUEZA'),
(487, 11, 154, 'CARMEN DE CARUPA'),
(488, 11, 168, 'CHAGUANI'),
(489, 11, 175, 'CHIA'),
(490, 11, 178, 'CHIPAQUE'),
(491, 11, 181, 'CHOACHI'),
(492, 11, 183, 'CHOCONTA'),
(493, 11, 200, 'COGUA'),
(494, 11, 214, 'COTA'),
(495, 11, 224, 'CUCUNUBA'),
(496, 11, 245, 'EL COLEGIO'),
(497, 11, 258, 'EL PEÑON'),
(498, 11, 260, 'EL ROSAL'),
(499, 11, 269, 'FACATATIVA'),
(500, 11, 279, 'FOMEQUE'),
(501, 11, 281, 'FOSCA'),
(502, 11, 286, 'FUNZA'),
(503, 11, 288, 'FUQUENE'),
(504, 11, 290, 'FUSAGASUGA'),
(505, 11, 293, 'GACHALA'),
(506, 11, 295, 'GACHANCIPA'),
(507, 11, 297, 'GACHETA'),
(508, 11, 299, 'GAMA'),
(509, 11, 307, 'GIRARDOT'),
(510, 11, 312, 'GRANADA'),
(511, 11, 317, 'GUACHETA'),
(512, 11, 320, 'GUADUAS'),
(513, 11, 322, 'GUASCA'),
(514, 11, 324, 'GUATAQUI'),
(515, 11, 326, 'GUATAVITA'),
(516, 11, 328, 'GUAYABAL DE SIQUIMA'),
(517, 11, 335, 'GUAYABETAL'),
(518, 11, 339, 'GUTIERREZ'),
(519, 11, 368, 'JERUSALEN'),
(520, 11, 372, 'JUNIN'),
(521, 11, 377, 'LA CALERA'),
(522, 11, 386, 'LA MESA'),
(523, 11, 394, 'LA PALMA'),
(524, 11, 398, 'LA PEÑA'),
(525, 11, 402, 'LA VEGA'),
(526, 11, 407, 'LENGUAZAQUE'),
(527, 11, 426, 'MACHETA'),
(528, 11, 430, 'MADRID'),
(529, 11, 436, 'MANTA'),
(530, 11, 438, 'MEDINA'),
(531, 11, 473, 'MOSQUERA'),
(532, 11, 483, 'NARIÑO'),
(533, 11, 486, 'NEMOCON'),
(534, 11, 488, 'NILO'),
(535, 11, 489, 'NIMAIMA'),
(536, 11, 491, 'NOCAIMA'),
(537, 11, 506, 'VENECIA (OSPINA PEREZ)'),
(538, 11, 513, 'PACHO'),
(539, 11, 518, 'PAIME'),
(540, 11, 524, 'PANDI'),
(541, 11, 530, 'PARATEBUENO'),
(542, 11, 535, 'PASCA'),
(543, 11, 572, 'PUERTO SALGAR'),
(544, 11, 580, 'PULI'),
(545, 11, 592, 'QUEBRADANEGRA'),
(546, 11, 594, 'QUETAME'),
(547, 11, 596, 'QUIPILE'),
(548, 11, 599, 'APULO (RAFAEL REYES)'),
(549, 11, 612, 'RICAURTE'),
(550, 11, 645, 'SAN ANTONIO DEL TEQUENDAMA'),
(551, 11, 649, 'SAN BERNARDO'),
(552, 11, 653, 'SAN CAYETANO'),
(553, 11, 658, 'SAN FRANCISCO'),
(554, 11, 662, 'SAN JUAN DE RIOSECO'),
(555, 11, 718, 'SASAIMA'),
(556, 11, 736, 'SESQUILE'),
(557, 11, 740, 'SIBATE'),
(558, 11, 743, 'SILVANIA'),
(559, 11, 745, 'SIMIJACA'),
(560, 11, 754, 'SOACHA'),
(561, 11, 758, 'SOPO'),
(562, 11, 769, 'SUBACHOQUE'),
(563, 11, 772, 'SUESCA'),
(564, 11, 777, 'SUPATA'),
(565, 11, 779, 'SUSA'),
(566, 11, 781, 'SUTATAUSA'),
(567, 11, 785, 'TABIO'),
(568, 11, 793, 'TAUSA'),
(569, 11, 797, 'TENA'),
(570, 11, 799, 'TENJO'),
(571, 11, 805, 'TIBACUY'),
(572, 11, 807, 'TIBIRITA'),
(573, 11, 815, 'TOCAIMA'),
(574, 11, 817, 'TOCANCIPA'),
(575, 11, 823, 'TOPAIPI'),
(576, 11, 839, 'UBALA'),
(577, 11, 841, 'UBAQUE'),
(578, 11, 843, 'UBATE'),
(579, 11, 845, 'UNE'),
(580, 11, 851, 'UTICA'),
(581, 11, 862, 'VERGARA'),
(582, 11, 867, 'VIANI'),
(583, 11, 871, 'VILLAGOMEZ'),
(584, 11, 873, 'VILLAPINZON'),
(585, 11, 875, 'VILLETA'),
(586, 11, 878, 'VIOTA'),
(587, 11, 885, 'YACOPI'),
(588, 11, 898, 'ZIPACON'),
(589, 11, 899, 'ZIPAQUIRA'),
(590, 12, 1, 'QUIBDO (SAN FRANCISCO DE QUIBDO)'),
(591, 12, 6, 'ACANDI'),
(592, 12, 25, 'ALTO BAUDO (PIE DE PATO)'),
(593, 12, 50, 'ATRATO'),
(594, 12, 73, 'BAGADO'),
(595, 12, 75, 'BAHIA SOLANO (MUTIS)'),
(596, 12, 77, 'BAJO BAUDO (PIZARRO)'),
(597, 12, 99, 'BOJAYA (BELLAVISTA)'),
(598, 12, 135, 'CANTON DE SAN PABLO (MANAGRU)'),
(599, 12, 205, 'CONDOTO'),
(600, 12, 245, 'EL CARMEN DE ATRATO'),
(601, 12, 250, 'LITORAL DEL BAJO SAN JUAN (SANTA GENOVEVA DE DOCORDO)'),
(602, 12, 361, 'ISTMINA'),
(603, 12, 372, 'JURADO'),
(604, 12, 413, 'LLORO'),
(605, 12, 425, 'MEDIO ATRATO'),
(606, 12, 430, 'MEDIO BAUDO'),
(607, 12, 491, 'NOVITA'),
(608, 12, 495, 'NUQUI'),
(609, 12, 600, 'RIOQUITO'),
(610, 12, 615, 'RIOSUCIO'),
(611, 12, 660, 'SAN JOSE DEL PALMAR'),
(612, 12, 745, 'SIPI'),
(613, 12, 787, 'TADO'),
(614, 12, 800, 'UNGUIA'),
(615, 12, 810, 'UNION PANAMERICANA'),
(616, 13, 1, 'NEIVA'),
(617, 13, 6, 'ACEVEDO'),
(618, 13, 13, 'AGRADO'),
(619, 13, 16, 'AIPE'),
(620, 13, 20, 'ALGECIRAS'),
(621, 13, 26, 'ALTAMIRA'),
(622, 13, 78, 'BARAYA'),
(623, 13, 132, 'CAMPOALEGRE'),
(624, 13, 206, 'COLOMBIA'),
(625, 13, 244, 'ELIAS'),
(626, 13, 298, 'GARZON'),
(627, 13, 306, 'GIGANTE'),
(628, 13, 319, 'GUADALUPE'),
(629, 13, 349, 'HOBO'),
(630, 13, 357, 'IQUIRA'),
(631, 13, 359, 'ISNOS (SAN JOSE DE ISNOS)'),
(632, 13, 378, 'LA ARGENTINA'),
(633, 13, 396, 'LA PLATA'),
(634, 13, 483, 'NATAGA'),
(635, 13, 503, 'OPORAPA'),
(636, 13, 518, 'PAICOL'),
(637, 13, 524, 'PALERMO'),
(638, 13, 530, 'PALESTINA'),
(639, 13, 548, 'PITAL'),
(640, 13, 551, 'PITALITO'),
(641, 13, 615, 'RIVERA'),
(642, 13, 660, 'SALADOBLANCO'),
(643, 13, 668, 'SAN AGUSTIN'),
(644, 13, 676, 'SANTA MARIA'),
(645, 13, 770, 'SUAZA'),
(646, 13, 791, 'TARQUI'),
(647, 13, 797, 'TESALIA'),
(648, 13, 799, 'TELLO'),
(649, 13, 801, 'TERUEL'),
(650, 13, 807, 'TIMANA'),
(651, 13, 872, 'VILLAVIEJA'),
(652, 13, 885, 'YAGUARA'),
(653, 14, 1, 'RIOHACHA'),
(654, 14, 78, 'BARRANCAS'),
(655, 14, 90, 'DIBULLA'),
(656, 14, 98, 'DISTRACCION'),
(657, 14, 110, 'EL MOLINO'),
(658, 14, 279, 'FONSECA'),
(659, 14, 378, 'HATONUEVO'),
(660, 14, 420, 'LA JAGUA DEL PILAR'),
(661, 14, 430, 'MAICAO'),
(662, 14, 560, 'MANAURE'),
(663, 14, 650, 'SAN JUAN DEL CESAR'),
(664, 14, 847, 'URIBIA'),
(665, 14, 855, 'URUMITA'),
(666, 14, 874, 'VILLANUEVA'),
(667, 15, 1, 'SANTA MARTA (DISTRITO TURISTICO CULTURAL E HISTORICO DE SANTA MARTA)'),
(668, 15, 30, 'ALGARROBO'),
(669, 15, 53, 'ARACATACA'),
(670, 15, 58, 'ARIGUANI (EL DIFICIL)'),
(671, 15, 161, 'CERRO SAN ANTONIO'),
(672, 15, 170, 'CHIVOLO'),
(673, 15, 189, 'CIENAGA'),
(674, 15, 205, 'CONCORDIA'),
(675, 15, 245, 'EL BANCO'),
(676, 15, 258, 'EL PIÑON'),
(677, 15, 268, 'EL RETEN'),
(678, 15, 288, 'FUNDACION'),
(679, 15, 318, 'GUAMAL'),
(680, 15, 541, 'PEDRAZA'),
(681, 15, 545, 'PIJIÑO DEL CARMEN (PIJIÑO)'),
(682, 15, 551, 'PIVIJAY'),
(683, 15, 555, 'PLATO'),
(684, 15, 570, 'PUEBLOVIEJO'),
(685, 15, 605, 'REMOLINO'),
(686, 15, 660, 'SABANAS DE SAN ANGEL'),
(687, 15, 675, 'SALAMINA'),
(688, 15, 692, 'SAN SEBASTIAN DE BUENAVISTA'),
(689, 15, 703, 'SAN ZENON'),
(690, 15, 707, 'SANTA ANA'),
(691, 15, 745, 'SITIONUEVO'),
(692, 15, 798, 'TENERIFE'),
(693, 16, 1, 'VILLAVICENCIO'),
(694, 16, 6, 'ACACIAS'),
(695, 16, 110, 'BARRANCA DE UPIA'),
(696, 16, 124, 'CABUYARO'),
(697, 16, 150, 'CASTILLA LA NUEVA'),
(698, 16, 223, 'SAN LUIS DE CUBARRAL'),
(699, 16, 226, 'CUMARAL'),
(700, 16, 245, 'EL CALVARIO'),
(701, 16, 251, 'EL CASTILLO'),
(702, 16, 270, 'EL DORADO'),
(703, 16, 287, 'FUENTE DE ORO'),
(704, 16, 313, 'GRANADA'),
(705, 16, 318, 'GUAMAL'),
(706, 16, 325, 'MAPIRIPAN'),
(707, 16, 330, 'MESETAS'),
(708, 16, 350, 'LA MACARENA'),
(709, 16, 370, 'LA URIBE'),
(710, 16, 400, 'LEJANIAS'),
(711, 16, 450, 'PUERTO CONCORDIA'),
(712, 16, 568, 'PUERTO GAITAN'),
(713, 16, 573, 'PUERTO LOPEZ'),
(714, 16, 577, 'PUERTO LLERAS'),
(715, 16, 590, 'PUERTO RICO'),
(716, 16, 606, 'RESTREPO'),
(717, 16, 680, 'SAN CARLOS DE GUAROA'),
(718, 16, 683, 'SAN JUAN DE ARAMA'),
(719, 16, 686, 'SAN JUANITO'),
(720, 16, 689, 'SAN MARTIN'),
(721, 16, 711, 'VISTAHERMOSA'),
(722, 17, 1, 'PASTO (SAN JUAN DE PASTO)'),
(723, 17, 19, 'ALBAN (SAN JOSE)'),
(724, 17, 22, 'ALDANA'),
(725, 17, 36, 'ANCUYA'),
(726, 17, 51, 'ARBOLEDA (BERRUECOS)'),
(727, 17, 79, 'BARBACOAS'),
(728, 17, 83, 'BELEN'),
(729, 17, 110, 'BUESACO'),
(730, 17, 203, 'COLON (GENOVA)'),
(731, 17, 207, 'CONSACA'),
(732, 17, 210, 'CONTADERO'),
(733, 17, 215, 'CORDOBA'),
(734, 17, 224, 'CUASPUD (CARLOSAMA)'),
(735, 17, 227, 'CUMBAL'),
(736, 17, 233, 'CUMBITARA'),
(737, 17, 240, 'CHACHAGUI'),
(738, 17, 250, 'EL CHARCO'),
(739, 17, 254, 'EL PEÑOL'),
(740, 17, 256, 'EL ROSARIO'),
(741, 17, 258, 'EL TABLON'),
(742, 17, 260, 'EL TAMBO'),
(743, 17, 287, 'FUNES'),
(744, 17, 317, 'GUACHUCAL'),
(745, 17, 320, 'GUAITARILLA'),
(746, 17, 323, 'GUALMATAN'),
(747, 17, 352, 'ILES'),
(748, 17, 354, 'IMUES'),
(749, 17, 356, 'IPIALES'),
(750, 17, 378, 'LA CRUZ'),
(751, 17, 381, 'LA FLORIDA'),
(752, 17, 385, 'LA LLANADA'),
(753, 17, 390, 'LA TOLA'),
(754, 17, 399, 'LA UNION'),
(755, 17, 405, 'LEIVA'),
(756, 17, 411, 'LINARES'),
(757, 17, 418, 'LOS ANDES (SOTOMAYOR)'),
(758, 17, 427, 'MAGUI (PAYAN)'),
(759, 17, 435, 'MALLAMA (PIEDRANCHA)'),
(760, 17, 473, 'MOSQUERA'),
(761, 17, 490, 'OLAYA HERRERA (BOCAS DE SATINGA)'),
(762, 17, 506, 'OSPINA'),
(763, 17, 520, 'FRANCISCO PIZARRO (SALAHONDA)'),
(764, 17, 540, 'POLICARPA'),
(765, 17, 560, 'POTOSI'),
(766, 17, 565, 'PROVIDENCIA'),
(767, 17, 573, 'PUERRES'),
(768, 17, 585, 'PUPIALES'),
(769, 17, 612, 'RICAURTE'),
(770, 17, 621, 'ROBERTO PAYAN (SAN JOSE)'),
(771, 17, 678, 'SAMANIEGO'),
(772, 17, 683, 'SANDONA'),
(773, 17, 685, 'SAN BERNARDO'),
(774, 17, 687, 'SAN LORENZO'),
(775, 17, 693, 'SAN PABLO'),
(776, 17, 694, 'SAN PEDRO DE CARTAGO'),
(777, 17, 696, 'SANTA BARBARA (ISCUANDE)'),
(778, 17, 699, 'SANTA CRUZ (GUACHAVES)'),
(779, 17, 720, 'SAPUYES'),
(780, 17, 786, 'TAMINANGO'),
(781, 17, 788, 'TANGUA'),
(782, 17, 835, 'TUMACO'),
(783, 17, 838, 'TUQUERRES'),
(784, 17, 885, 'YACUANQUER'),
(785, 18, 1, 'CUCUTA'),
(786, 18, 3, 'ABREGO'),
(787, 18, 51, 'ARBOLEDAS'),
(788, 18, 99, 'BOCHALEMA'),
(789, 18, 109, 'BUCARASICA'),
(790, 18, 125, 'CACOTA'),
(791, 18, 128, 'CACHIRA'),
(792, 18, 172, 'CHINACOTA'),
(793, 18, 174, 'CHITAGA'),
(794, 18, 206, 'CONVENCION'),
(795, 18, 223, 'CUCUTILLA'),
(796, 18, 239, 'DURANIA'),
(797, 18, 245, 'EL CARMEN'),
(798, 18, 250, 'EL TARRA'),
(799, 18, 261, 'EL ZULIA'),
(800, 18, 313, 'GRAMALOTE'),
(801, 18, 344, 'HACARI'),
(802, 18, 347, 'HERRAN'),
(803, 18, 377, 'LABATECA'),
(804, 18, 385, 'LA ESPERANZA'),
(805, 18, 398, 'LA PLAYA'),
(806, 18, 405, 'LOS PATIOS'),
(807, 18, 418, 'LOURDES'),
(808, 18, 480, 'MUTISCUA'),
(809, 18, 498, 'OCAÑA'),
(810, 18, 518, 'PAMPLONA'),
(811, 18, 520, 'PAMPLONITA'),
(812, 18, 553, 'PUERTO SANTANDER'),
(813, 18, 599, 'RAGONVALIA'),
(814, 18, 660, 'SALAZAR'),
(815, 18, 670, 'SAN CALIXTO'),
(816, 18, 673, 'SAN CAYETANO'),
(817, 18, 680, 'SANTIAGO'),
(818, 18, 720, 'SARDINATA'),
(819, 18, 743, 'SILOS'),
(820, 18, 800, 'TEORAMA'),
(821, 18, 810, 'TIBU'),
(822, 18, 820, 'TOLEDO'),
(823, 18, 871, 'VILLACARO'),
(824, 18, 874, 'VILLA DEL ROSARIO'),
(825, 19, 1, 'ARMENIA'),
(826, 19, 111, 'BUENAVISTA'),
(827, 19, 130, 'CALARCA'),
(828, 19, 190, 'CIRCASIA'),
(829, 19, 212, 'CORDOBA'),
(830, 19, 272, 'FILANDIA'),
(831, 19, 302, 'GENOVA'),
(832, 19, 401, 'LA TEBAIDA'),
(833, 19, 470, 'MONTENEGRO'),
(834, 19, 548, 'PIJAO'),
(835, 19, 594, 'QUIMBAYA'),
(836, 19, 690, 'SALENTO'),
(837, 20, 1, 'PEREIRA'),
(838, 20, 45, 'APIA'),
(839, 20, 75, 'BALBOA'),
(840, 20, 88, 'BELEN DE UMBRIA'),
(841, 20, 170, 'DOS QUEBRADAS'),
(842, 20, 318, 'GUATICA'),
(843, 20, 383, 'LA CELIA'),
(844, 20, 400, 'LA VIRGINIA'),
(845, 20, 440, 'MARSELLA'),
(846, 20, 456, 'MISTRATO'),
(847, 20, 572, 'PUEBLO RICO'),
(848, 20, 594, 'QUINCHIA'),
(849, 20, 682, 'SANTA ROSA DE CABAL'),
(850, 20, 687, 'SANTUARIO'),
(851, 21, 1, 'BUCARAMANGA'),
(852, 21, 13, 'AGUADA'),
(853, 21, 20, 'ALBANIA'),
(854, 21, 51, 'ARATOCA'),
(855, 21, 77, 'BARBOSA'),
(856, 21, 79, 'BARICHARA'),
(857, 21, 81, 'BARRANCABERMEJA'),
(858, 21, 92, 'BETULIA'),
(859, 21, 101, 'BOLIVAR'),
(860, 21, 121, 'CABRERA'),
(861, 21, 132, 'CALIFORNIA'),
(862, 21, 147, 'CAPITANEJO'),
(863, 21, 152, 'CARCASI'),
(864, 21, 160, 'CEPITA'),
(865, 21, 162, 'CERRITO'),
(866, 21, 167, 'CHARALA'),
(867, 21, 169, 'CHARTA'),
(868, 21, 176, 'CHIMA'),
(869, 21, 179, 'CHIPATA'),
(870, 21, 190, 'CIMITARRA'),
(871, 21, 207, 'CONCEPCION'),
(872, 21, 209, 'CONFINES'),
(873, 21, 211, 'CONTRATACION'),
(874, 21, 217, 'COROMORO'),
(875, 21, 229, 'CURITI'),
(876, 21, 235, 'EL CARMEN DE CHUCURY'),
(877, 21, 245, 'EL GUACAMAYO'),
(878, 21, 250, 'EL PEÑON'),
(879, 21, 255, 'EL PLAYON'),
(880, 21, 264, 'ENCINO'),
(881, 21, 266, 'ENCISO'),
(882, 21, 271, 'FLORIAN'),
(883, 21, 276, 'FLORIDABLANCA'),
(884, 21, 296, 'GALAN'),
(885, 21, 298, 'GAMBITA'),
(886, 21, 307, 'GIRON'),
(887, 21, 318, 'GUACA'),
(888, 21, 320, 'GUADALUPE'),
(889, 21, 322, 'GUAPOTA'),
(890, 21, 324, 'GUAVATA'),
(891, 21, 327, 'GUEPSA'),
(892, 21, 344, 'HATO'),
(893, 21, 368, 'JESUS MARIA'),
(894, 21, 370, 'JORDAN'),
(895, 21, 377, 'LA BELLEZA'),
(896, 21, 385, 'LANDAZURI'),
(897, 21, 397, 'LA PAZ'),
(898, 21, 406, 'LEBRIJA'),
(899, 21, 418, 'LOS SANTOS'),
(900, 21, 425, 'MACARAVITA'),
(901, 21, 432, 'MALAGA'),
(902, 21, 444, 'MATANZA'),
(903, 21, 464, 'MOGOTES'),
(904, 21, 468, 'MOLAGAVITA'),
(905, 21, 498, 'OCAMONTE'),
(906, 21, 500, 'OIBA'),
(907, 21, 502, 'ONZAGA'),
(908, 21, 522, 'PALMAR'),
(909, 21, 524, 'PALMAS DEL SOCORRO'),
(910, 21, 533, 'PARAMO'),
(911, 21, 547, 'PIEDECUESTA'),
(912, 21, 549, 'PINCHOTE'),
(913, 21, 572, 'PUENTE NACIONAL'),
(914, 21, 573, 'PUERTO PARRA'),
(915, 21, 575, 'PUERTO WILCHES'),
(916, 21, 615, 'RIONEGRO'),
(917, 21, 655, 'SABANA DE TORRES'),
(918, 21, 669, 'SAN ANDRES'),
(919, 21, 673, 'SAN BENITO'),
(920, 21, 679, 'SAN GIL'),
(921, 21, 682, 'SAN JOAQUIN'),
(922, 21, 684, 'SAN JOSE DE MIRANDA'),
(923, 21, 686, 'SAN MIGUEL'),
(924, 21, 689, 'SAN VICENTE DE CHUCURI'),
(925, 21, 705, 'SANTA BARBARA'),
(926, 21, 720, 'SANTA HELENA DEL OPON'),
(927, 21, 745, 'SIMACOTA'),
(928, 21, 755, 'SOCORRO'),
(929, 21, 770, 'SUAITA'),
(930, 21, 773, 'SUCRE'),
(931, 21, 780, 'SURATA'),
(932, 21, 820, 'TONA'),
(933, 21, 855, 'VALLE SAN JOSE'),
(934, 21, 861, 'VELEZ'),
(935, 21, 867, 'VETAS'),
(936, 21, 872, 'VILLANUEVA'),
(937, 21, 895, 'ZAPATOCA'),
(938, 22, 1, 'SINCELEJO'),
(939, 22, 110, 'BUENAVISTA'),
(940, 22, 124, 'CAIMITO'),
(941, 22, 204, 'COLOSO (RICAURTE)'),
(942, 22, 215, 'COROZAL'),
(943, 22, 230, 'CHALAN'),
(944, 22, 235, 'GALERAS (NUEVA GRANADA)'),
(945, 22, 265, 'GUARANDA'),
(946, 22, 400, 'LA UNION'),
(947, 22, 418, 'LOS PALMITOS'),
(948, 22, 429, 'MAJAGUAL'),
(949, 22, 473, 'MORROA'),
(950, 22, 508, 'OVEJAS'),
(951, 22, 523, 'PALMITO'),
(952, 22, 670, 'SAMPUES'),
(953, 22, 678, 'SAN BENITO ABAD'),
(954, 22, 702, 'SAN JUAN DE BETULIA'),
(955, 22, 708, 'SAN MARCOS'),
(956, 22, 713, 'SAN ONOFRE'),
(957, 22, 717, 'SAN PEDRO'),
(958, 22, 742, 'SINCE'),
(959, 22, 771, 'SUCRE'),
(960, 22, 820, 'TOLU'),
(961, 22, 823, 'TOLUVIEJO'),
(962, 23, 1, 'IBAGUE'),
(963, 23, 24, 'ALPUJARRA'),
(964, 23, 26, 'ALVARADO'),
(965, 23, 30, 'AMBALEMA'),
(966, 23, 43, 'ANZOATEGUI'),
(967, 23, 55, 'ARMERO (GUAYABAL)'),
(968, 23, 67, 'ATACO'),
(969, 23, 124, 'CAJAMARCA'),
(970, 23, 148, 'CARMEN APICALA'),
(971, 23, 152, 'CASABIANCA'),
(972, 23, 168, 'CHAPARRAL'),
(973, 23, 200, 'COELLO'),
(974, 23, 217, 'COYAIMA'),
(975, 23, 226, 'CUNDAY'),
(976, 23, 236, 'DOLORES'),
(977, 23, 268, 'ESPINAL'),
(978, 23, 270, 'FALAN'),
(979, 23, 275, 'FLANDES'),
(980, 23, 283, 'FRESNO'),
(981, 23, 319, 'GUAMO'),
(982, 23, 347, 'HERVEO'),
(983, 23, 349, 'HONDA'),
(984, 23, 352, 'ICONONZO'),
(985, 23, 408, 'LERIDA'),
(986, 23, 411, 'LIBANO'),
(987, 23, 443, 'MARIQUITA'),
(988, 23, 449, 'MELGAR'),
(989, 23, 461, 'MURILLO'),
(990, 23, 483, 'NATAGAIMA'),
(991, 23, 504, 'ORTEGA'),
(992, 23, 520, 'PALOCABILDO'),
(993, 23, 547, 'PIEDRAS'),
(994, 23, 555, 'PLANADAS'),
(995, 23, 563, 'PRADO'),
(996, 23, 585, 'PURIFICACION'),
(997, 23, 616, 'RIOBLANCO'),
(998, 23, 622, 'RONCESVALLES'),
(999, 23, 624, 'ROVIRA'),
(1000, 23, 671, 'SALDAÑA'),
(1001, 23, 675, 'SAN ANTONIO'),
(1002, 23, 678, 'SAN LUIS'),
(1003, 23, 686, 'SANTA ISABEL'),
(1004, 23, 770, 'SUAREZ'),
(1005, 23, 854, 'VALLE DE SAN JUAN'),
(1006, 23, 861, 'VENADILLO'),
(1007, 23, 870, 'VILLAHERMOSA'),
(1008, 23, 873, 'VILLARRICA'),
(1009, 24, 1, 'CALI (SANTIAGO DE CALI)'),
(1010, 24, 20, 'ALCALA'),
(1011, 24, 36, 'ANDALUCIA'),
(1012, 24, 41, 'ANSERMANUEVO'),
(1013, 24, 54, 'ARGELIA'),
(1014, 24, 100, 'BOLIVAR'),
(1015, 24, 109, 'BUENAVENTURA'),
(1016, 24, 111, 'BUGA'),
(1017, 24, 113, 'BUGALAGRANDE'),
(1018, 24, 122, 'CAICEDONIA'),
(1019, 24, 126, 'CALIMA (DARIEN)'),
(1020, 24, 130, 'CANDELARIA'),
(1021, 24, 147, 'CARTAGO'),
(1022, 24, 233, 'DAGUA'),
(1023, 24, 243, 'EL AGUILA'),
(1024, 24, 246, 'EL CAIRO'),
(1025, 24, 248, 'EL CERRITO'),
(1026, 24, 250, 'EL DOVIO'),
(1027, 24, 275, 'FLORIDA'),
(1028, 24, 306, 'GINEBRA'),
(1029, 24, 318, 'GUACARI'),
(1030, 24, 364, 'JAMUNDI'),
(1031, 24, 377, 'LA CUMBRE'),
(1032, 24, 400, 'LA UNION'),
(1033, 24, 403, 'LA VICTORIA'),
(1034, 24, 497, 'OBANDO'),
(1035, 24, 520, 'PALMIRA'),
(1036, 24, 563, 'PRADERA'),
(1037, 24, 606, 'RESTREPO'),
(1038, 24, 616, 'RIOFRIO'),
(1039, 24, 622, 'ROLDANILLO'),
(1040, 24, 670, 'SAN PEDRO'),
(1041, 24, 736, 'SEVILLA'),
(1042, 24, 823, 'TORO'),
(1043, 24, 828, 'TRUJILLO'),
(1044, 24, 834, 'TULUA'),
(1045, 24, 845, 'ULLOA'),
(1046, 24, 863, 'VERSALLES'),
(1047, 24, 869, 'VIJES'),
(1048, 24, 890, 'YOTOCO'),
(1049, 24, 892, 'YUMBO'),
(1050, 24, 895, 'ZARZAL'),
(1051, 25, 1, 'ARAUCA'),
(1052, 25, 65, 'ARAUQUITA'),
(1053, 25, 220, 'CRAVO NORTE'),
(1054, 25, 300, 'FORTUL'),
(1055, 25, 591, 'PUERTO RONDON'),
(1056, 25, 736, 'SARAVENA'),
(1057, 25, 794, 'TAME'),
(1058, 26, 1, 'YOPAL'),
(1059, 26, 10, 'AGUAZUL'),
(1060, 26, 15, 'CHAMEZA'),
(1061, 26, 125, 'HATO COROZAL'),
(1062, 26, 136, 'LA SALINA'),
(1063, 26, 139, 'MANI'),
(1064, 26, 162, 'MONTERREY'),
(1065, 26, 225, 'NUNCHIA'),
(1066, 26, 230, 'OROCUE'),
(1067, 26, 250, 'PAZ DE ARIPORO'),
(1068, 26, 263, 'PORE'),
(1069, 26, 279, 'RECETOR'),
(1070, 26, 300, 'SABANALARGA'),
(1071, 26, 315, 'SACAMA'),
(1072, 26, 325, 'SAN LUIS DE PALENQUE'),
(1073, 26, 400, 'TAMARA'),
(1074, 26, 410, 'TAURAMENA'),
(1075, 26, 430, 'TRINIDAD'),
(1076, 26, 440, 'VILLANUEVA'),
(1077, 27, 1, 'MOCOA'),
(1078, 27, 219, 'COLON'),
(1079, 27, 320, 'ORITO'),
(1080, 27, 568, 'PUERTO ASIS'),
(1081, 27, 569, 'PUERTO CAICEDO'),
(1082, 27, 571, 'PUERTO GUZMAN'),
(1083, 27, 573, 'PUERTO LEGUIZAMO'),
(1084, 27, 749, 'SIBUNDOY'),
(1085, 27, 755, 'SAN FRANCISCO'),
(1086, 27, 757, 'SAN MIGUEL (LA DORADA)'),
(1087, 27, 760, 'SANTIAGO'),
(1088, 27, 865, 'LA HORMIGA (VALLE DEL GUAMUEZ)'),
(1089, 27, 885, 'VILLAGARZON'),
(1090, 28, 1, 'SAN ANDRES'),
(1091, 28, 564, 'PROVIDENCIA'),
(1092, 29, 1, 'LETICIA'),
(1093, 29, 263, 'EL ENCANTO'),
(1094, 29, 405, 'LA CHORRERA'),
(1095, 29, 407, 'LA PEDRERA'),
(1096, 29, 430, 'LA VICTORIA'),
(1097, 29, 460, 'MIRITI-PARANA'),
(1098, 29, 530, 'PUERTO ALEGRIA'),
(1099, 29, 536, 'PUERTO ARICA'),
(1100, 29, 540, 'PUERTO NARIÑO'),
(1101, 29, 669, 'PUERTO SANTANDER'),
(1102, 29, 798, 'TARAPACA'),
(1103, 30, 1, 'PUERTO INIRIDA'),
(1104, 30, 343, 'BARRANCO MINAS'),
(1105, 30, 883, 'SAN FELIPE'),
(1106, 30, 884, 'PUERTO COLOMBIA'),
(1107, 30, 885, 'LA GUADALUPE'),
(1108, 30, 886, 'CACAHUAL'),
(1109, 30, 887, 'PANA PANA (CAMPO ALEGRE)'),
(1110, 30, 888, 'MORICHAL (MORICHAL NUEVO)'),
(1111, 31, 1, 'SAN JOSE DEL GUAVIARE'),
(1112, 31, 15, 'CALAMAR'),
(1113, 31, 25, 'EL RETORNO'),
(1114, 31, 200, 'MIRAFLORES'),
(1115, 32, 1, 'MITU'),
(1116, 32, 161, 'CARURU'),
(1117, 32, 511, 'PACOA'),
(1118, 32, 666, 'TARAIRA'),
(1119, 32, 777, 'PAPUNAUA (MORICHAL)'),
(1120, 32, 889, 'YAVARATE'),
(1121, 33, 1, 'PUERTO CARREÑO'),
(1122, 33, 524, 'LA PRIMAVERA'),
(1123, 33, 572, 'SANTA RITA'),
(1124, 33, 666, 'SANTA ROSALIA'),
(1125, 33, 760, 'SAN JOSE DE OCUNE'),
(1126, 33, 773, 'CUMARIBO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas_sobre_productos`
--

CREATE TABLE `preguntas_sobre_productos` (
  `id` int(11) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `cliente` varchar(50) NOT NULL DEFAULT '',
  `producto` varchar(12) NOT NULL,
  `pregunta` varchar(2000) NOT NULL,
  `respuesta` varchar(2000) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `referencia` varchar(100) DEFAULT '',
  `categoria` varchar(100) NOT NULL,
  `subcategoria` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(2000) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `n_cuotas` varchar(10) DEFAULT '',
  `valor_cuotas` varchar(50) DEFAULT '',
  `text_credito` varchar(100) DEFAULT '',
  `imagen` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `referencia`, `categoria`, `subcategoria`, `nombre`, `descripcion`, `valor`, `n_cuotas`, `valor_cuotas`, `text_credito`, `imagen`) VALUES
(12, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Qyq dama plateado', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(13, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Qyq dama calendario ', 'Cuero sintetico Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila ', '98000', '', '', '', ''),
(14, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Qyq dama con estrellas', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '105000', '', '', '', ''),
(15, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'QYQ dama dorado', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '110000', '', '', '', ''),
(18, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Qyq dama pavonado ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(19, 'Relojes dama ', 'Relojes dama ', '', 'Reloj Q&Q caja pasta', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(20, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja fondo negro ', 'Pulso cuero sintético resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(21, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja pulso negro caja dorada', 'Cuero sintetico Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(22, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja café Fondo beis', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(24, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja cuero azul fondo ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '145000', '', '', '', ''),
(25, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja correa negra caja dorada', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(26, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja pavonada ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '230000', '', '', '', ''),
(28, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja dorada', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '205000', '', '', '', ''),
(29, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja Combinada fondo beis', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '180000', '', '', '', ''),
(30, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja plateada', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '165000', '', '', '', ''),
(31, 'Pareja QyQ', 'Catálogo pareja', '', 'Pareja plateada centro gris', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '165000', '', '', '', ''),
(32, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja pulso azul', 'Pulso cuero sintético resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(34, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja dorada fondo blanco', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '180000', '', '', '', ''),
(35, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja plateada fondo blanco ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '165000', '', '', '', ''),
(39, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja plateada colección ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '190000', '', '', '', ''),
(46, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja pulso cafe2', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(49, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja plateada6', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(50, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja maya dorada ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '210000', '', '', '', ''),
(51, 'Pareja QyQ', 'Catalogo pareja', '', 'Pareja dorada8', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '180000', '', '', '', ''),
(52, 'Pareja loto', 'Catalogo pareja', '', 'Pareja loto1', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(53, 'Pareja loto', 'Catalogo pareja', '', 'Pareja loto2', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(54, 'Pareja loto', 'Catalogo pareja', '', 'Pareja loto 3', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(55, 'Pareja loto', 'Catalogo pareja', '', 'Pareja negra 4', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(56, 'Pareja loto', 'Catalogo pareja', '', 'Pareja loto6', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(57, 'Reloj caballero ', 'Catalogo caballero ', '', 'Caballero QyQ calendario ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(58, 'Reloj caballero ', 'Catalogo caballero ', '', 'Caballero Q&Q 1', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(59, 'Reloj caballero ', 'Catalogo caballero ', '', 'Qyq pavonado ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '120000', '', '', '', ''),
(60, 'Reloj caballero ', 'Catalogo caballero ', '', 'Qyq caballero 2', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(61, 'Reloj caballero ', 'Catalogo caballero ', '', 'Caballero oro rosa', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(62, 'Reloj caballero ', 'Catalogo caballero ', '', 'caballero  negro3', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '110000', '', '', '', ''),
(63, 'Reloj caballero ', 'Catalogo caballero ', '', 'Caballero plateado', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(64, 'Reloj caballero ', 'Casio original ', '', 'Casio telememo ', 'Hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '210000', '', '', '', ''),
(66, 'Casio', 'Casio original ', '', 'Retro espejo', 'Hora fecha alarma luz Cronómetro resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '190000', '', '', '', ''),
(67, 'Casio', 'Casio original ', '', 'Casio retro espejo 2', 'Hora fecha alarma luz Cronómetro resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '190000', '', '', '', ''),
(68, 'Loto caballero ', 'Cronografos caballero ', '', 'Cronografos 1', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(69, 'Loto caballero ', 'Cronografos caballero ', '', 'Cronografos 2', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(70, 'Loto caballero ', 'Cronografos caballero ', '', 'Cronografos 3', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '170000', '', '', '', ''),
(72, 'Loto caballero ', 'Cronografos caballero ', '', 'Cuero cronografos7', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(73, 'Loto caballero ', 'Cronografos caballero ', '', 'Cuero cronografos 8', 'Cuero cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(74, 'Loto caballero ', 'Cronografos caballero ', '', 'Cuero cronografos 9', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(75, 'Loto caballero ', 'Cronografos caballero ', '', 'Cronografos cuero3', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(76, 'Loto caballero ', 'Cronografos caballero ', '', 'Cuero cronografos2', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(77, 'Loto caballero ', 'Cronografos caballero ', '', 'Cronografos cuero1', 'Cronografos funcionales con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '160000', '', '', '', ''),
(78, 'Yess dama', 'Yess dama', '', 'Dama dorado calendario ', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '230000', '', '', '', ''),
(79, 'Yess dama', 'Yess dama', '', 'Dama dorado2', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '230000', '', '', '', ''),
(80, 'Yess dama', 'Yess dama', '', 'Negro dama', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '150000', '', '', '', ''),
(81, 'Yess dama', 'Yess dama', '', 'Plateado dama yess', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '140000', '', '', '', ''),
(82, 'Yess dama', 'Yess dama', '', 'Deportivo rosado', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(83, 'Yess dama', 'Yess dama', '', ' dama negro', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional garantía ', '100000', '', '', '', ''),
(84, 'Yess dama', 'Yess dama', '', 'dama combinado', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(87, 'Yess caballero ', 'Yess caballero ', '', 'Calendario caballero ', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '230000', '', '', '', ''),
(88, 'Yess caballero ', 'Yess caballero ', '', 'Cronografos funcionales ', 'Cronografos funcionales resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '280000', '', '', '', ''),
(89, 'Reloj caballero ', 'Yess caballero ', '', 'Deportivo calendario ', 'Deportivo con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '150000', '', '', '', ''),
(90, 'Yess caballero ', 'Yess caballero ', '', 'Calendario naranja', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '150000', '', '', '', ''),
(92, 'Yess caballero ', 'Yess caballero ', '', 'Dorado caballero ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(94, 'Yess caballero ', 'Yess caballero ', '', 'Doble hora silicona ', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '190000', '', '', '', ''),
(95, 'Yess caballero ', 'Yess caballero ', '', ' caballero 1', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(96, 'Yess caballero ', 'Yess caballero ', '', 'Caballero modelo 1', 'Cronografos funcionales resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '260000', '', '', '', ''),
(97, 'Yess caballero ', 'Yess caballero ', '', 'Deportivo negro', 'Hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(101, 'Yess caballero ', 'Yess caballero ', '', 'Negro con naranja', 'Resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '150000', '', '', '', ''),
(102, 'Yess caballero ', 'Yess caballero ', '', 'Deportivo azul', 'Hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '100000', '', '', '', ''),
(103, 'Deportivo dama ', 'Deportivo dama', '', 'Loto negro oro', 'Doble hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(104, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo rosado', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(105, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo salmon', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(106, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo dorado', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(107, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo celes', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(108, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo Negro con dorado ', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(109, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo fucsia ', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(110, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo plateado', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(111, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo dorado2', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(112, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo celes 2', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(113, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo blanco', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(114, 'Deportivo dama ', 'Deportivo dama', '', 'Deportivo blanco2', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(115, 'Digital caballero ', 'Digital caballero ', '', 'Digital azul ', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(117, 'Digital caballero ', 'Digital caballero ', '', 'Digital Rojo ', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional garantía', '70000', '', '', '', ''),
(118, 'Digital caballero ', 'Digital caballero ', '', 'Digital negro1', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(119, 'Digital caballero ', 'Digital caballero ', '', 'Digital negro2', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(120, 'Digital caballero ', 'Digital caballero ', '', 'Digital negro3', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(121, 'Digital caballero ', 'Digital caballero ', '', 'Digital verde', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(122, 'Digital caballero ', 'Digital caballero ', '', 'Digital negro4', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(123, 'Digital caballero ', 'Digital caballero ', '', 'Digital oro rosa', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(124, 'Digital caballero ', 'Digital caballero ', '', 'Digital negro6', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(125, 'Digital caballero ', 'Digital caballero ', '', 'Digital gris', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(126, 'Digital caballero ', 'Digital caballero ', '', 'Digital azul2', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(127, 'Digital caballero ', 'Digital caballero ', '', 'Digital naranja', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(128, 'Digital caballero ', 'Digital caballero ', '', 'Digital negro 8', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(129, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo negro1', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(130, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo negro2', 'Hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(131, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro y dorado ', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(132, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro y verde', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(133, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo naranja ', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(134, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro 4', 'Hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(135, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo blanco', 'Doble hora fecha Cronómetro alarma luz resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(136, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro 7', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(137, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro 5', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(138, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo rojo', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(139, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo blanco2', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(140, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro y blanco', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(141, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro y rojo', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(142, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo Negro y dorado ', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(143, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo azul3', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(144, 'Deportivo caballero ', 'Deportivo caballero ', '', 'Deportivo pulso azul ', 'Doble hora fecha Cronómetro alarma luz resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '105000', '', '', '', ''),
(145, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Plateado números ', 'Pulso acero inoxidable caja pasta resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(146, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Dorado pal', 'Pulso acero inoxidable caja pasta resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(147, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Dama oro rosa', 'Pulso acero inoxidable caja pasta resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(148, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Calendario fondo azul', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(149, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Calendario fondo blanco', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(150, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Fondo azul numero ', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '130000', '', '', '', ''),
(151, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Retro plateado ', 'Retro resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '95000', '', '', '', ''),
(152, 'Reloj Q&Q dama ', 'Relojes dama ', '', 'Retro azul', 'Retro resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '110000', '', '', '', ''),
(153, 'Reloj dama ', 'Relojes dama ', '', 'Deportivo amarillo ', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '75000', '', '', '', ''),
(154, 'Reloj dama ', 'Relojes dama ', '', 'Deportivo celeste', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila ', '75000', '', '', '', ''),
(155, 'Reloj dama ', 'Relojes dama ', '', 'Deportivo naranja', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '75000', '', '', '', ''),
(156, 'Reloj dama ', 'Relojes dama ', '', 'Dama combinado ', 'Pulso acero inoxidable caja aloy resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '90000', '', '', '', ''),
(157, 'Reloj', 'Relojes dama ', '', 'Reloj morado', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila ', '70000', '', '', '', ''),
(158, 'Reloj', 'Relojes dama ', '', 'Deportivo verdad ', 'Resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '70000', '', '', '', ''),
(159, 'Reloj ', 'Relojes dama ', '', 'Retro negro ', 'Qyq retro resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '110000', '', '', '', ''),
(160, 'Reloj con calendario ', 'Relojes dama ', '', 'Calendario rojo', 'Con calendario resistente al agua 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(161, 'Reloj con calendario ', 'Relojes dama ', '', 'Calendario vinotinto ', 'Con calendario resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(162, 'Reloj con calendario ', 'Relojes dama ', '', 'Calendario morado ', 'Con calendario resistente al agua sumergible 10 meses de garantía por maquinaria incluye estuche y pila adicional ', '85000', '', '', '', ''),
(163, 'Pareja QyQ dorada 1', 'Catalogo pareja', '', 'Pareja dorada 1', 'Incluye estuche y pila adicional ', '230000', '', '', '', ''),
(164, 'Pareja QyQ 2', 'Catalogo pareja', '', 'Pareja dorada 2', 'Incluye estuche y pila adicional ', '230000', '', '', '', ''),
(165, 'Pareja QyQ 3 ', 'Catalogo pareja', '', 'Pareja dorada 3', 'Incluye estuche y pila adicional ', '230000', '', '', '', ''),
(166, 'Pareja QyQ 4', 'Catalogo pareja', '', 'Pareja dorada 4', 'Incluye estuche y pila adicional ', '230000', '', '', '', ''),
(167, 'Caballero dorada', 'Catalogo caballero ', '', 'Dorado caballero ', 'Incluye estuche y pila adicional ', '110000', '', '', '', ''),
(168, 'Dama 1', 'Relojes dama ', '', 'Dama azul 1', 'Incluye estuche y pila adicional ', '105000', '', '', '', ''),
(169, 'Caballero pavonado', 'Catalogo caballero', '', 'Pavonado 2', 'Incluye estuche y pila adicional', '100000', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `pago_credito` varchar(200) DEFAULT '',
  `imagen` varchar(100) NOT NULL,
  `imagen_mas_texto` varchar(100) DEFAULT NULL,
  `ref_producto` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `promociones`
--

INSERT INTO `promociones` (`id`, `descripcion`, `pago_credito`, `imagen`, `imagen_mas_texto`, `ref_producto`, `categoria`) VALUES
(11, 'Pago contra entrega ', '', 'Imagenes_productos/png_20230109_214829_0000.png', NULL, '11', NULL),
(13, 'Pareja fondo negro : $ 135.000', '', 'Imagenes_productos/Screenshot_20221220_184937.jpg', NULL, '20', NULL),
(14, 'Qyq pavonado : $ 115.000', '', 'Imagenes_productos/modelo5.jpg', NULL, '59', NULL),
(20, 'Qyq dama plateado: $ 100.000', '', 'Imagenes_productos/Screenshot_20221222_174601.jpg', NULL, '12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('UBCnlCmnTKanBAYfzQY7gRrHaMmvIbGDgI1eCEEp', NULL, '2800:484:438b:2272:501a:8e81:dc04:90cb', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0ZwSmZsZW1rc3YwTXppeEI0OGJ5TkdwUzRFaTNIeVZSeWxBSkQ3ciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1684809581);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_clientes`
--

CREATE TABLE `telefonos_clientes` (
  `id` int(11) NOT NULL,
  `cedula` int(11) NOT NULL,
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `telefonos_clientes`
--

INSERT INTO `telefonos_clientes` (`id`, `cedula`, `telefono`) VALUES
(115, 1044394327, '3113148884'),
(117, 80160210, '3133405102');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_pagina`
--

CREATE TABLE `telefonos_pagina` (
  `id` int(11) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `telefonos_pagina`
--

INSERT INTO `telefonos_pagina` (`id`, `telefono`) VALUES
(1, '3142214979');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Delcy', 'Jusamstore@hotmail.com', NULL, '$2y$10$9/PtS8q.CjXSp8BE7NugVuFbqqynJt4P4Wdczmg0xfLAQfHG2qQZK', 'mcVlG1eDUnbqINT7PORpb3Kyr6dZ0pVoDElfuJwmYWkC8WBzifnEqHoFb7tW', '2023-05-23 07:11:14', '2023-05-23 07:11:14');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesores`
--
ALTER TABLE `asesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `crear_clave`
--
ALTER TABLE `crear_clave`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `Imagenes_productos`
--
ALTER TABLE `Imagenes_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `info_pagina`
--
ALTER TABLE `info_pagina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista_compras`
--
ALTER TABLE `lista_compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista_productos_comprados`
--
ALTER TABLE `lista_productos_comprados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `departamento_id` (`departamento_id`);

--
-- Indices de la tabla `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `preguntas_sobre_productos`
--
ALTER TABLE `preguntas_sobre_productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indices de la tabla `telefonos_clientes`
--
ALTER TABLE `telefonos_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `telefonos_pagina`
--
ALTER TABLE `telefonos_pagina`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asesores`
--
ALTER TABLE `asesores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT de la tabla `carrito_compras`
--
ALTER TABLE `carrito_compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `crear_clave`
--
ALTER TABLE `crear_clave`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Imagenes_productos`
--
ALTER TABLE `Imagenes_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `info_pagina`
--
ALTER TABLE `info_pagina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `lista_compras`
--
ALTER TABLE `lista_compras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `lista_productos_comprados`
--
ALTER TABLE `lista_productos_comprados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `municipios`
--
ALTER TABLE `municipios`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1127;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas_sobre_productos`
--
ALTER TABLE `preguntas_sobre_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `telefonos_clientes`
--
ALTER TABLE `telefonos_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `telefonos_pagina`
--
ALTER TABLE `telefonos_pagina`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
