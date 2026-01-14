-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 14, 2026 at 05:20 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simvent`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `asset_id` int NOT NULL,
  `asset_name` varchar(100) NOT NULL,
  `qty` int NOT NULL,
  `unit` varchar(20) NOT NULL,
  `condition` enum('Baik','Rusak') NOT NULL,
  `entry_date` date NOT NULL,
  `item_desc` text,
  `room_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`asset_id`, `asset_name`, `qty`, `unit`, `condition`, `entry_date`, `item_desc`, `room_id`) VALUES
(1, 'PC Rakitan Core i5', 20, 'Unit', 'Baik', '2024-01-10', 'Intel Core i5, RAM 8GB, SSD 256GB', 1),
(2, 'Bola Basket Molten', 5, 'Buah', 'Baik', '2024-02-15', 'Ukuran 7 Standar Pertandingan', 2),
(3, 'Proyektor Epson', 3, 'Unit', 'Rusak', '2026-01-04', 'Lensa agak buram', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `room_desc`) VALUES
(1, 'Lab Komputer Utama', 'Lantai 2, AC Baru'),
(2, 'Gudang Olahraga', 'Sebelah Lapangan Basket'),
(6, 'Lab Fisika', 'Lantai 2');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `full_name`) VALUES
(1, 'admin', '$2y$10$Ob.dP4O4X5.XWsYMU.Is6Oj7GbuibaQo5henEVZHdlXE4TN248kwm', 'Administrator Utama');

-- --------------------------------------------------------

--
-- Table structure for table `usertokens`
--

CREATE TABLE `usertokens` (
  `token_id` int NOT NULL,
  `user_id` int NOT NULL,
  `token` text NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usertokens`
--

INSERT INTO `usertokens` (`token_id`, `user_id`, `token`, `expires_at`, `created_at`) VALUES
(1, 1, 'f59622d464fd7cf86bef0f7c6f21f46508df5a3455e813d2c81a0e3ddd5f246a', '2025-12-23 03:56:49', '2025-12-22 10:56:49'),
(2, 1, '92a6ee735ce98adbcf78f51fb92b35d1810d4008a8a24c46d7a4bbec09d0dc4e', '2025-12-25 14:30:00', '2025-12-24 21:30:00'),
(3, 1, 'dummy_token_1766853167', '2025-12-27 17:32:47', '2025-12-27 23:32:47'),
(4, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzNjg4LCJleHAiOjE3NjY5NDAwODgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.elYHN4mneWqtfeUR7tjy62JnMkMCB7PWXvfEUSlrngU', '2025-12-28 16:41:28', '2025-12-27 23:41:28'),
(5, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzNjkwLCJleHAiOjE3NjY5NDAwOTAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.YksaVnpj7ku-ORiC_qtTFQFjd7oMjJnPSwefHLRr9Zw', '2025-12-28 16:41:30', '2025-12-27 23:41:30'),
(6, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzNjkxLCJleHAiOjE3NjY5NDAwOTEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.oQ7MuxSsYFrvNO90bxRsK1ZfIblwxNHy2PKbnc6i1dg', '2025-12-28 16:41:31', '2025-12-27 23:41:31'),
(7, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzNjkxLCJleHAiOjE3NjY5NDAwOTEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.oQ7MuxSsYFrvNO90bxRsK1ZfIblwxNHy2PKbnc6i1dg', '2025-12-28 16:41:31', '2025-12-27 23:41:31'),
(8, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzNzA5LCJleHAiOjE3NjY5NDAxMDksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.j1SRtHVcXCH5353OsxDp7w8ucCGPDtOXRs2Sl0_PPK4', '2025-12-28 16:41:49', '2025-12-27 23:41:49'),
(9, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzNzEzLCJleHAiOjE3NjY5NDAxMTMsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.M3YbiuVYWbz5OHkx4IbuE-s9eqVNK1DyVzsT-1N7Xzo', '2025-12-28 16:41:53', '2025-12-27 23:41:53'),
(10, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODUzODI5LCJleHAiOjE3NjY5NDAyMjksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.4etWtUaR4cO_PZ4BRye2z2nSWJdugEVKPfsaMIDrvbw', '2025-12-28 16:43:49', '2025-12-27 23:43:49'),
(11, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODU2MjUwLCJleHAiOjE3NjY5NDI2NTAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.qsE1Yr1dg5gh4SsdI-XGb0huIUb5PRNI96L8OnFZeOc', '2025-12-28 17:24:10', '2025-12-28 00:24:10'),
(12, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODU2OTAwLCJleHAiOjE3NjY5NDMzMDAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.3PVBS0b2EVInrirjuis8hZG0GLCq5OSOM8VIU8Xe2SY', '2025-12-28 17:35:00', '2025-12-28 00:35:00'),
(14, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODYwOTM5LCJleHAiOjE3NjY5NDczMzksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.sSnueJdsbLFWe3rI45XDr8HD8BTh6knZLIoZ39aGBHM', '2025-12-28 18:42:19', '2025-12-28 01:42:19'),
(15, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODYxMTY4LCJleHAiOjE3NjY5NDc1NjgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.CSHdxnZhvHhBcD7k9C0tkMyQC-HmLQHUQhBkQKhKywo', '2025-12-28 18:46:08', '2025-12-28 01:46:08'),
(16, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODYxMjM4LCJleHAiOjE3NjY5NDc2MzgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.hyrt6OG37lAO9glCMDX_LireJWL8w583K1DvgcVRvo0', '2025-12-28 18:47:18', '2025-12-28 01:47:18'),
(17, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODYxMzUwLCJleHAiOjE3NjY5NDc3NTAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.mFJsZMHB_ENeQExnBCsU2CqA_8pm3vgE3n3MwB4Ovhc', '2025-12-28 18:49:10', '2025-12-28 01:49:10'),
(19, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2ODYxNTAxLCJleHAiOjE3NjY5NDc5MDEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.b4266K1k4zTQuoLjC3gxt5EMAoXwUf76gop7k2P9Tto', '2025-12-28 18:51:41', '2025-12-28 01:51:41'),
(21, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQwNzY1LCJleHAiOjE3NjcwMjcxNjUsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.voMYr5xZqDRFM0SdkmKatc_Twb262fjF3Dq9ZE5BgPw', '2025-12-29 16:52:45', '2025-12-28 23:52:45'),
(22, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxMTg5LCJleHAiOjE3NjcwMjc1ODksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.bXRdQgVjratqDeJkdJAc_zKFId57njn71vRBiwlW_vQ', '2025-12-29 16:59:49', '2025-12-28 23:59:49'),
(23, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxNjM1LCJleHAiOjE3NjcwMjgwMzUsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.TQdAmpoN_GoV2H4IOg41dg_CtEKFu73afViRf3ye0wY', '2025-12-29 17:07:15', '2025-12-29 00:07:15'),
(24, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxNjc5LCJleHAiOjE3NjcwMjgwNzksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.jRfZwN8EliTjKt6TaY2rN4lmVtyCfMzqCF-3lVcL5hs', '2025-12-29 17:07:59', '2025-12-29 00:07:59'),
(25, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxNzQ5LCJleHAiOjE3NjcwMjgxNDksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.JZSSRz3nx5sF5hU4tZZo28qVGa0yf9Mc68pNnZW80nc', '2025-12-29 17:09:09', '2025-12-29 00:09:09'),
(26, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxODA5LCJleHAiOjE3NjcwMjgyMDksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.-uKsJ8WOBcudnue4rQ6XidYMaL3I9iCDx4pnWWGF4tA', '2025-12-29 17:10:09', '2025-12-29 00:10:09'),
(27, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxODM0LCJleHAiOjE3NjcwMjgyMzQsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.CGBCbodHvhPsEJ2plb312IEqTqtCAQ_FyFXXaTKoc_4', '2025-12-29 17:10:34', '2025-12-29 00:10:34'),
(28, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxODcxLCJleHAiOjE3NjcwMjgyNzEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.liTBNQjuBga6aw0BY4fVVfRd_y8l9rfgkhi576QgvAA', '2025-12-29 17:11:11', '2025-12-29 00:11:11'),
(29, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxOTA5LCJleHAiOjE3NjcwMjgzMDksImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.3Y8Plr8Ve-1UTGmHvLcPJHn8qpxbnGG9OfFKHs5VyBk', '2025-12-29 17:11:49', '2025-12-29 00:11:49'),
(30, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQxOTg4LCJleHAiOjE3NjcwMjgzODgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.XvMcxt5-jVdAm1pX03ViSvxbblEzJdbMwxJo6WJ9qXI', '2025-12-29 17:13:08', '2025-12-29 00:13:08'),
(31, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQyMDMwLCJleHAiOjE3NjcwMjg0MzAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.tVWfZZBp5ldT2nBQhgzJpEJmx2UQ2ko4-cvrDSF3f88', '2025-12-29 17:13:50', '2025-12-29 00:13:50'),
(32, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY2OTQyNzUyLCJleHAiOjE3NjcwMjkxNTIsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.8nINXLDYM_yEX5hUsvG11a3YaYvSiDl8TxwS8CftJjM', '2025-12-29 17:25:52', '2025-12-29 00:25:52'),
(33, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3MDI0NDY2LCJleHAiOjE3NjcxMTA4NjYsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.OiD4iZ4RvBKDkj6BGI8hXtMJId1cuB1qGTQXt8VLLDI', '2025-12-30 16:07:46', '2025-12-29 23:07:46'),
(36, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3MzUzODQxLCJleHAiOjE3Njc0NDAyNDEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.mPUSCWJfWC7iIjCAvc0ZMTHT6uPckU41Ykw627ZAeiU', '2026-01-03 11:37:21', '2026-01-02 18:37:21'),
(37, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTE4NzE0LCJleHAiOjE3Njc2MDUxMTQsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.ah8zVuOkvuFXsC4OL_gZyYAIXSO1_5wcjoLrvxbSx8w', '2026-01-05 09:25:14', '2026-01-04 16:25:14'),
(38, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTE5MTY4LCJleHAiOjE3Njc2MDU1NjgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.kGZ0BmGRDDYu2KQXLZ5Wr93_MrhabTvJe6AP0fUR6_c', '2026-01-05 09:32:48', '2026-01-04 16:32:48'),
(39, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIxMTM1LCJleHAiOjE3Njc2MDc1MzUsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.C--IG3IK8syXcadSSvNZR0blMYKrbPA8CWJ4VDDSkNc', '2026-01-05 10:05:35', '2026-01-04 17:05:35'),
(40, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIxMzMxLCJleHAiOjE3Njc2MDc3MzEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.MDEbDISPoEdtzEx28Z7_8OC8AqIX4uK-SEYDH5rUIOg', '2026-01-05 10:08:51', '2026-01-04 17:08:51'),
(41, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIxMzc4LCJleHAiOjE3Njc2MDc3NzgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.eF3pxhzxr0UKeG0NHEsAvVzeSSAPK5Pbba_hoSCPovs', '2026-01-05 10:09:38', '2026-01-04 17:09:38'),
(42, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIxNzUwLCJleHAiOjE3Njc2MDgxNTAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.cQv75ubJjPgeNsdtN2muaZAWF_9epx7UzupSsbHbETE', '2026-01-05 10:15:50', '2026-01-04 17:15:50'),
(43, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIxOTAxLCJleHAiOjE3Njc2MDgzMDEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.q4sXRFjpT7RBZoNiRpJXd8hn4MIyNkjggJTAGks_QF8', '2026-01-05 10:18:21', '2026-01-04 17:18:21'),
(44, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIyMTc2LCJleHAiOjE3Njc2MDg1NzYsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.xWXNljEqsjMFn63oigKGaowmMjeAqTPaNB0lwiQS_vo', '2026-01-05 10:22:56', '2026-01-04 17:22:56'),
(45, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIyNDUyLCJleHAiOjE3Njc2MDg4NTIsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.RLpaZpZ5F5ZLcOhIhS9RMZ4T0zy_MQvCbA66Xa-0obg', '2026-01-05 10:27:32', '2026-01-04 17:27:32'),
(46, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIzNTI4LCJleHAiOjE3Njc2MDk5MjgsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.udiVe2wnsxolQc2vO-SM2JPfyVsBzcI0gDGZ6IcCIVc', '2026-01-05 10:45:28', '2026-01-04 17:45:28'),
(47, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTIzODA3LCJleHAiOjE3Njc2MTAyMDcsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.if7Og8wtEh0AMaHsyA3fbubaYuq0eudf94ZIMA2wxN0', '2026-01-05 10:50:07', '2026-01-04 17:50:07'),
(48, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTI0NzU2LCJleHAiOjE3Njc2MTExNTYsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.OHiTERRtRzbWcmmIMnYMJeZPEA-kAhsy28O5YSGniXY', '2026-01-05 11:05:56', '2026-01-04 18:05:56'),
(49, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTI0OTc0LCJleHAiOjE3Njc2MTEzNzQsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.cG-NGZII5j8m8RdKpPuiRY4o79Vy5KYV7K-8KrGVM0A', '2026-01-05 11:09:34', '2026-01-04 18:09:34'),
(50, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTI2NjkxLCJleHAiOjE3Njc2MTMwOTEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.QLh29W8lEJXtu5MpMzqtNo3SSoxJGqs16NLroAYx9KA', '2026-01-05 11:38:11', '2026-01-04 18:38:11'),
(51, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NTI2OTkzLCJleHAiOjE3Njc2MTMzOTMsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.oSrxThP90nkK-nO47udYFdJaRsuV7K2GA37kGZxoQBc', '2026-01-05 11:43:13', '2026-01-04 18:43:13'),
(52, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NjI1MjcyLCJleHAiOjE3Njc3MTE2NzIsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.YluJk2dcPio2qewXe0RNUjfslB6gMvX-TrA3PC4dwqA', '2026-01-06 15:01:12', '2026-01-05 22:01:12'),
(53, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NjI2MTQ1LCJleHAiOjE3Njc3MTI1NDUsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.c2rt4a93MMJC7wKX7joPvbkFadRz39DZrxxKAM7Pi_g', '2026-01-06 15:15:45', '2026-01-05 22:15:45'),
(54, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NjI2NDYxLCJleHAiOjE3Njc3MTI4NjEsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.yUtRpbCeuj4TkicyX8O3fDEZ9UWlGuq85bBEpFGufd4', '2026-01-06 15:21:01', '2026-01-05 22:21:01'),
(55, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vbG9jYWxob3N0L3NpbXZlbnRfYXBpIiwiaWF0IjoxNzY3NjI3MDUwLCJleHAiOjE3Njc3MTM0NTAsImRhdGEiOnsidXNlcl9pZCI6MSwidXNlcm5hbWUiOiJhZG1pbiJ9fQ.RoanYm5jybO59LZA9dAmmPnC5_pLebhEOYCLi2O1tjc', '2026-01-06 15:30:50', '2026-01-05 22:30:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD KEY `FK_Assets_Rooms` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `usertokens`
--
ALTER TABLE `usertokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `FK_Tokens_Users` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `asset_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usertokens`
--
ALTER TABLE `usertokens`
  MODIFY `token_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `FK_Assets_Rooms` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `usertokens`
--
ALTER TABLE `usertokens`
  ADD CONSTRAINT `FK_Tokens_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
