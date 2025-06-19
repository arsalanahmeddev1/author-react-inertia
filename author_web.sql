-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 19, 2025 at 10:54 PM
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
(35, '2025_06_02_231226_communities', 26),
(36, '2025_06_16_170557_add_role_to_users_table', 27),
(37, '2025_06_16_183634_add_is_active_to_users_table', 28);

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
('he1w8nCkHLVgbFj0QemxGW8eF84FYxTgt38V35S9', 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkQzQXFRYms3RjVFWlRHZnNCQ245ZEUxS3FWRmZFSERWUnlRZFllYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MzA7fQ==', 1750366198),
('Y2DjBnlmzyFCsMCXflzR8X5Td6l8R1VWk6P0aGCg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVFA2MzN4aUdkakdsSjl2ZlJMcUlBQ0NyMU12MVFDMHZOcXJxSUVUcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jb21tdW5pdHkiO319', 1750361275);

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
(47, NULL, 'Death At Fallow End', 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '<p>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.<span style=\"color: rgba(37, 43, 54, 0.95);\">Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.</span></p>', 'Anne Rice', 'Mystery', 'cover_images/zhgFHOupBWD2kDLdd41Ur4x89cX4iJulbDDrFBnd.png', 5, 0, 0, NULL, 'pending', '2025-05-16 13:56:20', '2025-06-04 17:43:19', 0, NULL),
(48, NULL, 'Death At Fallow End', 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '<p><span style=\"color: rgba(37, 43, 54, 0.95);\">Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.</span></p>', 'Victoria Saccenti', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 29, 0, 0, NULL, 'pending', '2025-05-16 13:58:05', '2025-06-09 15:37:27', 0, NULL),
(49, NULL, 'Death At Fallow End', 'Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.', '<p>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved passion. As the Earl is murdered in a cruel act of betrayal, Virginia is forced to confront long-buried secrets and lost love.</p>', 'Martha Grimes', 'Thriller', 'cover_images/yyRN9KDzLXogQmHo35dmDE6w4D7jhMxSxfFoe29R.png', 21, 0, 0, NULL, 'pending', '2025-05-16 15:36:59', '2025-06-09 15:28:12', 0, NULL),
(52, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by arsalan', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p><p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p><p><br></p><p>testing continue story by userAs Lead, I...</p>', 'admin', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 16, 0, 0, NULL, 'approved', '2025-05-16 16:38:57', '2025-06-05 14:05:02', 1, NULL),
(53, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by admin', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p>\n          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Lead, I...</p>', 'admin', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 7, 0, 0, NULL, 'approved', '2025-05-16 18:30:22', '2025-06-05 14:22:29', 1, NULL),
(54, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by admin', '<p><strong>Death At Fallow End</strong> - Continued from villian\'s perspective</p><p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p><p><br></p><p>As villian, I...</p>', 'admin', 'Mystery', 'cover_images/zhgFHOupBWD2kDLdd41Ur4x89cX4iJulbDDrFBnd.png', 3, 0, 0, NULL, 'approved', '2025-05-16 18:35:08', '2025-06-09 13:21:06', 1, NULL),
(56, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by admin', '<p><strong>Death At Fallow End</strong> - Continued from Hero\'s perspective</p>\n          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Hero, I...</p>', 'admin', 'Thriller', 'cover_images/yyRN9KDzLXogQmHo35dmDE6w4D7jhMxSxfFoe29R.png', 0, 0, 0, NULL, 'rejected', '2025-06-05 10:44:35', '2025-06-05 10:49:03', 1, NULL),
(57, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by newuser', '<p><strong>Death At Fallow End</strong> - Continued from Hero\'s perspective</p>\n testing<p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Hero, I...</p>', 'newuser', 'Thriller', 'cover_images/yyRN9KDzLXogQmHo35dmDE6w4D7jhMxSxfFoe29R.png', 3, 0, 0, NULL, 'approved', '2025-06-09 13:21:43', '2025-06-09 15:02:55', 1, NULL),
(58, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by newuser', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p><div><br></div><b>testing new user community story\n</b>          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Lead, I...</p>', 'newuser', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 2, 0, 0, NULL, 'approved', '2025-06-09 15:04:21', '2025-06-09 15:15:30', 1, NULL),
(59, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by newuser', '<p><strong>Death At Fallow End</strong> - Continued from Hero\'s perspective</p>\n testing story<p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Hero, I...</p>', 'newuser', 'Thriller', 'cover_images/yyRN9KDzLXogQmHo35dmDE6w4D7jhMxSxfFoe29R.png', 1, 0, 0, NULL, 'approved', '2025-06-09 15:28:37', '2025-06-09 15:29:45', 1, NULL),
(60, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by newuser', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p><div><br></div>new story continue \n          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Lead, I...</p>', 'newuser', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 0, 0, 0, NULL, 'pending', '2025-06-09 15:32:26', '2025-06-09 15:32:26', 1, NULL),
(61, NULL, 'Death At Fallow End - Continued by Character', 'A continuation of \"Death At Fallow End\" by newuser', '<p><strong>Death At Fallow End</strong> - Continued from Lead\'s perspective</p>new story 22\n          <p><em>Virginia Weatherby thought she had left her past behind, but the invitation from Crispin Forsythe drags her back to Fallow End, a place where memories are buried, and the air is thick with unresolved ...</em></p>\n          <hr>\n          <p>As Lead, I...</p>', 'newuser', 'Horror', 'cover_images/vIr8QKaeADq11F7WUwahCKFR3T7KD6UyfCBdCan9.png', 0, 0, 0, NULL, 'pending', '2025-06-09 15:37:40', '2025-06-09 15:37:40', 1, NULL);

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

--
-- Dumping data for table `story_reads`
--

INSERT INTO `story_reads` (`id`, `story_id`, `user_id`, `ip_address`, `user_agent`, `created_at`, `updated_at`) VALUES
(453, 49, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 17:03:31', '2025-06-03 17:03:31'),
(454, 49, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 17:03:49', '2025-06-03 17:03:49'),
(455, 49, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 17:03:56', '2025-06-03 17:03:56'),
(456, 49, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 17:04:45', '2025-06-03 17:04:45'),
(457, 49, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-03 17:08:44', '2025-06-03 17:08:44'),
(458, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:39', '2025-06-04 17:42:39'),
(459, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:41', '2025-06-04 17:42:41'),
(460, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:42', '2025-06-04 17:42:42'),
(461, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:43', '2025-06-04 17:42:43'),
(462, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:44', '2025-06-04 17:42:44'),
(463, 54, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:46', '2025-06-04 17:42:46'),
(464, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:49', '2025-06-04 17:42:49'),
(465, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:42:51', '2025-06-04 17:42:51'),
(466, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:03', '2025-06-04 17:43:03'),
(467, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:24', '2025-06-04 17:43:24'),
(468, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:39', '2025-06-04 17:43:39'),
(469, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:41', '2025-06-04 17:43:41'),
(470, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:45', '2025-06-04 17:43:45'),
(471, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:47', '2025-06-04 17:43:47'),
(472, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:47', '2025-06-04 17:43:47'),
(473, 54, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:43:49', '2025-06-04 17:43:49'),
(474, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:44:20', '2025-06-04 17:44:20'),
(475, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:51:38', '2025-06-04 17:51:38'),
(476, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 17:52:49', '2025-06-04 17:52:49'),
(477, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 18:13:13', '2025-06-04 18:13:13'),
(478, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-04 18:13:46', '2025-06-04 18:13:46'),
(479, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 10:31:19', '2025-06-05 10:31:19'),
(480, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 14:04:52', '2025-06-05 14:04:52'),
(481, 52, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 14:05:02', '2025-06-05 14:05:02'),
(482, 53, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 14:22:29', '2025-06-05 14:22:29'),
(483, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 14:22:48', '2025-06-05 14:22:48'),
(484, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 14:23:02', '2025-06-05 14:23:02'),
(485, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 16:22:35', '2025-06-05 16:22:35'),
(486, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 16:23:43', '2025-06-05 16:23:43'),
(487, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 16:24:38', '2025-06-05 16:24:38'),
(488, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:10:15', '2025-06-05 17:10:15'),
(489, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:16:12', '2025-06-05 17:16:12'),
(490, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:17:55', '2025-06-05 17:17:55'),
(491, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:39:03', '2025-06-05 17:39:03'),
(492, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:39:24', '2025-06-05 17:39:24'),
(493, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:39:38', '2025-06-05 17:39:38'),
(494, 48, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 17:41:25', '2025-06-05 17:41:25'),
(495, 48, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-05 18:49:20', '2025-06-05 18:49:20'),
(496, 54, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 13:21:07', '2025-06-09 13:21:07'),
(497, 57, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 13:33:15', '2025-06-09 13:33:15'),
(498, 57, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 13:33:22', '2025-06-09 13:33:22'),
(499, 57, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 15:02:55', '2025-06-09 15:02:55'),
(500, 58, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 15:15:25', '2025-06-09 15:15:25'),
(501, 58, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 15:15:30', '2025-06-09 15:15:30'),
(502, 59, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', '2025-06-09 15:29:45', '2025-06-09 15:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_group` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1:admin,2:user',
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_guest` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_group`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `is_guest`, `created_at`, `updated_at`, `is_admin`, `is_active`) VALUES
(24, '1', 'web engineer', 'webengineer009@gmail.com', 'user', NULL, '$2y$12$ijCNqIUeZFinK6gRrUtzK.GgXYszrmQVDAe6rSzJMPK1bXYteBQ6O', NULL, 0, '2025-05-09 13:50:06', '2025-05-09 13:50:06', 0, 1),
(26, '1', 'oscar steve', 'oscarsteve@gmail.com', 'user', NULL, '$2y$12$VG9mrYIxc.i1bOT81AlVS./Dw..kuWti9adOjwlVkdswQJ.DUjR0O', NULL, 0, '2025-05-15 14:44:42', '2025-05-15 14:44:42', 0, 1),
(27, '1', 'admin', 'admin@gmail.com', 'admin', NULL, '$2y$12$1HgUvn14PrpX.HVuCvk1UOrxuOTig6dK/P6XVNx9AXBC7vwjyz42y', NULL, 0, '2025-05-16 12:58:07', '2025-05-16 12:58:07', 1, 1),
(30, '2', 'newuser', 'user@gmail.com', 'user', NULL, '$2y$12$dD9ioNjZBiAASZM1zLzwCOH1uBI4ZhQ82gBTOVRfPkYSTXnBTz8vq', NULL, 0, '2025-06-05 18:21:28', '2025-06-05 18:21:28', 0, 1),
(31, '1', 'mark herry', 'markherry321@gmail.com', 'user', NULL, '$2y$12$oyMOPQ06y9G11X8DxY8QFuunNI6bl7SecKdvSKoTKco4SiHEUowhW', NULL, 0, '2025-06-06 12:24:06', '2025-06-06 12:24:06', 0, 1),
(32, '1', 'Astra Lambert', 'astra@gmail.com', 'user', NULL, '$2y$12$mUK8pb0xQfXO7p8hoOo3t.pt0j35PUFsXvVOpaXJFmU5j5sxYxjK.', NULL, 0, '2025-06-06 12:27:56', '2025-06-06 12:27:56', 0, 1),
(33, '2', 'Sonya Kelley', 'sonya@gmail.com', 'user', NULL, '$2y$12$Rt7slJqWJBoIognybIjfBefaQxb5GFTgenFnq7rQt/kuh9.v14cu6', NULL, 0, '2025-06-06 12:36:07', '2025-06-06 12:36:07', 0, 1),
(34, '2', 'user', 'newuser@gmail.com', 'user', NULL, '$2y$12$9YQ5Fdtr9QRwUJkkq9unRuwIaiCvA0vcHPogBmzUtA..C2XA1/nia', NULL, 0, '2025-06-16 12:41:47', '2025-06-16 12:41:47', 0, 1),
(35, '1', 'Guest_tyueZx5x', 'guest_zpfGo2oh@example.com', 'user', NULL, '$2y$12$J/lZsMQCSqwGv9KtqZIlEuHz1DHMXVsKkdLfV0QicpF9p5bnu/hLW', NULL, 0, '2025-06-16 13:32:47', '2025-06-16 13:32:47', 0, 1),
(36, '1', 'Guest_KYTYbhMQ', 'guest_n4TaCICn@example.com', 'user', NULL, '$2y$12$0RMRoTFk9m/nBKmR8WfRL.EHGBbRdTScnaX5EPIzZVPFH5BalwoKm', NULL, 0, '2025-06-16 13:33:37', '2025-06-16 13:33:37', 0, 1);

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
(343, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 10:50:44', '2025-06-03 10:50:44', '2025-06-03 10:50:44'),
(344, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-03 16:57:05', '2025-06-03 16:57:05', '2025-06-03 16:57:05'),
(345, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 16:57:10', '2025-06-03 16:57:10', '2025-06-03 16:57:10'),
(346, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-03 17:00:21', '2025-06-03 17:00:21', '2025-06-03 17:00:21'),
(347, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 10:23:08', '2025-06-04 10:23:08', '2025-06-04 10:23:08'),
(348, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 10:24:15', '2025-06-04 10:24:15', '2025-06-04 10:24:15'),
(349, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-04 10:32:49', '2025-06-04 10:32:49', '2025-06-04 10:32:49'),
(350, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-04 10:32:52', '2025-06-04 10:32:52', '2025-06-04 10:32:52'),
(351, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-04 10:32:52', '2025-06-04 10:32:52', '2025-06-04 10:32:52'),
(352, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-04 10:32:53', '2025-06-04 10:32:53', '2025-06-04 10:32:53'),
(353, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-04 10:32:53', '2025-06-04 10:32:53', '2025-06-04 10:32:53'),
(354, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 10:41:12', '2025-06-04 10:41:12', '2025-06-04 10:41:12'),
(355, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 10:41:23', '2025-06-04 10:41:23', '2025-06-04 10:41:23'),
(356, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-04 15:52:05', '2025-06-04 15:52:05', '2025-06-04 15:52:05'),
(357, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-04 15:52:15', '2025-06-04 15:52:15', '2025-06-04 15:52:15'),
(358, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-04 15:52:16', '2025-06-04 15:52:16', '2025-06-04 15:52:16'),
(359, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-04 15:52:16', '2025-06-04 15:52:16', '2025-06-04 15:52:16'),
(360, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-04 15:52:16', '2025-06-04 15:52:16', '2025-06-04 15:52:16'),
(361, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-04 15:52:25', '2025-06-04 15:52:25', '2025-06-04 15:52:25'),
(362, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 15:53:06', '2025-06-04 15:53:06', '2025-06-04 15:53:06'),
(363, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 15:55:09', '2025-06-04 15:55:09', '2025-06-04 15:55:09'),
(364, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-04 15:55:21', '2025-06-04 15:55:21', '2025-06-04 15:55:21'),
(365, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-05 10:24:02', '2025-06-05 10:24:02', '2025-06-05 10:24:02'),
(366, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-05 10:24:18', '2025-06-05 10:24:18', '2025-06-05 10:24:18'),
(367, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-05 10:31:11', '2025-06-05 10:31:11', '2025-06-05 10:31:11'),
(368, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-05 18:21:07', '2025-06-05 18:21:07', '2025-06-05 18:21:07'),
(369, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-05 18:21:09', '2025-06-05 18:21:09', '2025-06-05 18:21:09'),
(370, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-05 18:21:28', '2025-06-05 18:21:28', '2025-06-05 18:21:28'),
(371, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-05 18:21:29', '2025-06-05 18:21:29', '2025-06-05 18:21:29'),
(372, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/read', '2025-06-05 18:49:20', '2025-06-05 18:49:20', '2025-06-05 18:49:20'),
(373, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/stories', '2025-06-05 18:49:20', '2025-06-05 18:49:20', '2025-06-05 18:49:20'),
(374, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-05 18:49:21', '2025-06-05 18:49:21', '2025-06-05 18:49:21'),
(375, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/comments', '2025-06-05 18:49:23', '2025-06-05 18:49:23', '2025-06-05 18:49:23'),
(376, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/comments', '2025-06-05 18:49:23', '2025-06-05 18:49:23', '2025-06-05 18:49:23'),
(377, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 10:29:19', '2025-06-06 10:29:19', '2025-06-06 10:29:19'),
(378, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 10:30:16', '2025-06-06 10:30:16', '2025-06-06 10:30:16'),
(379, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/stories', '2025-06-06 10:30:17', '2025-06-06 10:30:17', '2025-06-06 10:30:17'),
(380, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 10:30:23', '2025-06-06 10:30:23', '2025-06-06 10:30:23'),
(381, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 10:30:24', '2025-06-06 10:30:24', '2025-06-06 10:30:24'),
(382, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:30:42', '2025-06-06 10:30:42', '2025-06-06 10:30:42'),
(383, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:37:03', '2025-06-06 10:37:03', '2025-06-06 10:37:03'),
(384, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:37:08', '2025-06-06 10:37:08', '2025-06-06 10:37:08'),
(385, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:38:15', '2025-06-06 10:38:15', '2025-06-06 10:38:15'),
(386, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:38:31', '2025-06-06 10:38:31', '2025-06-06 10:38:31'),
(387, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:38:42', '2025-06-06 10:38:42', '2025-06-06 10:38:42'),
(388, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:39:57', '2025-06-06 10:39:57', '2025-06-06 10:39:57'),
(389, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:42:47', '2025-06-06 10:42:47', '2025-06-06 10:42:47'),
(390, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:42:56', '2025-06-06 10:42:56', '2025-06-06 10:42:56'),
(391, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:43:22', '2025-06-06 10:43:22', '2025-06-06 10:43:22'),
(392, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:43:59', '2025-06-06 10:43:59', '2025-06-06 10:43:59'),
(393, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:44:05', '2025-06-06 10:44:05', '2025-06-06 10:44:05'),
(394, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:45:48', '2025-06-06 10:45:48', '2025-06-06 10:45:48'),
(395, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:45:52', '2025-06-06 10:45:52', '2025-06-06 10:45:52'),
(396, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:46:05', '2025-06-06 10:46:05', '2025-06-06 10:46:05'),
(397, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:46:05', '2025-06-06 10:46:05', '2025-06-06 10:46:05'),
(398, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:49:50', '2025-06-06 10:49:50', '2025-06-06 10:49:50'),
(399, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:50:17', '2025-06-06 10:50:17', '2025-06-06 10:50:17'),
(400, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:50:36', '2025-06-06 10:50:36', '2025-06-06 10:50:36'),
(401, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:51:00', '2025-06-06 10:51:00', '2025-06-06 10:51:00'),
(402, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 10:51:00', '2025-06-06 10:51:00', '2025-06-06 10:51:00'),
(403, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 10:51:11', '2025-06-06 10:51:11', '2025-06-06 10:51:11'),
(404, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 10:51:16', '2025-06-06 10:51:16', '2025-06-06 10:51:16'),
(405, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 11:05:35', '2025-06-06 11:05:35', '2025-06-06 11:05:35'),
(406, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 11:07:27', '2025-06-06 11:07:27', '2025-06-06 11:07:27'),
(407, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 11:07:39', '2025-06-06 11:07:39', '2025-06-06 11:07:39'),
(408, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 11:07:45', '2025-06-06 11:07:45', '2025-06-06 11:07:45'),
(409, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:11:01', '2025-06-06 12:11:01', '2025-06-06 12:11:01'),
(410, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 12:13:23', '2025-06-06 12:13:23', '2025-06-06 12:13:23'),
(411, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 12:13:32', '2025-06-06 12:13:32', '2025-06-06 12:13:32'),
(412, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:13:33', '2025-06-06 12:13:33', '2025-06-06 12:13:33');
INSERT INTO `visits` (`id`, `user_id`, `ip_address`, `user_agent`, `url`, `visited_at`, `created_at`, `updated_at`) VALUES
(413, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 12:13:41', '2025-06-06 12:13:41', '2025-06-06 12:13:41'),
(414, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:13:42', '2025-06-06 12:13:42', '2025-06-06 12:13:42'),
(415, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:13:49', '2025-06-06 12:13:49', '2025-06-06 12:13:49'),
(416, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:13:53', '2025-06-06 12:13:53', '2025-06-06 12:13:53'),
(417, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:15:51', '2025-06-06 12:15:51', '2025-06-06 12:15:51'),
(418, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:15:54', '2025-06-06 12:15:54', '2025-06-06 12:15:54'),
(419, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:17:19', '2025-06-06 12:17:19', '2025-06-06 12:17:19'),
(420, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:17:20', '2025-06-06 12:17:20', '2025-06-06 12:17:20'),
(421, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:17:22', '2025-06-06 12:17:22', '2025-06-06 12:17:22'),
(422, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:17:25', '2025-06-06 12:17:25', '2025-06-06 12:17:25'),
(423, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:17:27', '2025-06-06 12:17:27', '2025-06-06 12:17:27'),
(424, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:17:49', '2025-06-06 12:17:49', '2025-06-06 12:17:49'),
(425, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:18:14', '2025-06-06 12:18:14', '2025-06-06 12:18:14'),
(426, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:21:20', '2025-06-06 12:21:20', '2025-06-06 12:21:20'),
(427, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:21:30', '2025-06-06 12:21:30', '2025-06-06 12:21:30'),
(428, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:22:01', '2025-06-06 12:22:01', '2025-06-06 12:22:01'),
(429, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:10', '2025-06-06 12:22:10', '2025-06-06 12:22:10'),
(430, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:14', '2025-06-06 12:22:14', '2025-06-06 12:22:14'),
(431, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:15', '2025-06-06 12:22:15', '2025-06-06 12:22:15'),
(432, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:17', '2025-06-06 12:22:17', '2025-06-06 12:22:17'),
(433, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:27', '2025-06-06 12:22:27', '2025-06-06 12:22:27'),
(434, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:22:30', '2025-06-06 12:22:30', '2025-06-06 12:22:30'),
(435, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:22:55', '2025-06-06 12:22:55', '2025-06-06 12:22:55'),
(436, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:55', '2025-06-06 12:22:55', '2025-06-06 12:22:55'),
(437, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-06 12:22:59', '2025-06-06 12:22:59', '2025-06-06 12:22:59'),
(438, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:22:59', '2025-06-06 12:22:59', '2025-06-06 12:22:59'),
(439, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:23:02', '2025-06-06 12:23:02', '2025-06-06 12:23:02'),
(440, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:24:06', '2025-06-06 12:24:06', '2025-06-06 12:24:06'),
(441, 31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:24:07', '2025-06-06 12:24:07', '2025-06-06 12:24:07'),
(442, 31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:24:12', '2025-06-06 12:24:12', '2025-06-06 12:24:12'),
(443, 31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:26:58', '2025-06-06 12:26:58', '2025-06-06 12:26:58'),
(444, 31, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-06 12:27:01', '2025-06-06 12:27:01', '2025-06-06 12:27:01'),
(445, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:27:01', '2025-06-06 12:27:01', '2025-06-06 12:27:01'),
(446, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:27:03', '2025-06-06 12:27:03', '2025-06-06 12:27:03'),
(447, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:27:56', '2025-06-06 12:27:56', '2025-06-06 12:27:56'),
(448, 32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:27:57', '2025-06-06 12:27:57', '2025-06-06 12:27:57'),
(449, 32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:28:03', '2025-06-06 12:28:03', '2025-06-06 12:28:03'),
(450, 32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:35:09', '2025-06-06 12:35:09', '2025-06-06 12:35:09'),
(451, 32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:35:11', '2025-06-06 12:35:11', '2025-06-06 12:35:11'),
(452, 32, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-06 12:35:15', '2025-06-06 12:35:15', '2025-06-06 12:35:15'),
(453, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:35:16', '2025-06-06 12:35:16', '2025-06-06 12:35:16'),
(454, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:35:17', '2025-06-06 12:35:17', '2025-06-06 12:35:17'),
(455, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:35:49', '2025-06-06 12:35:49', '2025-06-06 12:35:49'),
(456, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:35:50', '2025-06-06 12:35:50', '2025-06-06 12:35:50'),
(457, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 12:36:07', '2025-06-06 12:36:07', '2025-06-06 12:36:07'),
(458, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-06 12:36:08', '2025-06-06 12:36:08', '2025-06-06 12:36:08'),
(459, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:36:20', '2025-06-06 12:36:20', '2025-06-06 12:36:20'),
(460, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:48:19', '2025-06-06 12:48:19', '2025-06-06 12:48:19'),
(461, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:13', '2025-06-06 12:49:13', '2025-06-06 12:49:13'),
(462, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:14', '2025-06-06 12:49:14', '2025-06-06 12:49:14'),
(463, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:15', '2025-06-06 12:49:15', '2025-06-06 12:49:15'),
(464, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:15', '2025-06-06 12:49:15', '2025-06-06 12:49:15'),
(465, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:15', '2025-06-06 12:49:15', '2025-06-06 12:49:15'),
(466, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:15', '2025-06-06 12:49:15', '2025-06-06 12:49:15'),
(467, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:16', '2025-06-06 12:49:16', '2025-06-06 12:49:16'),
(468, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:16', '2025-06-06 12:49:16', '2025-06-06 12:49:16'),
(469, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:16', '2025-06-06 12:49:16', '2025-06-06 12:49:16'),
(470, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:16', '2025-06-06 12:49:16', '2025-06-06 12:49:16'),
(471, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:17', '2025-06-06 12:49:17', '2025-06-06 12:49:17'),
(472, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:17', '2025-06-06 12:49:17', '2025-06-06 12:49:17'),
(473, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:17', '2025-06-06 12:49:17', '2025-06-06 12:49:17'),
(474, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:17', '2025-06-06 12:49:17', '2025-06-06 12:49:17'),
(475, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:18', '2025-06-06 12:49:18', '2025-06-06 12:49:18'),
(476, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:18', '2025-06-06 12:49:18', '2025-06-06 12:49:18'),
(477, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:18', '2025-06-06 12:49:18', '2025-06-06 12:49:18'),
(478, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:18', '2025-06-06 12:49:18', '2025-06-06 12:49:18'),
(479, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:19', '2025-06-06 12:49:19', '2025-06-06 12:49:19'),
(480, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:32', '2025-06-06 12:49:32', '2025-06-06 12:49:32'),
(481, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:33', '2025-06-06 12:49:33', '2025-06-06 12:49:33'),
(482, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:33', '2025-06-06 12:49:33', '2025-06-06 12:49:33'),
(483, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:33', '2025-06-06 12:49:33', '2025-06-06 12:49:33'),
(484, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:33', '2025-06-06 12:49:33', '2025-06-06 12:49:33'),
(485, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:34', '2025-06-06 12:49:34', '2025-06-06 12:49:34'),
(486, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:34', '2025-06-06 12:49:34', '2025-06-06 12:49:34'),
(487, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:34', '2025-06-06 12:49:34', '2025-06-06 12:49:34'),
(488, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:35', '2025-06-06 12:49:35', '2025-06-06 12:49:35'),
(489, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:35', '2025-06-06 12:49:35', '2025-06-06 12:49:35'),
(490, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:35', '2025-06-06 12:49:35', '2025-06-06 12:49:35'),
(491, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:35', '2025-06-06 12:49:35', '2025-06-06 12:49:35'),
(492, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:36', '2025-06-06 12:49:36', '2025-06-06 12:49:36'),
(493, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:36', '2025-06-06 12:49:36', '2025-06-06 12:49:36'),
(494, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:36', '2025-06-06 12:49:36', '2025-06-06 12:49:36'),
(495, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:36', '2025-06-06 12:49:36', '2025-06-06 12:49:36'),
(496, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:37', '2025-06-06 12:49:37', '2025-06-06 12:49:37'),
(497, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:37', '2025-06-06 12:49:37', '2025-06-06 12:49:37'),
(498, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:37', '2025-06-06 12:49:37', '2025-06-06 12:49:37'),
(499, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:37', '2025-06-06 12:49:37', '2025-06-06 12:49:37'),
(500, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:37', '2025-06-06 12:49:37', '2025-06-06 12:49:37'),
(501, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:38', '2025-06-06 12:49:38', '2025-06-06 12:49:38'),
(502, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:38', '2025-06-06 12:49:38', '2025-06-06 12:49:38'),
(503, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:39', '2025-06-06 12:49:39', '2025-06-06 12:49:39'),
(504, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:39', '2025-06-06 12:49:39', '2025-06-06 12:49:39'),
(505, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:39', '2025-06-06 12:49:39', '2025-06-06 12:49:39'),
(506, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:39', '2025-06-06 12:49:39', '2025-06-06 12:49:39'),
(507, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:39', '2025-06-06 12:49:39', '2025-06-06 12:49:39'),
(508, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:40', '2025-06-06 12:49:40', '2025-06-06 12:49:40'),
(509, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:40', '2025-06-06 12:49:40', '2025-06-06 12:49:40'),
(510, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:40', '2025-06-06 12:49:40', '2025-06-06 12:49:40'),
(511, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:40', '2025-06-06 12:49:40', '2025-06-06 12:49:40'),
(512, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:41', '2025-06-06 12:49:41', '2025-06-06 12:49:41'),
(513, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:41', '2025-06-06 12:49:41', '2025-06-06 12:49:41'),
(514, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:41', '2025-06-06 12:49:41', '2025-06-06 12:49:41'),
(515, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:41', '2025-06-06 12:49:41', '2025-06-06 12:49:41'),
(516, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:42', '2025-06-06 12:49:42', '2025-06-06 12:49:42'),
(517, 33, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-06 12:49:42', '2025-06-06 12:49:42', '2025-06-06 12:49:42'),
(518, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 16:08:18', '2025-06-06 16:08:18', '2025-06-06 16:08:18'),
(519, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/forgot-password', '2025-06-06 16:09:00', '2025-06-06 16:09:00', '2025-06-06 16:09:00'),
(520, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 16:09:05', '2025-06-06 16:09:05', '2025-06-06 16:09:05'),
(521, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 16:09:07', '2025-06-06 16:09:07', '2025-06-06 16:09:07'),
(522, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 16:09:16', '2025-06-06 16:09:16', '2025-06-06 16:09:16'),
(523, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-06 16:09:27', '2025-06-06 16:09:27', '2025-06-06 16:09:27'),
(524, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 16:09:28', '2025-06-06 16:09:28', '2025-06-06 16:09:28'),
(525, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-06 16:25:21', '2025-06-06 16:25:21', '2025-06-06 16:25:21'),
(526, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:27:10', '2025-06-09 10:27:10', '2025-06-09 10:27:10'),
(527, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:27:35', '2025-06-09 10:27:35', '2025-06-09 10:27:35'),
(528, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 10:43:24', '2025-06-09 10:43:24', '2025-06-09 10:43:24'),
(529, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:43:28', '2025-06-09 10:43:28', '2025-06-09 10:43:28'),
(530, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:43:35', '2025-06-09 10:43:35', '2025-06-09 10:43:35'),
(531, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:43:36', '2025-06-09 10:43:36', '2025-06-09 10:43:36'),
(532, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:43:46', '2025-06-09 10:43:46', '2025-06-09 10:43:46'),
(533, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:43:47', '2025-06-09 10:43:47', '2025-06-09 10:43:47'),
(534, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 10:44:01', '2025-06-09 10:44:01', '2025-06-09 10:44:01'),
(535, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 10:44:02', '2025-06-09 10:44:02', '2025-06-09 10:44:02'),
(536, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/users', '2025-06-09 10:44:09', '2025-06-09 10:44:09', '2025-06-09 10:44:09'),
(537, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 10:44:20', '2025-06-09 10:44:20', '2025-06-09 10:44:20'),
(538, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 10:55:02', '2025-06-09 10:55:02', '2025-06-09 10:55:02'),
(539, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 10:56:28', '2025-06-09 10:56:28', '2025-06-09 10:56:28'),
(540, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/stories', '2025-06-09 10:56:36', '2025-06-09 10:56:36', '2025-06-09 10:56:36'),
(541, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/stories', '2025-06-09 11:01:35', '2025-06-09 11:01:35', '2025-06-09 11:01:35'),
(542, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 11:14:59', '2025-06-09 11:14:59', '2025-06-09 11:14:59'),
(543, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 11:15:08', '2025-06-09 11:15:08', '2025-06-09 11:15:08'),
(544, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 11:16:30', '2025-06-09 11:16:30', '2025-06-09 11:16:30'),
(545, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 11:17:09', '2025-06-09 11:17:09', '2025-06-09 11:17:09'),
(546, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 11:17:34', '2025-06-09 11:17:34', '2025-06-09 11:17:34'),
(547, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 11:20:14', '2025-06-09 11:20:14', '2025-06-09 11:20:14'),
(548, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 11:20:48', '2025-06-09 11:20:48', '2025-06-09 11:20:48'),
(549, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 11:20:49', '2025-06-09 11:20:49', '2025-06-09 11:20:49'),
(550, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 11:20:51', '2025-06-09 11:20:51', '2025-06-09 11:20:51'),
(551, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 11:21:00', '2025-06-09 11:21:00', '2025-06-09 11:21:00'),
(552, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 11:43:13', '2025-06-09 11:43:13', '2025-06-09 11:43:13'),
(553, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 11:43:15', '2025-06-09 11:43:15', '2025-06-09 11:43:15'),
(554, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 11:43:24', '2025-06-09 11:43:24', '2025-06-09 11:43:24'),
(555, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 11:43:25', '2025-06-09 11:43:25', '2025-06-09 11:43:25'),
(556, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 11:43:29', '2025-06-09 11:43:29', '2025-06-09 11:43:29'),
(557, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 12:05:21', '2025-06-09 12:05:21', '2025-06-09 12:05:21'),
(558, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 12:05:21', '2025-06-09 12:05:21', '2025-06-09 12:05:21'),
(559, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 12:05:52', '2025-06-09 12:05:52', '2025-06-09 12:05:52'),
(560, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 12:05:54', '2025-06-09 12:05:54', '2025-06-09 12:05:54'),
(561, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 12:16:18', '2025-06-09 12:16:18', '2025-06-09 12:16:18'),
(562, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-09 12:17:46', '2025-06-09 12:17:46', '2025-06-09 12:17:46'),
(563, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 12:19:57', '2025-06-09 12:19:57', '2025-06-09 12:19:57'),
(564, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 12:20:38', '2025-06-09 12:20:38', '2025-06-09 12:20:38'),
(565, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 12:20:38', '2025-06-09 12:20:38', '2025-06-09 12:20:38'),
(566, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 12:20:40', '2025-06-09 12:20:40', '2025-06-09 12:20:40'),
(567, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 12:20:51', '2025-06-09 12:20:51', '2025-06-09 12:20:51'),
(568, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 12:21:22', '2025-06-09 12:21:23', '2025-06-09 12:21:23'),
(569, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 12:21:24', '2025-06-09 12:21:24', '2025-06-09 12:21:24'),
(570, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 12:21:34', '2025-06-09 12:21:34', '2025-06-09 12:21:34'),
(571, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 12:21:35', '2025-06-09 12:21:35', '2025-06-09 12:21:35'),
(572, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-09 12:21:39', '2025-06-09 12:21:39', '2025-06-09 12:21:39'),
(573, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 12:21:41', '2025-06-09 12:21:41', '2025-06-09 12:21:41'),
(574, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 13:05:01', '2025-06-09 13:05:01', '2025-06-09 13:05:01'),
(575, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:05:31', '2025-06-09 13:05:31', '2025-06-09 13:05:31'),
(576, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:09:52', '2025-06-09 13:09:52', '2025-06-09 13:09:52'),
(577, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-09 13:09:53', '2025-06-09 13:09:53', '2025-06-09 13:09:53'),
(578, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:09:57', '2025-06-09 13:09:57', '2025-06-09 13:09:57'),
(579, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:18:35', '2025-06-09 13:18:35', '2025-06-09 13:18:35'),
(580, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:19:38', '2025-06-09 13:19:38', '2025-06-09 13:19:38'),
(581, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 13:19:45', '2025-06-09 13:19:45', '2025-06-09 13:19:45'),
(582, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:19:45', '2025-06-09 13:19:46', '2025-06-09 13:19:46'),
(583, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:19:48', '2025-06-09 13:19:48', '2025-06-09 13:19:48'),
(584, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:19:56', '2025-06-09 13:19:56', '2025-06-09 13:19:56'),
(585, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:19:56', '2025-06-09 13:19:56', '2025-06-09 13:19:56'),
(586, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:19:59', '2025-06-09 13:19:59', '2025-06-09 13:19:59'),
(587, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 13:20:05', '2025-06-09 13:20:05', '2025-06-09 13:20:05'),
(588, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 13:20:06', '2025-06-09 13:20:06', '2025-06-09 13:20:06'),
(589, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 13:20:06', '2025-06-09 13:20:06', '2025-06-09 13:20:06'),
(590, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 13:20:07', '2025-06-09 13:20:07', '2025-06-09 13:20:07'),
(591, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 13:20:09', '2025-06-09 13:20:09', '2025-06-09 13:20:09'),
(592, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 13:20:10', '2025-06-09 13:20:10', '2025-06-09 13:20:10'),
(593, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 13:20:10', '2025-06-09 13:20:10', '2025-06-09 13:20:10'),
(594, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 13:20:11', '2025-06-09 13:20:11', '2025-06-09 13:20:11'),
(595, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 13:20:18', '2025-06-09 13:20:18', '2025-06-09 13:20:18'),
(596, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:20:18', '2025-06-09 13:20:18', '2025-06-09 13:20:18'),
(597, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:20:21', '2025-06-09 13:20:21', '2025-06-09 13:20:21'),
(598, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:20:36', '2025-06-09 13:20:36', '2025-06-09 13:20:36'),
(599, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:20:45', '2025-06-09 13:20:45', '2025-06-09 13:20:45'),
(600, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:20:47', '2025-06-09 13:20:47', '2025-06-09 13:20:47'),
(601, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:20:53', '2025-06-09 13:20:53', '2025-06-09 13:20:53'),
(602, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:20:54', '2025-06-09 13:20:54', '2025-06-09 13:20:54'),
(603, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:20:57', '2025-06-09 13:20:57', '2025-06-09 13:20:57'),
(604, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 13:21:02', '2025-06-09 13:21:02', '2025-06-09 13:21:02'),
(605, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 13:21:03', '2025-06-09 13:21:03', '2025-06-09 13:21:03'),
(606, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 13:21:04', '2025-06-09 13:21:04', '2025-06-09 13:21:04'),
(607, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 13:21:04', '2025-06-09 13:21:04', '2025-06-09 13:21:04'),
(608, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/54', '2025-06-09 13:21:06', '2025-06-09 13:21:06', '2025-06-09 13:21:06'),
(609, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/comments', '2025-06-09 13:21:08', '2025-06-09 13:21:08', '2025-06-09 13:21:08'),
(610, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 13:21:09', '2025-06-09 13:21:09', '2025-06-09 13:21:09'),
(611, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/comments', '2025-06-09 13:21:09', '2025-06-09 13:21:09', '2025-06-09 13:21:09'),
(612, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 13:21:13', '2025-06-09 13:21:13', '2025-06-09 13:21:13'),
(613, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 13:21:13', '2025-06-09 13:21:13', '2025-06-09 13:21:13'),
(614, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 13:21:14', '2025-06-09 13:21:14', '2025-06-09 13:21:14'),
(615, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 13:21:14', '2025-06-09 13:21:14', '2025-06-09 13:21:14'),
(616, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49', '2025-06-09 13:21:23', '2025-06-09 13:21:23', '2025-06-09 13:21:23'),
(617, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 13:21:24', '2025-06-09 13:21:24', '2025-06-09 13:21:24');
INSERT INTO `visits` (`id`, `user_id`, `ip_address`, `user_agent`, `url`, `visited_at`, `created_at`, `updated_at`) VALUES
(618, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/comments', '2025-06-09 13:21:24', '2025-06-09 13:21:24', '2025-06-09 13:21:24'),
(619, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/drafts', '2025-06-09 13:21:26', '2025-06-09 13:21:26', '2025-06-09 13:21:26'),
(620, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/store', '2025-06-09 13:21:43', '2025-06-09 13:21:43', '2025-06-09 13:21:43'),
(621, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/57', '2025-06-09 13:21:44', '2025-06-09 13:21:44', '2025-06-09 13:21:44'),
(622, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:21:51', '2025-06-09 13:21:51', '2025-06-09 13:21:51'),
(623, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 13:22:00', '2025-06-09 13:22:00', '2025-06-09 13:22:00'),
(624, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:22:00', '2025-06-09 13:22:00', '2025-06-09 13:22:00'),
(625, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:22:02', '2025-06-09 13:22:02', '2025-06-09 13:22:02'),
(626, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:22:11', '2025-06-09 13:22:11', '2025-06-09 13:22:11'),
(627, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:32:20', '2025-06-09 13:32:20', '2025-06-09 13:32:20'),
(628, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:32:22', '2025-06-09 13:32:22', '2025-06-09 13:32:22'),
(629, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 13:32:40', '2025-06-09 13:32:40', '2025-06-09 13:32:40'),
(630, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 13:32:41', '2025-06-09 13:32:41', '2025-06-09 13:32:41'),
(631, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:32:44', '2025-06-09 13:32:44', '2025-06-09 13:32:44'),
(632, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:32:58', '2025-06-09 13:32:58', '2025-06-09 13:32:58'),
(633, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 13:33:09', '2025-06-09 13:33:09', '2025-06-09 13:33:09'),
(634, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 13:33:09', '2025-06-09 13:33:09', '2025-06-09 13:33:09'),
(635, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 13:33:10', '2025-06-09 13:33:10', '2025-06-09 13:33:10'),
(636, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 13:33:10', '2025-06-09 13:33:10', '2025-06-09 13:33:10'),
(637, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 13:33:10', '2025-06-09 13:33:10', '2025-06-09 13:33:10'),
(638, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/57', '2025-06-09 13:33:15', '2025-06-09 13:33:15', '2025-06-09 13:33:15'),
(639, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/comments', '2025-06-09 13:33:16', '2025-06-09 13:33:16', '2025-06-09 13:33:16'),
(640, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 13:33:16', '2025-06-09 13:33:16', '2025-06-09 13:33:16'),
(641, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/comments', '2025-06-09 13:33:16', '2025-06-09 13:33:16', '2025-06-09 13:33:16'),
(642, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/57', '2025-06-09 13:33:22', '2025-06-09 13:33:22', '2025-06-09 13:33:22'),
(643, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 13:33:23', '2025-06-09 13:33:23', '2025-06-09 13:33:23'),
(644, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/comments', '2025-06-09 13:33:23', '2025-06-09 13:33:23', '2025-06-09 13:33:23'),
(645, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/comments', '2025-06-09 13:33:23', '2025-06-09 13:33:23', '2025-06-09 13:33:23'),
(646, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:33:37', '2025-06-09 13:33:37', '2025-06-09 13:33:37'),
(647, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:34:28', '2025-06-09 13:34:28', '2025-06-09 13:34:28'),
(648, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:35:43', '2025-06-09 13:35:43', '2025-06-09 13:35:43'),
(649, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:37:22', '2025-06-09 13:37:22', '2025-06-09 13:37:22'),
(650, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:38:15', '2025-06-09 13:38:15', '2025-06-09 13:38:15'),
(651, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:38:33', '2025-06-09 13:38:33', '2025-06-09 13:38:33'),
(652, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:39:07', '2025-06-09 13:39:07', '2025-06-09 13:39:07'),
(653, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:39:22', '2025-06-09 13:39:22', '2025-06-09 13:39:22'),
(654, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:39:29', '2025-06-09 13:39:29', '2025-06-09 13:39:29'),
(655, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:39:38', '2025-06-09 13:39:38', '2025-06-09 13:39:38'),
(656, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:42:46', '2025-06-09 13:42:46', '2025-06-09 13:42:46'),
(657, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:43:39', '2025-06-09 13:43:39', '2025-06-09 13:43:39'),
(658, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:44:23', '2025-06-09 13:44:23', '2025-06-09 13:44:23'),
(659, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:45:04', '2025-06-09 13:45:04', '2025-06-09 13:45:04'),
(660, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 13:45:10', '2025-06-09 13:45:10', '2025-06-09 13:45:10'),
(661, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/57', '2025-06-09 15:02:55', '2025-06-09 15:02:55', '2025-06-09 15:02:55'),
(662, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:03:03', '2025-06-09 15:03:03', '2025-06-09 15:03:03'),
(663, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/comments', '2025-06-09 15:03:04', '2025-06-09 15:03:04', '2025-06-09 15:03:04'),
(664, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/comments', '2025-06-09 15:03:04', '2025-06-09 15:03:04', '2025-06-09 15:03:04'),
(665, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:03:28', '2025-06-09 15:03:28', '2025-06-09 15:03:28'),
(666, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:03:29', '2025-06-09 15:03:29', '2025-06-09 15:03:29'),
(667, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:03:29', '2025-06-09 15:03:29', '2025-06-09 15:03:29'),
(668, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:03:29', '2025-06-09 15:03:29', '2025-06-09 15:03:29'),
(669, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:03:30', '2025-06-09 15:03:30', '2025-06-09 15:03:30'),
(670, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:03:33', '2025-06-09 15:03:33', '2025-06-09 15:03:33'),
(671, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:03:33', '2025-06-09 15:03:33', '2025-06-09 15:03:33'),
(672, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:03:34', '2025-06-09 15:03:34', '2025-06-09 15:03:34'),
(673, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:03:34', '2025-06-09 15:03:34', '2025-06-09 15:03:34'),
(674, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48', '2025-06-09 15:03:52', '2025-06-09 15:03:52', '2025-06-09 15:03:52'),
(675, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/comments', '2025-06-09 15:03:53', '2025-06-09 15:03:53', '2025-06-09 15:03:53'),
(676, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:03:53', '2025-06-09 15:03:53', '2025-06-09 15:03:53'),
(677, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/drafts', '2025-06-09 15:03:56', '2025-06-09 15:03:56', '2025-06-09 15:03:56'),
(678, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/store', '2025-06-09 15:04:21', '2025-06-09 15:04:21', '2025-06-09 15:04:21'),
(679, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/58', '2025-06-09 15:04:21', '2025-06-09 15:04:21', '2025-06-09 15:04:21'),
(680, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-09 15:04:29', '2025-06-09 15:04:29', '2025-06-09 15:04:29'),
(681, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:04:47', '2025-06-09 15:04:47', '2025-06-09 15:04:47'),
(682, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:04:51', '2025-06-09 15:04:51', '2025-06-09 15:04:51'),
(683, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 15:04:54', '2025-06-09 15:04:54', '2025-06-09 15:04:54'),
(684, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:04:55', '2025-06-09 15:04:55', '2025-06-09 15:04:55'),
(685, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:05:06', '2025-06-09 15:05:06', '2025-06-09 15:05:06'),
(686, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:05:18', '2025-06-09 15:05:18', '2025-06-09 15:05:18'),
(687, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:06:27', '2025-06-09 15:06:27', '2025-06-09 15:06:27'),
(688, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:06:31', '2025-06-09 15:06:31', '2025-06-09 15:06:31'),
(689, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:06:39', '2025-06-09 15:06:39', '2025-06-09 15:06:39'),
(690, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:06:39', '2025-06-09 15:06:39', '2025-06-09 15:06:39'),
(691, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:06:44', '2025-06-09 15:06:44', '2025-06-09 15:06:44'),
(692, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:06:46', '2025-06-09 15:06:46', '2025-06-09 15:06:46'),
(693, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:14:34', '2025-06-09 15:14:34', '2025-06-09 15:14:34'),
(694, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:14:57', '2025-06-09 15:14:57', '2025-06-09 15:14:57'),
(695, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:14:58', '2025-06-09 15:14:58', '2025-06-09 15:14:58'),
(696, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:14:58', '2025-06-09 15:14:58', '2025-06-09 15:14:58'),
(697, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:14:58', '2025-06-09 15:14:58', '2025-06-09 15:14:58'),
(698, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:15:00', '2025-06-09 15:15:00', '2025-06-09 15:15:00'),
(699, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:15:01', '2025-06-09 15:15:01', '2025-06-09 15:15:01'),
(700, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:15:01', '2025-06-09 15:15:01', '2025-06-09 15:15:01'),
(701, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:15:01', '2025-06-09 15:15:01', '2025-06-09 15:15:01'),
(702, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:15:01', '2025-06-09 15:15:01', '2025-06-09 15:15:01'),
(703, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:15:02', '2025-06-09 15:15:02', '2025-06-09 15:15:02'),
(704, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:15:02', '2025-06-09 15:15:02', '2025-06-09 15:15:02'),
(705, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:15:03', '2025-06-09 15:15:03', '2025-06-09 15:15:03'),
(706, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:15:03', '2025-06-09 15:15:03', '2025-06-09 15:15:03'),
(707, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:15:03', '2025-06-09 15:15:03', '2025-06-09 15:15:03'),
(708, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:15:08', '2025-06-09 15:15:08', '2025-06-09 15:15:08'),
(709, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:15:08', '2025-06-09 15:15:08', '2025-06-09 15:15:08'),
(710, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:15:09', '2025-06-09 15:15:09', '2025-06-09 15:15:09'),
(711, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:15:09', '2025-06-09 15:15:09', '2025-06-09 15:15:09'),
(712, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:15:09', '2025-06-09 15:15:09', '2025-06-09 15:15:09'),
(713, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:15:09', '2025-06-09 15:15:09', '2025-06-09 15:15:09'),
(714, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:15:19', '2025-06-09 15:15:19', '2025-06-09 15:15:19'),
(715, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:15:20', '2025-06-09 15:15:20', '2025-06-09 15:15:20'),
(716, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:15:20', '2025-06-09 15:15:20', '2025-06-09 15:15:20'),
(717, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:15:20', '2025-06-09 15:15:20', '2025-06-09 15:15:20'),
(718, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:15:21', '2025-06-09 15:15:21', '2025-06-09 15:15:21'),
(719, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:15:21', '2025-06-09 15:15:21', '2025-06-09 15:15:21'),
(720, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/58', '2025-06-09 15:15:25', '2025-06-09 15:15:25', '2025-06-09 15:15:25'),
(721, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/comments', '2025-06-09 15:15:25', '2025-06-09 15:15:25', '2025-06-09 15:15:25'),
(722, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:15:26', '2025-06-09 15:15:26', '2025-06-09 15:15:26'),
(723, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/comments', '2025-06-09 15:15:26', '2025-06-09 15:15:26', '2025-06-09 15:15:26'),
(724, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/58', '2025-06-09 15:15:30', '2025-06-09 15:15:30', '2025-06-09 15:15:30'),
(725, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:15:31', '2025-06-09 15:15:31', '2025-06-09 15:15:31'),
(726, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/comments', '2025-06-09 15:15:31', '2025-06-09 15:15:31', '2025-06-09 15:15:31'),
(727, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/comments', '2025-06-09 15:15:32', '2025-06-09 15:15:32', '2025-06-09 15:15:32'),
(728, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:15:33', '2025-06-09 15:15:33', '2025-06-09 15:15:33'),
(729, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:15:33', '2025-06-09 15:15:33', '2025-06-09 15:15:33'),
(730, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:15:33', '2025-06-09 15:15:33', '2025-06-09 15:15:33'),
(731, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:15:34', '2025-06-09 15:15:34', '2025-06-09 15:15:34'),
(732, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:15:34', '2025-06-09 15:15:34', '2025-06-09 15:15:34'),
(733, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:20:28', '2025-06-09 15:20:28', '2025-06-09 15:20:28'),
(734, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:23:54', '2025-06-09 15:23:54', '2025-06-09 15:23:54'),
(735, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:27:01', '2025-06-09 15:27:01', '2025-06-09 15:27:01'),
(736, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:27:07', '2025-06-09 15:27:07', '2025-06-09 15:27:07'),
(737, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:27:17', '2025-06-09 15:27:17', '2025-06-09 15:27:17'),
(738, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:27:18', '2025-06-09 15:27:18', '2025-06-09 15:27:18'),
(739, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:27:18', '2025-06-09 15:27:18', '2025-06-09 15:27:18'),
(740, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:27:19', '2025-06-09 15:27:19', '2025-06-09 15:27:19'),
(741, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:27:19', '2025-06-09 15:27:19', '2025-06-09 15:27:19'),
(742, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:27:19', '2025-06-09 15:27:19', '2025-06-09 15:27:19'),
(743, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:28:04', '2025-06-09 15:28:04', '2025-06-09 15:28:04'),
(744, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:28:05', '2025-06-09 15:28:05', '2025-06-09 15:28:05'),
(745, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:28:05', '2025-06-09 15:28:05', '2025-06-09 15:28:05'),
(746, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:28:06', '2025-06-09 15:28:06', '2025-06-09 15:28:06'),
(747, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49', '2025-06-09 15:28:12', '2025-06-09 15:28:12', '2025-06-09 15:28:12'),
(748, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:28:13', '2025-06-09 15:28:13', '2025-06-09 15:28:13'),
(749, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/comments', '2025-06-09 15:28:13', '2025-06-09 15:28:13', '2025-06-09 15:28:13'),
(750, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/drafts', '2025-06-09 15:28:14', '2025-06-09 15:28:14', '2025-06-09 15:28:14'),
(751, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/store', '2025-06-09 15:28:37', '2025-06-09 15:28:37', '2025-06-09 15:28:37'),
(752, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/59', '2025-06-09 15:28:37', '2025-06-09 15:28:37', '2025-06-09 15:28:37'),
(753, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-09 15:28:46', '2025-06-09 15:28:46', '2025-06-09 15:28:46'),
(754, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:28:46', '2025-06-09 15:28:46', '2025-06-09 15:28:46'),
(755, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:28:52', '2025-06-09 15:28:52', '2025-06-09 15:28:52'),
(756, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:29:03', '2025-06-09 15:29:03', '2025-06-09 15:29:03'),
(757, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:29:17', '2025-06-09 15:29:17', '2025-06-09 15:29:17'),
(758, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:29:18', '2025-06-09 15:29:18', '2025-06-09 15:29:18'),
(759, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-09 15:29:29', '2025-06-09 15:29:29', '2025-06-09 15:29:29'),
(760, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 15:29:29', '2025-06-09 15:29:29', '2025-06-09 15:29:29'),
(761, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:29:32', '2025-06-09 15:29:32', '2025-06-09 15:29:32'),
(762, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:29:33', '2025-06-09 15:29:33', '2025-06-09 15:29:33'),
(763, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:29:33', '2025-06-09 15:29:33', '2025-06-09 15:29:33'),
(764, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:29:33', '2025-06-09 15:29:33', '2025-06-09 15:29:33'),
(765, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:29:36', '2025-06-09 15:29:36', '2025-06-09 15:29:36'),
(766, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-09 15:29:36', '2025-06-09 15:29:36', '2025-06-09 15:29:36'),
(767, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:29:37', '2025-06-09 15:29:37', '2025-06-09 15:29:37'),
(768, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:29:37', '2025-06-09 15:29:37', '2025-06-09 15:29:37'),
(769, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:29:37', '2025-06-09 15:29:37', '2025-06-09 15:29:37'),
(770, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:29:38', '2025-06-09 15:29:38', '2025-06-09 15:29:38'),
(771, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:29:38', '2025-06-09 15:29:38', '2025-06-09 15:29:38'),
(772, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/59', '2025-06-09 15:29:45', '2025-06-09 15:29:45', '2025-06-09 15:29:45'),
(773, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-09 15:29:45', '2025-06-09 15:29:45', '2025-06-09 15:29:45'),
(774, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/comments', '2025-06-09 15:29:45', '2025-06-09 15:29:45', '2025-06-09 15:29:45'),
(775, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/comments', '2025-06-09 15:29:46', '2025-06-09 15:29:46', '2025-06-09 15:29:46'),
(776, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:29:58', '2025-06-09 15:29:58', '2025-06-09 15:29:58'),
(777, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:31:36', '2025-06-09 15:31:36', '2025-06-09 15:31:36'),
(778, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:31:37', '2025-06-09 15:31:37', '2025-06-09 15:31:37'),
(779, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:31:37', '2025-06-09 15:31:37', '2025-06-09 15:31:37'),
(780, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:31:37', '2025-06-09 15:31:37', '2025-06-09 15:31:37'),
(781, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48', '2025-06-09 15:32:06', '2025-06-09 15:32:06', '2025-06-09 15:32:06'),
(782, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:32:07', '2025-06-09 15:32:07', '2025-06-09 15:32:07'),
(783, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/comments', '2025-06-09 15:32:07', '2025-06-09 15:32:07', '2025-06-09 15:32:07'),
(784, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/drafts', '2025-06-09 15:32:09', '2025-06-09 15:32:09', '2025-06-09 15:32:09'),
(785, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/store', '2025-06-09 15:32:26', '2025-06-09 15:32:26', '2025-06-09 15:32:26'),
(786, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/60', '2025-06-09 15:32:26', '2025-06-09 15:32:26', '2025-06-09 15:32:26'),
(787, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:32:33', '2025-06-09 15:32:33', '2025-06-09 15:32:33'),
(788, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-09 15:32:33', '2025-06-09 15:32:33', '2025-06-09 15:32:33'),
(789, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:32:34', '2025-06-09 15:32:34', '2025-06-09 15:32:34'),
(790, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:32:34', '2025-06-09 15:32:34', '2025-06-09 15:32:34'),
(791, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:32:34', '2025-06-09 15:32:34', '2025-06-09 15:32:34'),
(792, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:32:34', '2025-06-09 15:32:34', '2025-06-09 15:32:34'),
(793, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:32:35', '2025-06-09 15:32:35', '2025-06-09 15:32:35'),
(794, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard/stories', '2025-06-09 15:36:46', '2025-06-09 15:36:46', '2025-06-09 15:36:46'),
(795, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 15:37:10', '2025-06-09 15:37:10', '2025-06-09 15:37:10'),
(796, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-09 15:37:11', '2025-06-09 15:37:11', '2025-06-09 15:37:11'),
(797, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 15:37:11', '2025-06-09 15:37:11', '2025-06-09 15:37:11'),
(798, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 15:37:11', '2025-06-09 15:37:11', '2025-06-09 15:37:11'),
(799, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 15:37:12', '2025-06-09 15:37:12', '2025-06-09 15:37:12'),
(800, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 15:37:12', '2025-06-09 15:37:12', '2025-06-09 15:37:12'),
(801, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 15:37:12', '2025-06-09 15:37:12', '2025-06-09 15:37:12'),
(802, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:37:13', '2025-06-09 15:37:13', '2025-06-09 15:37:13'),
(803, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:37:14', '2025-06-09 15:37:14', '2025-06-09 15:37:14'),
(804, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:37:14', '2025-06-09 15:37:14', '2025-06-09 15:37:14'),
(805, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:37:14', '2025-06-09 15:37:14', '2025-06-09 15:37:14'),
(806, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 15:37:15', '2025-06-09 15:37:15', '2025-06-09 15:37:15'),
(807, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 15:37:16', '2025-06-09 15:37:16', '2025-06-09 15:37:16'),
(808, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:37:16', '2025-06-09 15:37:16', '2025-06-09 15:37:16'),
(809, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 15:37:16', '2025-06-09 15:37:16', '2025-06-09 15:37:16'),
(810, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48', '2025-06-09 15:37:27', '2025-06-09 15:37:27', '2025-06-09 15:37:27'),
(811, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 15:37:28', '2025-06-09 15:37:28', '2025-06-09 15:37:28'),
(812, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/comments', '2025-06-09 15:37:28', '2025-06-09 15:37:28', '2025-06-09 15:37:28'),
(813, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/drafts', '2025-06-09 15:37:29', '2025-06-09 15:37:29', '2025-06-09 15:37:29'),
(814, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/store', '2025-06-09 15:37:40', '2025-06-09 15:37:40', '2025-06-09 15:37:40'),
(815, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community/61', '2025-06-09 15:37:40', '2025-06-09 15:37:40', '2025-06-09 15:37:40'),
(816, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 16:05:00', '2025-06-09 16:05:00', '2025-06-09 16:05:00'),
(817, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 16:05:02', '2025-06-09 16:05:02', '2025-06-09 16:05:02'),
(818, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 16:05:02', '2025-06-09 16:05:02', '2025-06-09 16:05:02'),
(819, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 16:05:02', '2025-06-09 16:05:02', '2025-06-09 16:05:02');
INSERT INTO `visits` (`id`, `user_id`, `ip_address`, `user_agent`, `url`, `visited_at`, `created_at`, `updated_at`) VALUES
(820, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 16:05:03', '2025-06-09 16:05:03', '2025-06-09 16:05:03'),
(821, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 16:05:03', '2025-06-09 16:05:03', '2025-06-09 16:05:03'),
(822, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-09 16:05:04', '2025-06-09 16:05:04', '2025-06-09 16:05:04'),
(823, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 16:05:04', '2025-06-09 16:05:04', '2025-06-09 16:05:04'),
(824, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 16:05:05', '2025-06-09 16:05:05', '2025-06-09 16:05:05'),
(825, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 16:05:05', '2025-06-09 16:05:05', '2025-06-09 16:05:05'),
(826, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 16:05:05', '2025-06-09 16:05:05', '2025-06-09 16:05:05'),
(827, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 16:05:05', '2025-06-09 16:05:05', '2025-06-09 16:05:05'),
(828, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-09 16:05:06', '2025-06-09 16:05:06', '2025-06-09 16:05:06'),
(829, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 16:10:48', '2025-06-09 16:10:48', '2025-06-09 16:10:48'),
(830, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 16:10:48', '2025-06-09 16:10:48', '2025-06-09 16:10:48'),
(831, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 16:10:49', '2025-06-09 16:10:49', '2025-06-09 16:10:49'),
(832, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 16:10:49', '2025-06-09 16:10:49', '2025-06-09 16:10:49'),
(833, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-09 16:10:50', '2025-06-09 16:10:50', '2025-06-09 16:10:50'),
(834, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-09 16:10:51', '2025-06-09 16:10:51', '2025-06-09 16:10:51'),
(835, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-09 16:10:51', '2025-06-09 16:10:51', '2025-06-09 16:10:51'),
(836, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-09 16:10:51', '2025-06-09 16:10:51', '2025-06-09 16:10:51'),
(837, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-09 16:10:52', '2025-06-09 16:10:52', '2025-06-09 16:10:52'),
(838, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-09 16:10:52', '2025-06-09 16:10:52', '2025-06-09 16:10:52'),
(839, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-09 16:10:52', '2025-06-09 16:10:52', '2025-06-09 16:10:52'),
(840, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-09 16:10:52', '2025-06-09 16:10:52', '2025-06-09 16:10:52'),
(841, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-09 16:10:53', '2025-06-09 16:10:53', '2025-06-09 16:10:53'),
(842, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-09 16:10:53', '2025-06-09 16:10:53', '2025-06-09 16:10:53'),
(843, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-09 16:10:54', '2025-06-09 16:10:54', '2025-06-09 16:10:54'),
(844, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-09 16:39:41', '2025-06-09 16:39:41', '2025-06-09 16:39:41'),
(845, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:07:12', '2025-06-16 11:07:12', '2025-06-16 11:07:12'),
(846, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:07:19', '2025-06-16 11:07:19', '2025-06-16 11:07:19'),
(847, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:08:00', '2025-06-16 11:08:00', '2025-06-16 11:08:00'),
(848, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:20:17', '2025-06-16 11:20:17', '2025-06-16 11:20:17'),
(849, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:20:45', '2025-06-16 11:20:45', '2025-06-16 11:20:45'),
(850, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:21:23', '2025-06-16 11:21:23', '2025-06-16 11:21:23'),
(851, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:21:45', '2025-06-16 11:21:45', '2025-06-16 11:21:45'),
(852, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:21:48', '2025-06-16 11:21:48', '2025-06-16 11:21:48'),
(853, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:21:55', '2025-06-16 11:21:55', '2025-06-16 11:21:55'),
(854, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:22:32', '2025-06-16 11:22:32', '2025-06-16 11:22:32'),
(855, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:22:35', '2025-06-16 11:22:35', '2025-06-16 11:22:35'),
(856, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:22:42', '2025-06-16 11:22:42', '2025-06-16 11:22:42'),
(857, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:28:40', '2025-06-16 11:28:40', '2025-06-16 11:28:40'),
(858, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:28:42', '2025-06-16 11:28:42', '2025-06-16 11:28:42'),
(859, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:29:01', '2025-06-16 11:29:01', '2025-06-16 11:29:01'),
(860, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:29:40', '2025-06-16 11:29:40', '2025-06-16 11:29:40'),
(861, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:29:42', '2025-06-16 11:29:42', '2025-06-16 11:29:42'),
(862, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:29:49', '2025-06-16 11:29:49', '2025-06-16 11:29:49'),
(863, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:29:50', '2025-06-16 11:29:50', '2025-06-16 11:29:50'),
(864, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:30:00', '2025-06-16 11:30:00', '2025-06-16 11:30:00'),
(865, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:30:01', '2025-06-16 11:30:01', '2025-06-16 11:30:01'),
(866, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:30:07', '2025-06-16 11:30:07', '2025-06-16 11:30:07'),
(867, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:30:08', '2025-06-16 11:30:08', '2025-06-16 11:30:08'),
(868, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:30:12', '2025-06-16 11:30:12', '2025-06-16 11:30:12'),
(869, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:30:13', '2025-06-16 11:30:13', '2025-06-16 11:30:13'),
(870, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:34:33', '2025-06-16 11:34:33', '2025-06-16 11:34:33'),
(871, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:34:34', '2025-06-16 11:34:34', '2025-06-16 11:34:34'),
(872, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-16 11:34:37', '2025-06-16 11:34:37', '2025-06-16 11:34:37'),
(873, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-16 11:34:40', '2025-06-16 11:34:40', '2025-06-16 11:34:40'),
(874, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/profile', '2025-06-16 11:34:55', '2025-06-16 11:34:55', '2025-06-16 11:34:55'),
(875, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:39:09', '2025-06-16 11:39:09', '2025-06-16 11:39:09'),
(876, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:39:22', '2025-06-16 11:39:22', '2025-06-16 11:39:22'),
(877, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:44:05', '2025-06-16 11:44:05', '2025-06-16 11:44:05'),
(878, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:45:42', '2025-06-16 11:45:42', '2025-06-16 11:45:42'),
(879, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:47:26', '2025-06-16 11:47:26', '2025-06-16 11:47:26'),
(880, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 11:48:25', '2025-06-16 11:48:25', '2025-06-16 11:48:25'),
(881, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:48:26', '2025-06-16 11:48:26', '2025-06-16 11:48:26'),
(882, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:48:27', '2025-06-16 11:48:27', '2025-06-16 11:48:27'),
(883, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:48:40', '2025-06-16 11:48:40', '2025-06-16 11:48:40'),
(884, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:54:22', '2025-06-16 11:54:22', '2025-06-16 11:54:22'),
(885, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:54:24', '2025-06-16 11:54:24', '2025-06-16 11:54:24'),
(886, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 11:54:30', '2025-06-16 11:54:30', '2025-06-16 11:54:30'),
(887, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:54:31', '2025-06-16 11:54:31', '2025-06-16 11:54:31'),
(888, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 11:56:29', '2025-06-16 11:56:29', '2025-06-16 11:56:29'),
(889, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:10:26', '2025-06-16 12:10:26', '2025-06-16 12:10:26'),
(890, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:11:58', '2025-06-16 12:11:58', '2025-06-16 12:11:58'),
(891, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:33:06', '2025-06-16 12:33:06', '2025-06-16 12:33:06'),
(892, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:33:18', '2025-06-16 12:33:18', '2025-06-16 12:33:18'),
(893, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:34:06', '2025-06-16 12:34:06', '2025-06-16 12:34:06'),
(894, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:34:50', '2025-06-16 12:34:50', '2025-06-16 12:34:50'),
(895, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:35:01', '2025-06-16 12:35:01', '2025-06-16 12:35:01'),
(896, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:36:59', '2025-06-16 12:36:59', '2025-06-16 12:36:59'),
(897, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-16 12:37:10', '2025-06-16 12:37:10', '2025-06-16 12:37:10'),
(898, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:39:29', '2025-06-16 12:39:29', '2025-06-16 12:39:29'),
(899, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 12:41:18', '2025-06-16 12:41:18', '2025-06-16 12:41:18'),
(900, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:41:19', '2025-06-16 12:41:19', '2025-06-16 12:41:19'),
(901, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-16 12:41:22', '2025-06-16 12:41:22', '2025-06-16 12:41:22'),
(902, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/register', '2025-06-16 12:41:46', '2025-06-16 12:41:46', '2025-06-16 12:41:46'),
(903, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:41:47', '2025-06-16 12:41:47', '2025-06-16 12:41:47'),
(904, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:41:55', '2025-06-16 12:41:55', '2025-06-16 12:41:55'),
(905, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:42:49', '2025-06-16 12:42:49', '2025-06-16 12:42:49'),
(906, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:44:12', '2025-06-16 12:44:12', '2025-06-16 12:44:12'),
(907, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:44:55', '2025-06-16 12:44:55', '2025-06-16 12:44:55'),
(908, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:47:45', '2025-06-16 12:47:45', '2025-06-16 12:47:45'),
(909, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:48:07', '2025-06-16 12:48:07', '2025-06-16 12:48:07'),
(910, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:48:27', '2025-06-16 12:48:27', '2025-06-16 12:48:27'),
(911, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:48:51', '2025-06-16 12:48:51', '2025-06-16 12:48:51'),
(912, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:50:33', '2025-06-16 12:50:33', '2025-06-16 12:50:33'),
(913, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:55:05', '2025-06-16 12:55:05', '2025-06-16 12:55:05'),
(914, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 12:55:21', '2025-06-16 12:55:21', '2025-06-16 12:55:21'),
(915, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:55:21', '2025-06-16 12:55:21', '2025-06-16 12:55:21'),
(916, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 12:55:24', '2025-06-16 12:55:24', '2025-06-16 12:55:24'),
(917, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 12:55:36', '2025-06-16 12:55:36', '2025-06-16 12:55:36'),
(918, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:55:36', '2025-06-16 12:55:36', '2025-06-16 12:55:36'),
(919, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:56:32', '2025-06-16 12:56:32', '2025-06-16 12:56:32'),
(920, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 12:56:58', '2025-06-16 12:56:58', '2025-06-16 12:56:58'),
(921, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:56:59', '2025-06-16 12:56:59', '2025-06-16 12:56:59'),
(922, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 12:57:02', '2025-06-16 12:57:02', '2025-06-16 12:57:02'),
(923, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 12:57:13', '2025-06-16 12:57:13', '2025-06-16 12:57:13'),
(924, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:57:13', '2025-06-16 12:57:13', '2025-06-16 12:57:13'),
(925, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:57:38', '2025-06-16 12:57:38', '2025-06-16 12:57:38'),
(926, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 12:59:22', '2025-06-16 12:59:22', '2025-06-16 12:59:22'),
(927, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:04:58', '2025-06-16 13:04:58', '2025-06-16 13:04:58'),
(928, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-16 13:05:46', '2025-06-16 13:05:46', '2025-06-16 13:05:46'),
(929, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-16 13:06:02', '2025-06-16 13:06:02', '2025-06-16 13:06:02'),
(930, 34, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 13:06:44', '2025-06-16 13:06:44', '2025-06-16 13:06:44'),
(931, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:06:44', '2025-06-16 13:06:44', '2025-06-16 13:06:44'),
(932, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:06:46', '2025-06-16 13:06:46', '2025-06-16 13:06:46'),
(933, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:06:54', '2025-06-16 13:06:54', '2025-06-16 13:06:54'),
(934, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:06:55', '2025-06-16 13:06:55', '2025-06-16 13:06:55'),
(935, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:08:47', '2025-06-16 13:08:47', '2025-06-16 13:08:47'),
(936, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:08:49', '2025-06-16 13:08:49', '2025-06-16 13:08:49'),
(937, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:09:02', '2025-06-16 13:09:02', '2025-06-16 13:09:02'),
(938, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:09:02', '2025-06-16 13:09:02', '2025-06-16 13:09:02'),
(939, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-16 13:09:07', '2025-06-16 13:09:07', '2025-06-16 13:09:07'),
(940, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/user-dashboard', '2025-06-16 13:09:11', '2025-06-16 13:09:11', '2025-06-16 13:09:11'),
(941, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/users', '2025-06-16 13:09:13', '2025-06-16 13:09:13', '2025-06-16 13:09:13'),
(942, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/stories', '2025-06-16 13:09:18', '2025-06-16 13:09:18', '2025-06-16 13:09:18'),
(943, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:12:11', '2025-06-16 13:12:11', '2025-06-16 13:12:11'),
(944, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-16 13:12:50', '2025-06-16 13:12:50', '2025-06-16 13:12:50'),
(945, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-16 13:12:51', '2025-06-16 13:12:51', '2025-06-16 13:12:51'),
(946, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-16 13:12:51', '2025-06-16 13:12:51', '2025-06-16 13:12:51'),
(947, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-16 13:12:52', '2025-06-16 13:12:52', '2025-06-16 13:12:52'),
(948, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:13:21', '2025-06-16 13:13:21', '2025-06-16 13:13:21'),
(949, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 13:17:09', '2025-06-16 13:17:09', '2025-06-16 13:17:09'),
(950, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:17:09', '2025-06-16 13:17:09', '2025-06-16 13:17:09'),
(951, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:17:11', '2025-06-16 13:17:11', '2025-06-16 13:17:11'),
(952, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:17:20', '2025-06-16 13:17:20', '2025-06-16 13:17:20'),
(953, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:17:20', '2025-06-16 13:17:20', '2025-06-16 13:17:20'),
(954, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-16 13:17:25', '2025-06-16 13:17:25', '2025-06-16 13:17:25'),
(955, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-16 13:17:27', '2025-06-16 13:17:27', '2025-06-16 13:17:27'),
(956, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-16 13:17:34', '2025-06-16 13:17:34', '2025-06-16 13:17:34'),
(957, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/users', '2025-06-16 13:17:37', '2025-06-16 13:17:37', '2025-06-16 13:17:37'),
(958, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/users', '2025-06-16 13:19:42', '2025-06-16 13:19:42', '2025-06-16 13:19:42'),
(959, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-16 13:23:01', '2025-06-16 13:23:01', '2025-06-16 13:23:01'),
(960, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard/users', '2025-06-16 13:28:44', '2025-06-16 13:28:44', '2025-06-16 13:28:44'),
(961, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/admin-dashboard', '2025-06-16 13:28:45', '2025-06-16 13:28:45', '2025-06-16 13:28:45'),
(962, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:31:57', '2025-06-16 13:31:57', '2025-06-16 13:31:57'),
(963, 27, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 13:32:00', '2025-06-16 13:32:00', '2025-06-16 13:32:00'),
(964, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:32:00', '2025-06-16 13:32:00', '2025-06-16 13:32:00'),
(965, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 13:32:02', '2025-06-16 13:32:02', '2025-06-16 13:32:02'),
(966, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/guest-login', '2025-06-16 13:32:47', '2025-06-16 13:32:47', '2025-06-16 13:32:47'),
(967, 35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:32:48', '2025-06-16 13:32:48', '2025-06-16 13:32:48'),
(968, 35, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-16 13:33:34', '2025-06-16 13:33:34', '2025-06-16 13:33:34'),
(969, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:33:34', '2025-06-16 13:33:35', '2025-06-16 13:33:35'),
(970, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/guest-login', '2025-06-16 13:33:37', '2025-06-16 13:33:37', '2025-06-16 13:33:37'),
(971, 36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:33:37', '2025-06-16 13:33:37', '2025-06-16 13:33:37'),
(972, 36, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 13:34:28', '2025-06-16 13:34:28', '2025-06-16 13:34:28'),
(973, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-16 16:11:21', '2025-06-16 16:11:21', '2025-06-16 16:11:21'),
(974, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-16 16:11:23', '2025-06-16 16:11:23', '2025-06-16 16:11:23'),
(975, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-17 12:03:57', '2025-06-17 12:03:57', '2025-06-17 12:03:57'),
(976, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-17 12:04:27', '2025-06-17 12:04:27', '2025-06-17 12:04:27'),
(977, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-17 12:04:56', '2025-06-17 12:04:56', '2025-06-17 12:04:56'),
(978, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-17 12:06:07', '2025-06-17 12:06:07', '2025-06-17 12:06:07'),
(979, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-17 12:06:18', '2025-06-17 12:06:18', '2025-06-17 12:06:18'),
(980, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-17 12:06:35', '2025-06-17 12:06:35', '2025-06-17 12:06:35'),
(981, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-17 12:06:38', '2025-06-17 12:06:38', '2025-06-17 12:06:38'),
(982, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:08:22', '2025-06-17 12:08:22', '2025-06-17 12:08:22'),
(983, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:22:14', '2025-06-17 12:22:14', '2025-06-17 12:22:14'),
(984, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:22:24', '2025-06-17 12:22:24', '2025-06-17 12:22:24'),
(985, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:23:02', '2025-06-17 12:23:02', '2025-06-17 12:23:02'),
(986, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:23:37', '2025-06-17 12:23:37', '2025-06-17 12:23:37'),
(987, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:23:47', '2025-06-17 12:23:47', '2025-06-17 12:23:47'),
(988, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-17 12:23:55', '2025-06-17 12:23:55', '2025-06-17 12:23:55'),
(989, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-17 12:23:56', '2025-06-17 12:23:56', '2025-06-17 12:23:56'),
(990, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-17 12:23:56', '2025-06-17 12:23:56', '2025-06-17 12:23:56'),
(991, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-17 12:23:56', '2025-06-17 12:23:56', '2025-06-17 12:23:56'),
(992, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-17 12:24:01', '2025-06-17 12:24:01', '2025-06-17 12:24:01'),
(993, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-17 12:24:01', '2025-06-17 12:24:01', '2025-06-17 12:24:01'),
(994, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-17 12:24:02', '2025-06-17 12:24:02', '2025-06-17 12:24:02'),
(995, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-17 12:24:02', '2025-06-17 12:24:02', '2025-06-17 12:24:02'),
(996, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 12:24:19', '2025-06-17 12:24:19', '2025-06-17 12:24:19'),
(997, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-17 12:25:23', '2025-06-17 12:25:23', '2025-06-17 12:25:23'),
(998, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-17 12:25:27', '2025-06-17 12:25:27', '2025-06-17 12:25:27'),
(999, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about-us', '2025-06-17 13:02:50', '2025-06-17 13:02:50', '2025-06-17 13:02:50'),
(1000, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:12:41', '2025-06-19 13:12:41', '2025-06-19 13:12:41'),
(1001, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 13:12:50', '2025-06-19 13:12:50', '2025-06-19 13:12:50'),
(1002, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 13:14:02', '2025-06-19 13:14:02', '2025-06-19 13:14:02'),
(1003, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 13:16:38', '2025-06-19 13:16:38', '2025-06-19 13:16:38'),
(1004, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:17:01', '2025-06-19 13:17:01', '2025-06-19 13:17:01'),
(1005, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:21:30', '2025-06-19 13:21:30', '2025-06-19 13:21:30'),
(1006, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 13:21:47', '2025-06-19 13:21:47', '2025-06-19 13:21:47'),
(1007, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 13:22:11', '2025-06-19 13:22:11', '2025-06-19 13:22:11'),
(1008, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:22:41', '2025-06-19 13:22:41', '2025-06-19 13:22:41'),
(1009, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-19 13:26:07', '2025-06-19 13:26:07', '2025-06-19 13:26:07'),
(1010, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:30:00', '2025-06-19 13:30:00', '2025-06-19 13:30:00'),
(1011, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:30:23', '2025-06-19 13:30:23', '2025-06-19 13:30:23'),
(1012, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-19 13:31:13', '2025-06-19 13:31:13', '2025-06-19 13:31:13'),
(1013, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-19 13:31:13', '2025-06-19 13:31:13', '2025-06-19 13:31:13'),
(1014, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-19 13:31:14', '2025-06-19 13:31:14', '2025-06-19 13:31:14'),
(1015, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-19 13:31:15', '2025-06-19 13:31:15', '2025-06-19 13:31:15'),
(1016, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-19 13:31:15', '2025-06-19 13:31:15', '2025-06-19 13:31:15'),
(1017, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-19 13:31:18', '2025-06-19 13:31:18', '2025-06-19 13:31:18'),
(1018, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-19 13:31:21', '2025-06-19 13:31:21', '2025-06-19 13:31:21'),
(1019, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-19 13:31:22', '2025-06-19 13:31:22', '2025-06-19 13:31:22'),
(1020, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-19 13:31:22', '2025-06-19 13:31:22', '2025-06-19 13:31:22'),
(1021, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-19 13:31:22', '2025-06-19 13:31:22', '2025-06-19 13:31:22'),
(1022, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 13:34:16', '2025-06-19 13:34:16', '2025-06-19 13:34:16'),
(1023, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:02:07', '2025-06-19 14:02:07', '2025-06-19 14:02:07'),
(1024, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:02:30', '2025-06-19 14:02:30', '2025-06-19 14:02:30'),
(1025, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 14:02:33', '2025-06-19 14:02:33', '2025-06-19 14:02:33'),
(1026, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:02:46', '2025-06-19 14:02:46', '2025-06-19 14:02:46'),
(1027, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:03:22', '2025-06-19 14:03:22', '2025-06-19 14:03:22');
INSERT INTO `visits` (`id`, `user_id`, `ip_address`, `user_agent`, `url`, `visited_at`, `created_at`, `updated_at`) VALUES
(1028, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:06:49', '2025-06-19 14:06:49', '2025-06-19 14:06:49'),
(1029, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:07:15', '2025-06-19 14:07:15', '2025-06-19 14:07:15'),
(1030, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:07:26', '2025-06-19 14:07:26', '2025-06-19 14:07:26'),
(1031, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:10:33', '2025-06-19 14:10:33', '2025-06-19 14:10:33'),
(1032, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:27:55', '2025-06-19 14:27:55', '2025-06-19 14:27:55'),
(1033, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:17', '2025-06-19 14:28:17', '2025-06-19 14:28:17'),
(1034, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:33', '2025-06-19 14:28:33', '2025-06-19 14:28:33'),
(1035, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:34', '2025-06-19 14:28:34', '2025-06-19 14:28:34'),
(1036, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:38', '2025-06-19 14:28:38', '2025-06-19 14:28:38'),
(1037, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:38', '2025-06-19 14:28:38', '2025-06-19 14:28:38'),
(1038, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:39', '2025-06-19 14:28:39', '2025-06-19 14:28:39'),
(1039, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:39', '2025-06-19 14:28:39', '2025-06-19 14:28:39'),
(1040, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:39', '2025-06-19 14:28:39', '2025-06-19 14:28:39'),
(1041, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:40', '2025-06-19 14:28:40', '2025-06-19 14:28:40'),
(1042, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:48', '2025-06-19 14:28:48', '2025-06-19 14:28:48'),
(1043, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:28:48', '2025-06-19 14:28:48', '2025-06-19 14:28:48'),
(1044, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:30:26', '2025-06-19 14:30:26', '2025-06-19 14:30:26'),
(1045, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:30:36', '2025-06-19 14:30:36', '2025-06-19 14:30:36'),
(1046, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:32:10', '2025-06-19 14:32:10', '2025-06-19 14:32:10'),
(1047, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 14:32:38', '2025-06-19 14:32:38', '2025-06-19 14:32:38'),
(1048, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 14:32:46', '2025-06-19 14:32:46', '2025-06-19 14:32:46'),
(1049, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 14:34:21', '2025-06-19 14:34:21', '2025-06-19 14:34:21'),
(1050, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-19 14:35:37', '2025-06-19 14:35:37', '2025-06-19 14:35:37'),
(1051, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-19 14:35:38', '2025-06-19 14:35:38', '2025-06-19 14:35:38'),
(1052, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-19 14:35:39', '2025-06-19 14:35:39', '2025-06-19 14:35:39'),
(1053, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-19 14:35:39', '2025-06-19 14:35:39', '2025-06-19 14:35:39'),
(1054, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories', '2025-06-19 14:37:08', '2025-06-19 14:37:08', '2025-06-19 14:37:08'),
(1055, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-19 14:37:09', '2025-06-19 14:37:09', '2025-06-19 14:37:09'),
(1056, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-19 14:37:10', '2025-06-19 14:37:10', '2025-06-19 14:37:10'),
(1057, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-19 14:37:10', '2025-06-19 14:37:10', '2025-06-19 14:37:10'),
(1058, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-19 14:37:46', '2025-06-19 14:37:46', '2025-06-19 14:37:46'),
(1059, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/49/likes', '2025-06-19 14:37:50', '2025-06-19 14:37:50', '2025-06-19 14:37:50'),
(1060, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/48/likes', '2025-06-19 14:37:50', '2025-06-19 14:37:50', '2025-06-19 14:37:50'),
(1061, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/47/likes', '2025-06-19 14:37:51', '2025-06-19 14:37:51', '2025-06-19 14:37:51'),
(1062, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/publish', '2025-06-19 14:37:51', '2025-06-19 14:37:51', '2025-06-19 14:37:51'),
(1063, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:38:10', '2025-06-19 14:38:10', '2025-06-19 14:38:10'),
(1064, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/about', '2025-06-19 14:38:30', '2025-06-19 14:38:30', '2025-06-19 14:38:30'),
(1065, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-19 14:38:41', '2025-06-19 14:38:41', '2025-06-19 14:38:41'),
(1066, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-19 14:38:49', '2025-06-19 14:38:49', '2025-06-19 14:38:49'),
(1067, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-19 14:38:50', '2025-06-19 14:38:50', '2025-06-19 14:38:50'),
(1068, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-19 14:38:51', '2025-06-19 14:38:51', '2025-06-19 14:38:51'),
(1069, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-19 14:38:52', '2025-06-19 14:38:52', '2025-06-19 14:38:52'),
(1070, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-19 14:38:52', '2025-06-19 14:38:52', '2025-06-19 14:38:52'),
(1071, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-19 14:38:52', '2025-06-19 14:38:52', '2025-06-19 14:38:52'),
(1072, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-19 14:38:53', '2025-06-19 14:38:53', '2025-06-19 14:38:53'),
(1073, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-19 14:38:53', '2025-06-19 14:38:53', '2025-06-19 14:38:53'),
(1074, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/community', '2025-06-19 15:44:34', '2025-06-19 15:44:34', '2025-06-19 15:44:34'),
(1075, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/54/likes', '2025-06-19 15:44:36', '2025-06-19 15:44:36', '2025-06-19 15:44:36'),
(1076, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/57/likes', '2025-06-19 15:44:36', '2025-06-19 15:44:36', '2025-06-19 15:44:36'),
(1077, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/58/likes', '2025-06-19 15:44:37', '2025-06-19 15:44:37', '2025-06-19 15:44:37'),
(1078, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/59/likes', '2025-06-19 15:44:37', '2025-06-19 15:44:37', '2025-06-19 15:44:37'),
(1079, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/53/likes', '2025-06-19 15:44:37', '2025-06-19 15:44:37', '2025-06-19 15:44:37'),
(1080, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/stories/52/likes', '2025-06-19 15:44:38', '2025-06-19 15:44:38', '2025-06-19 15:44:38'),
(1081, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/logout', '2025-06-19 15:49:49', '2025-06-19 15:49:49', '2025-06-19 15:49:49'),
(1082, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 15:49:49', '2025-06-19 15:49:49', '2025-06-19 15:49:49'),
(1083, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-19 15:49:51', '2025-06-19 15:49:51', '2025-06-19 15:49:51'),
(1084, NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000/login', '2025-06-19 15:49:58', '2025-06-19 15:49:58', '2025-06-19 15:49:58'),
(1085, 30, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'http://localhost:8000', '2025-06-19 15:49:58', '2025-06-19 15:49:58', '2025-06-19 15:49:58');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1086;

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
