-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2024 a las 22:37:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nou-bombonet1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `booking_date` datetime NOT NULL,
  `num_diners` int(11) NOT NULL,
  `booking_state` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bookings`
--

INSERT INTO `bookings` (`id`, `id_user`, `booking_date`, `num_diners`, `booking_state`, `created_at`, `updated_at`) VALUES
(1, 3, '2024-06-16 23:30:00', 3, 'Ready', '2024-06-16 19:33:25', '2024-06-16 19:33:25'),
(2, 2, '2024-06-16 23:35:00', 2, 'Ready', '2024-06-16 19:35:07', '2024-06-16 19:35:07'),
(3, 7, '2024-06-16 23:37:00', 2, 'Canceled', '2024-06-16 19:37:06', '2024-06-16 19:37:06'),
(4, 1, '2024-06-25 11:00:00', 5, 'Ready', '2024-06-25 14:43:23', '2024-06-25 14:43:23'),
(5, 1, '2024-06-06 09:30:00', 2, 'Ready', '2024-06-25 14:44:26', '2024-06-25 14:44:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '2024_04_25_154600_products_table', 1),
(4, '2024_04_25_154652_orders_table', 1),
(5, '2024_04_25_154748_order_details_table', 1),
(6, '2024_04_25_154937_bookings_table', 1),
(7, '2024_05_22_180618_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `state` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `carry` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `orders`
--

INSERT INTO `orders` (`id`, `id_user`, `date`, `state`, `total`, `carry`, `created_at`, `updated_at`) VALUES
(1, 3, '2024-06-03 22:00:00', 'Received', 10.00, 0, '2024-06-16 19:29:58', '2024-06-17 09:52:07'),
(2, 6, '2024-08-14 22:00:00', 'Received', 13.00, 1, '2024-06-16 19:30:36', '2024-06-17 09:51:57'),
(3, 1, '2024-06-24 16:01:00', 'Ready', 50.00, 1, '2024-06-24 14:01:43', '2024-06-24 14:01:43'),
(6, 2, '2024-06-24 16:39:34', 'Received', 20.00, 0, '2024-06-24 16:39:34', '2024-06-24 16:39:34'),
(7, 2, '2024-06-24 21:29:25', 'Received', 58.50, 0, '2024-06-24 21:29:25', '2024-06-24 21:29:25'),
(8, 1, '2024-06-25 12:48:27', 'Received', 20.00, 0, '2024-06-25 12:48:27', '2024-06-25 12:48:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_order` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `amount` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `specs` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `order_details`
--

INSERT INTO `order_details` (`id`, `id_order`, `id_product`, `amount`, `unit_price`, `specs`, `created_at`, `updated_at`) VALUES
(1, 2, 27, 1, 6.50, NULL, NULL, NULL),
(2, 1, 8, 2, 5.00, NULL, NULL, NULL),
(3, 2, 30, 1, 6.50, NULL, NULL, NULL),
(5, 6, 19, 1, 7.00, NULL, '2024-06-24 16:39:34', '2024-06-24 16:39:34'),
(6, 6, 20, 1, 6.00, NULL, '2024-06-24 16:39:34', '2024-06-24 16:39:34'),
(7, 6, 18, 1, 7.00, NULL, '2024-06-24 16:39:35', '2024-06-24 16:39:35'),
(8, 7, 3, 3, 4.50, NULL, '2024-06-24 21:29:26', '2024-06-24 21:29:26'),
(9, 7, 15, 3, 8.50, NULL, '2024-06-24 21:29:26', '2024-06-24 21:29:26'),
(10, 7, 11, 1, 7.50, NULL, '2024-06-24 21:29:26', '2024-06-24 21:29:26'),
(11, 7, 22, 1, 6.00, NULL, '2024-06-24 21:29:26', '2024-06-24 21:29:26'),
(12, 7, 21, 1, 6.00, NULL, '2024-06-24 21:29:27', '2024-06-24 21:29:27'),
(13, 8, 16, 1, 7.50, NULL, '2024-06-25 12:48:27', '2024-06-25 12:48:27'),
(14, 8, 17, 1, 5.50, NULL, '2024-06-25 12:48:28', '2024-06-25 12:48:28'),
(15, 8, 18, 1, 7.00, NULL, '2024-06-25 12:48:28', '2024-06-25 12:48:28');

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

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'AuthToken', '5022493f4ba88f764ec655899c3b2974eafc72dfc9f6853631b269b194087305', '[\"*\"]', NULL, NULL, '2024-05-24 10:04:00', '2024-05-24 10:04:00'),
(2, 'App\\Models\\User', 3, 'AuthToken', '98bb262807482d1e5200e4a21a44ddf5ac846be13998f1cde3f0994cec1cea49', '[\"*\"]', NULL, NULL, '2024-05-24 10:11:58', '2024-05-24 10:11:58'),
(3, 'App\\Models\\User', 1, 'AuthToken', 'b3c1d543750ee823a2da415b636e2a02adb0f54da97c2866e23eacb6d379a89c', '[\"*\"]', NULL, NULL, '2024-05-29 15:02:36', '2024-05-29 15:02:36'),
(4, 'App\\Models\\User', 1, 'AuthToken', 'd26d268aa29035fb9476973e26bdae4ba5038ef56c28f8219580d26ca3c56855', '[\"*\"]', NULL, NULL, '2024-05-29 15:38:41', '2024-05-29 15:38:41'),
(5, 'App\\Models\\User', 1, 'AuthToken', 'fbc37ab0dc0416da8a99d6751bd1e217cb36f74f07eebae01aa7d767f7626ccc', '[\"*\"]', NULL, NULL, '2024-05-29 15:46:46', '2024-05-29 15:46:46'),
(6, 'App\\Models\\User', 1, 'AuthToken', 'ed46d16ceda90c220647f024025e13a18536638a2a863453eeadece4f5fcee4f', '[\"*\"]', '2024-05-29 15:52:10', NULL, '2024-05-29 15:49:06', '2024-05-29 15:52:10'),
(7, 'App\\Models\\User', 1, 'AuthToken', 'dd6fdf5093aa3f2c1f2e9019796c1388107ac37e8aa84eff60ac96a257837fcd', '[\"*\"]', NULL, NULL, '2024-05-29 15:56:51', '2024-05-29 15:56:51'),
(8, 'App\\Models\\User', 1, 'AuthToken', 'c930cb7762a25760d91a38f716ca6b97f0dbbd2f51adfb9ec67646e144b92e15', '[\"*\"]', '2024-05-29 16:15:56', NULL, '2024-05-29 15:58:24', '2024-05-29 16:15:56'),
(9, 'App\\Models\\User', 1, 'AuthToken', '814689359467252dc305c2297c9a66e9cd7fd16749862cb03079559679bcb7c9', '[\"*\"]', '2024-06-10 05:32:19', NULL, '2024-06-10 05:32:18', '2024-06-10 05:32:19'),
(10, 'App\\Models\\User', 1, 'AuthToken', 'c0db6272881697ba2f1032010adea123bcd87a58d5d6c87923865b736fc770dd', '[\"*\"]', '2024-06-11 13:44:09', NULL, '2024-06-11 13:44:08', '2024-06-11 13:44:09'),
(11, 'App\\Models\\User', 1, 'AuthToken', 'dd1bbce1d0bc94ef55fb0b9a74004da4b76ec71eb02ca1eaef0173e954f3936c', '[\"*\"]', '2024-06-12 08:33:04', NULL, '2024-06-12 08:33:04', '2024-06-12 08:33:04'),
(12, 'App\\Models\\User', 1, 'AuthToken', '0c6c676626e01ec633003827b4b5a2ed3ca1e23d754df2e2907bdc6e528b21dd', '[\"*\"]', '2024-06-13 05:56:05', NULL, '2024-06-13 05:56:04', '2024-06-13 05:56:05'),
(13, 'App\\Models\\User', 1, 'AuthToken', '9d2d3b3b69e17e6d80b2317de50d7ebf4d73110de1ff1587175f3d1bc040f6dd', '[\"*\"]', '2024-06-16 17:56:20', NULL, '2024-06-16 17:56:19', '2024-06-16 17:56:20'),
(14, 'App\\Models\\User', 1, 'AuthToken', 'a89ebec3d03e80b133ae30de059625ef366fcfdaf2f60a4e156a597b494ad777', '[\"*\"]', '2024-06-16 18:53:17', NULL, '2024-06-16 18:53:16', '2024-06-16 18:53:17'),
(15, 'App\\Models\\User', 1, 'AuthToken', 'ce29751bd531eee6ff67151179bdd066ba4f8f9ccdf47fc1a137508a837e68d8', '[\"*\"]', '2024-06-16 19:08:49', NULL, '2024-06-16 19:08:49', '2024-06-16 19:08:49'),
(16, 'App\\Models\\User', 1, 'AuthToken', 'a1854798fced52544497321c0735f94d8db5547bd130f17d8821b6abff9cf1b4', '[\"*\"]', '2024-06-16 19:17:16', NULL, '2024-06-16 19:17:16', '2024-06-16 19:17:16'),
(17, 'App\\Models\\User', 1, 'AuthToken', '7f13c07493f4cab5ec4ecd218087bfcc84a6b4fa73b3e9e0dfc96e1df7e32381', '[\"*\"]', '2024-06-16 19:29:30', NULL, '2024-06-16 19:29:30', '2024-06-16 19:29:30'),
(18, 'App\\Models\\User', 2, 'AuthToken', 'c98cd105abed3bc550870065266b73ce34e2854cab2f71e93019949861055c02', '[\"*\"]', '2024-06-17 09:04:29', NULL, '2024-06-17 08:47:06', '2024-06-17 09:04:29'),
(19, 'App\\Models\\User', 1, 'AuthToken', 'e2a7214194db05935c7a910e14e8630da12183f24418308373c1ec92ecada33d', '[\"*\"]', '2024-06-17 09:04:56', NULL, '2024-06-17 09:04:55', '2024-06-17 09:04:56'),
(20, 'App\\Models\\User', 2, 'AuthToken', '3520ae13030b75ed2a8c05720eb7579fc5fbb17e7985fe2379e991ed35f62444', '[\"*\"]', '2024-06-17 09:06:16', NULL, '2024-06-17 09:05:56', '2024-06-17 09:06:16'),
(21, 'App\\Models\\User', 1, 'AuthToken', '252141b06a8c814b96473993ae176d424745809bc91b82f899278579c0c5b1c5', '[\"*\"]', '2024-06-17 15:57:51', NULL, '2024-06-17 09:10:05', '2024-06-17 15:57:51'),
(22, 'App\\Models\\User', 1, 'AuthToken', '13b281bf66ef946645c37d61cbdd4d193c1697c4b705eadcc880228e19714e20', '[\"*\"]', '2024-06-17 17:57:16', NULL, '2024-06-17 16:20:45', '2024-06-17 17:57:16'),
(23, 'App\\Models\\User', 1, 'AuthToken', 'c37213704fa85708f73e06439e66dc9fe19a0f91f691401c0faeb6814102d081', '[\"*\"]', NULL, NULL, '2024-06-18 15:12:48', '2024-06-18 15:12:48'),
(24, 'App\\Models\\User', 2, 'AuthToken', '845b0cd0848a5323b2aca15101f76f80ac50dfbbf91ba0b2eb0af7edd8d63284', '[\"*\"]', NULL, NULL, '2024-06-18 15:33:11', '2024-06-18 15:33:11'),
(25, 'App\\Models\\User', 1, 'AuthToken', '2d4f71bc37a9d00e1342d99ceb38895d0dfcf12789df25889e02104b0ea9c1f3', '[\"*\"]', '2024-06-18 15:34:40', NULL, '2024-06-18 15:34:37', '2024-06-18 15:34:40'),
(26, 'App\\Models\\User', 2, 'AuthToken', '4fd0316c27709457db5db748ae410bcf1820c3955f9ea29b330277dd55e738d8', '[\"*\"]', NULL, NULL, '2024-06-18 15:37:01', '2024-06-18 15:37:01'),
(27, 'App\\Models\\User', 1, 'AuthToken', '79264ade5da5ebd41a818a45af7d833cdaf0fb645cad1e4403d597610336ddfb', '[\"*\"]', '2024-06-18 17:16:49', NULL, '2024-06-18 15:42:21', '2024-06-18 17:16:49'),
(28, 'App\\Models\\User', 1, 'AuthToken', '565e206de0ba735b4274a9080da90ad008a09667f9b13a838a8f3e83de6687a9', '[\"*\"]', '2024-06-18 17:54:51', NULL, '2024-06-18 17:33:51', '2024-06-18 17:54:51'),
(29, 'App\\Models\\User', 1, 'AuthToken', '95e7f75bd3d21995a7d819535faacbce21e2678730c0e60a444786738cbe1e37', '[\"*\"]', '2024-06-21 14:57:36', NULL, '2024-06-19 09:14:10', '2024-06-21 14:57:36'),
(30, 'App\\Models\\User', 1, 'AuthToken', '9b2240e3e2b7698288bc482a432b4499da665429903e37492722be658a323415', '[\"*\"]', '2024-06-21 16:02:24', NULL, '2024-06-21 15:18:36', '2024-06-21 16:02:24'),
(31, 'App\\Models\\User', 1, 'AuthToken', '0e59dc636e42df667afc739f6776e1ad5e70133cc66fbd826ffea70f6836bc22', '[\"*\"]', '2024-06-23 22:45:07', NULL, '2024-06-21 16:02:51', '2024-06-23 22:45:07'),
(32, 'App\\Models\\User', 1, 'AuthToken', 'bdd52b215cc6031da6634e613ccaa1a5882e7e8d85de67bab7a879f9ee90f249', '[\"*\"]', '2024-06-24 13:31:07', NULL, '2024-06-24 00:55:01', '2024-06-24 13:31:07'),
(33, 'App\\Models\\User', 1, 'AuthToken', '3f5cd3299e1d27d2ecedf656435af5381ee9ab1dbda70f7c82e91f4bd78411ae', '[\"*\"]', NULL, NULL, '2024-06-24 13:43:37', '2024-06-24 13:43:37'),
(34, 'App\\Models\\User', 1, 'AuthToken', '3c5608ba5051e96c84025a77b51f9a4138184a6f2019685eb00c0f43adecd1ca', '[\"*\"]', NULL, NULL, '2024-06-24 13:49:34', '2024-06-24 13:49:34'),
(35, 'App\\Models\\User', 1, 'AuthToken', '72d3892dc55c8fb9bb8bd35ce3e19ae42f6d3ab0614d6181bfea97cc79d5f5cf', '[\"*\"]', '2024-06-24 14:01:00', NULL, '2024-06-24 13:54:19', '2024-06-24 14:01:00'),
(36, 'App\\Models\\User', 6, 'AuthToken', '3f7335700867fcf7102394928a3a9263ea118ea86c1fbbb5fcdcba825e15c5e0', '[\"*\"]', NULL, NULL, '2024-06-24 14:28:38', '2024-06-24 14:28:38'),
(37, 'App\\Models\\User', 1, 'AuthToken', 'b7a1f1b43956f1e50aeab9ddd2f4f88d143f36f905b9c29a6219283cb618a559', '[\"*\"]', '2024-06-24 15:38:52', NULL, '2024-06-24 15:38:49', '2024-06-24 15:38:52'),
(38, 'App\\Models\\User', 2, 'AuthToken', '25a8fdd69e2e2b000683347fbf71c54be99f9097acea5b4d5ee07fd4f13e17a6', '[\"*\"]', NULL, NULL, '2024-06-24 15:40:18', '2024-06-24 15:40:18'),
(39, 'App\\Models\\User', 1, 'AuthToken', '3acd297dd250c4fc03773811f8ebe4f3d53366b5ae074dc9e59c10d6a60b45f9', '[\"*\"]', '2024-06-24 23:22:28', NULL, '2024-06-24 21:37:39', '2024-06-24 23:22:28'),
(40, 'App\\Models\\User', 2, 'AuthToken', '0d57cdde91c9cb2aece16cd29a75dd2316f08d9fedd410bb0ceb98192c2a5c04', '[\"*\"]', NULL, NULL, '2024-06-24 23:29:27', '2024-06-24 23:29:27'),
(41, 'App\\Models\\User', 1, 'AuthToken', '6a0d3ca4387fa3e75f0481be79e65d7496732ea72b823a132de9ac2512a22fc4', '[\"*\"]', '2024-06-24 23:57:42', NULL, '2024-06-24 23:57:34', '2024-06-24 23:57:42'),
(42, 'App\\Models\\User', 1, 'AuthToken', 'da62dc6c29ee34959a6f6cae6816bf239ece004182a5f6df5c600035352e4cde', '[\"*\"]', '2024-06-25 17:08:36', NULL, '2024-06-25 14:14:17', '2024-06-25 17:08:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name_product`, `description`, `price`, `category`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Gofre sencillo', '1 topping a elegir', 3.00, 'Meriendas', 'waffle1.jpg', NULL, '2024-06-13 06:20:22'),
(2, 'Gofre completo', '2 topping a elegir', 3.50, 'Meriendas', 'waffle2.jpg', '2024-06-13 07:15:19', '2024-06-13 07:15:19'),
(3, 'Gofre especial', '2 topping a elegir más helado', 4.50, 'Meriendas', 'waffle3.jpg', '2024-06-13 07:18:28', '2024-06-13 07:18:28'),
(4, 'Batidos sencillos', 'Fresa, Chocolate/Blanco, Dulce de leche', 3.50, 'Meriendas', 'batidos1.jpg', NULL, '2024-06-17 17:58:40'),
(5, 'Batidos especiales', 'Ferrero, Unicornio, M&M\'s, Oreo, Kit Kat', 4.50, 'Meriendas', 'batidos2.jpg', NULL, NULL),
(6, 'Tarrina de helado', 'Pequeña', 2.40, 'Meriendas', 'tarrina1.jpg', '2024-06-13 07:30:17', '2024-06-13 07:30:17'),
(7, 'Tarrina de helado', 'Mediana', 3.25, 'Meriendas', 'tarrina2.jpg', '2024-06-13 07:30:49', '2024-06-13 07:30:49'),
(8, 'Bravas', NULL, 5.00, 'Tapas', 'bravas.jpg', '2024-06-13 07:33:40', '2024-06-13 07:33:40'),
(9, 'Morro', NULL, 6.50, 'Tapas', 'morro.jpg', '2024-06-13 07:40:34', '2024-06-13 07:40:34'),
(10, 'Rabo', NULL, 7.50, 'Tapas', 'rabo.jpg', '2024-06-13 07:40:58', '2024-06-13 07:40:58'),
(11, 'Calamar rebozado', NULL, 7.50, 'Tapas', 'calamar.jpg', '2024-06-13 07:41:29', '2024-06-13 07:41:29'),
(12, 'Tellinas', NULL, 9.50, 'Tapas', 'tellinas.jpg', '2024-06-13 07:42:03', '2024-06-13 07:42:03'),
(13, 'Carne en salsa', NULL, 6.50, 'Tapas', 'carne.jpg', '2024-06-13 07:45:04', '2024-06-13 07:45:04'),
(14, 'Cazuela de pinchos morunos', NULL, 5.50, 'Tapas', 'cazuela.jpg', '2024-06-13 07:45:34', '2024-06-13 07:45:34'),
(15, 'Chipirón plancha', NULL, 8.50, 'Tapas', 'chipiron.jpg', '2024-06-13 07:46:08', '2024-06-13 07:46:08'),
(16, 'Puntilla', NULL, 7.50, 'Tapas', 'puntilla.jpg', '2024-06-13 07:58:37', '2024-06-13 07:58:37'),
(17, 'Palitos de berenjena a la miel', NULL, 5.50, 'Tapas', 'berenjena.jpg', '2024-06-13 07:59:21', '2024-06-13 07:59:21'),
(18, 'Fingers de pollo', NULL, 7.00, 'Tapas', 'fingers.jpg', '2024-06-13 07:59:43', '2024-06-13 07:59:43'),
(19, 'Queso frito', NULL, 7.00, 'Tapas', 'queso.jpg', '2024-06-13 07:59:58', '2024-06-13 07:59:58'),
(20, 'Patatas rancheras', NULL, 6.00, 'Tapas', 'rancheras.jpg', '2024-06-13 08:00:20', '2024-06-13 08:00:20'),
(21, 'Patatas BBQ', NULL, 6.00, 'Tapas', 'bbq.jpg', '2024-06-13 08:00:44', '2024-06-13 08:00:44'),
(22, 'Chivito', 'Lomo, bacon, lechuga, tomate, huevo y mayonesa', 6.00, 'Bocadillos', 'chivito.jpg', '2024-06-13 08:21:01', '2024-06-13 08:21:01'),
(23, 'Brascada', 'Ternera, cebolla y jamón', 6.50, 'Bocadillos', 'brascada.jpg', '2024-06-13 08:21:40', '2024-06-13 08:21:40'),
(24, 'Calamares', NULL, 6.00, 'Bocadillos', 'calamares.jpg', '2024-06-13 08:22:04', '2024-06-13 08:22:04'),
(25, 'Almussafes', 'Sobrasada, cebolla y queso', 5.50, 'Bocadillos', 'almussafes.jpg', '2024-06-13 08:22:36', '2024-06-13 08:22:36'),
(26, 'El Fort', 'Lomo, berenjena rebozada y roquefort', 6.50, 'Especiales', 'fort.jpg', '2024-06-13 08:23:26', '2024-06-13 08:23:26'),
(27, 'El Pollet', 'Pechuga, queso cheddar, bacon, cebolla crujiente y BBQ', 6.50, 'Especiales', 'pollet.jpg', '2024-06-13 08:24:09', '2024-06-13 08:24:09'),
(28, 'Bombonet', 'Pechuga, cebolla, queso cabra y calabacín', 6.50, 'Especiales', 'bombonet.jpg', '2024-06-13 08:24:42', '2024-06-13 08:24:42'),
(29, 'El Caballer', 'Caballo, patatas y ajos tiernos', 6.50, 'Especiales', 'caballer.jpg', '2024-06-13 08:25:18', '2024-06-13 08:25:18'),
(30, 'El Campechá', 'Ternera, pimiento, queso y huevo', 6.50, 'Especiales', 'campecha.jpg', '2024-06-13 08:25:59', '2024-06-13 08:25:59'),
(31, 'El Serranet', 'Lomo, jamón, pimiento y tomate', 6.50, 'Especiales', 'serranet.jpg', '2024-06-13 08:26:33', '2024-06-13 08:26:33');

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
('FCKGpDQ9v6UFc8K2wrY3QXWuNmnSHHoSowoEi5OA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmVicFRmWEU2NEFyWFNiV2NHeEFCcXNVc3JxTDdUWGdPUzhJdFdiZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718189677),
('FDFdZKXra5X2ltYgyjHm4FMIHmpXRamGNIaGg6Kb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVWs3ZGFJS1N6Z2gyNU9NUmo0b0xYdHFLSTFITlRLRUg3blJkalpHUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1715686165),
('G4nvJKJTTSNMod2jxX5g5ABQcr773zJsJGOLpaAJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQks3QnNVM3NvdU14MnE0cFV2Tk00ajFYaDhWdDkxTVNCak00S0hmdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1716486785),
('o5FB1oJx3D4eEyISudzAxYXhclqCT0dsVvZCJ0mq', NULL, '127.0.0.1', 'PostmanRuntime/7.38.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTJCaHo2R3FiZnU2cVkwSkJQYXlMOEw3bUdYcGlnVlZOMVlPbEdJdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1718620663),
('OCCzedCwRhstWWBOvk0yOVyatNzEZjbWzWDkKFCP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicFJ6ZFVmTFBkUzBmTlZhdjVMYTk3RUpiYnRFaDZReEJCbEdkbWZ4SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1716550372);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `usertype` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(9) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `usertype`, `email_verified_at`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$h9RrPuI6p7r.bBLoitzAA.P6c.7gfwdlpCHGPUvmgPHCCt1xYS5qi', '999999999', NULL, '2024-05-14 07:34:29', '2024-06-12 10:11:59'),
(2, 'Dario', 'dario@gmail.com', 'user', NULL, '$2y$12$bZEXpywzz83aU/X74j/HYOyVFM8PhCvQe62NDfVnQoYpZcd8w3E66', '626478375', NULL, '2024-05-14 07:35:04', '2024-06-12 13:44:21'),
(3, 'Carlos', 'carlos@gmail.com', 'user', NULL, '$2y$12$qvaunIivseKTNEXluvMJQ.1BttjHU8qq9uqw5/XBp8AOtiAquW0DK', '123123123', NULL, '2024-05-24 10:11:58', '2024-06-12 10:12:12'),
(6, 'juana', 'juana@gmail.com', 'user', NULL, '$2y$12$Ct3cYdN3MvgNuzb/18Es8umRj8NrQGpZNZHBYcEx5mF1OPuMs/wxu', '147258369', NULL, '2024-06-12 16:29:03', '2024-06-12 16:32:58'),
(7, 'Pepe', 'lol@gmail.com', 'admin', NULL, '$2y$12$V/XsV6rbAgmgUqXH5KodG.rVyfdXzbryzX8ms8iQMlrbowwKWfM9G', '123456789', NULL, '2024-06-12 16:34:20', '2024-06-13 06:09:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_id_order_foreign` (`id_order`),
  ADD KEY `order_details_id_product_foreign` (`id_product`);

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
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT de la tabla `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
