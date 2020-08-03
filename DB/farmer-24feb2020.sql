-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2020 at 12:53 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmer`
--

-- --------------------------------------------------------

--
-- Table structure for table `cancel_bookings`
--

CREATE TABLE `cancel_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `reason` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_category` int(11) NOT NULL,
  `category_description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_category`, `category_description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Agro Processing', 0, 'Agro Processing', '1', '2019-12-13 12:25:07', '2019-12-13 12:25:07'),
(3, 'Beekeeping', 0, 'Beekeeping', '1', '2019-12-13 12:25:12', '2019-12-13 12:25:12'),
(4, 'Crop Production Vegetables', 0, 'Crop Production Vegetables', '1', '2019-12-13 12:25:43', '2019-12-13 12:25:43'),
(5, 'Crop Production Tree Crops', 0, 'Crop Production_ Tree Crops', '1', '2019-12-13 12:25:54', '2019-12-13 12:25:54'),
(6, 'Crop Production Herbs, Condiments and Spices', 0, 'Crop Production_ Herbs, Condiments and Spices', '1', '2019-12-13 12:26:03', '2019-12-13 12:26:03'),
(7, 'Crop Production Sugarcane', 0, 'Crop Production_ Sugarcane', '1', '2019-12-13 12:27:04', '2019-12-13 12:27:04'),
(8, 'Crop Production Rice, Pulses, Grains', 0, 'Crop Production Rice, Pulses, Grains', '1', '2019-12-13 12:27:15', '2019-12-13 12:27:15'),
(9, 'Crop Production Nursery', 0, 'Crop Production Nursery', '1', '2019-12-13 12:27:25', '2019-12-13 12:27:25'),
(10, 'Exporting', 0, 'Exporting', '1', '2019-12-13 12:27:32', '2019-12-13 12:27:32'),
(11, 'Fishing', 0, 'Fishing', '1', '2019-12-13 12:27:39', '2019-12-13 12:27:39'),
(12, 'Forest Trees Agro Forestry', 0, 'Forest Trees/Agro_ Forestry', '1', '2019-12-13 12:27:54', '2019-12-13 12:27:54'),
(13, 'Horticulture', 0, 'Horticulture', '1', '2019-12-13 12:28:00', '2019-12-13 12:28:00'),
(14, 'Livestock', 0, 'Livestock_', '1', '2019-12-13 12:28:09', '2019-12-13 12:28:09'),
(15, 'Manufacturing', 0, 'Manufacturing', '1', '2019-12-13 12:28:15', '2019-12-13 12:28:15'),
(16, 'Root Crops', 0, 'Root Crops', '1', '2019-12-13 12:28:21', '2019-12-13 12:28:21'),
(17, 'Other', 0, 'Other', '1', '2019-12-13 12:28:28', '2019-12-13 12:28:28'),
(18, 'Beef Cattle', 14, 'Beef Cattle', '1', '2019-12-13 12:42:46', '2019-12-13 12:42:46'),
(19, 'Goats Sheep', 14, 'Goats/Sheep', '1', '2019-12-13 12:43:26', '2019-12-13 12:43:26'),
(20, 'Wildlife', 14, 'Wildlife', '1', '2019-12-13 12:43:38', '2019-12-13 12:43:38'),
(21, 'Boiler', 14, 'Boiler', '1', '2019-12-13 12:43:50', '2019-12-13 12:43:50'),
(22, 'Egg Production', 14, 'Egg Production', '1', '2019-12-13 12:43:59', '2019-12-13 12:43:59'),
(23, 'Small Stock', 14, 'Small Stock', '1', '2019-12-13 12:47:37', '2019-12-13 12:47:37'),
(24, 'Milk Production', 14, 'Milk Production', '1', '2019-12-13 12:48:47', '2019-12-13 12:48:47'),
(25, 'Pig Production', 14, 'Pig Production', '1', NULL, NULL),
(26, 'Test', 0, 'This is a test of parent category', '1', '2019-12-13 23:17:10', '2019-12-13 23:17:10'),
(27, 'Test_Child', 26, NULL, '1', '2019-12-13 23:18:37', '2019-12-13 23:18:37');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED NOT NULL,
  `participants` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_activities` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `service_id`, `consultant_id`, `participants`, `work_activities`, `created_at`, `updated_at`) VALUES
(6, 30, 47, 'Amit, Nitin, Niraj, Rahul', 'And we have completed the task.', '2020-01-31 15:03:00', '2020-01-31 15:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `extension_managers`
--

CREATE TABLE `extension_managers` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `answer`, `status`, `created_at`, `updated_at`) VALUES
(2, 'IS Lorem Ipsum is simply dummy text ???', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages', '1', '2020-02-12 07:39:03', '2020-02-12 07:49:53');

-- --------------------------------------------------------

--
-- Table structure for table `farms`
--

CREATE TABLE `farms` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `consultant_id` int(11) NOT NULL DEFAULT 0,
  `farm_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `land_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_commodities` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_line_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `farms`
--

INSERT INTO `farms` (`id`, `user_id`, `consultant_id`, `farm_name`, `land_size`, `main_commodities`, `address`, `address_line_1`, `address_line_2`, `city`, `district`, `postal_code`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(2, 21, 0, 'Birch Wood Farm', '4500', 'Commodities, Main', NULL, 'A-416', 'ekta nagar ajmer road', 'Jaipur', 'Jaipur', '302021', '28.7041', '77.1025', '1', '2019-11-13 02:08:34', '2019-11-27 05:28:53'),
(3, 29, 0, 'Magnolia Ranch', '5600', 'Farm, Agriculture, Green House, Animal Salter', NULL, 'B1-122', 'Magnolia Ranch Bhavan', 'Delhi', 'Delhi', '12345', '28.7041', '77.1025', '1', '2019-11-27 05:30:36', '2019-11-27 05:30:36'),
(5, 33, 0, 'Trout Brook Farm', '3500', 'Cereal Grains, Oilseeds, Meat, Dairy, Other Soft Commodities, Miscellaneous Agricultural Commodities', NULL, 'Brook Street', 'HONGASANDRA, Bengaluru, Karnataka', 'Bengaluru', 'Bengaluru', '530068', '12.9716', '77.5946', '1', '2019-11-27 06:48:01', '2019-11-27 06:48:01'),
(6, 33, 0, 'Riverlands Cove Homestead', '4200', 'Cereal Grains, Oilseeds, Meat, Dairy, Other Soft Commodities, Miscellaneous Agricultural Commodities', NULL, 'Brook Street', 'HONGASANDRA, Bengaluru, Karnataka', 'Bengaluru', 'Bengaluru', '530068', '12.9716', '77.5946', '1', '2019-11-27 07:21:48', '2019-11-27 07:21:48'),
(7, 33, 0, 'Spring Mount Farm', '4200', 'Cereal Grains, Oilseeds, Meat, Dairy, Other Soft Commodities, Miscellaneous Agricultural Commodities', NULL, 'Brook Street', 'HONGASANDRA, Bengaluru, Karnataka', 'Bengaluru', 'Bengaluru', '530068', '12.9716', '77.5946', '1', '2019-11-27 07:23:44', '2019-11-27 07:23:44'),
(8, 33, 0, 'Sunny Banks Ranch Farm', '4200', 'Cereal Grains, Oilseeds, Meat, Dairy, Other Soft Commodities, Miscellaneous Agricultural Commodities', NULL, 'Brook Street', 'HONGASANDRA, Bengaluru, Karnataka', 'Bengaluru', 'Bengaluru', '530068', '12.9716', '77.5946', '1', '2019-11-27 07:26:29', '2019-11-27 07:26:29'),
(28, 21, 0, 'Avengers Yard Point', '1234', 'Veg Farm, Egg Farm', NULL, 'Country Yard NJ', 'HIghway 49', 'NJ', '36555', 'NJ', '28.7041', '77.1025', '1', '2019-12-24 13:56:34', '2019-12-24 13:59:30'),
(29, 70, 0, 'Fulbert Taga Farm', 'Fishing, Ship, Milk', '36 hectares', NULL, '21 lanser street', 'Kew', 'Johannesburg', '2030', 'Eastrand', '26.9124', '75.7873', '1', '2019-12-25 03:23:51', '2020-01-29 20:04:22'),
(32, 71, 0, 'Farm QA', '3544', 'QA Egg, QA Veg, QA Organic Milking', NULL, 'Country Yard', 'Berlin', 'Jaipur', 'Jaipur', '302017', '26.9124', '75.7873', '1', '2020-01-08 18:12:16', '2020-01-20 17:59:49'),
(41, 23, 0, 'Crop Agri Hub', '1250', 'Egg Veg Milk', NULL, 'demo address', 'Test address 2', 'Test District', '123456', 'City Demo', '28.7041', '77.1025', '1', '2020-01-16 12:22:26', '2020-01-16 12:22:26'),
(42, 33, 0, 'ABC Farm Inc', '5000', 'Egg, Fruits, Vegitables', NULL, 'Star Steet', 'Park Avenue Corner', 'New Wales', 'NY', '123456', '28.7041', '77.1025', '1', '2020-01-16 12:26:41', '2020-01-20 17:55:14'),
(43, 23, 0, 'Alpha Showbridge Farm', '3250', 'Veg, Egg, Fruits', NULL, 'New Hemispair', 'New south Walse, QA', 'AUS', '98554', 'Queensland', '26.9124', '75.7873', '1', '2020-01-16 12:32:05', '2020-01-16 15:36:13'),
(44, 23, 0, 'Sholfeel farm', '2201', 'Milk, Crop, Vegetable, fruits', NULL, 'Gandhi Path West', 'Vaishali Nagar', 'Jaipur', 'Rajasthan', '382021', '28.7041', '77.1025', '1', '2020-01-20 18:02:38', '2020-01-20 18:02:38'),
(45, 70, 0, 'Testing', 'Maize', '3', NULL, '54 orange farm', 'Gauteng', 'Kew', '2000', 'Johannesburg', '28.7041', '77.1025', '1', '2020-01-29 19:25:21', '2020-01-29 19:25:21'),
(47, 75, 0, 'new farm', '1100', 'farming', NULL, 'mansarovar ext', 'near man', 'jaipur', 'jaipur', '302033', '28.7041', '77.1025', '1', '2020-01-30 13:19:40', '2020-01-30 13:19:40'),
(48, 75, 0, 'farmest farm', '2000', 'farming', NULL, 'yuo', 'uuio', 'dfg', 'ghh', '58963', '28.7041', '77.1025', '1', '2020-01-31 08:15:35', '2020-01-31 08:15:35'),
(49, 23, 0, 'Captain America Farm', '256', 'Vegii, Farming, Organic', NULL, 'New Sanganer Road', 'New Mansarovar Metro Station', 'Jaipur', 'Jaipur', '302020', '28.7041', '77.1025', '1', '2020-01-31 12:46:07', '2020-01-31 12:46:07'),
(50, 76, 0, 'Jimmy Farm Countryyard', '2500', 'Farming, Egg, Veg, Organic', NULL, 'New Modal Town', 'Malviya Nagar', 'Jaipur', 'Jaipur', '302015', '28.7041', '77.1025', '1', '2020-01-31 13:01:24', '2020-01-31 13:01:24'),
(51, 70, 0, 'Famkouo', '5', 'Okra', NULL, '12 kakouop road', 'Bafoussam', 'Baf', 'Kakouop', '2', '28.7041', '77.1025', '1', '2020-02-03 12:04:31', '2020-02-03 12:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `farm_id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `consultant_id` int(11) UNSIGNED DEFAULT NULL,
  `assigned_by` int(10) UNSIGNED DEFAULT NULL,
  `service_id` int(11) UNSIGNED NOT NULL,
  `alt_contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `information` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `close_comment` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `farm_id`, `user_id`, `consultant_id`, `assigned_by`, `service_id`, `alt_contact_number`, `information`, `status`, `close_comment`, `created_at`, `updated_at`) VALUES
(3, 29, 70, 47, NULL, 22, '9588295716', 'Hi, I am having problem with my farm. Tired from insects', '0', NULL, '2020-01-03 18:53:26', '2020-01-24 11:36:22'),
(4, 29, 70, 47, NULL, 22, '11111', 'Hi, I am having problem with my farm. Tired from insects', '3', NULL, '2020-01-03 18:53:28', '2020-01-20 19:05:32'),
(5, 29, 70, 47, NULL, 22, '11111', 'Yeyegeveg', '0', NULL, '2020-01-03 18:53:30', '2020-01-28 15:12:45'),
(6, 29, 70, NULL, NULL, 22, '11111', 'Yeyegeveg', '0', NULL, '2020-01-03 18:53:33', '2020-01-03 18:53:33'),
(7, 29, 70, NULL, NULL, 22, '11111', 'Yeyegeveg', '0', NULL, '2020-01-03 18:53:33', '2020-01-03 18:53:33'),
(9, 29, 70, NULL, NULL, 22, '11111', 'Yeyegeveg', '0', NULL, '2020-01-03 18:53:34', '2020-01-03 18:53:34'),
(11, 32, 71, NULL, NULL, 3, '2525252525', 'Test', '0', NULL, '2020-01-08 18:25:42', '2020-01-08 18:48:50'),
(12, 32, 71, NULL, NULL, 3, '2525255255', 'Test', '0', NULL, '2020-01-08 18:32:24', '2020-01-08 18:32:24'),
(13, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:38', '2020-01-10 17:13:38'),
(14, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:39', '2020-01-10 17:13:39'),
(17, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:42', '2020-01-10 17:13:42'),
(18, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:42', '2020-01-10 17:13:42'),
(19, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:42', '2020-01-10 17:13:42'),
(20, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:43', '2020-01-10 17:13:43'),
(21, 29, 70, NULL, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:44', '2020-01-10 17:13:44'),
(22, 29, 70, 72, NULL, 5, '08122222', 'Burnt farn', '0', NULL, '2020-01-10 17:13:45', '2020-01-28 15:12:36'),
(28, 47, 75, 47, NULL, 6, '9851236540', 'I am facing problem in growing with the plants', '4', NULL, '2020-01-30 13:34:53', '2020-02-06 15:42:22'),
(29, 48, 75, NULL, NULL, 6, '563265236', '5ygyhui', '0', NULL, '2020-01-31 08:16:22', '2020-01-31 08:16:22'),
(30, 50, 76, 47, NULL, 2, '9888888888', 'Unable to grow crops. I water them regular but no results. Help me out!', '4', 'This is a closing request.', '2020-01-31 13:20:58', '2020-01-31 17:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `date_change` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_change` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_change` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_for` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place_of_change` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_11_04_083729_entrust_setup_tables', 2),
(6, '2019_11_11_050337_add_fields_to_users', 3),
(7, '2019_11_11_060347_create_services_table', 4),
(8, '2019_11_12_110547_create_farms_table', 5),
(12, '2019_11_13_094630_create_leads_table', 6),
(13, '2019_11_15_084825_create_categories_table', 7),
(14, '2019_11_18_091240_create_pages_table', 8),
(15, '2019_11_19_061707_create_statuses_table', 9),
(16, '2019_11_20_125425_create_extension_managers_table', 10),
(17, '2019_11_22_052346_add_fields_to_farms', 11),
(18, '2019_11_25_115933_add_fields_to_users', 12),
(19, '2019_11_26_102329_create_notifications_table', 13),
(21, '2019_11_26_113713_create_notifies_table', 14),
(22, '2019_11_28_054042_create_logs_table', 15),
(23, '2020_01_18_091903_create_questions_table', 16),
(24, '2020_01_18_093016_create_questions_options_table', 16),
(25, '2020_01_22_042126_create_task_lists_table', 17),
(26, '2020_01_22_075542_create_question_responses_table', 18),
(27, '2020_01_28_101047_create_cancel_bookings_table', 19),
(28, '2020_01_31_085259_create_comments_table', 20),
(29, '2020_02_06_112618_add_fields_to_leads', 21),
(30, '2020_02_12_123936_create_faqs_table', 22),
(31, '2020_02_13_065242_add_fields_to_task_lists', 23);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `notification_msg_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifies`
--

CREATE TABLE `notifies` (
  `id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `notification_msg_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifies`
--

INSERT INTO `notifies` (`id`, `sender_id`, `receiver_id`, `notification_msg_id`, `title`, `message`, `status`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 1, 47, NULL, 'Email Notification', 'Administrator has sent an email', '1', '1', '2019-11-26 06:13:56', '2019-11-26 06:13:56'),
(2, 1, 47, NULL, 'Email Notification', 'Administrator has sent an email', '1', '1', '2019-11-26 23:28:02', '2019-11-26 23:28:02'),
(3, 1, 51, NULL, 'Email Notification', 'Administrator has sent an email', '1', '1', '2019-12-25 02:48:22', '2019-12-25 02:48:22');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `body`, `status`, `created_at`, `updated_at`) VALUES
(4, 'where-does-it-come-from', 'Where does it come from?', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html><body><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></body></html>\n', '1', '2019-11-22 01:36:11', '2019-11-22 01:36:11'),
(6, 'how-to-apply-for-a-loan', 'How to apply for a loan', '<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html><body><p>Prepare your bank statement</p></body></html>\n', '1', '2020-02-03 23:45:59', '2020-02-03 23:45:59');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `updated_at`) VALUES
('Flubert@afrigenius.co.za', 'PC3Y', '2020-02-04 00:00:24', '2020-02-04 00:33:49'),
('Admin@afrigenius.co.za', '2NPI', '2020-02-04 00:13:59', '2020-02-04 00:13:59');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `question` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `user_id`, `question`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'What type of farming you do?', '1', '2020-01-18 04:50:11', '2020-01-18 19:19:33'),
(2, 1, 'Demo Question Demo QuestionDemo QuestionDemo Question', '1', '2020-01-18 07:20:35', '2020-01-18 07:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `questions_options`
--

CREATE TABLE `questions_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(11) UNSIGNED NOT NULL,
  `option` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct_answer` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions_options`
--

INSERT INTO `questions_options` (`id`, `question_id`, `option`, `correct_answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'Horticulture', 0, '2020-01-18 04:50:11', '2020-01-18 19:19:33'),
(2, 1, 'Egg', 0, '2020-01-18 04:50:11', '2020-01-18 19:19:33'),
(3, 1, 'Vegitable', 0, '2020-01-18 04:50:11', '2020-01-18 19:19:33'),
(4, 1, 'Fruites', 0, '2020-01-18 04:50:11', '2020-01-18 19:19:33'),
(5, 2, 'A Demo Question', 0, '2020-01-18 07:20:35', '2020-01-18 07:29:57'),
(6, 2, 'B Demo Question', 0, '2020-01-18 07:20:36', '2020-01-18 07:29:57'),
(7, 2, 'C Demo Question', 0, '2020-01-18 07:20:36', '2020-01-18 07:29:57'),
(8, 2, 'D Demo Question', 0, '2020-01-18 07:20:36', '2020-01-18 07:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `question_responses`
--

CREATE TABLE `question_responses` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED NOT NULL,
  `response` int(10) UNSIGNED NOT NULL,
  `farm_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_responses`
--

INSERT INTO `question_responses` (`id`, `question_id`, `consultant_id`, `response`, `farm_id`, `created_at`, `updated_at`) VALUES
(3, 1, 47, 1, 5, '2020-01-23 18:50:37', '2020-01-23 18:50:37'),
(4, 2, 47, 8, 5, '2020-01-23 18:50:37', '2020-01-23 18:50:37'),
(5, 1, 47, 1, 29, '2020-01-23 18:51:32', '2020-01-23 18:51:32'),
(6, 2, 47, 8, 29, '2020-01-23 18:51:32', '2020-01-23 18:51:32'),
(7, 1, 47, 1, 47, '2020-01-30 13:44:08', '2020-01-30 13:44:08'),
(8, 2, 47, 6, 47, '2020-01-30 13:44:08', '2020-01-30 13:44:08'),
(9, 1, 47, 2, 50, '2020-01-31 15:53:47', '2020-01-31 15:53:47'),
(10, 2, 47, 6, 50, '2020-01-31 15:53:47', '2020-01-31 15:53:47');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator', 'Administrator', '2019-11-03 18:30:00', '2019-11-03 18:30:00'),
(2, 'Extension Manager', 'Extension Manager', 'Extension Manager', '2019-11-03 18:30:00', '2019-11-03 18:30:00'),
(3, 'Consultant', 'Consultant', 'Consultant', '2019-11-06 18:30:00', '2019-11-06 18:30:00'),
(4, 'Customer', 'Customer', 'Customer', '2019-11-06 18:30:00', '2019-11-06 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`user_id`, `role_id`) VALUES
(1, 1),
(13, 3),
(14, 3),
(15, 3),
(18, 3),
(21, 4),
(23, 4),
(25, 2),
(26, 2),
(29, 4),
(30, 4),
(33, 4),
(40, 3),
(42, 3),
(43, 3),
(44, 4),
(45, 4),
(46, 3),
(47, 3),
(48, 3),
(50, 2),
(55, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(62, 4),
(63, 4),
(64, 2),
(65, 4),
(66, 4),
(67, 2),
(70, 4),
(71, 4),
(72, 3),
(74, 2),
(75, 4),
(76, 4),
(77, 2),
(78, 3);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(10) UNSIGNED NOT NULL,
  `service_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_details` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `service_details`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Soil preparation services', 'Soil Preparation Services\r\nEstablishments primarily engaged in land breaking, plowing, application of fertilizer, seed bed preparation, and other services for improving the soil for crop planting. Establishments primarily engaged in land clearing and earth moving for terracing and pond and irrigation construction are classified in Construction, Industry 1629.\r\nChemical treatment of coil for crops\r\nFertilizer application for crops\r\nLime spreading for crops\r\nPlowing\r\nSeed bed preparation\r\nWeed control, crop; before planting', '1', '2019-11-13 05:01:09', '2019-11-27 05:19:10'),
(3, 'Water Supply Service', 'Harvesting is the process of gathering a ripe crop from the fields. Reaping is the cutting of grain or pulse for harvest, typically using a scythe, sickle, or reaper On smaller farms with minimal mechanization, harvesting is the most labor-intensive activity of the growing season. On large mechanized farms, harvesting utilizes the most expensive and sophisticated farm machinery, such as the combine harvester. Process automation has increased the efficiency of both the seeding and harvesting process. Specialized harvesting equipment utilizing conveyor belts to mimic gentle gripping and mass transport replaces the manual task of removing each seedling by hand.\r\n\r\nThe completion of harvesting marks the end of the growing season, or the growing cycle for a particular crop, and the social importance of this event makes it the focus of seasonal celebrations such as harvest festivals, found in many religions.', '1', '2019-11-13 05:01:20', '2019-11-27 05:20:47'),
(4, 'Cotton ginning services', 'Officially, cotton ginning always has been an agricultural operation. However, questions frequently are raised by state and federal regulatory agencies and standard-setting code organizations regarding the classification of cotton ginning as agriculture rather than as a general industry process. It is very important that cotton ginning is correctly classified as an agricultural operation instead of general industry to avoid being subjected to inappropriate, burdensome, and costly general industry standards, which could adversely affect the operation of a gin and cotton quality.ew', '1', '2019-11-27 05:21:52', '2019-12-06 14:10:17'),
(5, 'Veterinary services', 'Veterinary medicine is the of medicine that deals with the prevention, diagnosis and treatment of disease, disorder and injury in animals. ... They also help to maintain food supply through livestock health monitoring and treatment, and mental health by keeping pets healthy and long living.', '1', '2019-11-27 05:22:28', '2019-11-27 05:22:28'),
(6, 'Farm management services', 'Farm management, making and implementing of the decisions involved in organizing and operating a farm for maximum production and profit. Farm management draws on agricultural economics for information on prices, markets, agricultural policy, and economic institutions such as leasing and credit. It also draws on plant and animal sciences for information on soils, seed, and fertilizer, on control of weeds, insects, and disease, and on rations and breeding; on agricultural engineering for information on farm buildings, machinery, irrigation, crop drying, drainage, and erosion control systems; and on psychology and sociology for information on human behaviour. In making his decisions, a farm manager thus integrates information from the biological, physical, and social sciences.', '1', '2019-11-27 05:23:02', '2019-11-27 05:23:02'),
(7, 'Lawn and garden services', 'There are many advantages to running a homebased lawn care or landscaping service. You\'re master of your own destiny, and you can devote as much or as little time to the business as you want. You have a short commute to work if you\'re based in your own community. You can work at your own pace and at virtually any time during regular daylight hours. You also can enjoy the fresh air, get a good cardiovascular workout, and bulk up your muscles.', '1', '2019-11-27 05:23:49', '2019-11-27 05:23:49'),
(8, 'kjfkluyihj/n', 'jlhfulhhkl/', '1', '2020-01-30 13:52:24', '2020-01-30 13:52:24');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `status_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `slug`, `status_type`, `status_name`, `status_description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'planned', '0', 'Planned', 'Planned', '1', '2019-11-26 00:02:24', '2019-11-26 00:02:24'),
(2, 'pending-approval', '0', 'Pending Approval', 'Pending Approval', '1', '2019-11-26 00:02:42', '2019-11-26 00:02:42'),
(3, 'rejected', '0', 'Rejected', 'Rejected', '1', '2019-11-26 00:02:49', '2019-11-26 00:02:49'),
(4, 'approved', '0', 'Approved', 'Approved', '1', '2019-11-26 00:02:55', '2019-11-26 00:02:55'),
(5, 'en-route', '0', 'En-route', 'En-route', '1', '2019-11-26 00:03:02', '2019-11-26 00:03:02'),
(6, 'on-site', '0', 'On-site', 'On-site', '1', '2019-11-26 00:03:18', '2019-11-26 00:03:18'),
(7, 'transferred', '0', 'Transferred', 'Transferred', '1', '2019-11-26 00:03:25', '2019-11-26 00:03:25'),
(8, 'completed', '0', 'Completed', 'Completed', '1', '2019-11-26 00:03:31', '2019-11-26 00:03:31'),
(9, 'closed', '0', 'Closed', 'Closed', '1', '2019-11-26 00:03:37', '2019-11-26 00:03:37'),
(10, 'new', '1', 'New', 'New', '1', '2019-11-26 00:03:45', '2019-11-26 00:03:45'),
(11, 'assigned', '1', 'Assigned', 'Assigned', '1', '2019-11-26 00:03:53', '2019-11-26 00:03:53'),
(12, 'accepted', '1', 'Accepted', 'Accepted', '1', '2019-11-26 00:03:59', '2019-11-26 00:03:59'),
(13, 'en-route-1', '1', 'En-route', 'En-route', '1', '2019-11-26 00:04:07', '2019-11-26 00:04:07'),
(14, 'on-site-1', '1', 'On-site', 'On-site', '1', '2019-11-26 00:04:16', '2019-11-26 00:04:16'),
(15, 'transferred-1', '1', 'Transferred', 'Transferred', '1', '2019-11-26 00:04:23', '2019-11-26 00:04:23'),
(16, 'completed-1', '1', 'Completed', 'Completed', '1', '2019-11-26 00:04:30', '2019-11-26 00:04:30'),
(17, 'closed-1', '1', 'Closed', 'Closed', '1', '2019-11-26 00:04:39', '2019-11-26 00:04:39');

-- --------------------------------------------------------

--
-- Table structure for table `task_lists`
--

CREATE TABLE `task_lists` (
  `id` int(10) UNSIGNED NOT NULL,
  `consultant_id` int(10) UNSIGNED NOT NULL,
  `activity_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_reasons` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expected_outcome` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reject_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `edited_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `edited_limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_lists`
--

INSERT INTO `task_lists` (`id`, `consultant_id`, `activity_type`, `activity_description`, `activity_location`, `activity_reasons`, `expected_outcome`, `start_date`, `end_date`, `start_time`, `end_time`, `activity_status`, `status`, `comments`, `reject_reason`, `created_at`, `updated_at`, `edited_on`, `edited_limit`) VALUES
(1, 47, 'Activity Type Null', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley ', 'New York', 'Reason Activity', '123', '1/10/2020', '1/15', '04:50:00', '15:00:00', 'default', 'accepted', 'lorem ipsum is a dummy text.', NULL, '2020-01-06 19:57:10', '2020-02-10 22:53:21', NULL, NULL),
(2, 47, 'Test', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley ', 'Jaipur', 'Reason Nothing', 'Correct outcome', '1/6/2020', '1/10/2020', '07:02:00', '09:02:00', 'true', 'accepted', 'this is a demo comments', NULL, '2020-01-07 11:25:16', '2020-01-07 11:25:16', NULL, NULL),
(3, 47, 'Activity Test', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley ', 'Jaipur', 'Reason Nothing', 'Correct outcome', '1/6/2020', '1/10/2020', '07:02:00', '09:02:00', 'true', 'accepted', 'this is a demo comments', NULL, '2020-01-07 11:28:30', '2020-02-04 00:22:45', NULL, NULL),
(4, 47, 'Type is undefined', 'This is an awesome description of what you are looking at a house and a half to go back in the office tomorrow morning at work today but I\'m going back and I have to be in a good way to start', 'New York Maddition Street', 'No Reason', '4567', '01-01-2020', '01-06-2020', '04:00:00', '10:00:00', 'Active', 'accepted', 'Thanks again and I hope to see everyone again and again I apologise I didn\'t know you had mentioned to you before the holidays are coming to visit you in a bit I\'m going back and I have to be', NULL, '2020-01-07 13:20:21', '2020-02-04 00:16:37', NULL, NULL),
(5, 72, 'TEST ACTIVITY', 'Lorem ipsum simple dummies text', 'Jaipur', 'test', 'Test', '06-01-2020', '07-01-2020', 'Ifssdd', 'Ighffyfi', 'Test', 'rejected', 'Test', NULL, '2020-01-08 19:17:20', '2020-01-22 11:47:39', NULL, NULL),
(6, 47, 'New acitivity', 'Activity description...', 'Jaipur', 'You aasigned me a job', 'Will show you', '02-01-2020', '17-01-2020', '5:00', '6:00', 'Working', 'accepted', 'Need mon3y', NULL, '2020-01-30 13:56:13', '2020-01-30 13:58:56', NULL, NULL),
(7, 78, 'Visit', 'Routine Visit for monitoring.', '66 fifth Street Randfontein', 'Monitoring', 'Evaluation of progress made by the farmer', '08-02-2020', '08-02-2020', '12', '17', 'Planned', 'accepted', 'Please approve.', NULL, '2020-02-04 01:58:20', '2020-02-04 02:00:27', NULL, NULL),
(8, 78, 'Farm visit', 'Visit lesego farm to assess the feasibility of poultry farming', '13 Jan Smith Avenue Johannesburg', 'Funding requirement', 'Establish if poultry farming is sustainable at Lesego farm', '11-02-2020', '12-02-2020', '14:30', '16:30', 'New', 'accepted', 'Please approve', NULL, '2020-02-10 23:20:49', '2020-02-10 23:45:17', NULL, NULL),
(9, 78, 'Training', 'ARC training at Ariene', 'R21', 'Personal development', 'Understand pig farming techniques', '11-02-2020', '29-02-2020', '10:00', '17:20', 'Planned', 'rejected', 'Kindly approve my training request', NULL, '2020-02-10 23:42:41', '2020-02-10 23:45:29', NULL, NULL),
(10, 47, 'Demo Activity Type', 'Demo Activity Descriptoin', 'Jaipur', 'There is no reason', 'Good', '01-02-2020', '06-02-2020', '17:00:00', '18:00:00', 'In Progress', NULL, 'Thanks again and I hope to see everyone again and again I apologise', NULL, '2020-02-13 12:41:18', '2020-02-13 12:41:18', NULL, NULL),
(11, 47, 'None', 'None', 'JP', 'None', 'None', '01-02-2020', '08-02-2020', '15:00', '18:00', 'None', NULL, 'None', NULL, '2020-02-13 12:46:29', '2020-02-13 12:46:29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `mobile_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension_manager` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `firstname`, `surname`, `email`, `mobile_number`, `date_of_birth`, `gender`, `slug`, `status`, `mobile_code`, `email_verified_at`, `password`, `remember_token`, `extension_manager`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'Vashi', 'Ahamad', 'codes@arkasoftwares.com', '9887772569', '2019-10-15', 'Male', 'codesarkasoftwares-com', '1', '91', NULL, '$2y$10$S2ibn97iTwboLDIzV4xYVuR0UsJIOl305yI4da2svk4aRvnDE.de6', 'xaLikgG7ROEwSO4LcL9b36JadCRaNp10iBMaI03QxEObpzhkKv4iDFrM6M03', NULL, NULL, '2019-11-03 13:00:00', '2019-11-27 01:38:23'),
(13, 'Iris West', 'Iris', 'West', 'iriswest@mailinator.com', '9988771123', '2019-10-15', 'Female', 'iriswestatmailinator-com', '1', NULL, NULL, '$2y$10$5sq1NZpAnZ.ngG4jS4vsSOnneFUIrDvwpRLmxQ7HT0uzE2gYEIQBO', NULL, NULL, NULL, '2019-11-11 06:33:15', '2019-11-11 07:57:17'),
(14, 'Cisco Ramon', 'Cisco', 'Ramon', 'ciscoramon@mailinator.com', '7878787878', '2019-11-04', 'Male', 'ciscoramonatmailinator-com', '1', NULL, NULL, '$2y$10$oHCBJguTqGTAo1kP6hgTqefYFaHWPld/Rp3yEie.JQTwbm2FjZEU6', NULL, NULL, NULL, '2019-11-11 08:18:47', '2019-11-11 08:18:47'),
(15, 'Wally West', 'Wally', 'West', 'wallywest@mailinator.com', '8797987979', '2019-11-04', 'Male', 'wallywestatmailinator-com', '1', NULL, NULL, '$2y$10$Y6ANN7WJScdcZA2jigev7e0gkOK9SylNFkAORSNQpVG6H0G9cB02K', NULL, NULL, NULL, '2019-11-11 08:20:57', '2019-11-11 08:20:57'),
(18, 'Jeet Kumar', 'Jitendra Kumar', 'Kumar', 'jitendra.kumar@arkasoftwares.co', '8974565477', '2019-11-04', 'Male', 'jitendra-kumaratarkasoftwares-co', '1', NULL, NULL, '$2y$10$KgaildlijFp56z7mIx3Kre/2slAAEknWMT7qs8WvrguqtC1r5RGuu', NULL, NULL, NULL, '2019-11-11 08:37:38', '2019-11-27 04:48:20'),
(21, 'Ragna Loth Brook', 'Ragna Loth', 'Brook', 'regnalothbrook@mailinator.com', '9874566666', '2019-11-01', 'Male', 'regnalothbrookatmailinator-com', '1', NULL, NULL, '$2y$10$fXs7veEO6B6lSpyYMT9nEOQDK327EUf8tpZDXmsDmGiE7/o008rQ6', NULL, NULL, NULL, '2019-11-12 04:42:52', '2019-11-12 04:42:52'),
(23, 'Amit Kumar Pandey', 'Amit Kumar', 'Pandey', 'amit.pandey@arkasoftwares.com', '9571373757', '01-01-2014', 'Male', 'amit-pandeyatarkasoftwares-com', '0', NULL, NULL, '$2y$10$qBdE33pz53HGkY0e2zXQUuYqo2WYl8k/ONuWSmtn3/NZT7/3EfAuu', NULL, NULL, NULL, '2019-11-19 00:29:19', '2020-01-29 15:08:08'),
(25, 'Brain Lara', 'Brain', 'Lara', 'brianlara@mailinator.com', '9874563211', '2019-11-21', 'Male', 'brianlaraatmailinator-com', '1', NULL, NULL, 'e807f1fcf82d132f9bb018ca6738a19f', NULL, NULL, NULL, '2019-11-20 23:36:41', '2019-11-20 23:36:41'),
(26, 'Hector Barbossa', 'Hector ', 'Barbossa', 'hectorbarbossa@mailintaor.com', '9877899877', '2019-11-01', 'Male', 'hectorbarbossaatmailintaor-com', '1', NULL, NULL, '$2y$10$lvsfr18yuxsX4/jlg0v2bO29NF4g.lcHXkz4Bjr7DeKCs8kHsyPYq', NULL, NULL, NULL, '2019-11-20 23:55:45', '2019-11-20 23:55:45'),
(29, 'John Smith', 'John', 'Smith', 'johnsmith@gmail.com', '7885856769', '2019-11-21', 'Male', 'johnsmithatgmail-com', '1', NULL, NULL, '$2y$10$usqsaruO5gbn8GWUtEzYD.pJhfIYqmPlTFu0S3t9/2kETe0Kw8jvK', NULL, NULL, NULL, '2019-11-21 07:07:08', '2019-11-21 07:07:08'),
(30, 'Harrison Wells', 'Harrison', 'Wells', 'harrisonwells@mailinator.com', '7898798787', '2019-11-22', 'Male', 'harrisonwellsatmailinator-com', '0', NULL, NULL, '$2y$10$oWjEeytCyFO3etIARBuiNug/LCcTjCNXgC4uZBMtO4aPT0UppexSq', NULL, NULL, NULL, '2019-11-22 07:42:12', '2019-12-24 12:22:57'),
(33, 'Oliver Queen', 'Oliver', 'Queen', 'oliverqueen@mailinator.com', '7896541233', '2019-11-22', 'Male', 'oliverqueenatmailinator-com', '1', NULL, NULL, '$2y$10$YXnyU.I.7DFUj7rp7sam.eCctl1o1IiU17HOeRKtGBbKEbuJAsDOu', NULL, NULL, NULL, '2019-11-22 07:45:46', '2019-11-25 04:28:29'),
(40, 'Felicity Smoak', 'Felicity', 'Smoak', 'felicitysmoak@mailinator.com', '7410258963', '2019-11-18', 'Female', 'felicitysmoakatmailinator-com', '1', NULL, NULL, '$2y$10$upNlpBeEIa1a8WO6i8RQXuC0novpQwuoHw1L6ZMGCUyk7ZkSy95mK', NULL, NULL, NULL, '2019-11-22 07:50:29', '2019-11-26 01:46:13'),
(42, 'Joe West', 'Joe', 'West', 'joewest@mailinator.com', '7410147410', '2019-11-24', 'Male', 'joewestatmailinator-com', '1', NULL, NULL, '$2y$10$6zO08776A89zMRm5gccHO.aLU8EUPtryiK6a7bW3CX7Cs48UmOfEC', NULL, NULL, NULL, '2019-11-25 03:55:18', '2019-11-25 03:55:18'),
(43, 'Nora Allen', 'Nora', 'Allen', 'noraallen@mailinator.com', '9632587410', '2019-11-18', 'Female', 'noraallenatmailinator-com', '1', NULL, NULL, '$2y$10$WfacDqNz6aK5AKIKQIsqPOTx3mdrblP8FK8q1Z7KEKk4GwN96YlkS', NULL, NULL, NULL, '2019-11-25 04:04:10', '2019-11-25 04:04:10'),
(44, 'Sara Lance', 'Sara', 'Lance', 'saralance@mailinator.com', '9871234560', '2019-11-11', 'Female', 'saralanceatmailinator-com', '1', NULL, NULL, '$2y$10$51CdLJK1Pt8q5E5iOsRZpOpbpHKAfwgIdc3GZ7WTTyd/dPKLgidsm', NULL, NULL, NULL, '2019-11-25 04:06:24', '2019-11-25 04:06:24'),
(45, 'Berry Cartar', 'Berry', 'Cartar', 'berrycartar@mailinatir.com', '7412369852', '2019-11-03', 'Male', 'berrycartaratmailinatir-com', '1', NULL, NULL, '$2y$10$E4QEBDaKjrDR8uMBf.gEyuDb7rwhxZTXzER6BmvwdBuDFgFI3ReCm', NULL, NULL, NULL, '2019-11-25 04:28:51', '2019-11-25 04:28:51'),
(46, 'John Snow', 'John', 'Snow', 'johnsnow@gmail.com', '7419638520', '2019-11-25', 'Male', 'johnsnowatgmail-com', '1', NULL, NULL, '$2y$10$2Q/0f1n0cpSvc5lrfDom8eUPtkPh4wOIuEUIWs4CRoqdX6RnlgXna', NULL, NULL, NULL, '2019-11-25 06:39:14', '2019-11-25 06:39:14'),
(47, 'SPL Royals', 'SPL', 'Royals', 'splroyalsclub@gmail.com', '8998984562', '2019-11-25', 'Male', 'splroyalsclubatgmail-com', '1', NULL, NULL, '$2y$10$tr8I82x4kc1jweN1g08wGubzfJIN7hTQIiikg1c7cFwUqdfPu4xx6', NULL, NULL, NULL, '2019-11-26 01:47:06', '2020-01-16 13:01:51'),
(48, 'Brian Carter', 'Brian', 'Carter', 'Carter.Brian@mailinator.com', '9990001112', '2019-11-03', 'Male', 'carter-brianatmailinator-com', '0', NULL, NULL, '$2y$10$0CH3RN9xxpzQvPO783lFBuFnJ1AdpfheLAbOptTjmxgDp9fA0hAPi', NULL, '[\"25\"]', NULL, '2019-11-28 07:12:01', '2019-12-05 23:37:50'),
(50, 'Thabo Miller', NULL, NULL, 'thabo@afrigenius.co.za', '07187246394', '2019-12-05', 'Male', 'thaboatafrigenius-co-za', '1', NULL, NULL, '$2y$10$EXBN4hwI5uGReuFY/3FxTOh.8NPy7LvN4bWUd40Hsr8i3M5Gq.m3W', NULL, NULL, NULL, '2019-12-05 15:40:12', '2019-12-05 15:40:12'),
(55, 'shuhbam', NULL, NULL, 'shubham@gmail.com', '7877462405', '19-12-2019', 'Male', 'shubhamatgmail-com', '1', NULL, NULL, '$2y$10$Fhm1V0B/1eg8p/P6sH7.OudaE7j3/fPixUG0Szu.pk2NihtdSEEZa', NULL, NULL, NULL, '2019-12-12 15:31:57', '2019-12-12 15:31:57'),
(57, 'arvind pelunathan', 'arvind', 'pelunathan', 'pel@pelunatham.com', '2342398723', '11-12-2019', 'Male', 'pelatpelunatham-com', '1', NULL, NULL, '$2y$10$eBxSyUKZrx9wZJsv3qfqBO4gxj4/CImanTI8IBoPEvoOuMRuJe9QO', NULL, NULL, NULL, '2019-12-12 17:25:40', '2019-12-12 17:25:40'),
(58, 'abc abc', 'abc', 'abc', 'abc@ab.com', '32432445', '17-12-2019', 'Female', 'abcatab-com', '1', NULL, NULL, '$2y$10$TcdzINFybrusvMjaeDVT.ewaffsPASdmEyLHJmRqYf1gjJZdYrrm2', NULL, NULL, NULL, '2019-12-12 17:28:52', '2019-12-12 17:28:52'),
(59, 'Oliver Arrow', 'Oliver', 'Arrow', 'arrow@mailinator.com', '957111212124', '18-12-2019', 'Male', 'arrowatmailinator-com', '1', NULL, NULL, '$2y$10$BbAm5a/7073o7KISxOZoN.SXwPfCkh4nZe/judXnZ043Z1UHpOTOK', NULL, NULL, NULL, '2019-12-12 18:45:20', '2019-12-12 18:45:20'),
(60, 'Fistju suranana', 'Fistju', 'suranana', 'fistju@gggg.com', '9577884411', '17-12-2019', 'Male', 'fistjuatgggg-com', '1', NULL, NULL, '$2y$10$Bc.Lk7L2OWM.V5R8eMJxHemSzASaIR3bO5oFfIUdNC0kW3Si6MvzK', NULL, NULL, NULL, '2019-12-12 18:47:26', '2019-12-12 18:47:26'),
(62, 'TTTT VVVV', 'TTTT', 'VVVV', 'tttt@mailinator.com', '957788956544', '10-12-2019', 'Female', 'ttttatmailinator-com', '1', NULL, NULL, '$2y$10$dVX9Csk3dAnz7.4cFkAtXueaZQETV0DFHsxPMeqYyrZdR71V5c9uC', NULL, NULL, NULL, '2019-12-17 17:59:12', '2019-12-17 17:59:12'),
(63, 'Niraj Kumar', 'Niraj', 'Kumar', 'niraj.kumar@mailinator.com', '9998887777', '10-12-2019', 'Male', 'niraj-kumaratmailinator-com', '1', NULL, NULL, '$2y$10$c/cKUYRwDW9c06WqbKnL0.weSI9Py6yjbJn/dx7Rnb7zndwxBLJUe', NULL, NULL, NULL, '2019-12-20 17:33:03', '2019-12-20 17:33:03'),
(64, 'Flubert Taga Nteumagne', 'Flubert', 'Taga Nteumagne', 'flubeyrt@afrigenius.co.za', '0718724630', '2019-12-22', 'Male', 'flubeyrtatafrigenius-co-za', '0', NULL, NULL, '$2y$10$vLrzxjUSyiBa9Tgm7YRAgODKpcbt7R5DewzjJnBDl1/BKSLxk8mDm', NULL, NULL, NULL, '2019-12-23 00:53:48', '2019-12-23 00:54:21'),
(65, 'Steve Smith', 'Steve', 'Smith', 'steve@mailinator.com', '2233665544', '08-12-2019', 'Male', 'steveatmailinator-com', '1', NULL, NULL, '$2y$10$Oro800yR.yk9z119SSnn4eHU/mQlaPoWijkamU/ukjkycH4pCjvEy', NULL, NULL, NULL, '2019-12-23 12:14:24', '2019-12-23 12:14:24'),
(66, 'RAKHI Rana', 'RAKHI', 'Rana', 'rakhi.rana@arkasoftwares.com', '9602147061', '03-12-2019', 'Female', 'rakhi-ranaatarkasoftwares-com', '1', NULL, NULL, '$2y$10$NYMA5tX7/y.rB/8Fgk8Ewec48vy6k8Mz4vQ2NVooaBamDqRjbWd36', NULL, NULL, NULL, '2019-12-23 13:40:36', '2019-12-23 13:40:36'),
(67, 'Will Mattsan', 'Will', 'Mattsan', 'matt@mailinator.com', '9955887744', '2019-12-15', 'Male', 'mattatmailinator-com', '1', NULL, NULL, '$2y$10$PP.23uoaO2I7EM89go4uzOS.L/lBepKqGZ30XCoPfpdorWF7BhN9u', NULL, NULL, 'Barcelona, Spain', '2019-12-23 17:35:43', '2019-12-23 17:36:07'),
(70, 'Flubert Taga', 'Flubert', 'Taga', 'fntaga@gmail.com', '+27718724639', '16-12-2019', 'Male', 'fntagaatgmail-com', '1', NULL, NULL, '$2y$10$T.y2xJvwhtMqF0tjiddeueDlYf2bEu8ZoX2rBSKnmrnmW3XGNtDqG', NULL, NULL, NULL, '2019-12-25 03:12:07', '2019-12-25 03:12:07'),
(71, 'QA RAKHI rana', 'QA RAKHI', 'rana', 'Rakhiq@getnada.com', '9602147081', '07-01-2009', 'Female', 'ranaqaatvetnada-com', '1', NULL, NULL, '$2y$10$jXNdOsYsaoHQUSh09tYEMuJhtuSr3mwIFWnwESQ8yRFfojXqxhk7S', NULL, NULL, NULL, '2020-01-08 17:16:31', '2020-01-08 18:10:40'),
(72, 'Rakhi consultant', 'Rakhi', 'consultant', 'rakhiqa@getnada.com', '9602147067', '1995-04-19', 'Female', 'rakhiqaatgetnada-com', '1', NULL, NULL, '$2y$10$Tu3kej6xvMh/regoMUr47O8qTXRhHrIyg4q3TnQctwqooHlQZfCgO', NULL, '[\"25\",\"26\",\"50\",\"64\",\"67\",\"68\"]', NULL, '2020-01-08 17:59:27', '2020-01-08 18:02:04'),
(74, 'Web Text Vision', 'Web Text', 'Vision', 'webvisionsoft@gmail.com', '9588295716', '2020-01-01', 'Male', 'webvisionsoftatgmail-com', '1', NULL, NULL, '$2y$10$kgeme.MDLCDqIo4dcoM5OeSJMHvHYJLtCzwdvUiyPaQYYeBaM1ake', NULL, NULL, 'Jaipur, Rajasthan, India', '2020-01-17 12:28:55', '2020-01-29 16:17:27'),
(75, 'nitin mathut', 'nitin', 'mathut', 'nitin@yopmail.com', '9785116057', '08-09-1989', 'Male', 'nitinatyopmail-com', '1', NULL, NULL, '$2y$10$5yPWrfjjbFaykXWsN//SUOJbmF7r8o074rsrG0ut.kZ8NZfjHyseO', NULL, NULL, NULL, '2020-01-30 13:00:55', '2020-01-30 13:00:55'),
(76, 'Jimmy Shar', 'Jimmy', 'Shar', 'jimmy@mailinator.com', '9222222222', '29-01-2020', 'Male', 'jimmyatmailinator-com', '1', NULL, NULL, '$2y$10$AmVgcJMWrdgPpYMQhzSBPe821XWNyWg7lWaLY5WQuRvVySUVYx5va', NULL, NULL, NULL, '2020-01-31 11:14:36', '2020-01-31 11:14:36'),
(77, 'Flubert Taga', 'Flubert', 'Taga', 'admin@afrigenius.co.za', '0718724639', '2020-02-03', 'Male', 'adminatafrigenius-co-za', '1', NULL, NULL, '$2y$10$taQR5qSfGuZsg41AWCA5SeLoeFSa2hiDXG7AbHzlFQYMO2VtroNYe', NULL, NULL, 'www.afrigenius.co.za', '2020-02-04 00:12:42', '2020-02-04 00:12:42'),
(78, 'Flubert Taga Nteumagne', 'Flubert', 'Taga Nteumagne', 'flubert@afrigenius.co.za', '07187246396', '2020-02-02', 'Male', 'flubertatafrigenius-co-za', '1', NULL, NULL, '$2y$10$TqTdN4np/JTNpVA7hqoLIOaIvV/56XwkisNXBy0EVK8Ez8seLby0m', NULL, '[\"64\"]', NULL, '2020-02-04 00:36:21', '2020-02-04 00:36:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancel_bookings`
--
ALTER TABLE `cancel_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancel_bookings_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_service_id_foreign` (`service_id`),
  ADD KEY `comments_consultant_id_foreign` (`consultant_id`);

--
-- Indexes for table `extension_managers`
--
ALTER TABLE `extension_managers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `extension_managers_email_unique` (`email`),
  ADD UNIQUE KEY `extension_managers_mobile_number_unique` (`mobile_number`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farms`
--
ALTER TABLE `farms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usersids` (`user_id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usersID` (`user_id`),
  ADD KEY `fk_farmID` (`farm_id`),
  ADD KEY `fk_servicesID` (`service_id`),
  ADD KEY `fk_consultantID` (`consultant_id`),
  ADD KEY `leads_assigned_by_foreign` (`assigned_by`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifies`
--
ALTER TABLE `notifies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_questions` (`user_id`);

--
-- Indexes for table `questions_options`
--
ALTER TABLE `questions_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_questions_options` (`question_id`);

--
-- Indexes for table `question_responses`
--
ALTER TABLE `question_responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_responses_consultant_id_foreign` (`consultant_id`),
  ADD KEY `question_responses_question_id_foreign` (`question_id`),
  ADD KEY `question_responses_farm_id_foreign` (`farm_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_lists`
--
ALTER TABLE `task_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_lists_consultant_id_foreign` (`consultant_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_mobile_number_unique` (`mobile_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cancel_bookings`
--
ALTER TABLE `cancel_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `extension_managers`
--
ALTER TABLE `extension_managers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `farms`
--
ALTER TABLE `farms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifies`
--
ALTER TABLE `notifies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `questions_options`
--
ALTER TABLE `questions_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `question_responses`
--
ALTER TABLE `question_responses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `task_lists`
--
ALTER TABLE `task_lists`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cancel_bookings`
--
ALTER TABLE `cancel_bookings`
  ADD CONSTRAINT `cancel_bookings_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `farms`
--
ALTER TABLE `farms`
  ADD CONSTRAINT `fk_usersids` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_assigned_by_foreign` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_ibfk_2` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `leads_ibfk_4` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_questions` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions_options`
--
ALTER TABLE `questions_options`
  ADD CONSTRAINT `fk_questions_options` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question_responses`
--
ALTER TABLE `question_responses`
  ADD CONSTRAINT `question_responses_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_responses_farm_id_foreign` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_responses_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_users`
--
ALTER TABLE `role_users`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task_lists`
--
ALTER TABLE `task_lists`
  ADD CONSTRAINT `task_lists_consultant_id_foreign` FOREIGN KEY (`consultant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
