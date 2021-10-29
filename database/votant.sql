-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 29 oct. 2021 à 18:08
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votant`
--

INSERT INTO `votant` (`IDVOTANT`, `NOM`, `PRENOM`, `EMAIL`, `SEXE`, `CodeVote`) VALUES
(1, 'Assemian', 'Kouammé Junior', 'Juniorassemian7@gmail.com', 'M', '55Voy7');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
