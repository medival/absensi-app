/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
DROP TABLE IF EXISTS attendance_position;
CREATE TABLE `attendance_position` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attendance_id` bigint unsigned NOT NULL,
  `position_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_position_attendance_id_foreign` (`attendance_id`),
  KEY `attendance_position_position_id_foreign` (`position_id`),
  CONSTRAINT `attendance_position_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_position_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS attendances;
CREATE TABLE `attendances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `batas_start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `batas_end_time` time NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS failed_jobs;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS holidays;
CREATE TABLE `holidays` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holiday_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS migrations;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS password_resets;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS permissions;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `attendance_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_date` date NOT NULL,
  `is_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_user_id_foreign` (`user_id`),
  KEY `permissions_attendance_id_foreign` (`attendance_id`),
  CONSTRAINT `permissions_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS personal_access_tokens;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS positions;
CREATE TABLE `positions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS presences;
CREATE TABLE `presences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `attendance_id` bigint unsigned NOT NULL,
  `presence_date` date NOT NULL,
  `presence_enter_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `presence_out_time` time DEFAULT NULL,
  `is_permission` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `presences_user_id_foreign` (`user_id`),
  KEY `presences_attendance_id_foreign` (`attendance_id`),
  CONSTRAINT `presences_attendance_id_foreign` FOREIGN KEY (`attendance_id`) REFERENCES `attendances` (`id`) ON DELETE CASCADE,
  CONSTRAINT `presences_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS roles;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS users;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_position_id_foreign` (`position_id`),
  CONSTRAINT `users_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `positions` (`id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO attendance_position(id,attendance_id,position_id,created_at,updated_at) VALUES('1','1','1','NULL','NULL'),('2','1','2','NULL','NULL'),('3','1','3','NULL','NULL'),('4','1','4','NULL','NULL'),('5','1','5','NULL','NULL'),('6','1','6','NULL','NULL'),('7','1','7','NULL','NULL'),('8','1','8','NULL','NULL');

INSERT INTO attendances(id,title,description,start_time,batas_start_time,end_time,batas_end_time,code,created_at,updated_at) VALUES('1','\'Absen Kerja \'','\'Absen Kerja Tanggal 6 Desember 2023\'','\'01:00:00\'','\'08:00:00\'','\'16:00:00\'','\'22:00:00\'','\'EXINCnzd29Bxgyu7\'','\'2023-12-06 01:50:11\'','\'2023-12-06 01:50:59\'');



INSERT INTO migrations(id,migration,batch) VALUES('1','\'2014_10_12_000000_create_users_table\'','1'),('2','\'2014_10_12_100000_create_password_resets_table\'','1'),('3','\'2019_08_19_000000_create_failed_jobs_table\'','1'),('4','\'2019_12_14_000001_create_personal_access_tokens_table\'','1'),('5','\'2022_06_16_075041_create_roles_table\'','1'),('6','\'2022_06_16_075123_add_role_id_to_users_table\'','1'),('7','\'2022_06_17_134607_create_positions_table\'','1'),('8','\'2022_06_17_142639_add_phone_and_position_id_to_users_table\'','1'),('9','\'2022_06_20_114945_create_holidays_table\'','1'),('10','\'2022_06_21_135647_create_attendances_table\'','1'),('11','\'2022_06_21_135721_create_attendance_position_table\'','1'),('12','\'2022_06_21_144144_create_presences_table\'','1'),('13','\'2022_06_26_214220_create_permissions_table\'','1'),('14','\'2022_06_26_214239_add_is_permission_to_presences_table\'','1'),('15','\'2022_06_26_215859_add_permission_date_to_permissions_table\'','1'),('16','\'2022_06_27_162656_add_is_accepted_to_permissions_table\'','1');




INSERT INTO positions(id,name,created_at,updated_at) VALUES('1','\'Pegawai \\\"Biasa\\\"\'','\'2023-12-06 00:50:18\'','\'2023-12-06 00:50:18\''),('2','\'Manager\'','\'2023-12-06 00:50:18\'','\'2023-12-06 00:50:18\''),('3','\'Direktur\'','\'2023-12-06 00:50:18\'','\'2023-12-06 00:50:18\''),('4','\'Operator\'','\'2023-12-06 00:50:18\'','\'2023-12-06 00:50:18\''),('5','\'Pegawai \\\"Biasa\\\"\'','\'2023-12-06 01:14:21\'','\'2023-12-06 01:14:21\''),('6','\'Manager\'','\'2023-12-06 01:14:21\'','\'2023-12-06 01:14:21\''),('7','\'Direktur\'','\'2023-12-06 01:14:21\'','\'2023-12-06 01:14:21\''),('8','\'Operator\'','\'2023-12-06 01:14:21\'','\'2023-12-06 01:14:21\'');

INSERT INTO presences(id,user_id,attendance_id,presence_date,presence_enter_time,presence_out_time,is_permission,created_at,updated_at) VALUES('1','14','1','\'2023-12-06\'','\'01:53:15\'','NULL','0','\'2023-12-06 01:53:15\'','\'2023-12-06 01:53:15\''),('2','14','1','\'2023-12-06\'','\'01:53:33\'','NULL','0','\'2023-12-06 01:53:34\'','\'2023-12-06 01:53:34\'');

INSERT INTO roles(id,name,created_at,updated_at) VALUES('1','\'admin\'','\'2023-12-06 00:50:17\'','\'2023-12-06 00:50:17\''),('2','\'operator\'','\'2023-12-06 00:50:17\'','\'2023-12-06 00:50:17\''),('3','\'user\'','\'2023-12-06 00:50:17\'','\'2023-12-06 00:50:17\''),('4','\'admin\'','\'2023-12-06 01:14:20\'','\'2023-12-06 01:14:20\''),('5','\'operator\'','\'2023-12-06 01:14:20\'','\'2023-12-06 01:14:20\''),('6','\'user\'','\'2023-12-06 01:14:20\'','\'2023-12-06 01:14:20\'');
INSERT INTO users(id,name,email,email_verified_at,password,phone,position_id,role_id,remember_token,created_at,updated_at) VALUES('1','\'Administrator\'','\'admin@gmail.com\'','\'2023-12-06 00:50:18\'','\'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\'','\'1-831-480-2019\'','4','1','\'5miLoQrG1k\'','\'2023-12-06 00:50:18\'','\'2023-12-06 01:34:28\''),('2','\'Javon Pacocha\'','\'gerhold.jarrell@example.org\'','\'2023-12-06 00:50:18\'','\'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi\'','\'+1.573.336.9991\'','4','2','\'uXfpE3xCRl\'','\'2023-12-06 00:50:18\'','\'2023-12-06 00:50:18\''),('14','\'Adi Purnomo\'','\'adi.purnomo@gmail.com\'','NULL','\'$2y$10$..KvnL2C76bm66303Adn9OzVmmlNJ2aYjRA1JUBXccdCgNQD7zdPi\'','\'0857272727123\'','1','3','NULL','\'2023-12-06 01:36:31\'','\'2023-12-06 01:36:31\'');