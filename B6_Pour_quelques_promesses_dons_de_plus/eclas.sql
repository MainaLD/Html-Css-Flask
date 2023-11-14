-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Jan 20, 2022 at 09:24 AM
-- Server version: 5.7.24
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eclas`
--

-- --------------------------------------------------------

--
-- Table structure for table `droits`
--

CREATE TABLE `droits` (
  `id_droit` int(11) NOT NULL,
  `libelle` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `droits`
--

INSERT INTO `droits` (`id_droit`, `libelle`) VALUES
(1, 'visiteur'),
(2, 'administrateur');

-- --------------------------------------------------------

--
-- Table structure for table `promesse_dons`
--

CREATE TABLE `promesse_dons` (
  `id_promesse` int(11) NOT NULL,
  `nom` varchar(40) DEFAULT NULL,
  `prenom` varchar(40) DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `mail` varchar(100) DEFAULT NULL,
  `somme_promise` int(11) DEFAULT NULL,
  `droit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promesse_dons`
--

INSERT INTO `promesse_dons` (`id_promesse`, `nom`, `prenom`, `adresse`, `mail`, `somme_promise`, `droit`) VALUES
(1, 'Dupont', 'Sophie', '10 rue de la Paix, 75001 Paris', 'sophie.dupont@gmail.com', 50, 2),
(2, 'Martin', 'Alexandre', '15 Avenue des Roses, 69002 Lyon', 'alex.martin@yahoo.fr', 500, 1),
(3, 'Lefevre', 'Julie', '8 Rue du Commerce, 31000 Toulouse', 'julie.lefevre@hotmail.com', 10, 1),
(4, 'Dubois', 'Pierre', '25 Rue du Château, 44000 Nantes', 'pierre.dubois@gmail.com', 100, 2),
(5, 'Robert', 'Caroline', '5 Boulevard des Lilas, 13008 Marseille', 'caro.robert@gmail.com', 3000, 1),
(6, 'Moreau', 'Nicolas', '2 Place de la Liberté, 67000 Strasbourg', 'nico.moreau@gmail.com', 15, 1),
(7, 'Girard', 'Céline', '18 Rue Saint-Michel, 59000 Lille', 'celine.girard@yahoo.fr', 25, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `droits`
--
ALTER TABLE `droits`
  ADD PRIMARY KEY (`id_droit`);

--
-- Indexes for table `promesse_dons`
--
ALTER TABLE `promesse_dons`
  ADD PRIMARY KEY (`id_promesse`),
  ADD KEY `droit` (`droit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `droits`
--
ALTER TABLE `droits`
  MODIFY `id_droit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `promesse_dons`
--
ALTER TABLE `promesse_dons`
  MODIFY `id_promesse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `promesse_dons`
--
ALTER TABLE `promesse_dons`
  ADD CONSTRAINT `promesse_dons_ibfk_1` FOREIGN KEY (`droit`) REFERENCES `droits` (`id_droit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
