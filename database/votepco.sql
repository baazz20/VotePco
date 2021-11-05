-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 05 nov. 2021 à 08:52
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
  `theme` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `candidat`
--

INSERT INTO `candidat` (`id`, `name`, `lastname`, `gender`, `email`, `phone`, `description`, `theme`, `photo`) VALUES
(6, 'ASSEMIAN', 'Junior', 'M', 'Juniorassemian7@gmail.com', '+22543963980', '\r\nPlus généralement, les nouveaux étudiants MIAGEISTE arrivent dans les locaux de MIAGE-GI ne savant pas véritablement ce c\'est que MIAGE-GI.\r\nIls sont peu informés et il est récurent que la majorité des étudiants ne savent pas vraiment ce qu\'ils cherchent à MIAGE-GI et pense que c\'est un choix qui c\'est imposé à eux.\r\n\r\nJe vois de ce fait la journée d\'intégration comme étant l\'événement primaire permettant de mieux faire comprendre à ces nouveaux arrivant l\'importance du choix de leur filières. Leur donner le maximum d\'informations sur MIAGE-GI pour qu\'ils comprennent ce qu\'ils sont venus chercher à MIAGE-GI et pour ceux qui ne le savent pas, qu\'ils le fasse dès maintenant. Pour qu\'ils trouve leur place à MIAGE-GI. ', 'Thème : Le MIAGEISTE pendant la formation et après la formation.', 'Juniorassemian7@gmail.com_2021110462157.jpeg'),
(8, 'Tano', 'Velar François', 'M', 'Tanovelar6@gmail.com', '+2250101010101', 'Candidat', 'Thème : Pour une Miage performante et dynamique, quel sont les débouchés de celle-ci et comment s’intégrer ?', 'tanovelar6@gmail.com_20211105 at 031619.jpeg'),
(9, 'BAMBA\r\n', 'Klanan Dossélbétchin', 'M', 'bambadossi@gmail.com', '+2550748382388', 'Un thème qui regroupe les débouchés après la formation y compris l’entrepreneuriat mais aussi les différentes activités qu’on peut mener en tant qu’étudiant de la filière MIAGE-GI pour se créer un revenu.', 'Thème : MIAGE-GI: perspective en cours et en fin de formation', 'bambadossi@gmail.com_20211105032151.jpeg'),
(10, 'Assokpé', 'Jean Morel', 'M', '', '+2250779959455', '', 'Thème : INSERTION DU MIAGISTE ET DU GEISTE : OUVERTURE DANS TOUS LES SECTEURS D\'ACTIVITÉS.', '+2250779959455.jpeg');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jure`
--

INSERT INTO `jure` (`IDJURE`, `NOM`, `PRENOM`, `CodeVote`) VALUES
(2, 'Snow', 'John', '6293Sno'),
(3, 'TIGOLI\r\n', 'Eyhua Ange Fredéric\r\n', '1605TIG'),
(4, 'YAO\r\n', 'N\'goran Eloge\r\n', '4618YAO'),
(5, 'DIENG\r\n', 'Yama Dior\r\n', '1689DIE'),
(6, 'AMADOU \r\n', 'Yohann-Emmanuel Farid\r\n', '2556AMA'),
(7, 'CAMARA\r\n', 'Séaoné\r\n', '9720CAM'),
(8, 'COULIBALY \r\n', 'Tiekoura\r\n', '3303COU');

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `votant`
--

INSERT INTO `votant` (`IDVOTANT`, `NOM`, `PRENOM`, `EMAIL`, `SEXE`, `CodeVote`, `photo`) VALUES
(6, 'Snow', 'John', 'electeur@email.com', 'M', '6293Sno', 'electeur@email.com_2021110378008.'),
(8, 'AKA ', 'Kassi Jean ThÃ©ophile', 'akakassi6@gmail.com', 'M', '3204AKA', 'akakassi6@gmail.com_2021110541633.'),
(9, ' KOFFI', 'Kra Herbert Donatien', 'krakoffi57@gmail.com', 'M', '1790KOF', 'krakoffi57@gmail.com_2021110540425.'),
(10, 'AKA ', 'AKA Jean Ruphin Emmanuel', 'jeanruphinaka228@gmail.com', 'M', '8089AKA', 'jeanruphinaka228@gmail.com_2021110570691.'),
(11, 'AMADOU ', 'Yohann-Emmanuel Farid', 'amadouyohann@yahoo.fr', 'M', '2556AMA', 'amadouyohann@yahoo.fr_2021110519892.'),
(12, 'ANOMA ', 'Sagbrou Mechak MÃ©phiboscheth', 'anomamechak.25@gmail.com', 'M', '4383ANO', 'anomamechak.25@gmail.com_2021110555809.'),
(13, 'ASSEMIAN', 'KouamÃ© Hyacinthe', 'juniorassemian7@gmail.com', 'M', '5749ASS', 'juniorassemian7@gmail.com_2021110583622.'),
(14, 'BAH', 'Abdoulaye', 'Abdoulaye.b1997@gmail.com', 'M', '1652BAH', 'Abdoulaye.b1997@gmail.com_2021110573713.'),
(15, 'BAMBA', 'Klanan DossÃ©lbÃ©tchin', 'bambadossi@gmail.com', 'M', '8386BAM', 'bambadossi@gmail.com_2021110595384.'),
(16, 'CAMARA', 'SÃ©aonÃ©', 'seaonecamara4@gmail.com', 'F', '9720CAM', 'seaonecamara4@gmail.com_2021110518955.'),
(17, 'COULIBALY ', 'Dognimin Conania', 'coulibalyconania@gmail.com', 'M', '1529COU', 'coulibalyconania@gmail.com_2021110542798.'),
(18, 'COULIBALY ', 'Vla Carmine EugÃ¨ne', 'Ecoulibaly11@gmail.com', 'M', '2353COU', 'Ecoulibaly11@gmail.com_2021110569731.'),
(19, 'COULIBALY ', 'Wamien Siompan Jean Emmanuel', 'emmanueljean55@gmail.com', 'M', '1076COU', 'emmanueljean55@gmail.com_2021110586325.'),
(20, 'COULIBALY ', 'Tiekoura', 'herwaxcoulibaly1@gmail.com', 'M', '3303COU', 'herwaxcoulibaly1@gmail.com_2021110523473.'),
(21, 'COULIBALY ', 'GnalÃ©bÃ©gna IsmaÃ«l Yohann', 'yohanncoulibaly17@yahoo.com', 'M', '5570COU', 'yohanncoulibaly17@yahoo.com_2021110518112.'),
(22, 'DALI ', 'Jawly Goli Brice HervÃ©', 'Uchiwaitachiobito@gmail.com', 'M', '7170DAL', 'Uchiwaitachiobito@gmail.com_2021110544971.'),
(23, 'DIABATE', ' Makan EmÃ©ric', 'diabatemakanemeric8@gmail.com', 'M', '7116DIA', 'diabatemakanemeric8@gmail.com_2021110525189.'),
(24, 'DIENG', 'Yama Dior', 'yamadiordieng@gmail.com', 'M', '1689DIE', 'yamadiordieng@gmail.com_2021110560658.'),
(25, 'DIOMANDE ', 'ZingbÃ© Dely-Ange', 'delyange.diomande@gmail.com', 'M', '3148DIO', 'delyange.diomande@gmail.com_202111053668.'),
(26, 'FATAHOU ', 'Azizah Modjirayo Assirou', 'Fatahouazeezat@gmail.com', 'F', '5157FAT', 'Fatahouazeezat@gmail.com_2021110537071.'),
(27, 'FOLBAL ', 'David YissonÃ©', 'folbaldavid@yahoo.fr', 'M', '9418FOL', 'folbaldavid@yahoo.fr_2021110535692.'),
(28, 'GBE ', 'SÃ©kou Justin', 'gbesjah@gmail.com', 'M', '4832GBE', 'gbesjah@gmail.com_2021110539177.'),
(29, 'GODE ', 'Bi GuiÃ© HonorÃ© Ephraim', 'Ephragode5@gmail.com', 'M', '1670GOD', 'Ephragode5@gmail.com_2021110535800.'),
(30, 'GOHI', 'Ange MarlÃ¨ne', 'gohiangemarlene@gmail.com', 'F', '5223GOH', 'gohiangemarlene@gmail.com_2021110563138.'),
(31, 'KABRE', 'Emmanuel', 'donkabreemmanuel@gmail.com', 'M', '3937KAB', 'donkabreemmanuel@gmail.com_2021110573683.'),
(32, 'KADIO ', 'Evrard Emmanuel', 'Kadioemmanuel14@gmail.com', 'M', '5449KAD', 'Kadioemmanuel14@gmail.com_2021110524879.'),
(33, 'KADJO', 'Acquah Dylan', 'Kadjodylan28@gmail.com', 'M', '5253KAD', 'Kadjodylan28@gmail.com_2021110553596.'),
(34, 'KAKOU ', 'Assemian Arnaud', 'arnaudassemian40@gmail.com', 'M', '9841KAK', 'arnaudassemian40@gmail.com_2021110598789.'),
(35, 'KANGA ', 'Tiecoura Kouadio Kpatchibo Wilfried', 'Kangakwilfried@gmail.com', 'M', '9174KAN', 'Kangakwilfried@gmail.com_2021110518181.'),
(36, 'KOFFI ', 'Kouakou Alain Constant', 'alainconstantkoffi8@gmail.com', 'M', '1926KOF', 'alainconstantkoffi8@gmail.com_2021110589406.'),
(37, 'KONAN', 'Aristide Don Marc', 'konantido1@gmail.com', 'M', '6125KON', 'konantido1@gmail.com_2021110542132.'),
(38, 'KONAN ', 'LoÃ¯s NathanaÃ«l', 'Loiskonan3@gmail.com', 'M', '3318KON', 'Loiskonan3@gmail.com_2021110529230.'),
(39, 'KONE', 'Kigbafolo Kiyaly Hamed', 'ahmedkone2001@gmail.com', 'M', '7260KON', 'ahmedkone2001@gmail.com_202111052469.'),
(40, 'KONE', 'Maria', 'kamy342@gmail.com', 'M', '4515KON', 'kamy342@gmail.com_2021110550431.'),
(41, 'KONE ', 'Mohamed', 'vapormax225@gmail.com', 'M', '1438KON', 'vapormax225@gmail.com_2021110575840.'),
(42, 'KOUADIO', 'Kouakou DÃ©sirÃ©', 'ekd04565kouadiodesire120@gmail.com', 'M', '1824KOU', 'ekd04565kouadiodesire120@gmail.com_2021110589868.'),
(43, 'KOUADIO ', 'Mark-Antoine David', 'antoinemark29@gmail.com', 'M', '5566KOU', 'antoinemark29@gmail.com_2021110542316.'),
(44, 'KOUADIO ', 'Messou Ange Patrick', 'kouadiomessouange@gmail.com', 'M', '5689KOU', 'kouadiomessouange@gmail.com_2021110559260.'),
(45, 'KOUAME', 'Boni Ezechiel', 'ezechielkouame57@gmail.com', 'M', '5023KOU', 'ezechielkouame57@gmail.com_2021110579223.'),
(46, 'KOUAO ', 'Cyrus Ariel', 'cyruskouao580@gmail.com', 'M', '6567KOU', 'cyruskouao580@gmail.com_2021110543510.'),
(47, 'KOUASSI ', 'Jean-Emmanuel KouamÃ©', 'ekouassi334@gmail.com', 'M', '1947KOU', 'ekouassi334@gmail.com_2021110513351.'),
(48, 'KOUASSI ', 'Amenan Mariam', 'kouassiamenan200@gmail.com', 'F', '5553KOU', 'kouassiamenan200@gmail.com_2021110586257.'),
(49, 'LALEYE', 'Yann Roger Alexis ', 'raynegr@gmail.com', 'M', '5835LAL', 'raynegr@gmail.com_2021110524029.'),
(50, 'LODIRO', 'Djro Nandjui Pauline Regina Prunelle', 'Prunellelodiro@gmail.com', 'F', '8924LOD', 'Prunellelodiro@gmail.com_2021110534767.'),
(51, 'NGOUAN', 'Adou Derrick', 'ngouandek@gmail.com', 'M', '9788NGO', 'ngouandek@gmail.com_2021110593897.'),
(52, 'NIAMKE ', 'N DÃ©dÃ© Ange Joseph', 'Josephniamke2002@gmail.com', 'M', '9331NIA', 'Josephniamke2002@gmail.com_202111053022.'),
(53, 'OHOLLI', 'Assamoi Kofi Hugues', 'Huguesaime97@gmail.com', 'M', '2796OHO', 'Huguesaime97@gmail.com_2021110593758.'),
(54, 'POE', 'Jean Philippe Arnaud', 'arnaudpoe99@gmail.com', 'M', '7130POE', 'arnaudpoe99@gmail.com_2021110571249.'),
(55, 'SAHORE', 'FrÃ©dÃ©rique Christelle Kimberley', 'Sahorekimberley@yahoo.com', 'F', '2437SAH', 'Sahorekimberley@yahoo.com_2021110540828.'),
(56, 'SAMY', 'By Licalo Jean Leonard', 'Samybilicalo1@gmail.com', 'M', '5544SAM', 'Samybilicalo1@gmail.com_2021110546961.'),
(57, 'SILUE', 'Nanlourou Karim', 'Silue.karim180@gmail.com', 'M', '9188SIL', 'Silue.karim180@gmail.com_2021110561227.'),
(58, 'SORO', 'Katienefowa Ibrahim', 'ibrahimsoro67@gmail.com', 'M', '2241SOR', 'ibrahimsoro67@gmail.com_2021110544794.'),
(59, 'TANO', 'Velar FranÃ§ois', 'Tanovelar6@gmail.com', 'M', '2472TAN', 'Tanovelar6@gmail.com_2021110512775.'),
(60, 'TCHIMOU', 'Cho JosÃ©e Alvine', 'alvinejose0@gmail.com', 'F', '9547TCH', 'alvinejose0@gmail.com_2021110538685.'),
(61, 'TIA', 'N da Demaurelle', 'demaurelletia@gmail.com', 'M', '7417TIA', 'demaurelletia@gmail.com_2021110515047.'),
(62, 'TIGOLI', 'Eyhua Ange FredÃ©ric', 'Tigolifrederic283@gmail.com', 'M', '1605TIG', 'Tigolifrederic283@gmail.com_2021110583319.'),
(63, 'TOURE', 'Katinan', 'katine.toure95@gmail.com', 'M', '2493TOU', 'katine.toure95@gmail.com_2021110598240.'),
(64, 'YAO', 'N goran Eloge', 'yaoeloge@outlook.fr', 'M', '4618YAO', 'yaoeloge@outlook.fr_2021110566104.'),
(65, 'YAOU', 'Othniel Philippe', 'othnielphilippeyaou@gmail.com', 'M', '2017YAO', 'othnielphilippeyaou@gmail.com_202111058628.'),
(66, 'YAO', 'Kan Ferra Maurice', 'Yk5ferra@gmail.com', 'M', '8300YAO', 'Yk5ferra@gmail.com_2021110562442.'),
(67, 'YOBOUE ', 'Henoc', 'yobouehenoc@outlook.fr', 'M', '5336YOB', 'yobouehenoc@outlook.fr_2021110569001.'),
(68, 'ESSIS ', 'Marvin', 'marvinessis9@gmail.com', 'M', '5629ESS', 'marvinessis9@gmail.com_2021110524177.'),
(69, 'KOFFI ', 'Cyl N Guessan Betsaleel', 'cylkoffi@gmail.com', 'M', '5984KOF', 'cylkoffi@gmail.com_2021110527671.');

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
