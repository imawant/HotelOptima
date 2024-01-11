-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 11, 2024 at 04:54 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hoteloptima`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id_booking` bigint(20) UNSIGNED NOT NULL,
  `booking_date` date NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `total_pay` int(11) NOT NULL,
  `id_guest` bigint(20) UNSIGNED NOT NULL,
  `id_room` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkinouts`
--

CREATE TABLE `checkinouts` (
  `id_check` bigint(20) UNSIGNED NOT NULL,
  `id_booking` bigint(20) UNSIGNED NOT NULL,
  `checkIn_date` datetime DEFAULT NULL,
  `checkOut_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id_department` bigint(20) UNSIGNED NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id_department`, `department_name`, `salary`) VALUES
(1, 'manager', 5000),
(2, 'receptionist', 6000),
(3, 'human resources', 5500),
(4, 'house keeper', 5500);

-- --------------------------------------------------------

--
-- Table structure for table `eventlogs`
--

CREATE TABLE `eventlogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id_guest` bigint(20) UNSIGNED NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `guest_phone` varchar(255) NOT NULL,
  `guest_address` varchar(255) NOT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_09_061110_create_roomtypes_table', 1),
(6, '2023_10_09_061123_create_guests_table', 1),
(7, '2023_10_09_061149_create_departments_table', 1),
(8, '2023_10_09_061201_create_eventlogs_table', 1),
(9, '2023_10_09_071322_create_staff_table', 1),
(10, '2023_10_09_072129_create_rooms_table', 1),
(11, '2023_10_09_115457_create_bookings_table', 1),
(12, '2023_10_09_115559_create_checkinouts_table', 1),
(13, '2023_10_11_050752_create_reports_table', 1);

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
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id_report` bigint(20) UNSIGNED NOT NULL,
  `id_room` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id_room` bigint(20) UNSIGNED NOT NULL,
  `room_number` varchar(255) NOT NULL,
  `id_roomtype` bigint(20) UNSIGNED NOT NULL,
  `status` enum('ready','checkined','checkouted','problem') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id_room`, `room_number`, `id_roomtype`, `status`) VALUES
(1, '101A', 1, 'ready'),
(2, '102A', 1, 'ready'),
(3, '103A', 1, 'ready'),
(4, '104A', 1, 'ready'),
(5, '105A', 1, 'ready'),
(6, '106A', 1, 'ready'),
(7, '107A', 1, 'ready'),
(8, '108A', 1, 'ready'),
(9, '109A', 1, 'ready'),
(10, '110A', 1, 'ready'),
(11, '201B', 2, 'ready'),
(12, '202B', 2, 'ready'),
(13, '203B', 2, 'ready'),
(14, '204B', 2, 'ready'),
(15, '205B', 2, 'ready'),
(16, '206B', 2, 'ready'),
(17, '207B', 2, 'ready'),
(18, '208B', 2, 'ready'),
(19, '209B', 2, 'ready'),
(20, '210B', 2, 'ready'),
(21, '301C', 3, 'ready'),
(22, '302C', 3, 'ready'),
(23, '303C', 3, 'ready'),
(24, '304C', 3, 'ready'),
(25, '305C', 3, 'ready'),
(26, '306C', 3, 'ready'),
(27, '307C', 3, 'ready'),
(28, '308C', 3, 'ready'),
(29, '309C', 3, 'ready'),
(30, '310C', 3, 'ready'),
(31, '401D', 4, 'ready'),
(32, '402D', 4, 'ready'),
(33, '403D', 4, 'ready'),
(34, '404D', 4, 'ready'),
(35, '405D', 4, 'ready'),
(36, '406D', 4, 'ready'),
(37, '407D', 4, 'ready'),
(38, '408D', 4, 'ready'),
(39, '409D', 4, 'ready'),
(40, '410D', 4, 'ready');

-- --------------------------------------------------------

--
-- Table structure for table `roomtypes`
--

CREATE TABLE `roomtypes` (
  `id_roomtype` bigint(20) UNSIGNED NOT NULL,
  `roomtype_name` varchar(255) NOT NULL,
  `bedsize` varchar(255) NOT NULL,
  `bed_count` int(11) NOT NULL,
  `max_cap` int(11) NOT NULL,
  `price_per_night` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roomtypes`
--

INSERT INTO `roomtypes` (`id_roomtype`, `roomtype_name`, `bedsize`, `bed_count`, `max_cap`, `price_per_night`) VALUES
(1, 'President Room', 'XL', 10, 5, 1000000),
(2, 'Deluxe Room', 'L', 10, 4, 800000),
(3, 'Junior Suite Room', 'M', 10, 2, 400000),
(4, 'Single Room', 'S', 10, 1, 250000);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id_staff` bigint(20) UNSIGNED NOT NULL,
  `staff_name` varchar(30) NOT NULL,
  `staff_address` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `id_department` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id_staff`, `staff_name`, `staff_address`, `phone_number`, `id_department`, `position`) VALUES
(1, 'Arya', 'Wisma Maju Mundur', '085717183826', 1, 'manager'),
(2, 'Nyon', 'Wisma Maju Mundur', '085717183827', 2, 'receptionist'),
(3, 'Ian Turu', 'Wisma Maju Mundur', '085717183829', 2, 'receptionist'),
(4, 'Fatih', 'Pasar Minggu', '087787143133', 1, 'manager'),
(5, 'Jethro', 'Gubeng', '087787143138', 3, 'human resources'),
(6, 'Kenang', 'Pasar Turi', '085717183822', 3, 'human resources'),
(7, 'Davva', 'Wisma Permai', '087787145152', 3, 'human resources'),
(8, 'Budi', 'Darmo', '081290966898', 4, 'house keeper'),
(9, 'Nisa', 'Warakas', '087787145154', 4, 'house keeper'),
(10, 'Nurul', 'Daan mogot', '087787145159', 4, 'house keeper'),
(11, 'Darren', 'Gading Kirana', '081290967878', 1, 'manager'),
(12, 'Ivan', 'Gading Putih', '087787149096', 2, 'receptionist'),
(13, 'Vania', 'Kalijudan', '08989876527', 2, 'receptionist'),
(14, 'Eagan', 'Gading Mercue', '085727284852', 2, 'receptionist'),
(15, 'Ivan', 'Gading Putih', '087787149096', 2, 'receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `role` enum('admin','receptionist','hrd','roomservice') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `remember_token`, `role`) VALUES
(1, 'akuadmin', '$2y$10$1r4j0Dkry9qfmRmXv868tu6k5Y0cLj7AWdxQWdxtRihBFBYFQ4UOy', NULL, 'admin'),
(2, 'akuhrd', '$2y$10$1r4j0Dkry9qfmRmXv868tu6k5Y0cLj7AWdxQWdxtRihBFBYFQ4UOy', NULL, 'hrd'),
(3, 'akuresepsionis', '$2y$10$1r4j0Dkry9qfmRmXv868tu6k5Y0cLj7AWdxQWdxtRihBFBYFQ4UOy', NULL, 'receptionist'),
(4, 'akuroomservice', '$2y$10$1r4j0Dkry9qfmRmXv868tu6k5Y0cLj7AWdxQWdxtRihBFBYFQ4UOy', NULL, 'roomservice');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id_booking`),
  ADD KEY `bookings_id_guest_foreign` (`id_guest`),
  ADD KEY `bookings_id_room_foreign` (`id_room`);

--
-- Indexes for table `checkinouts`
--
ALTER TABLE `checkinouts`
  ADD PRIMARY KEY (`id_check`),
  ADD KEY `checkinouts_id_booking_foreign` (`id_booking`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_department`);

--
-- Indexes for table `eventlogs`
--
ALTER TABLE `eventlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id_guest`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `reports_id_room_foreign` (`id_room`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id_room`),
  ADD KEY `rooms_id_roomtype_foreign` (`id_roomtype`);

--
-- Indexes for table `roomtypes`
--
ALTER TABLE `roomtypes`
  ADD PRIMARY KEY (`id_roomtype`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id_staff`),
  ADD KEY `staff_id_department_foreign` (`id_department`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id_booking` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkinouts`
--
ALTER TABLE `checkinouts`
  MODIFY `id_check` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id_department` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `eventlogs`
--
ALTER TABLE `eventlogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id_guest` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id_report` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id_room` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `roomtypes`
--
ALTER TABLE `roomtypes`
  MODIFY `id_roomtype` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id_staff` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_id_guest_foreign` FOREIGN KEY (`id_guest`) REFERENCES `guests` (`id_guest`),
  ADD CONSTRAINT `bookings_id_room_foreign` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`);

--
-- Constraints for table `checkinouts`
--
ALTER TABLE `checkinouts`
  ADD CONSTRAINT `checkinouts_id_booking_foreign` FOREIGN KEY (`id_booking`) REFERENCES `bookings` (`id_booking`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_id_room_foreign` FOREIGN KEY (`id_room`) REFERENCES `rooms` (`id_room`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_id_roomtype_foreign` FOREIGN KEY (`id_roomtype`) REFERENCES `roomtypes` (`id_roomtype`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_id_department_foreign` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
