-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 24 oct. 2025 à 12:55
-- Version du serveur : 10.11.14-MariaDB-0+deb12u2
-- Version de PHP : 8.3.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cakir4`
--

-- --------------------------------------------------------

--
-- Structure de la table `Category`
--

CREATE TABLE `Category` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Category`
--

INSERT INTO `Category` (`id`, `name`) VALUES
(1, 'Composants'),
(2, 'PC Portables'),
(3, 'Nouveautés'),
(4, 'Smartphones'),
(5, 'Son');

-- --------------------------------------------------------

--
-- Structure de la table `OrderItems`
--

CREATE TABLE `OrderItems` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Product`
--

CREATE TABLE `Product` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `category` int(11) NOT NULL,
  `description` text NOT NULL DEFAULT 'aucune',
  `image` varchar(255) DEFAULT 'aucune'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Déchargement des données de la table `Product`
--

INSERT INTO `Product` (`id`, `name`, `price`, `category`, `description`, `image`) VALUES
(1, 'Carte mère ASUS Prime B650M-A', '302.82', 1, 'Carte mère micro-ATX compatible Ryzen 7000 avec DDR5 et PCIe 5.0', 'carte_mere_asus_1.jpg'),
(2, 'Processeur AMD Ryzen 7 7800X3D', '236.24', 1, 'Processeur 8 cœurs optimisé pour le gaming', 'ryzen_7800x3.jpg'),
(3, 'SSD Samsung 980 Pro 1TB', '422.73', 1, 'SSD NVMe PCIe 4.0 ultra rapide 1 To', 'ssd_samsung_980.jpg'),
(4, 'Alimentation Corsair RM750e', '354.94', 1, 'Alimentation 750W 80+ Gold, modulaire', 'alimentation_corsair.jpg'),
(5, 'Boîtier NZXT H5 Flow', '356.49', 1, 'Boîtier PC compact avec flux d’air optimisé', 'boitier_nzxt.jpg'),
(6, 'ASUS TUF Gaming A15', '267.66', 2, 'PC portable gamer 15.6\" Ryzen 7 RTX 4060', 'asus_tuf_a15.jpg'),
(7, 'MacBook Air M2', '418.82', 2, 'Ultra-portable Apple 13\" puce M2 256 Go', 'macbook_air_m2.jpg'),
(8, 'HP Envy 14', '241.11', 2, 'Ultrabook 14\" Intel Core i7 avec écran tactile', 'hp_envy_14.jpg'),
(9, 'Lenovo ThinkPad X1 Carbon', '399.08', 2, 'Ordinateur professionnel léger et robuste', 'thinkpad_x1.jpg'),
(10, 'Acer Nitro 5', '222.06', 2, 'PC gamer abordable avec carte graphique RTX 3050', 'acer_nitro_5.jpg'),
(11, 'Écran OLED 27\" LG UltraGear', '363.09', 3, 'Moniteur gaming 27\" OLED HDR10 240Hz', 'lg_ultragear_oled.jpg'),
(12, 'Casque VR Meta Quest 3', '399.26', 3, 'Casque VR nouvelle génération Meta Quest 3', 'meta_quest_3.jpg'),
(13, 'Clavier Logitech MX Keys S', '157.04', 3, 'Clavier sans fil premium rétroéclairé Logitech MX Keys S', 'logitech_mx_keys_s.jpg'),
(14, 'Montre connectée Samsung Galaxy Watch 7', '337.41', 3, 'Montre connectée Samsung Galaxy Watch 7 avec suivi santé', 'galaxy_watch_7.jpg'),
(15, 'Station d’accueil Dell WD19S', '165.92', 3, 'Station d’accueil Dell WD19S USB-C universelle', 'dell_wd19s.jpg'),
(16, 'iPhone 15', '267.39', 4, 'iPhone 15 avec puce A17 et écran OLED 6.1\"', 'iphone_15.jpg'),
(17, 'Samsung Galaxy S24', '389.20', 4, 'Smartphone Android premium Samsung Galaxy S24', 'galaxy_s24.jpg'),
(18, 'Google Pixel 9', '393.81', 4, 'Google Pixel 9 avec Android 15 et IA intégrée', 'google_pixel_9.jpg'),
(19, 'OnePlus 12', '351.47', 4, 'OnePlus 12 avec charge rapide 100W', 'oneplus_12.jpg'),
(20, 'Xiaomi Redmi Note 14 Pro', '425.91', 4, 'Xiaomi Redmi Note 14 Pro avec appareil photo 108MP', 'redmi_note_14_pro.jpg'),
(21, 'Casque Sony WH-1000XM5', '325.15', 5, 'Casque Sony WH-1000XM5 à réduction de bruit', 'sony_wh1000xm5.jpg'),
(22, 'Enceinte JBL Charge 6', '198.02', 5, 'Enceinte portable Bluetooth étanche JBL Charge 6', 'jbl_charge_6.jpg'),
(23, 'Micro Blue Yeti X', '164.64', 5, 'Micro USB Blue Yeti X pour streaming et podcast', 'blue_yeti_x.jpg'),
(24, 'Barre de son Samsung HW-Q800D', '379.15', 5, 'Barre de son Samsung HW-Q800D Dolby Atmos 5.1.2', 'samsung_hw_q800d.jpg'),
(25, 'Écouteurs Apple AirPods Pro 2', '351.83', 5, 'Écouteurs sans fil Apple AirPods Pro 2 avec ANC', 'airpods_pro_2.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `ProductImage`
--

CREATE TABLE `ProductImage` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ProductImage`
--

INSERT INTO `ProductImage` (`id`, `id_product`, `url`) VALUES
(1, 1, 'carte_mere_asus_1.jpg'),
(2, 1, 'carte_mere_asus_2.jpg'),
(3, 1, 'carte_mere_asus_3.jpg'),
(4, 2, 'ryzen_7800x3_1.jpg'),
(5, 2, 'ryzen_7800x3_2.jpg'),
(6, 3, 'ssd_samsung_980_1.jpg'),
(15, 4, 'alimentation_corsair_1.jpg'),
(16, 5, 'boitier_nzxt_1.jpg'),
(17, 6, 'asus_tuf_a15_1.jpg'),
(18, 7, 'macbook_air_m2_1.jpg'),
(19, 8, 'hp_envy_14_1.jpg'),
(20, 9, 'thinkpad_x1_1.jpg'),
(21, 10, 'acer_nitro_5_1.jpg'),
(22, 11, 'lg_ultragear_oled_1.jpg'),
(23, 12, 'meta_quest_3_1.jpg'),
(24, 13, 'logitech_mx_keys_s_1.jpg'),
(25, 14, 'galaxy_watch_7_1.jpg'),
(26, 15, 'dell_wd19s_1.jpg'),
(27, 16, 'iphone_15_1.jpg'),
(28, 17, 'galaxy_s24_1.jpg'),
(29, 18, 'google_pixel_9_1.jpg'),
(30, 19, 'oneplus_12_1.jpg'),
(31, 20, 'redmi_note_14_pro_1.jpg'),
(32, 21, 'sony_wh1000xm5_1.jpg'),
(33, 22, 'jbl_charge_6_1.jpg'),
(34, 23, 'blue_yeti_x_1.jpg'),
(35, 24, 'samsung_hw_q800d_1.jpg'),
(36, 25, 'airpods_pro_2_1.jpg'),
(37, 2, 'ryzen_7800x3_3.jpg'),
(38, 3, 'ssd_samsung_980_2.jpg'),
(39, 3, 'ssd_samsung_980_3.jpg'),
(40, 4, 'alimentation_corsair_2.jpg'),
(41, 4, 'alimentation_corsair_3.jpg'),
(42, 4, 'alimentation_corsair_4.jpg'),
(43, 5, 'boitier_nzxt_2.jpg'),
(44, 5, 'boitier_nzxt_3.jpg'),
(45, 5, 'boitier_nzxt_4.jpg'),
(46, 6, 'asus_tuf_a15_2.jpg'),
(47, 6, 'asus_tuf_a15_3.jpg'),
(48, 7, 'macbook_air_m2_2.jpg'),
(49, 7, 'macbook_air_m2_3.jpg'),
(50, 7, 'macbook_air_m2_4.jpg'),
(51, 8, 'hp_envy_14_2.jpg'),
(52, 8, 'hp_envy_14_3.jpg'),
(53, 9, 'thinkpad_x1_2.jpg'),
(54, 9, 'thinkpad_x1_3.jpg'),
(55, 10, 'acer_nitro_5_2.jpg'),
(56, 10, 'acer_nitro_5_3.jpg'),
(57, 11, 'lg_ultragear_oled_2.jpg'),
(58, 11, 'lg_ultragear_oled_3.jpg'),
(59, 12, 'meta_quest_3_2.jpg'),
(60, 12, 'meta_quest_3_3.jpg'),
(61, 13, 'logitech_mx_keys_s_2.jpg'),
(62, 13, 'logitech_mx_keys_s_3.jpg'),
(63, 14, 'galaxy_watch_7_2.jpg'),
(64, 14, 'galaxy_watch_7_3.jpg'),
(65, 15, 'dell_wd19s_2.jpg'),
(66, 15, 'dell_wd19s_3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `User`
--

CREATE TABLE `User` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_creation` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `User`
--

INSERT INTO `User` (`id`, `nom`, `prenom`, `email`, `gender`, `mot_de_passe`, `date_creation`) VALUES
(7, 'TestNom', 'TestPrenom', 'huiagf@zeu', 'M', '$2y$10$J.CBarjlTrE0lzuK1BKT/.9zby7rdtEdE7VRfI0oX80S6rdilQI7S', '2025-10-22 08:24:27'),
(8, 'z', 'duzh', 'adddem@zitoune', 'M', '$2y$10$b8ngKGbfMa/yzOMoAOk6reMu3asnKt/Qm4wYvpzFZEXdm6K25CpgG', '2025-10-22 08:25:16'),
(9, 'z', 'duzh', 'adddem@zitouns', 'M', '$2y$10$aXZq1zy9f8GhQEKwfZKxcuZ4c2aqljG9TQmOvGeMGR/xjE2B1BK9S', '2025-10-22 08:27:15'),
(10, 'cak', 'huzey', 'huzeyfe@cakir', 'Mme', '$2y$10$TIzt2X.lrnTmaOCZTNoI8.XQYlASFUjHrtoCQbjQnc2xsj..nEdqK', '2025-10-22 08:29:34'),
(11, 'def', 'abc', 'abc@abc', 'Mme', '$2y$10$LJFIZgECHV6Fv8dqBLsltOqwsjcEulSwRqRZCh/bpRgpLU1wnFQye', '2025-10-22 08:53:53'),
(12, 'Cakir', 'Azerty', 'a@a.com', 'M', '$2y$10$1J1WZr4mnZbhDGZ64CVWTOpWhqN90uy9tcTgeFqYuKtZpYR8li9Lm', '2025-10-22 12:34:06'),
(13, 'cakir', 'osman', 'osman@cakir', 'M', '$2y$10$jznfOTplCGGmImgyIjVC7u21m9q/Jpr7D0HpSkHec9DLW8tCtgTGK', '2025-10-22 13:55:55'),
(14, 'zblillah', 'addem', 'addem@e', 'M', '$2y$10$nZaNUIVihlqI0tXP37clIuHDAJHBSZdO0YHi0LckatVPV7ePesOSS', '2025-10-22 14:12:49'),
(15, 'tutu', 'toto', 'toto@to', 'Mme', '$2y$10$Op80R3h.0h9Sg4sEuEYF4.45Np5XqwTSfoDPZOth5Hu8AWvP24i5a', '2025-10-22 14:22:32'),
(16, 'otto', 'uttu', 'tutu@tu', 'Mme', '$2y$10$/vyrn8FAGjWG0Q3Qw65dbOgYFjG/CUhnMOYfE3lYl1oVV9UHCtaB.', '2025-10-22 15:04:06'),
(30, 'fe', 'zfoz', 'huer@fiejf', NULL, '$2y$10$I5wMaNXtcvTsP4jMN9sIx.jbdUTh1OfDz2MHmm.vx2odAGcsptr.W', '2025-10-22 15:52:03'),
(31, 'dz', 'fjzzjfe', 'bbzfj@kfze', NULL, '$2y$10$rjT54A485Kp0zC3Bnuxbu.0PvI3bZSmjzVVucua3CfZy0RbMShc/m', '2025-10-22 15:52:42'),
(32, 'dfzenf', 'fzjkfhzk', 'vferfze@ijzfoiej', 'Mme', '$2y$10$CmLpJ1K2um0dnYZ6.MjNEuerJ/.Ov/VwDLd1IUb4QRnbBjvbBkaEC', '2025-10-22 15:53:01'),
(38, 'jul', 'benoit', 'huzeyfe@c', 'Mme', '$2y$10$mJqJNih421LIrhDfPvqup.9pbWWwnEnZ4F2Fe6p2t2aVj4JIGVrIW', '2025-10-22 15:54:06'),
(39, 'yilmaz', 'mehmet', 'mehmet@yildiz', 'M', '$2y$10$OYcGufPv1A8z//IFRTGGK./v6vl0onny4GgOI39T1lg3GDCMpWyTW', '2025-10-22 18:20:04'),
(42, 'momo', 'mama', 'watch@a', 'Mme', '$2y$10$2TpJVUmM.jVY7n3Y4CaKn.oHLXHONPARY1AtJkcZcrtAzgOtsQNkK', '2025-10-22 21:58:40'),
(44, 'cak', 'huz', 'huz@huz', 'M', '$2y$10$kc5BEL6ND2j15VepqdUb9.A66MUy26o8xL0f68KNu3wDXl9T1Zg7u', '2025-10-22 22:25:06'),
(45, 'baba', 'ali', 'hu@hu', 'M', '$2y$10$BEj/BvCsQ1xhgOgavVOibenexp9LZx6dmeI.PGqTBk6GTCKa1CltC', '2025-10-23 06:46:08'),
(48, 'abi', 'yusud', 'abi@turc', 'M', '$2y$10$P2SsLqNQxw48p4k8SLi4hOWUadrhzt65TVLR97bppI./dGmDTW3T.', '2025-10-23 07:44:10'),
(49, 'crespin', 'uzeyfe', 'benoit@crespin', 'M', '$2y$10$9XBpsPQmUTZRxRc1OEnRZOKtWFYXdBXkPC082EICDm4cOvoO1PDhW', '2025-10-23 08:18:25'),
(52, 'toti', 'tutu', 'titi@ti', 'Mme', '$2y$10$y/37l0ZPggOqrOytfiQR6eFrj/HNF/G9MXxtR.61AN56R.ipSWbZW', '2025-10-23 11:30:17'),
(54, 'mora', 'frederic', 'mora@mora', 'M', '$2y$10$zD0K2qRVXAR7j1VanKEGE.0XYhrO3953ZVXYc10XGKzVpLeywepEa', '2025-10-23 12:15:50'),
(56, 'pupu', 'popo', 'pupou@wa', 'F', '$2y$10$.ilzfHaKGURECGZzy5ESmegtl4SlHD7hGJ492IkrpaQ1uizwW.rCW', '2025-10-23 12:53:37'),
(57, 'eegader', 'wahel', 'wahel@gmail.com', 'M', '$2y$10$neY2zXo9MMWJz7RrmuAmbuj890VylzVf8.a5qDBUiFL/ausIKOIeu', '2025-10-23 14:34:25'),
(59, 'bbob', 'frite', 'ZAZA@payepas', 'M', '$2y$10$.0OlfA0yEfhNgbZ3eW14AOFoHBS3Ng.V5r3W5LCtqJJfM57kgxnMC', '2025-10-23 22:37:38'),
(60, 'mora', 'frederic', 'mora@frederic', 'M', '$2y$10$sKCoFXrJ53KIkoqw9MYnIe69SMFMsW8x/lTGYNAWX8/TUDP1vaRYC', '2025-10-24 11:04:00');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Category`
--
ALTER TABLE `Category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Index pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Index pour la table `ProductImage`
--
ALTER TABLE `ProductImage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Index pour la table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Category`
--
ALTER TABLE `Category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `OrderItems`
--
ALTER TABLE `OrderItems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `ProductImage`
--
ALTER TABLE `ProductImage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `User`
--
ALTER TABLE `User`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD CONSTRAINT `OrderItems_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);

--
-- Contraintes pour la table `Product`
--
ALTER TABLE `Product`
  ADD CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `Category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ProductImage`
--
ALTER TABLE `ProductImage`
  ADD CONSTRAINT `ProductImage_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `Product` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
