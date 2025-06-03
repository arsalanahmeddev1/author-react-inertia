-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
<<<<<<< HEAD
-- Generation Time: Jun 03, 2025 at 06:08 PM
=======
-- Generation Time: Jun 03, 2025 at 06:04 PM
>>>>>>> feature/seprating-standard-community
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `author_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`id`, `name`, `story_id`, `description`, `created_at`, `updated_at`) VALUES
(45, 'villian', 47, 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '2025-05-16 13:56:20', '2025-05-16 13:56:20'),
(46, 'Lead', 48, 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '2025-05-16 13:58:05', '2025-05-16 13:58:05'),
(47, 'Hero', 49, 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '2025-05-16 15:36:59', '2025-05-16 15:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communities`
--

CREATE TABLE `communities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `read_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `style` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_community` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `likes_count` int(11) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `communities`
--

INSERT INTO `communities` (`id`, `title`, `description`, `author`, `genre`, `cover_image`, `read_count`, `comment_count`, `style`, `content`, `is_community`, `status`, `likes_count`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'In quia quo placeat', 'Aut lorem fugit id', 'Autem pariatur Face', 'Fantasy', 'cover_images/JXimm2IPUvDVUX1GFSvRfaOFGQecBsDqVPkOsa4O.webp', 0, 0, 'Qui ipsa molestiae', '<p>Et expedita blanditi.</p>', 1, 'pending', 0, 27, '2025-06-02 18:13:23', '2025-06-02 18:13:23');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_01_000000_create_stories_table', 2),
(7, '2025_05_04_121755_create_stories_table', 4),
(8, '2025_05_05_050657_add_content_to_stories_table', 4),
(9, '2025_05_05_050738_add_content_to_stories_table', 4),
(10, '2025_05_05_154118_create_stories_table', 4),
(11, '2025_05_02_234557_create_characters_table', 5),
(12, '2025_05_05_161910_create_writing_character_table', 6),
(13, '2025_05_05_165638_add_content_to_stories_table', 6),
(14, '2025_05_05_171234_add_is_guest_to_users_table', 7),
(15, '2023_05_08_000000_create_story_comments_table', 8),
(16, '2023_06_01_000000_add_community_fields_to_stories_table', 9),
(17, '2023_06_01_000001_create_story_likes_table', 10),
(18, '2023_06_02_000000_add_user_id_to_stories_table', 11),
(19, '2023_06_03_000000_ensure_content_column_in_stories_table', 12),
(20, '2023_06_10_000000_reset_comment_counts', 13),
(21, '2023_06_11_000000_reset_read_counts', 14),
(22, '2023_06_12_000000_create_story_reads_table', 15),
(23, '2023_06_15_000001_add_likes_count_to_stories_table', 16),
(24, '2023_06_20_000000_create_story_drafts_table', 17),
(25, '2023_05_06_000000_add_is_guest_to_users_table', 18),
(26, '2023_05_07_000000_create_comments_table', 18),
(27, '2023_06_15_000000_create_story_likes_table', 19),
(28, '2025_05_15_205404_add_status_to_stories_table', 19),
(29, '2025_05_16_174306_add_is_admin_to_users_table', 20),
(30, '2025_05_19_180635_create_visits_table', 21),
(31, '2025_06_02_180902_create_communities_table', 22),
(32, '2025_06_02_225108_add_column_to_communities_table', 23),
(33, '2025_06_02_230417_communities', 24),
(34, '2025_06_02_231132_communities', 25),
(35, '2025_06_02_231226_communities', 26);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dj7MdP1fB4Vy4iNsuQQ1G3PRkpVqcyactgY0p9eZ', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQkZ3MzBVVFZraDVYamJHTzlRd3BvR3J6ZUZBZnYwTEhFd2ZTSVMzSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9zdG9yaWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjc7fQ==', 1748911226),
('Ev93SnauauWHovZG0jbOoe2ugdQTomxGiTJY9MJw', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieVVJOExhWHJndjFQWDN0RHVUMkRiNXRZS2JzSTFjQmZsRFp1NmUxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9jb21tdW5pdHkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNzt9', 1748898131),
<<<<<<< HEAD
('kzMeIQ7wuKJ1rNB7fUU6rO4eEHyRwqmcrc341VT4', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaGxzSEt1SzI3SkpGOHk4SUFqTVFpbTVhNVFQeFJTWEhzbVNMUEZkUiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vc3RvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI3O30=', 1748966859),
=======
('kzMeIQ7wuKJ1rNB7fUU6rO4eEHyRwqmcrc341VT4', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaGxzSEt1SzI3SkpGOHk4SUFqTVFpbTVhNVFQeFJTWEhzbVNMUEZkUiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM1OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4vc3RvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI3O30=', 1748966291),
>>>>>>> feature/seprating-standard-community
('xcGsupMLYVGenkjSMuFnldKJsYxdf1XHqr7bbAbW', 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiclZnODJzQmk4WjVGZ3pvQjAwdEJsbUhBcXN6UTJhZU5tbHhJSEpXWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9zdG9yaWVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI3O30=', 1748965624),
('XtGLxXBmNNqSSOvxwHuMAmlxcHsSk357Xzc2yKlZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnhyY1JBRVlFbUVKcEFEWEIxWkxrcWU1TGZXbFFvdHB6QXZGTVJpVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1748910504);

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `content` longtext DEFAULT NULL,
  `author` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `cover_image` varchar(255) DEFAULT NULL,
  `read_count` int(11) NOT NULL DEFAULT 0,
  `comment_count` int(11) NOT NULL DEFAULT 0,
  `likes_count` int(11) NOT NULL DEFAULT 0,
  `style` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_community` tinyint(1) NOT NULL DEFAULT 0,
  `published_to_community_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `user_id`, `title`, `description`, `content`, `author`, `genre`, `cover_image`, `read_count`, `comment_count`, `likes_count`, `style`, `status`, `created_at`, `updated_at`, `is_community`, `published_to_community_at`) VALUES
(47, NULL, 'Death At Fallow End', 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '<p>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.<span style=\"color: rgba(37, 43, 54, 0.95);\">Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.</span></p>', 'Anne Rice', 'Mystery', 'cover_images/zhgFHOupBWD2kDLdd41Ur4x89cX4iJulbDDrFBnd.png', 4, 0, 0, NULL, 'pending', '2025-05-16 13:56:20', '2025-05-20 12:59:20', 0, NULL),
(48, NULL, 'Death At Fallow End', 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '<p><span style=\"color: rgba(37, 43, 54, 0.95);\">Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.</span></p>', 'Victoria Saccenti', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 10, 0, 0, NULL, 'pending', '2025-05-16 13:58:05', '2025-05-26 17:46:12', 0, NULL),
(49, NULL, 'Death At Fallow End', 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '<p>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.</p>', 'Martha Grimes', 'Thriller', 'cover_images/RpMdwASdK1HDpjulGTdcJ6nI88c2RNN8HjtY9k8Z.png', 1, 0, 0, NULL, 'pending', '2025-05-16 15:36:59', '2025-06-02 10:33:09', 0, NULL),
(52, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by arsalan', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p>\n          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          testing continue story by user<hr>\n          <p>As Lead, I...</p>', 'arsalan', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 0, 0, 0, NULL, 'approved', '2025-05-16 16:38:57', '2025-05-16 16:56:06', 1, NULL),
(53, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by admin', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p>\n          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Lead, I...</p>', 'admin', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 0, 0, 0, NULL, 'approved', '2025-05-16 18:30:22', '2025-05-16 18:31:00', 1, NULL),
(54, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by admin', '<p><strong>Death At Fallow End</strong> - Continued from villian\'s perspective</p><p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p><p><br></p><p>As villian, I...</p>', 'admin', 'Mystery', 'cover_images/zhgFHOupBWD2kDLdd41Ur4x89cX4iJulbDDrFBnd.png', 0, 0, 0, NULL, 'approved', '2025-05-16 18:35:08', '2025-06-02 12:02:47', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `story_comments`
--

CREATE TABLE `story_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `content` text NOT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `story_drafts`
--

CREATE TABLE `story_drafts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `word_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `story_likes`
--

CREATE TABLE `story_likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `story_reads`
--

CREATE TABLE `story_reads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `is_guest`, `created_at`, `updated_at`, `is_admin`) VALUES
(18, 'arsalan', 'arsalan@gmail.com', NULL, '$2y$12$qzC.6tCnRMhk/vHK8s5n4OIhYHPQzm9uu34yYzr/U2vqPsSDInLty', NULL, 0, '2025-05-05 18:04:13', '2025-05-05 18:04:13', 0),
(23, 'Arsalan dev', 'arsalanahmeddev1@gmail.com', NULL, '$2y$12$ZcbzhKfclhcqeHUqqiTnr.cbELg0cM2DwP1bNlOTAzNPQBHSbiLVq', NULL, 0, '2025-05-09 13:13:25', '2025-05-09 13:13:25', 0),
(24, 'web engineer', 'webengineer009@gmail.com', NULL, '$2y$12$ijCNqIUeZFinK6gRrUtzK.GgXYszrmQVDAe6rSzJMPK1bXYteBQ6O', NULL, 0, '2025-05-09 13:50:06', '2025-05-09 13:50:06', 0),
(26, 'oscar steve', 'oscarsteve@gmail.com', NULL, '$2y$12$VG9mrYIxc.i1bOT81AlVS./Dw..kuWti9adOjwlVkdswQJ.DUjR0O', NULL, 0, '2025-05-15 14:44:42', '2025-05-15 14:44:42', 0),
(27, 'admin', 'admin@gmail.com', NULL, '$2y$12$1HgUvn14PrpX.HVuCvk1UOrxuOTig6dK/P6XVNx9AXBC7vwjyz42y', NULL, 0, '2025-05-16 12:58:07', '2025-05-16 12:58:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `user_id`, `ip_address`, `user_agent`, `url`, `visited_at`, `created_at`, `updated_at`) VALUES
(1, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:25:51', '2025-05-19 13:25:51', '2025-05-19 13:25:51'),
(2, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:25:54', '2025-05-19 13:25:54', '2025-05-19 13:25:54'),
(3, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-19 13:25:55', '2025-05-19 13:25:55', '2025-05-19 13:25:55'),
(4, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:26:58', '2025-05-19 13:26:58', '2025-05-19 13:26:58'),
(5, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:27:29', '2025-05-19 13:27:29', '2025-05-19 13:27:29'),
(6, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-19 13:28:33', '2025-05-19 13:28:33', '2025-05-19 13:28:33'),
(7, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-19 13:28:40', '2025-05-19 13:28:40', '2025-05-19 13:28:40'),
(8, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-19 13:28:45', '2025-05-19 13:28:45', '2025-05-19 13:28:45'),
(9, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:28:49', '2025-05-19 13:28:49', '2025-05-19 13:28:49'),
(10, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-19 13:29:13', '2025-05-19 13:29:13', '2025-05-19 13:29:13'),
(11, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:47:03', '2025-05-19 13:47:03', '2025-05-19 13:47:03'),
(12, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:48:28', '2025-05-19 13:48:28', '2025-05-19 13:48:28'),
(13, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 13:51:07', '2025-05-19 13:51:07', '2025-05-19 13:51:07'),
(14, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:07:42', '2025-05-19 14:07:42', '2025-05-19 14:07:42'),
(15, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-19 14:07:42', '2025-05-19 14:07:42', '2025-05-19 14:07:42'),
(16, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:08:22', '2025-05-19 14:08:22', '2025-05-19 14:08:22'),
(17, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:08:33', '2025-05-19 14:08:33', '2025-05-19 14:08:33'),
(18, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:09:11', '2025-05-19 14:09:11', '2025-05-19 14:09:11'),
(19, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:09:32', '2025-05-19 14:09:32', '2025-05-19 14:09:32'),
(20, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:09:54', '2025-05-19 14:09:54', '2025-05-19 14:09:54'),
(21, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:10:07', '2025-05-19 14:10:07', '2025-05-19 14:10:07'),
(22, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:13:19', '2025-05-19 14:13:19', '2025-05-19 14:13:19'),
(23, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:13:32', '2025-05-19 14:13:32', '2025-05-19 14:13:32'),
(24, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:13:32', '2025-05-19 14:13:32', '2025-05-19 14:13:32'),
(25, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:13:40', '2025-05-19 14:13:40', '2025-05-19 14:13:40'),
(26, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:14:18', '2025-05-19 14:14:18', '2025-05-19 14:14:18'),
(27, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:14:22', '2025-05-19 14:14:22', '2025-05-19 14:14:22'),
(28, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:15:18', '2025-05-19 14:15:18', '2025-05-19 14:15:18'),
(29, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:15:18', '2025-05-19 14:15:18', '2025-05-19 14:15:18'),
(30, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:15:22', '2025-05-19 14:15:22', '2025-05-19 14:15:22'),
(31, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:15:23', '2025-05-19 14:15:23', '2025-05-19 14:15:23'),
(32, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:22:36', '2025-05-19 14:22:36', '2025-05-19 14:22:36'),
(33, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:22:53', '2025-05-19 14:22:53', '2025-05-19 14:22:53'),
(34, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:23:17', '2025-05-19 14:23:17', '2025-05-19 14:23:17'),
(35, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:23:45', '2025-05-19 14:23:45', '2025-05-19 14:23:45'),
(36, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:24:59', '2025-05-19 14:24:59', '2025-05-19 14:24:59'),
(37, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:33:41', '2025-05-19 14:33:41', '2025-05-19 14:33:41'),
(38, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-19 14:33:44', '2025-05-19 14:33:44', '2025-05-19 14:33:44'),
(39, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-20 10:31:35', '2025-05-20 10:31:35', '2025-05-20 10:31:35'),
(40, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-20 10:31:57', '2025-05-20 10:31:57', '2025-05-20 10:31:57'),
(41, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-20 18:44:33', '2025-05-20 18:44:33', '2025-05-20 18:44:33'),
(42, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-20 18:44:38', '2025-05-20 18:44:38', '2025-05-20 18:44:38'),
(43, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-22 19:03:37', '2025-05-22 19:03:37', '2025-05-22 19:03:37'),
(44, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-22 19:03:47', '2025-05-22 19:03:47', '2025-05-22 19:03:47'),
(45, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-22 19:03:48', '2025-05-22 19:03:48', '2025-05-22 19:03:48'),
(46, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-22 19:03:48', '2025-05-22 19:03:48', '2025-05-22 19:03:48'),
(47, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-22 19:03:48', '2025-05-22 19:03:48', '2025-05-22 19:03:48'),
(48, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48', '2025-05-22 19:04:01', '2025-05-22 19:04:01', '2025-05-22 19:04:01'),
(49, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-22 19:04:02', '2025-05-22 19:04:02', '2025-05-22 19:04:02'),
(50, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/comments', '2025-05-22 19:04:02', '2025-05-22 19:04:02', '2025-05-22 19:04:02'),
(51, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-05-23 10:48:39', '2025-05-23 10:48:39', '2025-05-23 10:48:39'),
(52, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48', '2025-05-23 10:52:12', '2025-05-23 10:52:12', '2025-05-23 10:52:12'),
(53, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-05-23 10:52:13', '2025-05-23 10:52:13', '2025-05-23 10:52:13'),
(54, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/comments', '2025-05-23 10:52:13', '2025-05-23 10:52:13', '2025-05-23 10:52:13'),
(55, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-05-23 10:52:24', '2025-05-23 10:52:24', '2025-05-23 10:52:24'),
(56, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-05-23 11:34:22', '2025-05-23 11:34:22', '2025-05-23 11:34:22'),
(57, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-05-23 11:35:24', '2025-05-23 11:35:24', '2025-05-23 11:35:24'),
(58, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-05-23 11:37:10', '2025-05-23 11:37:10', '2025-05-23 11:37:10'),
(59, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48', '2025-05-23 12:07:22', '2025-05-23 12:07:22', '2025-05-23 12:07:22'),
(60, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-23 12:07:24', '2025-05-23 12:07:24', '2025-05-23 12:07:24'),
(61, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/comments', '2025-05-23 12:07:24', '2025-05-23 12:07:24', '2025-05-23 12:07:24'),
(62, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 16:58:02', '2025-05-26 16:58:02', '2025-05-26 16:58:02'),
(63, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:03:42', '2025-05-26 17:03:42', '2025-05-26 17:03:42'),
(64, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:04:37', '2025-05-26 17:04:37', '2025-05-26 17:04:37'),
(65, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:05:32', '2025-05-26 17:05:32', '2025-05-26 17:05:32'),
(66, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:05:41', '2025-05-26 17:05:41', '2025-05-26 17:05:41'),
(67, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:21:58', '2025-05-26 17:21:58', '2025-05-26 17:21:58'),
(68, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:24:07', '2025-05-26 17:24:07', '2025-05-26 17:24:07'),
(69, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:24:08', '2025-05-26 17:24:08', '2025-05-26 17:24:08'),
(70, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:24:55', '2025-05-26 17:24:55', '2025-05-26 17:24:55'),
(71, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:25:02', '2025-05-26 17:25:02', '2025-05-26 17:25:02'),
(72, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:25:02', '2025-05-26 17:25:02', '2025-05-26 17:25:02'),
(73, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:25:03', '2025-05-26 17:25:03', '2025-05-26 17:25:03'),
(74, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:25:41', '2025-05-26 17:25:41', '2025-05-26 17:25:41'),
(75, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:30:40', '2025-05-26 17:30:40', '2025-05-26 17:30:40'),
(76, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:33:08', '2025-05-26 17:33:09', '2025-05-26 17:33:09'),
(77, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:35:10', '2025-05-26 17:35:10', '2025-05-26 17:35:10'),
(78, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:35:30', '2025-05-26 17:35:30', '2025-05-26 17:35:30'),
(79, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-26 17:39:51', '2025-05-26 17:39:51', '2025-05-26 17:39:51'),
(80, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-26 17:39:53', '2025-05-26 17:39:53', '2025-05-26 17:39:53'),
(81, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-26 17:39:53', '2025-05-26 17:39:53', '2025-05-26 17:39:53'),
(82, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-26 17:39:54', '2025-05-26 17:39:54', '2025-05-26 17:39:54'),
(83, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:40:48', '2025-05-26 17:40:48', '2025-05-26 17:40:48'),
(84, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:40:59', '2025-05-26 17:40:59', '2025-05-26 17:40:59'),
(85, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:41:00', '2025-05-26 17:41:00', '2025-05-26 17:41:00'),
(86, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:41:09', '2025-05-26 17:41:09', '2025-05-26 17:41:09'),
(87, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-26 17:46:02', '2025-05-26 17:46:02', '2025-05-26 17:46:02'),
(88, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-26 17:46:03', '2025-05-26 17:46:03', '2025-05-26 17:46:03'),
(89, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-26 17:46:04', '2025-05-26 17:46:04', '2025-05-26 17:46:04'),
(90, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-26 17:46:04', '2025-05-26 17:46:04', '2025-05-26 17:46:04'),
(91, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48', '2025-05-26 17:46:12', '2025-05-26 17:46:12', '2025-05-26 17:46:12'),
(92, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/comments', '2025-05-26 17:46:13', '2025-05-26 17:46:13', '2025-05-26 17:46:13'),
(93, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-26 17:46:13', '2025-05-26 17:46:13', '2025-05-26 17:46:13'),
(94, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:46:22', '2025-05-26 17:46:22', '2025-05-26 17:46:22'),
(95, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:46:52', '2025-05-26 17:46:52', '2025-05-26 17:46:52'),
(96, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:47:06', '2025-05-26 17:47:06', '2025-05-26 17:47:06'),
(97, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 17:56:30', '2025-05-26 17:56:30', '2025-05-26 17:56:30'),
(98, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:11:54', '2025-05-26 18:11:54', '2025-05-26 18:11:54'),
(99, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:16:51', '2025-05-26 18:16:51', '2025-05-26 18:16:51'),
(100, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:19:11', '2025-05-26 18:19:11', '2025-05-26 18:19:11'),
(101, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:24:02', '2025-05-26 18:24:02', '2025-05-26 18:24:02'),
(102, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:29:26', '2025-05-26 18:29:26', '2025-05-26 18:29:26'),
(103, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:31:02', '2025-05-26 18:31:02', '2025-05-26 18:31:02'),
(104, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:31:59', '2025-05-26 18:31:59', '2025-05-26 18:31:59'),
(105, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:33:04', '2025-05-26 18:33:04', '2025-05-26 18:33:04'),
(106, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:35:04', '2025-05-26 18:35:04', '2025-05-26 18:35:04'),
(107, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 18:35:16', '2025-05-26 18:35:16', '2025-05-26 18:35:16'),
(108, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 19:05:21', '2025-05-26 19:05:21', '2025-05-26 19:05:21'),
(109, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-26 19:17:03', '2025-05-26 19:17:03', '2025-05-26 19:17:03'),
(110, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:30:25', '2025-05-27 10:30:25', '2025-05-27 10:30:25'),
(111, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:33:16', '2025-05-27 10:33:16', '2025-05-27 10:33:16'),
(112, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:35:46', '2025-05-27 10:35:46', '2025-05-27 10:35:46'),
(113, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:35:57', '2025-05-27 10:35:57', '2025-05-27 10:35:57'),
(114, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:35:58', '2025-05-27 10:35:58', '2025-05-27 10:35:58'),
(115, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:35:58', '2025-05-27 10:35:58', '2025-05-27 10:35:58'),
(116, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:05', '2025-05-27 10:36:05', '2025-05-27 10:36:05'),
(117, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:06', '2025-05-27 10:36:06', '2025-05-27 10:36:06'),
(118, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:21', '2025-05-27 10:36:21', '2025-05-27 10:36:21'),
(119, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:22', '2025-05-27 10:36:22', '2025-05-27 10:36:22'),
(120, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:24', '2025-05-27 10:36:24', '2025-05-27 10:36:24'),
(121, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:28', '2025-05-27 10:36:28', '2025-05-27 10:36:28'),
(122, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 10:36:41', '2025-05-27 10:36:41', '2025-05-27 10:36:41'),
(123, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 11:27:12', '2025-05-27 11:27:12', '2025-05-27 11:27:12'),
(124, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 11:29:06', '2025-05-27 11:29:06', '2025-05-27 11:29:06'),
(125, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 11:29:27', '2025-05-27 11:29:27', '2025-05-27 11:29:27'),
(126, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 11:29:53', '2025-05-27 11:29:53', '2025-05-27 11:29:53'),
(127, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 11:33:39', '2025-05-27 11:33:39', '2025-05-27 11:33:39'),
(128, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 11:40:45', '2025-05-27 11:40:45', '2025-05-27 11:40:45'),
(129, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:25:33', '2025-05-27 12:25:33', '2025-05-27 12:25:33'),
(130, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:26:47', '2025-05-27 12:26:47', '2025-05-27 12:26:47'),
(131, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:37:56', '2025-05-27 12:37:56', '2025-05-27 12:37:56'),
(132, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:38:02', '2025-05-27 12:38:02', '2025-05-27 12:38:02'),
(133, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:39:57', '2025-05-27 12:39:57', '2025-05-27 12:39:57'),
(134, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:44:27', '2025-05-27 12:44:27', '2025-05-27 12:44:27'),
(135, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:46:01', '2025-05-27 12:46:01', '2025-05-27 12:46:01'),
(136, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 12:48:20', '2025-05-27 12:48:20', '2025-05-27 12:48:20'),
(137, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-27 13:01:57', '2025-05-27 13:01:57', '2025-05-27 13:01:57'),
(138, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-27 13:01:58', '2025-05-27 13:01:58', '2025-05-27 13:01:58'),
(139, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-27 13:01:58', '2025-05-27 13:01:58', '2025-05-27 13:01:58'),
(140, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-27 13:01:58', '2025-05-27 13:01:58', '2025-05-27 13:01:58'),
(141, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 13:02:02', '2025-05-27 13:02:02', '2025-05-27 13:02:02'),
(142, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-27 13:02:05', '2025-05-27 13:02:05', '2025-05-27 13:02:05'),
(143, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-27 13:02:06', '2025-05-27 13:02:06', '2025-05-27 13:02:06'),
(144, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-27 13:02:06', '2025-05-27 13:02:06', '2025-05-27 13:02:06'),
(145, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-27 13:02:06', '2025-05-27 13:02:06', '2025-05-27 13:02:06'),
(146, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-27 13:02:20', '2025-05-27 13:02:20', '2025-05-27 13:02:20'),
(147, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-27 13:02:20', '2025-05-27 13:02:20', '2025-05-27 13:02:20'),
(148, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-27 13:02:21', '2025-05-27 13:02:21', '2025-05-27 13:02:21'),
(149, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-27 13:02:21', '2025-05-27 13:02:21', '2025-05-27 13:02:21'),
(150, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 13:02:22', '2025-05-27 13:02:22', '2025-05-27 13:02:22'),
(151, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-27 13:03:29', '2025-05-27 13:03:29', '2025-05-27 13:03:29'),
(152, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-27 13:03:38', '2025-05-27 13:03:38', '2025-05-27 13:03:38'),
(153, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-27 13:03:39', '2025-05-27 13:03:39', '2025-05-27 13:03:39'),
(154, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-27 13:03:47', '2025-05-27 13:03:47', '2025-05-27 13:03:47'),
(155, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-27 13:03:48', '2025-05-27 13:03:48', '2025-05-27 13:03:48'),
(156, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 13:03:54', '2025-05-27 13:03:54', '2025-05-27 13:03:54'),
(157, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-27 13:04:16', '2025-05-27 13:04:16', '2025-05-27 13:04:16'),
(158, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-27 13:04:16', '2025-05-27 13:04:16', '2025-05-27 13:04:16'),
(159, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-27 13:04:16', '2025-05-27 13:04:16', '2025-05-27 13:04:16'),
(160, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-27 13:04:18', '2025-05-27 13:04:18', '2025-05-27 13:04:18'),
(161, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-27 13:04:18', '2025-05-27 13:04:18', '2025-05-27 13:04:18'),
(162, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-27 13:04:18', '2025-05-27 13:04:18', '2025-05-27 13:04:18'),
(163, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-27 13:04:19', '2025-05-27 13:04:19', '2025-05-27 13:04:19'),
(164, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-27 13:04:29', '2025-05-27 13:04:29', '2025-05-27 13:04:29'),
(165, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-27 13:04:38', '2025-05-27 13:04:38', '2025-05-27 13:04:38'),
(166, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-27 13:04:39', '2025-05-27 13:04:39', '2025-05-27 13:04:39'),
(167, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-27 13:04:39', '2025-05-27 13:04:39', '2025-05-27 13:04:39'),
(168, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-27 13:04:39', '2025-05-27 13:04:39', '2025-05-27 13:04:39'),
(169, 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/logout', '2025-05-27 13:04:41', '2025-05-27 13:04:41', '2025-05-27 13:04:41'),
(170, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-27 13:04:41', '2025-05-27 13:04:41', '2025-05-27 13:04:41'),
(171, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-27 13:05:01', '2025-05-27 13:05:01', '2025-05-27 13:05:01'),
(172, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-27 13:05:15', '2025-05-27 13:05:15', '2025-05-27 13:05:15'),
(173, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:22:23', '2025-05-28 10:22:23', '2025-05-28 10:22:23'),
(174, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:28:45', '2025-05-28 10:28:45', '2025-05-28 10:28:45'),
(175, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:29:55', '2025-05-28 10:29:55', '2025-05-28 10:29:55'),
(176, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:32:34', '2025-05-28 10:32:34', '2025-05-28 10:32:34'),
(177, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:33:33', '2025-05-28 10:33:33', '2025-05-28 10:33:33'),
(178, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:36:05', '2025-05-28 10:36:05', '2025-05-28 10:36:05'),
(179, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:38:28', '2025-05-28 10:38:28', '2025-05-28 10:38:28'),
(180, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:54:40', '2025-05-28 10:54:40', '2025-05-28 10:54:40'),
(181, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:57:02', '2025-05-28 10:57:02', '2025-05-28 10:57:02'),
(182, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:57:55', '2025-05-28 10:57:55', '2025-05-28 10:57:55'),
(183, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 10:58:54', '2025-05-28 10:58:54', '2025-05-28 10:58:54'),
(184, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:00:38', '2025-05-28 11:00:38', '2025-05-28 11:00:38'),
(185, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:03:08', '2025-05-28 11:03:08', '2025-05-28 11:03:08'),
(186, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:27:42', '2025-05-28 11:27:42', '2025-05-28 11:27:42'),
(187, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:45:39', '2025-05-28 11:45:39', '2025-05-28 11:45:39'),
(188, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:48:44', '2025-05-28 11:48:44', '2025-05-28 11:48:44'),
(189, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:49:12', '2025-05-28 11:49:12', '2025-05-28 11:49:12'),
(190, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:52:18', '2025-05-28 11:52:18', '2025-05-28 11:52:18'),
(191, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:57:51', '2025-05-28 11:57:51', '2025-05-28 11:57:51'),
(192, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 11:59:36', '2025-05-28 11:59:36', '2025-05-28 11:59:36'),
(193, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:03:47', '2025-05-28 12:03:47', '2025-05-28 12:03:47'),
(194, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:04:28', '2025-05-28 12:04:28', '2025-05-28 12:04:28'),
(195, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:06:55', '2025-05-28 12:06:55', '2025-05-28 12:06:55'),
(196, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:43:50', '2025-05-28 12:43:50', '2025-05-28 12:43:50'),
(197, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:44:21', '2025-05-28 12:44:21', '2025-05-28 12:44:21'),
(198, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:46:30', '2025-05-28 12:46:30', '2025-05-28 12:46:30'),
(199, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:47:15', '2025-05-28 12:47:15', '2025-05-28 12:47:15'),
(200, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:50:41', '2025-05-28 12:50:41', '2025-05-28 12:50:41'),
(201, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:55:41', '2025-05-28 12:55:41', '2025-05-28 12:55:41'),
(202, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:56:52', '2025-05-28 12:56:52', '2025-05-28 12:56:52'),
(203, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:58:15', '2025-05-28 12:58:15', '2025-05-28 12:58:15'),
(204, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 12:58:46', '2025-05-28 12:58:46', '2025-05-28 12:58:46'),
(205, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 13:14:23', '2025-05-28 13:14:23', '2025-05-28 13:14:23'),
(206, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 13:18:16', '2025-05-28 13:18:16', '2025-05-28 13:18:16'),
(207, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 13:33:29', '2025-05-28 13:33:29', '2025-05-28 13:33:29'),
(208, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 13:35:33', '2025-05-28 13:35:33', '2025-05-28 13:35:33');
INSERT INTO `visits` (`id`, `user_id`, `ip_address`, `user_agent`, `url`, `visited_at`, `created_at`, `updated_at`) VALUES
(209, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 13:47:26', '2025-05-28 13:47:26', '2025-05-28 13:47:26'),
(210, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 13:56:33', '2025-05-28 13:56:33', '2025-05-28 13:56:33'),
(211, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 14:03:16', '2025-05-28 14:03:16', '2025-05-28 14:03:16'),
(212, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 14:05:40', '2025-05-28 14:05:40', '2025-05-28 14:05:40'),
(213, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 14:15:35', '2025-05-28 14:15:35', '2025-05-28 14:15:35'),
(214, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 14:15:44', '2025-05-28 14:15:44', '2025-05-28 14:15:44'),
(215, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 14:17:41', '2025-05-28 14:17:41', '2025-05-28 14:17:41'),
(216, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 15:04:08', '2025-05-28 15:04:08', '2025-05-28 15:04:08'),
(217, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 15:04:18', '2025-05-28 15:04:18', '2025-05-28 15:04:18'),
(218, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 15:08:15', '2025-05-28 15:08:15', '2025-05-28 15:08:15'),
(219, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-28 17:17:21', '2025-05-28 17:17:21', '2025-05-28 17:17:21'),
(220, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:10:51', '2025-05-29 11:10:51', '2025-05-29 11:10:51'),
(221, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:11:43', '2025-05-29 11:11:43', '2025-05-29 11:11:43'),
(222, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:12:22', '2025-05-29 11:12:22', '2025-05-29 11:12:22'),
(223, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:12:40', '2025-05-29 11:12:40', '2025-05-29 11:12:40'),
(224, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:13:51', '2025-05-29 11:13:51', '2025-05-29 11:13:51'),
(225, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:14:25', '2025-05-29 11:14:25', '2025-05-29 11:14:25'),
(226, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:15:11', '2025-05-29 11:15:11', '2025-05-29 11:15:11'),
(227, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:15:12', '2025-05-29 11:15:12', '2025-05-29 11:15:12'),
(228, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:27:02', '2025-05-29 11:27:02', '2025-05-29 11:27:02'),
(229, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-29 11:27:13', '2025-05-29 11:27:13', '2025-05-29 11:27:13'),
(230, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:27:14', '2025-05-29 11:27:14', '2025-05-29 11:27:14'),
(231, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:27:14', '2025-05-29 11:27:14', '2025-05-29 11:27:14'),
(232, NULL, '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Mobile Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:27:14', '2025-05-29 11:27:14', '2025-05-29 11:27:14'),
(233, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:29:15', '2025-05-29 11:29:15', '2025-05-29 11:29:15'),
(234, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:29:23', '2025-05-29 11:29:23', '2025-05-29 11:29:23'),
(235, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:29:40', '2025-05-29 11:29:40', '2025-05-29 11:29:40'),
(236, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:29:53', '2025-05-29 11:29:53', '2025-05-29 11:29:53'),
(237, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:29:58', '2025-05-29 11:29:58', '2025-05-29 11:29:58'),
(238, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-29 11:33:33', '2025-05-29 11:33:33', '2025-05-29 11:33:33'),
(239, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:33:33', '2025-05-29 11:33:33', '2025-05-29 11:33:33'),
(240, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:33:34', '2025-05-29 11:33:34', '2025-05-29 11:33:34'),
(241, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:33:34', '2025-05-29 11:33:34', '2025-05-29 11:33:34'),
(242, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:33:39', '2025-05-29 11:33:39', '2025-05-29 11:33:39'),
(243, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:33:42', '2025-05-29 11:33:42', '2025-05-29 11:33:42'),
(244, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:33:42', '2025-05-29 11:33:42', '2025-05-29 11:33:42'),
(245, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:33:42', '2025-05-29 11:33:42', '2025-05-29 11:33:42'),
(246, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:33:43', '2025-05-29 11:33:43', '2025-05-29 11:33:43'),
(247, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:33:45', '2025-05-29 11:33:45', '2025-05-29 11:33:45'),
(248, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:33:45', '2025-05-29 11:33:45', '2025-05-29 11:33:45'),
(249, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:33:46', '2025-05-29 11:33:46', '2025-05-29 11:33:46'),
(250, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/register', '2025-05-29 11:33:46', '2025-05-29 11:33:46', '2025-05-29 11:33:46'),
(251, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:33:49', '2025-05-29 11:33:49', '2025-05-29 11:33:49'),
(252, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:33:49', '2025-05-29 11:33:49', '2025-05-29 11:33:49'),
(253, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:33:49', '2025-05-29 11:33:49', '2025-05-29 11:33:49'),
(254, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/register', '2025-05-29 11:34:00', '2025-05-29 11:34:00', '2025-05-29 11:34:00'),
(255, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:34:03', '2025-05-29 11:34:03', '2025-05-29 11:34:03'),
(256, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:34:03', '2025-05-29 11:34:03', '2025-05-29 11:34:03'),
(257, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:34:04', '2025-05-29 11:34:04', '2025-05-29 11:34:04'),
(258, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:34:05', '2025-05-29 11:34:05', '2025-05-29 11:34:05'),
(259, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:34:12', '2025-05-29 11:34:12', '2025-05-29 11:34:12'),
(260, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/register', '2025-05-29 11:36:25', '2025-05-29 11:36:25', '2025-05-29 11:36:25'),
(261, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:36:46', '2025-05-29 11:36:47', '2025-05-29 11:36:47'),
(262, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:37:26', '2025-05-29 11:37:26', '2025-05-29 11:37:26'),
(263, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:40:07', '2025-05-29 11:40:07', '2025-05-29 11:40:07'),
(264, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:40:10', '2025-05-29 11:40:10', '2025-05-29 11:40:10'),
(265, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/guest-login', '2025-05-29 11:40:12', '2025-05-29 11:40:12', '2025-05-29 11:40:12'),
(266, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:40:12', '2025-05-29 11:40:12', '2025-05-29 11:40:12'),
(267, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/admin', '2025-05-29 11:40:19', '2025-05-29 11:40:19', '2025-05-29 11:40:19'),
(268, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:41:47', '2025-05-29 11:41:47', '2025-05-29 11:41:47'),
(269, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-29 11:41:49', '2025-05-29 11:41:49', '2025-05-29 11:41:49'),
(270, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:41:49', '2025-05-29 11:41:49', '2025-05-29 11:41:49'),
(271, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:41:50', '2025-05-29 11:41:50', '2025-05-29 11:41:50'),
(272, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:41:50', '2025-05-29 11:41:50', '2025-05-29 11:41:50'),
(273, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:43:20', '2025-05-29 11:43:20', '2025-05-29 11:43:20'),
(274, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:43:20', '2025-05-29 11:43:20', '2025-05-29 11:43:20'),
(275, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-29 11:45:11', '2025-05-29 11:45:11', '2025-05-29 11:45:11'),
(276, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:45:12', '2025-05-29 11:45:12', '2025-05-29 11:45:12'),
(277, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:45:12', '2025-05-29 11:45:12', '2025-05-29 11:45:12'),
(278, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:45:12', '2025-05-29 11:45:12', '2025-05-29 11:45:12'),
(279, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:45:44', '2025-05-29 11:45:44', '2025-05-29 11:45:44'),
(280, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:45:44', '2025-05-29 11:45:44', '2025-05-29 11:45:44'),
(281, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-05-29 11:45:52', '2025-05-29 11:45:52', '2025-05-29 11:45:52'),
(282, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-05-29 11:45:52', '2025-05-29 11:45:52', '2025-05-29 11:45:52'),
(283, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-05-29 11:45:52', '2025-05-29 11:45:52', '2025-05-29 11:45:52'),
(284, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-05-29 11:45:53', '2025-05-29 11:45:53', '2025-05-29 11:45:53'),
(285, 28, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/logout', '2025-05-29 11:45:53', '2025-05-29 11:45:53', '2025-05-29 11:45:53'),
(286, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 11:45:54', '2025-05-29 11:45:54', '2025-05-29 11:45:54'),
(287, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:45:59', '2025-05-29 11:45:59', '2025-05-29 11:45:59'),
(288, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:46:07', '2025-05-29 11:46:07', '2025-05-29 11:46:07'),
(289, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:46:20', '2025-05-29 11:46:20', '2025-05-29 11:46:20'),
(290, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:46:20', '2025-05-29 11:46:20', '2025-05-29 11:46:20'),
(291, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 11:46:29', '2025-05-29 11:46:29', '2025-05-29 11:46:29'),
(292, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 12:36:59', '2025-05-29 12:36:59', '2025-05-29 12:36:59'),
(293, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/guest-login', '2025-05-29 12:37:04', '2025-05-29 12:37:04', '2025-05-29 12:37:04'),
(294, 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 12:37:05', '2025-05-29 12:37:05', '2025-05-29 12:37:05'),
(295, 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/logout', '2025-05-29 12:37:53', '2025-05-29 12:37:53', '2025-05-29 12:37:53'),
(296, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 12:37:53', '2025-05-29 12:37:53', '2025-05-29 12:37:53'),
(297, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 12:37:55', '2025-05-29 12:37:55', '2025-05-29 12:37:55'),
(298, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-05-29 12:38:07', '2025-05-29 12:38:07', '2025-05-29 12:38:07'),
(299, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 15:39:12', '2025-05-29 15:39:12', '2025-05-29 15:39:12'),
(300, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-29 18:18:12', '2025-05-29 18:18:12', '2025-05-29 18:18:12'),
(301, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-30 12:54:36', '2025-05-30 12:54:36', '2025-05-30 12:54:36'),
(302, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-30 17:53:40', '2025-05-30 17:53:40', '2025-05-30 17:53:40'),
(303, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-30 17:54:06', '2025-05-30 17:54:06', '2025-05-30 17:54:06'),
(304, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-05-30 17:55:50', '2025-05-30 17:55:50', '2025-05-30 17:55:50'),
(305, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-06-02 10:32:23', '2025-06-02 10:32:23', '2025-06-02 10:32:23'),
(306, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories', '2025-06-02 10:32:38', '2025-06-02 10:32:38', '2025-06-02 10:32:38'),
(307, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-06-02 10:32:39', '2025-06-02 10:32:39', '2025-06-02 10:32:39'),
(308, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-06-02 10:32:39', '2025-06-02 10:32:39', '2025-06-02 10:32:39'),
(309, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-06-02 10:32:39', '2025-06-02 10:32:39', '2025-06-02 10:32:39'),
(310, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=a', '2025-06-02 10:32:43', '2025-06-02 10:32:43', '2025-06-02 10:32:43'),
(311, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=as', '2025-06-02 10:32:44', '2025-06-02 10:32:44', '2025-06-02 10:32:44'),
(312, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=asd', '2025-06-02 10:32:44', '2025-06-02 10:32:44', '2025-06-02 10:32:44'),
(313, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=asds', '2025-06-02 10:32:44', '2025-06-02 10:32:44', '2025-06-02 10:32:44'),
(314, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=asdsa', '2025-06-02 10:32:45', '2025-06-02 10:32:45', '2025-06-02 10:32:45'),
(315, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=asdsad', '2025-06-02 10:32:45', '2025-06-02 10:32:45', '2025-06-02 10:32:45'),
(316, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories?genre=all&search=', '2025-06-02 10:32:48', '2025-06-02 10:32:48', '2025-06-02 10:32:48'),
(317, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-06-02 10:32:48', '2025-06-02 10:32:48', '2025-06-02 10:32:48'),
(318, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/48/likes', '2025-06-02 10:32:48', '2025-06-02 10:32:48', '2025-06-02 10:32:48'),
(319, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/47/likes', '2025-06-02 10:32:49', '2025-06-02 10:32:49', '2025-06-02 10:32:49'),
(320, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49', '2025-06-02 10:33:09', '2025-06-02 10:33:09', '2025-06-02 10:33:09'),
(321, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/likes', '2025-06-02 10:33:10', '2025-06-02 10:33:10', '2025-06-02 10:33:10'),
(322, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/stories/49/comments', '2025-06-02 10:33:10', '2025-06-02 10:33:10', '2025-06-02 10:33:10'),
(323, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-02 10:33:43', '2025-06-02 10:33:43', '2025-06-02 10:33:43'),
(324, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-02 10:34:02', '2025-06-02 10:34:02', '2025-06-02 10:34:02'),
(325, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-02 11:56:46', '2025-06-02 11:56:46', '2025-06-02 11:56:46'),
(326, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-06-02 11:56:53', '2025-06-02 11:56:53', '2025-06-02 11:56:53'),
(327, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-02 11:56:59', '2025-06-02 11:56:59', '2025-06-02 11:56:59'),
(328, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-02 11:57:29', '2025-06-02 11:57:29', '2025-06-02 11:57:29'),
(329, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-02 16:02:52', '2025-06-02 16:02:52', '2025-06-02 16:02:52'),
(330, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-02 16:03:02', '2025-06-02 16:03:02', '2025-06-02 16:03:02'),
(331, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-02 16:03:15', '2025-06-02 16:03:15', '2025-06-02 16:03:15'),
(332, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-06-02 19:21:12', '2025-06-02 19:21:12', '2025-06-02 19:21:12'),
(333, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-06-02 19:28:24', '2025-06-02 19:28:24', '2025-06-02 19:28:24'),
(334, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000', '2025-06-03 10:15:59', '2025-06-03 10:15:59', '2025-06-03 10:15:59'),
(335, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-03 10:16:12', '2025-06-03 10:16:12', '2025-06-03 10:16:12'),
(336, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://127.0.0.1:8000/login', '2025-06-03 10:16:28', '2025-06-03 10:16:28', '2025-06-03 10:16:28'),
(337, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:18:43', '2025-06-03 10:18:43', '2025-06-03 10:18:43'),
(338, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:46:59', '2025-06-03 10:46:59', '2025-06-03 10:46:59'),
(339, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:50:12', '2025-06-03 10:50:12', '2025-06-03 10:50:12'),
(340, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:50:17', '2025-06-03 10:50:17', '2025-06-03 10:50:17'),
(341, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-03 10:50:31', '2025-06-03 10:50:31', '2025-06-03 10:50:31'),
(342, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:50:35', '2025-06-03 10:50:35', '2025-06-03 10:50:35'),
(343, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:50:44', '2025-06-03 10:50:44', '2025-06-03 10:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `writing_character`
--

CREATE TABLE `writing_character` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `status` enum('draft','publish') NOT NULL DEFAULT 'draft',
  `story_id` bigint(20) UNSIGNED NOT NULL,
  `character_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `characters_story_id_foreign` (`story_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_story_id_foreign` (`story_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `communities`
--
ALTER TABLE `communities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `communities_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stories_user_id_foreign` (`user_id`);

--
-- Indexes for table `story_comments`
--
ALTER TABLE `story_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_comments_user_id_foreign` (`user_id`),
  ADD KEY `story_comments_story_id_foreign` (`story_id`),
  ADD KEY `story_comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `story_drafts`
--
ALTER TABLE `story_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_drafts_user_id_foreign` (`user_id`),
  ADD KEY `story_drafts_story_id_foreign` (`story_id`),
  ADD KEY `story_drafts_character_id_foreign` (`character_id`);

--
-- Indexes for table `story_likes`
--
ALTER TABLE `story_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `story_likes_story_id_user_id_unique` (`story_id`,`user_id`),
  ADD KEY `story_likes_user_id_foreign` (`user_id`);

--
-- Indexes for table `story_reads`
--
ALTER TABLE `story_reads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_reads_story_id_foreign` (`story_id`),
  ADD KEY `story_reads_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `writing_character`
--
ALTER TABLE `writing_character`
  ADD PRIMARY KEY (`id`),
  ADD KEY `writing_character_story_id_foreign` (`story_id`),
  ADD KEY `writing_character_character_id_foreign` (`character_id`),
  ADD KEY `writing_character_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communities`
--
ALTER TABLE `communities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `story_comments`
--
ALTER TABLE `story_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `story_drafts`
--
ALTER TABLE `story_drafts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `story_likes`
--
ALTER TABLE `story_likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `story_reads`
--
ALTER TABLE `story_reads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `writing_character`
--
ALTER TABLE `writing_character`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `characters`
--
ALTER TABLE `characters`
  ADD CONSTRAINT `characters_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `communities`
--
ALTER TABLE `communities`
  ADD CONSTRAINT `communities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `story_comments`
--
ALTER TABLE `story_comments`
  ADD CONSTRAINT `story_comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `story_comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_comments_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `story_drafts`
--
ALTER TABLE `story_drafts`
  ADD CONSTRAINT `story_drafts_character_id_foreign` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `story_drafts_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_drafts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `story_likes`
--
ALTER TABLE `story_likes`
  ADD CONSTRAINT `story_likes_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `story_reads`
--
ALTER TABLE `story_reads`
  ADD CONSTRAINT `story_reads_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `story_reads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `writing_character`
--
ALTER TABLE `writing_character`
  ADD CONSTRAINT `writing_character_character_id_foreign` FOREIGN KEY (`character_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `writing_character_story_id_foreign` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `writing_character_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
