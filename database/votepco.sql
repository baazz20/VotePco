-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 nov. 2021 à 01:58
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`id`, `name`, `lastname`, `gender`, `email`, `phone`, `description`, `photo`) VALUES
(6, 'ASSEMIAN', 'Junior', 'M', 'Juniorassemian7@gmail.com', '+22543963980', 'Le MIAGEISTE pendant la formation et après la formation.\r\n\r\nPlus généralement, les nouveaux étudiants MIAGEISTE arrivent dans les locaux de MIAGE-GI ne savant pas véritablement ce c\'est que MIAGE-GI.\r\nIls sont peu informés et il est récurent que la majorité des étudiants ne savent pas vraiment ce qu\'ils cherchent à MIAGE-GI et pense que c\'est un choix qui c\'est imposé à eux.\r\n\r\nJe vois de ce fait la journée d\'intégration comme étant l\'événement primaire permettant de mieux faire comprendre à ces nouveaux arrivant l\'importance du choix de leur filières. Leur donner le maximum d\'informations sur MIAGE-GI pour qu\'ils comprennent ce qu\'ils sont venus chercher à MIAGE-GI et pour ceux qui ne le savent pas, qu\'ils le fasse dès maintenant. Pour qu\'ils trouve leur place à MIAGE-GI. ', 'Juniorassemian7@gmail.com_2021110462157.jpeg');

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
  `dateVote` varchar(255) NOT NULL,
  PRIMARY KEY (`idVote`),
  KEY `idVotant` (`idVotant`),
  KEY `idCandidat` (`idCandidat`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `iinfocandidat`
--

DROP TABLE IF EXISTS `iinfocandidat`;
CREATE TABLE IF NOT EXISTS `iinfocandidat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCandidat` int(11) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `idee1` text NOT NULL,
  `idee2` text NOT NULL,
  `idee3` text NOT NULL,
  `idee4` text NOT NULL,
  `photoIlus1` varchar(255) NOT NULL,
  `photoIlus2` varchar(255) NOT NULL,
  `photoIlus3` varchar(255) NOT NULL,
  `photoIlus4` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
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
  `CodeVote` varchar(100) NOT NULL,
  PRIMARY KEY (`IDJURE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jure`
--

INSERT INTO `jure` (`IDJURE`, `NOM`, `PRENOM`, `CodeVote`) VALUES
(2, 'Snow', 'John', '6293Sno');

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
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDVOTANT`),
  KEY `CodeVote` (`CodeVote`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votant`
--

INSERT INTO `votant` (`IDVOTANT`, `NOM`, `PRENOM`, `EMAIL`, `SEXE`, `CodeVote`, `photo`) VALUES
(6, 'Snow', 'John', 'electeur@email.com', 'M', '6293Sno', 'electeur@email.com_2021110378008.'),
(7, 'Snow1', 'John1', 'electeur1@email.com', 'M', '2186Sno', 'electeur1@email.com_2021110549970.jpg');

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

--
-- Contraintes pour la table `iinfocandidat`
--
ALTER TABLE `iinfocandidat`
  ADD CONSTRAINT `idCandidat` FOREIGN KEY (`idCandidat`) REFERENCES `candidat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
