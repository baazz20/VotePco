-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 02 nov. 2021 à 19:22
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
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` char(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`id`, `name`, `lastname`, `gender`, `email`, `phone`, `description`, `photo`) VALUES
(1, 'Snow', 'John', 'M', 'candidat@email.com', '+2550707070707', 'tesr', 'candidat@email.com_2021110295587.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `est_bani`
--

DROP TABLE IF EXISTS `est_bani`;
CREATE TABLE IF NOT EXISTS `est_bani` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVotant` int(11) NOT NULL,
  `idJure` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idVotant` (`idVotant`),
  KEY `est_bani_ibfk_1` (`idJure`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `est_vote`
--

DROP TABLE IF EXISTS `est_vote`;
CREATE TABLE IF NOT EXISTS `est_vote` (
  `idVote` int(11) NOT NULL AUTO_INCREMENT,
  `idVotant` int(11) NOT NULL,
  `idCandidat` int(11) NOT NULL,
  `dateVote` time(6) NOT NULL,
  PRIMARY KEY (`idVote`),
  KEY `idVotant` (`idVotant`),
  KEY `idCandidat` (`idCandidat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `jure`
--

DROP TABLE IF EXISTS `jure`;
CREATE TABLE IF NOT EXISTS `jure` (
  `IDJURE` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(100) NOT NULL,
  `PRENOM` varchar(100) NOT NULL,
  `GRADE` int(11) NOT NULL,
  PRIMARY KEY (`IDJURE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `est_bani`
--
ALTER TABLE `est_bani`
  ADD CONSTRAINT `est_bani_ibfk_1` FOREIGN KEY (`idJure`) REFERENCES `jure` (`IDJURE`),
  ADD CONSTRAINT `est_bani_ibfk_2` FOREIGN KEY (`idVotant`) REFERENCES `votant` (`IDVOTANT`);

--
-- Contraintes pour la table `est_vote`
--
ALTER TABLE `est_vote`
  ADD CONSTRAINT `est_vote_ibfk_1` FOREIGN KEY (`idVotant`) REFERENCES `votant` (`IDVOTANT`),
  ADD CONSTRAINT `est_vote_ibfk_2` FOREIGN KEY (`idCandidat`) REFERENCES `candidat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
