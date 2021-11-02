-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 01 nov. 2021 à 19:57
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `votepco`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidat`
--

DROP TABLE IF EXISTS `candidat`;
CREATE TABLE IF NOT EXISTS `candidat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`id`, `name`, `lastname`, `gender`, `email`, `phone`, `description`, `photo`) VALUES
(2, 'Snow', 'John', 'M', 'candidat@email.com', '+2550707070707', 'Je suis candidat...', 'candidat@email.com_2021110198655.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `votant`
--

DROP TABLE IF EXISTS `votant`;
CREATE TABLE IF NOT EXISTS `votant` (
  `IDVOTANT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(100) NOT NULL,
  `PRENOM` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `SEXE` char(1) NOT NULL,
  `CodeVote` varchar(7) NOT NULL,
  PRIMARY KEY (`IDVOTANT`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votant`
--

INSERT INTO `votant` (`IDVOTANT`, `NOM`, `PRENOM`, `EMAIL`, `SEXE`, `CodeVote`) VALUES
(1, 'Assemian', 'Kouammé Junior', 'Juniorassemian7@gmail.com', 'M', '55Voy7');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
