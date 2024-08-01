-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 01 août 2024 à 07:45
-- Version du serveur : 8.0.37
-- Version de PHP : 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dracostore`
--
CREATE DATABASE IF NOT EXISTS `dracostore` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `dracostore`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id_category` int UNSIGNED NOT NULL,
  `category_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `category_name`) VALUES
(1, 'Magique'),
(2, 'Potion'),
(3, 'Arme'),
(4, 'Armure'),
(5, 'Bouclier'),
(6, 'Ingrédient'),
(7, 'Déco'),
(8, 'Services'),
(9, 'Artefact'),
(10, 'Familier'),
(11, 'Vêtement'),
(12, 'Nourriture');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int UNSIGNED NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `lastname`, `firstname`, `email`) VALUES
(1, 'Clients sans compte', '', ''),
(2, 'Rakes', 'Lucrèce', 'erakes1@ovh.net'),
(3, 'Firebrace', 'Maï', 'tfirebrace2@bloglines.com'),
(4, 'Harriday', 'Johnny', 'tharriday3@zimbio.com'),
(5, 'Smitheman', 'Wá', 'msmitheman4@tumblr.com'),
(6, 'Kinton', 'Réjane', 'gkinton5@sun.com'),
(7, 'Lawlee', 'Kuí', 'glawlee6@unicef.org'),
(8, 'Lammenga', 'Ráo', 'elammenga7@cdbaby.com'),
(9, 'Chawkley', 'Lauréna', 'mchawkley8@xinhuanet.com'),
(10, 'Wagon', 'Réjane', 'kwagon9@nytimes.com'),
(11, 'Grayshan', 'Nadège', 'agrayshana@newsvine.com'),
(12, 'Sharvill', 'Gaétane', 'msharvillb@statcounter.com'),
(13, 'Coda', 'Uò', 'pcodac@vistaprint.com'),
(14, 'Egentan', 'Eléa', 'eegentand@shutterfly.com'),
(15, 'Endricci', 'Renée', 'dendriccie@hud.gov'),
(16, 'Whistlecraft', 'Mélanie', 'bwhistlecraftf@ed.gov'),
(17, 'Banasik', 'Séréna', 'wbanasikg@redcross.org'),
(18, 'Pirri', 'Aí', 'rpirrih@ox.ac.uk'),
(19, 'Christiensen', 'Marie-françoise', 'achristienseni@blogger.com'),
(20, 'Roomes', 'Kévina', 'sroomesj@exblog.jp'),
(21, 'Pennington', 'Loïs', 'gpenningtonk@dion.ne.jp'),
(22, 'Gohier', 'Liè', 'ggohierl@apple.com'),
(23, 'Raoult', 'Céline', 'graoultm@arstechnica.com'),
(24, 'Kerswill', 'Maïwenn', 'ckerswilln@miitbeian.gov.cn'),
(25, 'Jayes', 'Alizée', 'cjayeso@ow.ly'),
(26, 'Sooley', 'Håkan', 'isooleyp@ning.com'),
(27, 'Oherlihy', 'André', 'koherlihyq@studiopress.com'),
(28, 'Ashforth', 'Zhì', 'gashforthr@arizona.edu'),
(29, 'Townson', 'Geneviève', 'stownsons@163.com'),
(30, 'Barradell', 'Loïca', 'rbarradellt@pen.io'),
(31, 'Filintsev', 'Fèi', 'wfilintsevu@eepurl.com'),
(32, 'Waddams', 'Aí', 'jwaddamsv@flickr.com'),
(33, 'Keeton', 'Andréa', 'ekeetonw@xrea.com'),
(34, 'Whisson', 'Miléna', 'ewhissonx@cafepress.com'),
(35, 'Hatley', 'Mélinda', 'khatleyy@hexun.com'),
(36, 'Truwert', 'Magdalène', 'atruwertz@google.com'),
(37, 'Christon', 'Géraldine', 'mchriston10@marketwatch.com'),
(38, 'Dryden', 'Régine', 'sdryden11@usnews.com'),
(39, 'Palay', 'Bérangère', 'hpalay12@elegantthemes.com'),
(40, 'Vennings', 'Séréna', 'uvennings13@sitemeter.com'),
(41, 'Donohoe', 'Régine', 'cdonohoe14@ning.com'),
(42, 'Pabst', 'André', 'jpabst15@paginegialle.it'),
(43, 'Kinny', 'Rachèle', 'kkinny16@bloglines.com'),
(44, 'Kaindl', 'Aí', 'skaindl17@pen.io'),
(45, 'Ferro', 'Océane', 'pferro18@hibu.com'),
(46, 'Ivy', 'Göran', 'kivy19@google.com.hk'),
(47, 'Wareing', 'Marlène', 'pwareing1a@aboutads.info'),
(48, 'Grey', 'Måns', 'cgrey1b@apple.com'),
(49, 'Bonanno', 'Annotée', 'lbonanno1c@walmart.com'),
(50, 'Cuolahan', 'Maëlann', 'jcuolahan1d@usgs.gov'),
(51, 'Beadnell', 'Personnalisée', 'pbeadnell1e@wunderground.com'),
(52, 'Willgoss', 'Bérénice', 'mwillgoss1f@google.com.br'),
(53, 'Stiller', 'Maïlys', 'wstiller1g@time.com'),
(54, 'Alejandri', 'Lucrèce', 'dalejandri1h@theguardian.com'),
(55, 'Dagg', 'Célestine', 'ndagg1i@zimbio.com'),
(56, 'Sudworth', 'Illustrée', 'vsudworth1j@shop-pro.jp'),
(57, 'Mix', 'Uò', 'mmix1k@msu.edu'),
(58, 'Pearson', 'Lóng', 'lpearson1l@gmpg.org'),
(59, 'Roberti', 'Maëlyss', 'rroberti1m@pcworld.com'),
(60, 'Blann', 'Maëly', 'rblann1n@netscape.com'),
(61, 'Abbot', 'Réjane', 'habbot1o@oaic.gov.au'),
(62, 'Ronaldson', 'Mélina', 'kronaldson1p@sourceforge.net'),
(63, 'Pallant', 'Naéva', 'npallant1q@newsvine.com'),
(64, 'Ellwood', 'Marylène', 'jellwood1r@pbs.org'),
(65, 'Chapelhow', 'Angèle', 'echapelhow1s@nymag.com'),
(66, 'Sellan', 'Célestine', 'rsellan1t@fastcompany.com'),
(67, 'Trowle', 'Gaëlle', 'ktrowle1u@booking.com'),
(68, 'Raisbeck', 'Mén', 'mraisbeck1v@infoseek.co.jp'),
(69, 'O\'Sherin', 'Publicité', 'oosherin1w@domainmarket.com'),
(70, 'Daniells', 'Kù', 'zdaniells1x@storify.com'),
(71, 'Hairsnape', 'Publicité', 'khairsnape1y@earthlink.net'),
(72, 'Tofano', 'Léone', 'ctofano1z@eepurl.com'),
(73, 'Lygo', 'Dà', 'hlygo20@domainmarket.com'),
(74, 'Rosenwasser', 'Fèi', 'prosenwasser21@house.gov'),
(75, 'Santora', 'Geneviève', 'tsantora22@jalbum.net'),
(76, 'Zapata', 'Simplifiés', 'nzapata23@ow.ly'),
(77, 'Lattin', 'Göran', 'tlattin24@gravatar.com'),
(78, 'Guyonneau', 'Björn', 'sguyonneau25@canalblog.com'),
(79, 'Loynes', 'André', 'hloynes26@senate.gov'),
(80, 'Damsell', 'Daphnée', 'fdamsell27@dyndns.org'),
(81, 'Casoni', 'Marie-thérèse', 'tcasoni28@liveinternet.ru'),
(82, 'Muzzi', 'Mélia', 'nmuzzi29@tripod.com'),
(83, 'Culp', 'Séverine', 'wculp2a@noaa.gov'),
(84, 'Barras', 'Björn', 'tbarras2b@aboutads.info'),
(85, 'Foulis', 'Dorothée', 'lfoulis2c@vistaprint.com'),
(86, 'Leinweber', 'Chloé', 'bleinweber2d@dedecms.com'),
(87, 'Messenger', 'Crééz', 'fmessenger2e@meetup.com'),
(88, 'McBlain', 'Dafnée', 'gmcblain2f@jugem.jp'),
(89, 'Erskin', 'Lài', 'serskin2g@com.com'),
(90, 'Tran', 'Kévina', 'jtran2h@mysql.com'),
(91, 'Lideard', 'Eléa', 'wlideard2i@jalbum.net'),
(92, 'MacCawley', 'Céline', 'gmaccawley2j@opensource.org'),
(93, 'Nuschke', 'Göran', 'mnuschke2k@sitemeter.com'),
(94, 'Darrow', 'Lèi', 'zdarrow2l@geocities.com'),
(95, 'Ida', 'Lài', 'mida2m@nasa.gov'),
(96, 'Middiff', 'Tú', 'umiddiff2n@oaic.gov.au'),
(97, 'Petera', 'Léonore', 'epetera2o@ebay.co.uk'),
(98, 'Greenroyd', 'Bécassine', 'cgreenroyd2p@addtoany.com'),
(99, 'Overstall', 'Sòng', 'boverstall2q@skyrock.com'),
(100, 'Johannesson', 'Méline', 'ejohannesson2r@ftc.gov'),
(101, 'Chatwood', 'Andrée', 'uchatwood2s@squidoo.com'),
(102, 'Matthis', 'Camélia', 'smatthis2t@google.nl'),
(103, 'Brawley', 'Camélia', 'tbrawley2u@amazonaws.com'),
(104, 'Fowler', 'Andréa', 'kfowler2v@amazon.co.uk'),
(105, 'Aked', 'Anaëlle', 'gaked2w@de.vu'),
(106, 'Kenderdine', 'Clémence', 'ckenderdine2x@gravatar.com'),
(107, 'Cessford', 'Marlène', 'mcessford2y@gmpg.org'),
(108, 'Keatley', 'Yáo', 'jkeatley2z@fda.gov'),
(109, 'Drakers', 'Eliès', 'gdrakers30@hugedomains.com'),
(110, 'Stribling', 'Frédérique', 'mstribling31@digg.com'),
(111, 'Kynston', 'Dafnée', 'vkynston32@gravatar.com'),
(112, 'Sharrock', 'Magdalène', 'csharrock33@cocolog-nifty.com'),
(113, 'Mugford', 'Táng', 'cmugford34@reddit.com'),
(114, 'Childes', 'Yú', 'wchildes35@bigcartel.com'),
(115, 'Stathor', 'Intéressant', 'mstathor36@apple.com'),
(116, 'Marchington', 'Maïlis', 'mmarchington37@unblog.fr'),
(117, 'Kean', 'Anaïs', 'wkean38@acquirethisname.com'),
(118, 'Dignan', 'Estève', 'sdignan39@cbc.ca'),
(119, 'Eloy', 'Nélie', 'beloy3a@psu.edu'),
(120, 'Yablsley', 'Maëly', 'nyablsley3b@paypal.com'),
(121, 'Swarbrigg', 'Vénus', 'kswarbrigg3c@last.fm'),
(122, 'Sambrok', 'Kallisté', 'asambrok3d@seesaa.net'),
(123, 'Swenson', 'Naéva', 'rswenson3e@ebay.com'),
(124, 'Ferraro', 'Kù', 'bferraro3f@spotify.com'),
(125, 'Ixor', 'Mélanie', 'mixor3g@scientificamerican.com'),
(126, 'Morris', 'Maëly', 'bmorris3h@arizona.edu'),
(127, 'Henderson', 'Amélie', 'hhenderson3i@bbc.co.uk'),
(128, 'Rapps', 'Lài', 'krapps3j@umich.edu'),
(129, 'Shilstone', 'Médiamass', 'dshilstone3k@163.com'),
(130, 'Delve', 'Françoise', 'bdelve3l@odnoklassniki.ru'),
(131, 'Yakubovich', 'Börje', 'cyakubovich3m@reverbnation.com'),
(132, 'Wraith', 'Fèi', 'ewraith3n@github.io'),
(133, 'Nawton', 'Mårten', 'mnawton3o@netvibes.com'),
(134, 'Westberg', 'Léonie', 'mwestberg3p@hao123.com'),
(135, 'Gerckens', 'Léone', 'dgerckens3q@google.de'),
(136, 'Jeannon', 'Eugénie', 'ijeannon3r@twitpic.com'),
(137, 'Rubinivitz', 'Thérèsa', 'arubinivitz3s@google.co.uk'),
(138, 'Christensen', 'Anaël', 'achristensen3t@eventbrite.com'),
(139, 'Imms', 'Léana', 'dimms3u@creativecommons.org'),
(140, 'Buckeridge', 'Béatrice', 'nbuckeridge3v@t.co'),
(141, 'Berridge', 'Marylène', 'lberridge3w@list-manage.com'),
(142, 'Dunphy', 'Zoé', 'adunphy3x@cocolog-nifty.com'),
(143, 'Heistermann', 'Maïwenn', 'mheistermann3y@cpanel.net'),
(144, 'Kuhndel', 'Ruì', 'jkuhndel3z@ebay.com'),
(145, 'Reisenberg', 'Dà', 'kreisenberg40@paypal.com'),
(146, 'Bemment', 'Lèi', 'tbemment41@ustream.tv'),
(147, 'Hauck', 'Cécilia', 'uhauck42@reuters.com'),
(148, 'Haslegrave', 'Yóu', 'ahaslegrave43@ucsd.edu'),
(149, 'Durdle', 'Laïla', 'ddurdle44@plala.or.jp'),
(150, 'Smales', 'Crééz', 'msmales45@utexas.edu'),
(151, 'Nugent', 'Alizée', 'dnugent46@vinaora.com'),
(152, 'Dunlop', 'Méng', 'sdunlop47@archive.org'),
(153, 'Blonden', 'Edmée', 'fblonden48@e-recht24.de'),
(154, 'Moncreiffe', 'Östen', 'amoncreiffe49@redcross.org'),
(155, 'Counter', 'Táng', 'ccounter4a@nytimes.com'),
(156, 'Hagston', 'Gaétane', 'ahagston4b@reuters.com'),
(157, 'Vinden', 'Torbjörn', 'kvinden4c@163.com'),
(158, 'Hayman', 'Judicaël', 'dhayman4d@simplemachines.org'),
(159, 'Columbine', 'Bérénice', 'rcolumbine4e@blogger.com'),
(160, 'Mattingley', 'Ophélie', 'lmattingley4f@tiny.cc'),
(161, 'Dumper', 'Maéna', 'adumper4g@eepurl.com'),
(162, 'Laverock', 'Célia', 'glaverock4h@hud.gov'),
(163, 'Housby', 'Styrbjörn', 'rhousby4i@skyrock.com'),
(164, 'Castri', 'Maëlle', 'ocastri4j@skyrock.com'),
(165, 'Leger', 'Cléa', 'rleger4k@zdnet.com'),
(166, 'Burchnall', 'Léane', 'hburchnall4l@shinystat.com'),
(167, 'Brosnan', 'Lèi', 'jbrosnan4m@cdc.gov'),
(168, 'Churchlow', 'Geneviève', 'dchurchlow4n@geocities.jp'),
(169, 'Lesor', 'Laïla', 'vlesor4o@devhub.com'),
(170, 'Huglin', 'Ruò', 'dhuglin4p@hatena.ne.jp'),
(171, 'Knaggs', 'Liè', 'bknaggs4q@mediafire.com'),
(172, 'Perigoe', 'Marie-noël', 'kperigoe4r@adobe.com'),
(173, 'O\'Devey', 'Méng', 'codevey4s@google.co.jp'),
(174, 'Fransinelli', 'Inès', 'dfransinelli4t@myspace.com'),
(175, 'Dockwra', 'Estée', 'udockwra4u@theatlantic.com'),
(176, 'Hadley', 'Åke', 'rhadley4v@oracle.com'),
(177, 'Bosket', 'Yáo', 'rbosket4w@artisteer.com'),
(178, 'Aitchinson', 'Inès', 'kaitchinson4x@artisteer.com'),
(179, 'Petrie', 'Gaïa', 'cpetrie4y@youtube.com'),
(180, 'Alcido', 'Françoise', 'ralcido4z@netlog.com'),
(181, 'Gammill', 'Maïwenn', 'ngammill50@people.com.cn'),
(182, 'Chatband', 'Néhémie', 'mchatband51@de.vu'),
(183, 'Dohmann', 'Maïlys', 'cdohmann52@discuz.net'),
(184, 'Sebring', 'Méthode', 'dsebring53@narod.ru'),
(185, 'Mangon', 'Pélagie', 'wmangon54@1und1.de'),
(186, 'Enticott', 'Personnalisée', 'nenticott55@cmu.edu'),
(187, 'Wain', 'Solène', 'twain56@bloglines.com'),
(188, 'Larvent', 'Gaïa', 'clarvent57@rakuten.co.jp'),
(189, 'McAuliffe', 'Cléa', 'vmcauliffe58@sciencedirect.com'),
(190, 'Breewood', 'Gaétane', 'cbreewood59@mac.com'),
(191, 'Jentet', 'Nadège', 'rjentet5a@theatlantic.com'),
(192, 'Bram', 'Béatrice', 'ebram5b@fotki.com'),
(193, 'Lober', 'Lóng', 'klober5c@cisco.com'),
(194, 'Pesek', 'Styrbjörn', 'npesek5d@china.com.cn'),
(195, 'Wones', 'Torbjörn', 'awones5e@timesonline.co.uk'),
(196, 'Wase', 'Andréanne', 'cwase5f@prnewswire.com'),
(197, 'Peyto', 'Lèi', 'speyto5g@webeden.co.uk'),
(198, 'Rake', 'Thérèsa', 'zrake5h@baidu.com'),
(199, 'Roughsedge', 'Maëlyss', 'groughsedge5i@stanford.edu'),
(200, 'Bernaldez', 'Maïlys', 'ubernaldez5j@slashdot.org'),
(201, 'Bernardelli', 'Célia', 'gbernardelli5k@huffingtonpost.com'),
(202, 'Velte', 'Örjan', 'rvelte5l@about.com'),
(203, 'Denekamp', 'Léone', 'tdenekamp5m@java.com'),
(204, 'Yetts', 'Dafnée', 'cyetts5n@fc2.com'),
(205, 'McCollum', 'Kévina', 'hmccollum5o@utexas.edu'),
(206, 'Rzehorz', 'Stéphanie', 'drzehorz5p@shutterfly.com'),
(207, 'Rimmer', 'Bécassine', 'brimmer5q@123-reg.co.uk'),
(208, 'Spittall', 'Sòng', 'kspittall5r@admin.ch'),
(209, 'McCulley', 'Séréna', 'omcculley5s@yolasite.com'),
(210, 'Smalman', 'Bécassine', 'esmalman5t@skyrock.com'),
(211, 'Petticrew', 'Liè', 'jpetticrew5u@clickbank.net'),
(212, 'McGurgan', 'Cléopatre', 'lmcgurgan5v@studiopress.com'),
(213, 'Ewert', 'Dà', 'eewert5w@umn.edu'),
(214, 'Farrow', 'Yáo', 'ofarrow5x@admin.ch'),
(215, 'Colebourne', 'Hélène', 'pcolebourne5y@reddit.com'),
(216, 'Buttery', 'Pélagie', 'ebuttery5z@51.la'),
(217, 'McUre', 'Frédérique', 'gmcure60@cocolog-nifty.com'),
(218, 'Clampe', 'Andréanne', 'hclampe61@cbslocal.com'),
(219, 'Richardt', 'Eugénie', 'prichardt62@economist.com'),
(220, 'Neame', 'Pénélope', 'rneame63@hexun.com'),
(221, 'Aspden', 'Valérie', 'gaspden64@elpais.com'),
(222, 'Phear', 'Gaétane', 'jphear65@spiegel.de'),
(223, 'Thirst', 'Estève', 'cthirst66@icio.us'),
(224, 'Spino', 'Magdalène', 'gspino67@csmonitor.com'),
(225, 'Obispo', 'Chloé', 'eobispo68@facebook.com'),
(226, 'Brittin', 'Geneviève', 'dbrittin69@joomla.org'),
(227, 'Meadowcroft', 'Béatrice', 'gmeadowcroft6a@dmoz.org'),
(228, 'Guilloud', 'Styrbjörn', 'eguilloud6b@phpbb.com'),
(229, 'Braznell', 'Angélique', 'sbraznell6c@arstechnica.com'),
(230, 'Vanderson', 'Maëline', 'jvanderson6d@delicious.com'),
(231, 'Grahl', 'Marie-thérèse', 'mgrahl6e@hc360.com'),
(232, 'Woodyatt', 'Anaël', 'jwoodyatt6f@amazon.de'),
(233, 'Yanshonok', 'Lorène', 'tyanshonok6g@weather.com'),
(234, 'Randerson', 'Clélia', 'nranderson6h@hatena.ne.jp'),
(235, 'Longstreet', 'Ruò', 'mlongstreet6i@icq.com'),
(236, 'Damiral', 'Alizée', 'edamiral6j@reverbnation.com'),
(237, 'Beeho', 'Ruì', 'rbeeho6k@bizjournals.com'),
(238, 'Peterffy', 'Personnalisée', 'tpeterffy6l@jigsy.com'),
(239, 'Goathrop', 'Hélèna', 'hgoathrop6m@networkadvertising.org'),
(240, 'Manthorpe', 'Gaïa', 'imanthorpe6n@timesonline.co.uk'),
(241, 'Bellee', 'Anaé', 'bbellee6o@multiply.com'),
(242, 'Keenleyside', 'Naëlle', 'rkeenleyside6p@state.tx.us'),
(243, 'Castiglioni', 'Miléna', 'lcastiglioni6q@myspace.com'),
(244, 'Stollenbeck', 'Anaëlle', 'jstollenbeck6r@cnn.com'),
(245, 'Jardin', 'Cinéma', 'djardin6s@moonfruit.com'),
(246, 'Ferronel', 'Åsa', 'jferronel6t@pbs.org'),
(247, 'Ackroyd', 'Clémentine', 'mackroyd6u@discovery.com'),
(248, 'Rumford', 'Lauréna', 'crumford6v@godaddy.com'),
(249, 'Uc', 'Vérane', 'kuc6w@smh.com.au'),
(250, 'Caulder', 'Léa', 'dcaulder6x@wordpress.org');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id_product` int UNSIGNED NOT NULL,
  `stock` int NOT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  `price` decimal(15,1) NOT NULL,
  `id_tax` int UNSIGNED NOT NULL DEFAULT '1',
  `id_category` int UNSIGNED DEFAULT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id_product`, `stock`, `product_name`, `price`, `id_tax`, `id_category`, `image_url`) VALUES
(13, 12, 'Porte-Clé Gourdin', 11.1, 1, 7, 'img/gourdin.webp'),
(14, 42, 'Slip Elfique', 0.3, 1, 11, 'img/slip-pour-david.webp'),
(15, 7, 'Potion de visibilité', 1.0, 1, 2, 'img/potion-visibilite.webp'),
(16, 49, 'Bile de Goule', 1.5, 1, 6, 'img/bile-goule.webp'),
(17, 2, 'Épée émoussée', 32.3, 1, 3, 'img/epee.webp'),
(18, 15, 'Bouclier Biscuit', 25.5, 1, 5, 'img/shield-biscuit.webp'),
(19, 8, 'Gallinule de compagnie', 8.0, 1, 10, 'img/gallinule.webp'),
(20, 11, 'Gnôle Allume-Dragon', 1.5, 1, 12, 'img/gnole.webp'),
(21, 4, 'Élixir de Vie', 16.2, 1, 2, 'img/elixir-vie.webp'),
(22, 78, 'Parchemin de Boule de Feu', 2.3, 1, 1, 'img/scroll.webp'),
(23, 1, 'Amulette de résurrection', 122.0, 1, 9, 'img/amulette.webp'),
(24, 51, 'Photo dédicacée de Sieur David le Hardi', 81.3, 1, 9, 'img/lord-david.webp');

-- --------------------------------------------------------

--
-- Structure de la table `reward`
--

CREATE TABLE `reward` (
  `id_reward` int UNSIGNED NOT NULL,
  `reward_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reward`
--

INSERT INTO `reward` (`id_reward`, `reward_name`) VALUES
(1, 'Porte-clés à tête vaudou');

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id_product` int UNSIGNED NOT NULL,
  `id_ticket` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`id_product`, `id_ticket`, `quantity`) VALUES
(13, 238, 5),
(14, 276, 5),
(15, 923, 10),
(16, 729, 1),
(17, 974, 7),
(18, 413, 4),
(19, 43, 10),
(20, 394, 7),
(21, 287, 6),
(22, 210, 6),
(23, 325, 1),
(24, 173, 9);

-- --------------------------------------------------------

--
-- Structure de la table `seller`
--

CREATE TABLE `seller` (
  `id_seller` int UNSIGNED NOT NULL,
  `seller_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `seller`
--

INSERT INTO `seller` (`id_seller`, `seller_name`, `password`) VALUES
(1, 'Alaric Stormbringer', '$2y$10$2eT3YVqqEMMvhn0Lkc00EuCcBGt3JXOvx/q/YsyRdxzi/LSKrQ/Ya');

-- --------------------------------------------------------

--
-- Structure de la table `tax`
--

CREATE TABLE `tax` (
  `id_tax` int UNSIGNED NOT NULL,
  `percentage` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `tax`
--

INSERT INTO `tax` (`id_tax`, `percentage`) VALUES
(1, 13);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int UNSIGNED NOT NULL,
  `ticket_date` datetime NOT NULL,
  `id_seller` int UNSIGNED NOT NULL DEFAULT '1',
  `id_reward` int UNSIGNED NOT NULL DEFAULT '1',
  `id_client` int UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `ticket_date`, `id_seller`, `id_reward`, `id_client`) VALUES
(1, '2022-11-10 00:00:00', 1, 1, 49),
(2, '2016-04-11 00:00:00', 1, 1, 219),
(3, '2016-01-26 00:00:00', 1, 1, 140),
(4, '2020-03-27 00:00:00', 1, 1, 74),
(5, '2019-06-28 00:00:00', 1, 1, 179),
(6, '2017-11-25 00:00:00', 1, 1, 224),
(7, '2020-07-18 00:00:00', 1, 1, 21),
(8, '2017-08-14 00:00:00', 1, 1, 140),
(9, '2018-02-11 00:00:00', 1, 1, 151),
(10, '2018-03-02 00:00:00', 1, 1, 85),
(11, '2019-03-26 00:00:00', 1, 1, 60),
(12, '2022-06-08 00:00:00', 1, 1, 225),
(13, '2018-03-12 00:00:00', 1, 1, 105),
(14, '2020-10-19 00:00:00', 1, 1, 101),
(15, '2016-01-12 00:00:00', 1, 1, 79),
(16, '2016-02-02 00:00:00', 1, 1, 236),
(17, '2015-09-29 00:00:00', 1, 1, 217),
(18, '2015-07-16 00:00:00', 1, 1, 168),
(19, '2021-02-17 00:00:00', 1, 1, 194),
(20, '2017-05-30 00:00:00', 1, 1, 111),
(21, '2015-12-31 00:00:00', 1, 1, 104),
(22, '2016-07-31 00:00:00', 1, 1, 24),
(23, '2021-02-25 00:00:00', 1, 1, 179),
(24, '2024-02-20 00:00:00', 1, 1, 205),
(25, '2016-08-24 00:00:00', 1, 1, 162),
(26, '2022-11-05 00:00:00', 1, 1, 63),
(27, '2016-11-08 00:00:00', 1, 1, 229),
(28, '2020-10-11 00:00:00', 1, 1, 108),
(29, '2021-05-25 00:00:00', 1, 1, 162),
(30, '2016-07-02 00:00:00', 1, 1, 244),
(31, '2018-11-03 00:00:00', 1, 1, 94),
(32, '2017-01-18 00:00:00', 1, 1, 177),
(33, '2018-05-05 00:00:00', 1, 1, 36),
(34, '2022-07-04 00:00:00', 1, 1, 5),
(35, '2020-02-02 00:00:00', 1, 1, 171),
(36, '2022-04-29 00:00:00', 1, 1, 99),
(37, '2019-08-11 00:00:00', 1, 1, 78),
(38, '2022-09-21 00:00:00', 1, 1, 201),
(39, '2021-04-21 00:00:00', 1, 1, 85),
(40, '2017-12-17 00:00:00', 1, 1, 117),
(41, '2017-02-22 00:00:00', 1, 1, 101),
(42, '2017-05-30 00:00:00', 1, 1, 108),
(43, '2015-06-16 00:00:00', 1, 1, 79),
(44, '2021-05-05 00:00:00', 1, 1, 203),
(45, '2021-04-18 00:00:00', 1, 1, 244),
(46, '2018-04-17 00:00:00', 1, 1, 96),
(47, '2019-06-25 00:00:00', 1, 1, 202),
(48, '2020-05-21 00:00:00', 1, 1, 116),
(49, '2020-06-24 00:00:00', 1, 1, 135),
(50, '2023-06-02 00:00:00', 1, 1, 159),
(51, '2021-02-15 00:00:00', 1, 1, 48),
(52, '2019-05-04 00:00:00', 1, 1, 51),
(53, '2022-06-17 00:00:00', 1, 1, 249),
(54, '2015-08-13 00:00:00', 1, 1, 66),
(55, '2019-09-13 00:00:00', 1, 1, 5),
(56, '2023-10-21 00:00:00', 1, 1, 182),
(57, '2019-11-18 00:00:00', 1, 1, 6),
(58, '2018-05-21 00:00:00', 1, 1, 179),
(59, '2016-08-27 00:00:00', 1, 1, 165),
(60, '2020-08-27 00:00:00', 1, 1, 183),
(61, '2023-06-12 00:00:00', 1, 1, 59),
(62, '2018-12-23 00:00:00', 1, 1, 94),
(63, '2023-01-18 00:00:00', 1, 1, 130),
(64, '2016-04-30 00:00:00', 1, 1, 16),
(65, '2022-01-22 00:00:00', 1, 1, 99),
(66, '2015-09-20 00:00:00', 1, 1, 143),
(67, '2019-07-03 00:00:00', 1, 1, 157),
(68, '2022-01-17 00:00:00', 1, 1, 102),
(69, '2021-03-07 00:00:00', 1, 1, 184),
(70, '2022-06-15 00:00:00', 1, 1, 130),
(71, '2017-04-24 00:00:00', 1, 1, 156),
(72, '2022-10-22 00:00:00', 1, 1, 141),
(73, '2018-04-23 00:00:00', 1, 1, 117),
(74, '2019-04-02 00:00:00', 1, 1, 205),
(75, '2024-03-14 00:00:00', 1, 1, 243),
(76, '2023-01-27 00:00:00', 1, 1, 67),
(77, '2022-03-12 00:00:00', 1, 1, 86),
(78, '2016-01-18 00:00:00', 1, 1, 51),
(79, '2022-03-05 00:00:00', 1, 1, 109),
(80, '2015-09-19 00:00:00', 1, 1, 211),
(81, '2018-09-28 00:00:00', 1, 1, 48),
(82, '2023-07-16 00:00:00', 1, 1, 143),
(83, '2021-02-05 00:00:00', 1, 1, 104),
(84, '2022-03-13 00:00:00', 1, 1, 57),
(85, '2021-11-08 00:00:00', 1, 1, 199),
(86, '2018-02-10 00:00:00', 1, 1, 13),
(87, '2017-12-11 00:00:00', 1, 1, 13),
(88, '2018-06-09 00:00:00', 1, 1, 96),
(89, '2023-07-13 00:00:00', 1, 1, 77),
(90, '2019-08-06 00:00:00', 1, 1, 108),
(91, '2019-12-19 00:00:00', 1, 1, 198),
(92, '2020-05-06 00:00:00', 1, 1, 34),
(93, '2016-01-02 00:00:00', 1, 1, 167),
(94, '2017-05-13 00:00:00', 1, 1, 229),
(95, '2023-10-14 00:00:00', 1, 1, 42),
(96, '2021-10-29 00:00:00', 1, 1, 232),
(97, '2016-10-20 00:00:00', 1, 1, 6),
(98, '2018-12-11 00:00:00', 1, 1, 65),
(99, '2023-08-27 00:00:00', 1, 1, 38),
(100, '2016-07-12 00:00:00', 1, 1, 171),
(101, '2022-03-24 00:00:00', 1, 1, 219),
(102, '2024-05-13 00:00:00', 1, 1, 39),
(103, '2015-11-15 00:00:00', 1, 1, 242),
(104, '2017-08-13 00:00:00', 1, 1, 215),
(105, '2019-04-21 00:00:00', 1, 1, 60),
(106, '2019-08-17 00:00:00', 1, 1, 144),
(107, '2019-09-27 00:00:00', 1, 1, 70),
(108, '2018-07-16 00:00:00', 1, 1, 56),
(109, '2023-07-28 00:00:00', 1, 1, 114),
(110, '2015-09-25 00:00:00', 1, 1, 140),
(111, '2024-04-09 00:00:00', 1, 1, 90),
(112, '2024-06-17 00:00:00', 1, 1, 113),
(113, '2015-11-27 00:00:00', 1, 1, 238),
(114, '2020-09-28 00:00:00', 1, 1, 209),
(115, '2018-09-16 00:00:00', 1, 1, 250),
(116, '2017-01-31 00:00:00', 1, 1, 217),
(117, '2022-10-17 00:00:00', 1, 1, 212),
(118, '2017-10-09 00:00:00', 1, 1, 42),
(119, '2021-07-08 00:00:00', 1, 1, 123),
(120, '2017-04-24 00:00:00', 1, 1, 216),
(121, '2016-05-02 00:00:00', 1, 1, 129),
(122, '2016-08-22 00:00:00', 1, 1, 14),
(123, '2019-06-26 00:00:00', 1, 1, 98),
(124, '2016-09-20 00:00:00', 1, 1, 84),
(125, '2021-12-17 00:00:00', 1, 1, 160),
(126, '2022-10-30 00:00:00', 1, 1, 194),
(127, '2023-04-12 00:00:00', 1, 1, 207),
(128, '2023-01-17 00:00:00', 1, 1, 181),
(129, '2023-02-15 00:00:00', 1, 1, 171),
(130, '2021-03-15 00:00:00', 1, 1, 164),
(131, '2021-02-15 00:00:00', 1, 1, 124),
(132, '2020-02-26 00:00:00', 1, 1, 121),
(133, '2018-03-15 00:00:00', 1, 1, 133),
(134, '2023-09-19 00:00:00', 1, 1, 135),
(135, '2018-12-30 00:00:00', 1, 1, 84),
(136, '2016-03-11 00:00:00', 1, 1, 79),
(137, '2019-01-11 00:00:00', 1, 1, 50),
(138, '2023-09-18 00:00:00', 1, 1, 135),
(139, '2023-11-10 00:00:00', 1, 1, 206),
(140, '2018-09-07 00:00:00', 1, 1, 18),
(141, '2018-05-16 00:00:00', 1, 1, 248),
(142, '2017-03-29 00:00:00', 1, 1, 122),
(143, '2015-11-01 00:00:00', 1, 1, 32),
(144, '2019-03-31 00:00:00', 1, 1, 7),
(145, '2022-07-30 00:00:00', 1, 1, 79),
(146, '2015-08-24 00:00:00', 1, 1, 218),
(147, '2020-11-22 00:00:00', 1, 1, 244),
(148, '2017-08-27 00:00:00', 1, 1, 211),
(149, '2023-12-14 00:00:00', 1, 1, 217),
(150, '2015-12-09 00:00:00', 1, 1, 193),
(151, '2019-01-24 00:00:00', 1, 1, 20),
(152, '2022-08-29 00:00:00', 1, 1, 33),
(153, '2023-03-10 00:00:00', 1, 1, 225),
(154, '2015-09-14 00:00:00', 1, 1, 3),
(155, '2022-01-27 00:00:00', 1, 1, 107),
(156, '2023-03-06 00:00:00', 1, 1, 111),
(157, '2021-02-23 00:00:00', 1, 1, 148),
(158, '2015-12-24 00:00:00', 1, 1, 72),
(159, '2015-09-10 00:00:00', 1, 1, 187),
(160, '2017-08-15 00:00:00', 1, 1, 131),
(161, '2023-08-24 00:00:00', 1, 1, 186),
(162, '2023-12-01 00:00:00', 1, 1, 195),
(163, '2020-07-01 00:00:00', 1, 1, 76),
(164, '2020-04-28 00:00:00', 1, 1, 71),
(165, '2015-08-14 00:00:00', 1, 1, 206),
(166, '2022-03-14 00:00:00', 1, 1, 218),
(167, '2021-07-13 00:00:00', 1, 1, 248),
(168, '2021-03-31 00:00:00', 1, 1, 100),
(169, '2017-08-03 00:00:00', 1, 1, 233),
(170, '2020-05-16 00:00:00', 1, 1, 39),
(171, '2018-10-07 00:00:00', 1, 1, 250),
(172, '2019-04-03 00:00:00', 1, 1, 107),
(173, '2019-05-16 00:00:00', 1, 1, 65),
(174, '2020-01-02 00:00:00', 1, 1, 46),
(175, '2022-12-07 00:00:00', 1, 1, 248),
(176, '2017-10-23 00:00:00', 1, 1, 11),
(177, '2020-06-03 00:00:00', 1, 1, 71),
(178, '2024-05-16 00:00:00', 1, 1, 32),
(179, '2015-12-19 00:00:00', 1, 1, 221),
(180, '2021-03-17 00:00:00', 1, 1, 209),
(181, '2016-05-20 00:00:00', 1, 1, 79),
(182, '2018-01-06 00:00:00', 1, 1, 169),
(183, '2020-12-27 00:00:00', 1, 1, 104),
(184, '2019-10-28 00:00:00', 1, 1, 241),
(185, '2018-05-19 00:00:00', 1, 1, 59),
(186, '2016-08-24 00:00:00', 1, 1, 162),


-- --------------------------------------------------------

--
-- Structure de la table `update_price`
--

CREATE TABLE `update_price` (
  `id_update_price` int UNSIGNED NOT NULL,
  `date_` date NOT NULL,
  `new_price` decimal(15,1) NOT NULL,
  `id_product` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_tax` (`id_tax`),
  ADD KEY `id_category` (`id_category`);

--
-- Index pour la table `reward`
--
ALTER TABLE `reward`
  ADD PRIMARY KEY (`id_reward`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_product`,`id_ticket`),
  ADD KEY `id_ticket` (`id_ticket`);

--
-- Index pour la table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id_seller`),
  ADD UNIQUE KEY `seller_name` (`seller_name`);

--
-- Index pour la table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id_tax`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_users` (`id_seller`),
  ADD KEY `id_reward` (`id_reward`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `update_price`
--
ALTER TABLE `update_price`
  ADD PRIMARY KEY (`id_update_price`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `reward`
--
ALTER TABLE `reward`
  MODIFY `id_reward` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `seller`
--
ALTER TABLE `seller`
  MODIFY `id_seller` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tax`
--
ALTER TABLE `tax`
  MODIFY `id_tax` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT pour la table `update_price`
--
ALTER TABLE `update_price`
  MODIFY `id_update_price` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_tax`) REFERENCES `tax` (`id_tax`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`);

--
-- Contraintes pour la table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`);

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`id_seller`) REFERENCES `seller` (`id_seller`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`id_reward`) REFERENCES `reward` (`id_reward`),
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `update_price`
--
ALTER TABLE `update_price`
  ADD CONSTRAINT `update_price_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
