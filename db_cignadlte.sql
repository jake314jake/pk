-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 23 fév. 2026 à 08:48
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_cignadlte`
--

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `position` enum('left','top') NOT NULL DEFAULT 'left',
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_last` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `position`, `name`, `slug`, `link`, `icon`, `is_last`, `is_active`) VALUES
(1, NULL, 'left', 'Person', 'person', 'person', 'fa fa-users', 1, 1),
(2, NULL, 'left', 'Tables', 'table', '#', 'fas fa-table', 0, 0),
(3, 2, 'left', 'Simple Table', 'simple_table', 'tables/simple', 'far fa-circle', 1, 0),
(4, 2, 'left', 'Datatables', 'dtables', 'tables/dtables', 'far fa-circle', 1, 0),
(5, 2, 'left', 'JqGrid', 'jqgrid', 'tables/jqgrid', 'far fa-circle', 1, 0),
(6, NULL, 'left', 'Level 1', 'level_1', '#', 'fas fa-circle', 0, 0),
(7, 6, 'left', 'Level 2', 'level_2', '#', 'far fa-circle', 1, 0),
(8, 6, 'left', 'Level 2', 'level_2_2', '#', 'far fa-circle', 0, 0),
(9, 8, 'left', 'Level 3', 'level_3', '#', 'fas fa-circle', 1, 0),
(10, NULL, 'top', 'Home', 'home', '#', 'far fa-circle', 1, 0),
(11, NULL, 'top', 'Contact', 'contact', '#', 'far fa-circle', 1, 0),
(12, NULL, 'left', 'Extra', 'extra', '#', 'far fa-plus-square', 0, 0),
(13, 12, 'left', 'Login', 'login', 'login', 'far fa-circle', 1, 0),
(14, 12, 'left', 'Register', 'register', 'register', 'far fa-circle', 1, 0),
(15, NULL, 'left', 'Setting', 'setting', '#', 'far fa-circle', 0, 0),
(16, 15, 'left', 'Privileges', 'privileges', 'setting/privileges', 'far fa-circle', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `menu_privileges`
--

DROP TABLE IF EXISTS `menu_privileges`;
CREATE TABLE IF NOT EXISTS `menu_privileges` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `privilege_id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED NOT NULL,
  `is_selected` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_menu_privilege` (`privilege_id`,`menu_id`),
  KEY `fk_menu_privileges_menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(5);

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`id`, `first_name`, `last_name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890', '2026-02-22 11:43:32', '2026-02-22 11:43:32'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '3456789012', '2026-02-22 11:43:32', '2026-02-22 11:43:32'),
(4, 'Bob', 'Brownn', 'bob.brown@example.com', '4567890123', '2026-02-22 11:43:32', '2026-02-22 12:06:26'),
(5, 'Charlie', 'Davis', 'charlie.davis@example.com', '5678901234', '2026-02-22 11:43:32', '2026-02-22 12:10:24'),
(6, 'YAKOUB', 'anouar', 'yakoub@gmail.com', '123', '2026-02-22 12:11:02', '2026-02-22 12:11:02');

-- --------------------------------------------------------

--
-- Structure de la table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
CREATE TABLE IF NOT EXISTS `privileges` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `user_privileges`
--

DROP TABLE IF EXISTS `user_privileges`;
CREATE TABLE IF NOT EXISTS `user_privileges` (
  `user_id` int UNSIGNED NOT NULL,
  `privilege_id` int UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`,`privilege_id`),
  KEY `fk_user_privileges_privilege` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `menu_privileges`
--
ALTER TABLE `menu_privileges`
  ADD CONSTRAINT `fk_menu_privileges_menu` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_privileges_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `user_privileges`
--
ALTER TABLE `user_privileges`
  ADD CONSTRAINT `fk_user_privileges_privilege` FOREIGN KEY (`privilege_id`) REFERENCES `privileges` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_privileges_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
