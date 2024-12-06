-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 06 déc. 2024 à 21:22
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `omeka-pr`
--

-- --------------------------------------------------------

--
-- Structure de la table `api_key`
--

CREATE TABLE `api_key` (
  `id` varchar(32) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `credential_hash` varchar(60) NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `media_type` varchar(255) NOT NULL,
  `storage_id` varchar(190) NOT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_entity`
--

CREATE TABLE `csvimport_entity` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `csvimport_import`
--

CREATE TABLE `csvimport_import` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `undo_job_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulltext_search`
--

CREATE TABLE `fulltext_search` (
  `id` int(11) NOT NULL,
  `resource` varchar(190) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext DEFAULT NULL,
  `text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(3, 'items', 1, 1, 'candidat1', 'candidat1\ncandidat1@gmail.com\ncandidat1\ncan1\n0682875275\ntest1\ntest\ntest\nmaster2\nlinkdin/candidat1 \ncandidat2'),
(4, 'items', 1, 1, 'candidat2', 'candidat2\ncandidat2@gmail.com\ncandidat2\ncand2\n0654852698\ntest2\ntest\nttst\nlicence\nlinkdin/candidat2 \ncandidat1'),
(5, 'items', 1, 1, 'candidature1', 'candidature1\ncandidature de candidat1\nbien\nexpert\ndalf\nhtml css react js java\noui\npython php\ncv\nalten\n3mois \noui\nnon\noui\nanglais\nvs code dart android\noui\nphoto\napplication mobile de gestion déchets '),
(6, 'items', 1, 1, 'candidature2', 'candidature2\noui\noui\ndelf\npython html css\noui\ngestion de temps \ncv\ncargo \n6 mois\noui\noui\noui\nespagnol\ndart flutter\noui\nphoto\nanalyse des fraudes'),
(7, 'items', 1, 1, 'Entreprise A', 'Entreprise A\natos\nparis\nentreprise international \ntechnologie '),
(8, 'items', 1, 1, 'Entreprise B', 'Entreprise B \norange Business \nbordeaux\nfilière d orange \ntélécommunication'),
(9, 'items', 1, 1, 'Offre alternance', 'Offre alternance \nalternance développement full stuck \nlinkdin'),
(10, 'items', 1, 1, 'offre alternance2', 'offre alternance2\nalternance en data analyste \nhellowork');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `primary_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `item_item_set`
--

CREATE TABLE `item_item_set` (
  `item_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_set`
--

CREATE TABLE `item_set` (
  `id` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `item_site`
--

CREATE TABLE `item_site` (
  `item_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `class` varchar(255) NOT NULL,
  `args` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `log` longtext DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) - R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"3274\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\ome38B3.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-10T22:05:31+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-10T22:05:31+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-10T22:05:31+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-10 22:05:30', '2024-10-10 22:05:31'),
(2, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\ome8764.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"2\":{\"foaf:firstName\":139},\"3\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T07:48:52+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T07:48:52+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T07:48:52+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 07:48:52', '2024-10-14 07:48:52'),
(3, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\omeB89A.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"1\":{\"foaf:mbox\":123},\"2\":{\"foaf:firstName\":139},\"3\":{\"foaf:familyName\":145}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":{\"o:id\":77},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T09:11:00+00:00 ERR (3): \'command\' n\'est pas reconnu en tant que commande interne\r\nou externe, un programme ex?cutable ou un fichier de commandes.\r\n\r\n2024-10-14T09:11:00+00:00 ERR (3): Command \"command -v \"php\"\" failed with status code 1.\r\n2024-10-14T09:11:00+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: cannot determine path to PHP. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:68\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 09:11:00', '2024-10-14 09:11:00'),
(4, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\omeCE88.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"2\":{\"foaf:firstName\":139}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T09:25:25+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 09:25:25', '2024-10-14 09:25:25'),
(5, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"Formulaire sans titre (r\\u00e9ponses) R\\u00e9ponses au formulaire 1.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\ome39F6.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column-property\":{\"3\":{\"foaf:lastName\":140}},\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":{\"o:id\":77},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-14T09:26:03+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-14 09:26:03', '2024-10-14 09:26:03'),
(6, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"R\\u00e9ponses au formulaire.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\omeC667.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-28T08:18:19+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-28 08:18:18', '2024-10-28 08:18:19'),
(7, 1, NULL, 'error', 'CSVImport\\Job\\Import', '{\"filename\":\"R\\u00e9ponses au formulaire.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\ome67F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":false,\"column\":[\"Horodateur\",\"Adresse e-mail\",\"Nom\",\"Pr\\u00e9nom\",\"Adresse email\",\"Num\\u00e9ro de t\\u00e9l\\u00e9phone\",\"Lieu de r\\u00e9sidence actuel\",\"Profil LinkedIn\",\"Niveau d\'\\u00e9tudes actuel\",\"Sp\\u00e9cialit\\u00e9 \\/ domaine d\'\\u00e9tudes\",\"\\u00c9tablissement scolaire actuel\",\"Avez-vous obtenu des certifications (ex. TOEIC, Google Analytics)?\",\"Si oui, lesquelles ?\",\"Mentionnez un projet acad\\u00e9mique dont vous \\u00eates particuli\\u00e8rement fier(e)\",\"Quelles comp\\u00e9tences ou savoirs avez-vous acquis pendant vos \\u00e9tudes en rapport avec ce poste ?\",\"Avez-vous d\\u00e9j\\u00e0 occup\\u00e9 un poste en alternance ?\",\"D\\u00e9crivez votre derni\\u00e8re exp\\u00e9rience professionnelle (intitul\\u00e9 du poste, entreprise, dur\\u00e9e, responsabilit\\u00e9s)\",\"Avez-vous travaill\\u00e9 en \\u00e9quipe dans cette exp\\u00e9rience ?\",\"Si oui, comment avez-vous contribu\\u00e9 ?\",\"Quelles comp\\u00e9tences professionnelles pensez-vous avoir d\\u00e9velopp\\u00e9es durant cette exp\\u00e9rience ?\",\"Quelle \\u00e9tait la dur\\u00e9e de votre contrat ou stage ?\",\"Listez les logiciels ou outils que vous ma\\u00eetrisez (ex. Photoshop, Excel, Python...)\",\"Quelle est votre expertise dans le domaine technique li\\u00e9 \\u00e0 cette alternance ?\",\"Parlez-vous des langues \\u00e9trang\\u00e8res ?\",\"Si oui, quelles langues et quel niveau (d\\u00e9butant, interm\\u00e9diaire, avanc\\u00e9, bilingue) ?\",\"Avez-vous des comp\\u00e9tences en gestion de temps ou d\'organisation ?\",\"Pourquoi souhaitez-vous rejoindre notre entreprise pour cette alternance ?\",\"Comment cette alternance s\'inscrit-elle dans votre projet professionnel \\u00e0 long terme ?\",\"Quelles sont les valeurs ou les principes de notre entreprise qui vous attirent ?\",\"Quelles sont vos attentes principales pour cette exp\\u00e9rience d\'alternance ?\",\"T\\u00e9l\\u00e9chargez votre CV\",\"Photo\",\"Comment avez-vous entendu parler de cette offre d\'alternance ? (Site web de l\'entreprise, R\\u00e9seaux sociaux, Universit\\u00e9, etc.)\",\"Souhaitez-vous ajouter d\'autres informations qui pourraient appuyer votre candidature ?\",\"Comment avez-vous entendu parler de cette offre d\'alternance ? (Site web de l\'entreprise, R\\u00e9seaux sociaux, Universit\\u00e9, etc.)\",\"Souhaitez-vous ajouter d\'autres informations qui pourraient appuyer votre candidature ?\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":\"\",\"o:resource_class\":\"\",\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', '2024-10-28T18:51:06+00:00 ERR (3): Omeka\\Job\\Exception\\RuntimeException: PHP-CLI error: invalid PHP path. in C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\DispatchStrategy\\PhpCli.php:63\nStack trace:\n#0 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(105): Omeka\\Job\\DispatchStrategy\\PhpCli->send(Object(Omeka\\Entity\\Job))\n#1 C:\\xampp\\htdocs\\omeka-pr\\application\\src\\Job\\Dispatcher.php(91): Omeka\\Job\\Dispatcher->send(Object(Omeka\\Entity\\Job), Object(Omeka\\Job\\DispatchStrategy\\PhpCli))\n#2 C:\\xampp\\htdocs\\omeka-pr\\modules\\CSVImport\\src\\Controller\\IndexController.php(160): Omeka\\Job\\Dispatcher->dispatch(\'CSVImport\\\\Job\\\\I...\', Array)\n#3 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractActionController.php(71): CSVImport\\Controller\\IndexController->mapAction()\n#4 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\Controller\\AbstractActionController->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#5 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#6 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Controller\\AbstractController.php(97): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#7 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\DispatchListener.php(132): Laminas\\Mvc\\Controller\\AbstractController->dispatch(Object(Laminas\\Http\\PhpEnvironment\\Request), Object(Laminas\\Http\\PhpEnvironment\\Response))\n#8 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(319): Laminas\\Mvc\\DispatchListener->onDispatch(Object(Laminas\\Mvc\\MvcEvent))\n#9 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-eventmanager\\src\\EventManager.php(179): Laminas\\EventManager\\EventManager->triggerListeners(Object(Laminas\\Mvc\\MvcEvent), Object(Closure))\n#10 C:\\xampp\\htdocs\\omeka-pr\\vendor\\laminas\\laminas-mvc\\src\\Application.php(325): Laminas\\EventManager\\EventManager->triggerEventUntil(Object(Closure), Object(Laminas\\Mvc\\MvcEvent))\n#11 C:\\xampp\\htdocs\\omeka-pr\\index.php(21): Laminas\\Mvc\\Application->run()\n#12 {main}\r\n', '2024-10-28 18:51:05', '2024-10-28 18:51:06'),
(8, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"R\\u00e9ponses au formulaire.csv\",\"filesize\":\"9433\",\"filepath\":\"C:\\\\Users\\\\hp\\\\AppData\\\\Local\\\\Temp\\\\ome595F.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"users\",\"comment\":\"altr\",\"automap_check_names_alone\":false,\"action\":\"create\",\"column-multivalue\":[],\"multivalue_separator\":\",\",\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\",\"o:owner\":{\"o:id\":1}}', NULL, '2024-10-28 18:52:21', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `ingester` varchar(255) NOT NULL,
  `renderer` varchar(255) NOT NULL,
  `data` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `source` longtext DEFAULT NULL,
  `media_type` varchar(255) DEFAULT NULL,
  `storage_id` varchar(190) DEFAULT NULL,
  `extension` varchar(255) DEFAULT NULL,
  `sha256` char(64) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int(11) DEFAULT NULL,
  `lang` varchar(190) DEFAULT NULL,
  `alt_text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.1');

-- --------------------------------------------------------

--
-- Structure de la table `password_creation`
--

CREATE TABLE `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('EQpklI5yrY8tOTpOuTzGBD2l8kDjc1GX', 5, '2024-11-28 22:55:54', 1),
('hNTBmo8If8o1o4GGu4GFvjH8KpcbOiGz', 6, '2024-11-28 22:58:50', 1);

-- --------------------------------------------------------

--
-- Structure de la table `property`
--

CREATE TABLE `property` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(243, 1, 8, 'Nom', 'Nom de famille', 'Le nom de famille du candidat.'),
(244, 1, 8, 'Prenom', 'Prénom du candidat', 'Le prénom du candidat.'),
(245, 1, 8, 'Email', 'Adresse électronique', 'L\'adresse email utilisée par le candidat.'),
(246, 1, 8, 'Telephone', 'Numéro de téléphone portable', 'Le numéro de téléphone mobile du candidat.'),
(247, 1, 8, 'LieuResidence', 'Localisation actuelle', 'Le lieu de résidence actuel du candidat.'),
(248, 1, 8, 'ProfilLinkedIn', 'Lien vers le profil LinkedIn', 'URL du profil LinkedIn du candidat.'),
(249, 1, 8, 'NiveauEtudes', 'Niveau d\'études', 'Le niveau d\'études actuel du candidat.'),
(250, 1, 8, 'Specialite', 'Domaine d\'études', 'Le domaine ou la spécialité des études du candidat.'),
(251, 1, 8, 'Etablissement', 'Établissement scolaire', 'L\'établissement scolaire actuel du candidat.'),
(252, 1, 8, 'Certifications', 'Certifications obtenues', 'Les certifications professionnelles ou académiques obtenues par le candidat.'),
(253, 1, 8, 'ProjetAcademique', 'Projet académique marquant', 'Un projet académique dont le candidat est particulièrement fier.'),
(254, 1, 8, 'Competences', 'Compétences acquises durant les études', 'Les compétences techniques ou théoriques acquises par le candidat lors de ses études.'),
(255, 1, 8, 'ExperienceAlternance', 'Expérience en alternance', 'Indique si le candidat a déjà occupé un poste en alternance.'),
(256, 1, 8, 'DerniereExperience', 'Dernière expérience professionnelle', 'Informations sur la dernière expérience professionnelle du candidat (poste, entreprise, durée, responsabilités).'),
(257, 1, 8, 'TravailEnEquipe', 'Expérience de travail en équipe', 'Indique si le candidat a travaillé en équipe et comment il a contribué.'),
(258, 1, 8, 'CompetencesPro', 'Compétences professionnelles développées', 'Les compétences professionnelles acquises par le candidat durant son expérience.'),
(259, 1, 8, 'DureeContrat', 'Durée du contrat ou du stage', 'La durée du dernier contrat ou stage effectué par le candidat.'),
(260, 1, 8, 'Logiciels', 'Logiciels et outils maîtrisés', 'Liste des logiciels ou outils que le candidat maîtrise.'),
(261, 1, 8, 'ExpertiseTechnique', 'Expertise technique', 'Le niveau d\'expertise technique du candidat en relation avec le poste.'),
(262, 1, 8, 'Langues', 'Langues étrangères', 'Les langues parlées par le candidat et leur niveau de maîtrise.'),
(263, 1, 8, 'GestionTemps', 'Compétences en gestion du temps', 'Compétences du candidat en matière d\'organisation et de gestion du temps.'),
(264, 1, 8, 'MotivationEntreprise', 'Motivation pour l\'entreprise', 'Les raisons pour lesquelles le candidat souhaite rejoindre l\'entreprise.'),
(265, 1, 8, 'ProjetLongTerme', 'Projet professionnel à long terme', 'Comment cette alternance s\'inscrit dans le projet professionnel à long terme du candidat.'),
(266, 1, 8, 'ValeursEntreprise', 'Valeurs d\'entreprise', 'Les valeurs de l\'entreprise qui attirent le candidat.'),
(267, 1, 8, 'AttentesAlternance', 'Attentes pour l\'alternance', 'Les attentes principales du candidat pour cette expérience d\'alternance.'),
(268, 1, 8, 'CV', 'CV téléversé', 'Le document CV téléversé par le candidat.'),
(269, 1, 8, 'Photo', 'Photo du candidat', 'Une photo du candidat téléversée avec sa candidature.'),
(270, 1, 8, 'AutresInfos', 'Autres informations supplémentaires', 'Informations supplémentaires que le candidat souhaite fournir pour appuyer sa candidature.'),
(271, 1, 8, 'EntrepriseNom', 'Entreprise Nom', 'Nom d\'entreprise'),
(272, 1, 8, 'Lieu', 'Lieu', 'Lieu de l\'entreprise.'),
(273, 1, 8, 'TitreOffre', 'Titre de l\'offre', 'Le titre d\'offre.'),
(274, 1, 8, 'SourceOffre', 'Source de l\'offre', 'Comment le candidat a entendu parler de cette offre d\'alternance.');

-- --------------------------------------------------------

--
-- Structure de la table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `resource_template_id` int(11) DEFAULT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `title` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(3, 1, 139, 3, NULL, 'candidat1', 1, '2024-11-19 15:53:52', '2024-11-19 15:56:10', 'Omeka\\Entity\\Item'),
(4, 1, 139, 3, NULL, 'candidat2', 1, '2024-11-19 15:55:06', '2024-11-19 15:55:49', 'Omeka\\Entity\\Item'),
(5, 1, 140, 4, NULL, 'candidature1', 1, '2024-11-19 15:58:25', '2024-11-19 15:58:45', 'Omeka\\Entity\\Item'),
(6, 1, 140, 4, NULL, 'candidature2', 1, '2024-11-19 16:00:15', '2024-11-19 16:00:15', 'Omeka\\Entity\\Item'),
(7, 1, 141, 5, NULL, 'Entreprise A', 1, '2024-11-19 16:01:04', '2024-11-19 16:01:04', 'Omeka\\Entity\\Item'),
(8, 1, 141, 5, NULL, 'Entreprise B', 1, '2024-11-19 16:02:11', '2024-11-19 16:02:11', 'Omeka\\Entity\\Item'),
(9, 1, 142, 6, NULL, 'Offre alternance', 1, '2024-11-19 16:02:57', '2024-11-19 16:02:57', 'Omeka\\Entity\\Item'),
(10, 1, 142, 6, NULL, 'offre alternance2', 1, '2024-11-19 16:03:31', '2024-11-19 16:03:31', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Structure de la table `resource_class`
--

CREATE TABLE `resource_class` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `vocabulary_id` int(11) NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(139, 1, 8, 'Candidat', 'Candidat à l\'alternance', 'Représente une personne soumettant sa candidature pour un poste en alternance.'),
(140, 1, 8, 'Candidature', 'Candidature', 'Représente la soumission d\'une demande pour un poste en alternance.'),
(141, 1, 8, 'Entreprise', 'Entreprise', 'Représente l\'entreprise qui propose des postes en alternance.'),
(142, 1, 8, 'Offre', 'Offre', 'Représente l\'offre.');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template`
--

CREATE TABLE `resource_template` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `resource_class_id` int(11) DEFAULT NULL,
  `title_property_id` int(11) DEFAULT NULL,
  `description_property_id` int(11) DEFAULT NULL,
  `label` varchar(190) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(3, 1, 139, NULL, NULL, 'Candidat'),
(4, 1, 140, NULL, NULL, 'candidature'),
(5, 1, 141, NULL, NULL, 'Entreprise'),
(6, 1, 142, NULL, NULL, 'Offre');

-- --------------------------------------------------------

--
-- Structure de la table `resource_template_property`
--

CREATE TABLE `resource_template_property` (
  `id` int(11) NOT NULL,
  `resource_template_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `alternate_label` varchar(255) DEFAULT NULL,
  `alternate_comment` longtext DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `data_type` longtext DEFAULT NULL COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(53, 3, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(54, 3, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(55, 3, 245, NULL, NULL, 3, NULL, 0, 0, NULL),
(56, 3, 244, NULL, NULL, 4, NULL, 0, 0, NULL),
(57, 3, 243, NULL, NULL, 5, NULL, 0, 0, NULL),
(58, 3, 246, NULL, NULL, 6, NULL, 0, 0, NULL),
(59, 3, 250, NULL, NULL, 7, NULL, 0, 0, NULL),
(60, 3, 251, NULL, NULL, 8, NULL, 0, 0, NULL),
(61, 3, 247, NULL, NULL, 9, NULL, 0, 0, NULL),
(62, 3, 249, NULL, NULL, 10, NULL, 0, 0, NULL),
(63, 3, 248, NULL, NULL, 11, NULL, 0, 0, NULL),
(64, 4, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(65, 4, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(66, 4, 266, NULL, NULL, 3, NULL, 0, 0, NULL),
(67, 4, 267, NULL, NULL, 4, NULL, 0, 0, NULL),
(68, 4, 252, NULL, NULL, 5, NULL, 0, 0, NULL),
(69, 4, 254, NULL, NULL, 6, NULL, 0, 0, NULL),
(70, 4, 263, NULL, NULL, 7, NULL, 0, 0, NULL),
(71, 4, 258, NULL, NULL, 8, NULL, 0, 0, NULL),
(72, 4, 268, NULL, NULL, 9, NULL, 0, 0, NULL),
(73, 4, 256, NULL, NULL, 10, NULL, 0, 0, NULL),
(74, 4, 259, NULL, NULL, 11, NULL, 0, 0, NULL),
(75, 4, 257, NULL, NULL, 12, NULL, 0, 0, NULL),
(76, 4, 255, NULL, NULL, 13, NULL, 0, 0, NULL),
(77, 4, 261, NULL, NULL, 14, NULL, 0, 0, NULL),
(78, 4, 262, NULL, NULL, 15, NULL, 0, 0, NULL),
(79, 4, 260, NULL, NULL, 16, NULL, 0, 0, NULL),
(80, 4, 264, NULL, NULL, 17, NULL, 0, 0, NULL),
(81, 4, 269, NULL, NULL, 18, NULL, 0, 0, NULL),
(82, 4, 253, NULL, NULL, 19, NULL, 0, 0, NULL),
(83, 5, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(84, 5, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(85, 5, 271, NULL, NULL, 3, NULL, 0, 0, NULL),
(86, 5, 272, NULL, NULL, 4, NULL, 0, 0, NULL),
(87, 5, 270, NULL, NULL, 5, NULL, 0, 0, NULL),
(88, 5, 170, 'specialite', NULL, 6, NULL, 0, 0, NULL),
(89, 6, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(90, 6, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(91, 6, 273, NULL, NULL, 3, NULL, 0, 0, NULL),
(92, 6, 274, NULL, NULL, 4, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

CREATE TABLE `session` (
  `id` varchar(190) NOT NULL,
  `data` longblob NOT NULL,
  `modified` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('0jhh13avnh62kdpdahkiv433d7', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323033343639342e3239303639323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2238346f37386d686869666b63326a693465697373697262623133223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323036383638313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323037373839353b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323037373838343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323037343437383b7d733a35393a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323037353432343b7d7d72656469726563745f75726c7c733a33313a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d70722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223236323537353832326134386333646362333139393464326535666338643565223b733a33323a226332386630646361656633613833613162386165383666636266316233353038223b7d733a343a2268617368223b733a36353a2263323866306463616566336138336131623861653836666362663162333530382d3236323537353832326134386333646362333139393464326535666338643565223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a37303a7b733a33323a226433636663323736343263353562333030356435356234343430653731323365223b733a33323a223432663934376662626262313932386135386438616366633635313936376162223b733a33323a226235613335623136363235623837636637323565373234306163613638393536223b733a33323a223435316465356663613463326666313966303734663335323233356266363731223b733a33323a226630373363376464373839646637343533343839356138333765613036343462223b733a33323a223239613131646535316130363435626532666163313531646331613332633139223b733a33323a223066356435393931333738373432343930376239636135626161313837323936223b733a33323a223266623939613865363634643362353330363365396639666163393662303766223b733a33323a226336373963623662326430356130643533373164666561613834336466623130223b733a33323a223432356538313764373065633535663066646635623931306539626665383065223b733a33323a226563383865396538383730313563666236633634326337653962363835646135223b733a33323a223130616235653436613630653262313266646632353932323731313663393537223b733a33323a223465343834353336663135383235393038356536383766363535656434303732223b733a33323a226434613139643535623865383165656138393861663334363934313430376534223b733a33323a223362396661383963346337333233326665623263646235386434653866353335223b733a33323a223434666637316530393732626461343630323936613761636463353333623661223b733a33323a226332626666353461336265633931373732333636653662346436363163623739223b733a33323a223535613464646539383837636237396163393137653939356562353864633062223b733a33323a223563383763346538313533656639643265343436313966353933393332323432223b733a33323a223163376532356230363435336530363237626261366334366336306663636337223b733a33323a223464613630643664326436373562393332663731643131313764313437616635223b733a33323a226436336265373236313936393537373936383461393962323635643934323235223b733a33323a223563353638633465633466393632636533646166323665383466386338353336223b733a33323a223830363335613161326330326439306261376463666638306639613332623863223b733a33323a223363363033323037313432323861396239316434303937653436356561613834223b733a33323a226432383563626236656432373036386436666364623737376366313666656661223b733a33323a223262626665613462396239666663363633363466653434653834613263616539223b733a33323a223831613964363164356165313763643038643534353665373233663564373439223b733a33323a223039626539656162653436663134623833323361353034343430633435383637223b733a33323a223935643939313536376438626663653033363736323066356535323264336263223b733a33323a226637616639363965633139653433393961633235656637356466396531396363223b733a33323a223862663665323631626363663239356564663464653961346135343835363964223b733a33323a226164643439376234306237383863336336316530613139393831613236646465223b733a33323a223337313964353334326334353063326339626132363762653433396130623934223b733a33323a223262623034663337323134663530616666393165393634373061383661386639223b733a33323a226632336565626135626264646438616662333763613738376263373636303336223b733a33323a223539353964343935313731353534633230323162336133356166396665646364223b733a33323a223230636438333434396530626166616230373965396530316565356636323635223b733a33323a223065326235353163333963363835336166323534356633663463353162356236223b733a33323a223136316463306161386139326433333838343932316166336430336438333639223b733a33323a226265643337623535656331373831326635653737333736353530633331396665223b733a33323a226461643563623731333437356231303132306439363431303633343732333961223b733a33323a226231396461613833626632306366323434363962303633376336313262396563223b733a33323a226435393437653435656664633966313733633734373434306631626262343764223b733a33323a223433646265383439306361333039366464626138363861386565343533623130223b733a33323a223836303237353764323731393264643762636230386139333337353962356331223b733a33323a223630323335343132663839613537346566353131663564386166353566366231223b733a33323a223238393839383634616636366330396135663462313436326439316666643338223b733a33323a223835626530356561663365303238626236393631303234623531393936333462223b733a33323a226462663738323136323235303361366238363433336636303365323930333836223b733a33323a223664643033353130633634613439356439653536303862376366653239323262223b733a33323a226438343433656533303037323033323962333662643332306533663032623732223b733a33323a223437356538663966366262383934333466363537326466303636323432663163223b733a33323a223534623566643432633036343562326230396561356466336165346361646664223b733a33323a226534623237373532663532313030616464643866656362316462363437353464223b733a33323a223438356566313335363939653137633634636434346234626238646438306335223b733a33323a223738313535383066303866666565303238333530343064376664343464313934223b733a33323a223964376563376431383764363564663139666634626232653438303130393361223b733a33323a226334356435376135306666663164383736613636363733363433383035386133223b733a33323a223362313437373665633232333738386561666162333261393661386138353765223b733a33323a223061333737346361366465653938613763653630356136393436646431343838223b733a33323a226465373064653062376235393639666465326261323361356332326235633363223b733a33323a223363326161666439656132356263373630306436633965326437643335623431223b733a33323a223761386239663363626239363036333963333234316139326261363430316165223b733a33323a223032613032366664363130363238656335656536373037666163653461623563223b733a33323a223736623139656666323437343833613437313963343336313166316633343164223b733a33323a223837623864353532666235316438393166396138663137366134373264616331223b733a33323a223132616264666637356437376638353131393835363037383431656133366535223b733a33323a223462663836353731633234636437643235393766666164663039386166366430223b733a33323a223663343435356563666338336235366337356430396339303033303630376531223b733a33323a226139326530646464396535353532613732303366633933633830303363656337223b733a33323a226139393035383937333031646632653863623365363139643666346237363238223b733a33323a226132633462363164653237666632343661336163333333393365303136363830223b733a33323a223461336131383163343734653663643230323630383233323633363334643061223b733a33323a226332326434346630306362326131363365663738643564396636326231653630223b733a33323a226264623536613732363432376261663862613336666232663336666134396136223b733a33323a223761666135353465616530396636303935313036363138373431633863666137223b733a33323a223933353965323164376139333639376237376638666462313032626236393032223b733a33323a226162616463346537366463346436386664393863343432363732343031386436223b733a33323a223939633963393162616338316662653333646431323533376562646531666563223b733a33323a223864636461636637313237613530326234656263353536663462643432303062223b733a33323a226363316339613936656562383966666637333831346266656638636663376363223b733a33323a223662313466313933636531633765366663326537376430353636333638306462223b733a33323a226664353764326162613665656338633337313833323364313037383236653266223b733a33323a226266316462313833313261656636383237376165343230393462363161346163223b733a33323a223563333663663966636234623431346564366135643365623733316535336461223b733a33323a223031373735393362333564643363386532333734363434616334666334353038223b733a33323a223536316137356330663738663864396530633064336230353962663939363434223b733a33323a226635633634343834333737383531616339353732626339386432616535336538223b733a33323a226334313035613131613266383337383963643135306137633562386335393061223b733a33323a223430613435396666663838643132643536626163353862636666333362373565223b733a33323a226261313234343863376137336434613033343866626634626166353335643666223b733a33323a223830653933636238653762383839633733366666326263383166353262376161223b733a33323a223633323737373063616565393862333362303539653139663465323364653065223b733a33323a223761653661623761346238396564343961383230313864323734393162343737223b733a33323a226637353439653261323765646263383164326233633732303437396238323765223b733a33323a223932636233396136653866373337346561666637353134353231363663616237223b733a33323a226636663336616339383138656131663036656632343537393336343631323763223b733a33323a223865643830326536303536323736653932363163353937313333323337646437223b733a33323a223661643533383535653533636665663934653133393561663235326462326364223b733a33323a226438613636326432626362383337356563613436613931636538656239313861223b733a33323a223961316365366362363932353238353766363530613463333339366536373766223b733a33323a226466343530383564613863346237363165633565343163653630326434346637223b733a33323a223233636133663361386262666132643366333731366239373866393063666233223b733a33323a223136663236643463393864643735356333613536613333666633343132336466223b733a33323a223438313162613435653538326366316334373266336466646437666231646562223b733a33323a226665326435356538623230663333636237336331656361613833616463623561223b733a33323a223138383038373431623362386638386234376562363634303561386239643232223b733a33323a226332383163373764633230313631376236316637373961326666353264663461223b733a33323a223436396561376232616138393239396132313034383633386561633430636133223b733a33323a226436613636393030376163643764363363323936353836623831363337306530223b733a33323a223634396362656232613838346634393066393962393636316539386639326365223b733a33323a223938376632613963616238303463663236396136663866356665386539643463223b733a33323a223636323762353039386434623362393734303461316438366662396163613237223b733a33323a223136383965376433636132663861313330356639646631646239393761373966223b733a33323a223766643561666337376336643762623963333463356432303363306636373738223b733a33323a226661653930646431333933313831383230366562333162636238626366616230223b733a33323a223434616633313335306465626366663139326338383337343166373533653231223b733a33323a226236326334623139363433616233623633333766633763326237373937396238223b733a33323a223865346666313637323261386631356138643661626430333832376466363965223b733a33323a223338616561393263663639383266323732653636616133346463396438663630223b733a33323a226436633136323636623663303063663535303064616365393636316163386330223b733a33323a223136383937343862656233353834393530633330616563653661363763666436223b733a33323a226133396162393139663366646163303661663130656439653763623261623030223b733a33323a223130643964616462326132376239303137616138663866646566356134373038223b733a33323a223134643535343436326530353437343535393361613230643337326233643961223b733a33323a226231633865643137633464643036353239623135316365626637653739373966223b733a33323a226230346437346161636463613733303738356436663238643136383831613631223b733a33323a226365663137653362643535396439373739373065353538336661653031656161223b733a33323a223931366164343437656464343562656336343562336235646663333234646565223b733a33323a223862306637333039636537393865653538333366383362336639363465666163223b733a33323a223366353636353161356262333237613563633063356262303030356164666135223b733a33323a226432623333396663386438363939396535373031393830323163376634383137223b733a33323a223735636132653166326134323431313166326437363530396366343533386162223b733a33323a223966356261643039366432623861323838353666346533633339353166623438223b733a33323a226163343264306564626365653663353336393733643134363365636236643763223b733a33323a223730303461633731366236636534323563633437343230323531343931633864223b733a33323a223963346131376437653838323734373634366332363039353165316437366236223b733a33323a226636633938366632663064346563373733653438363932366139393834623234223b733a33323a223935316231313436356236616531633737383530636532313866376566303437223b7d733a343a2268617368223b733a36353a2239353162313134363562366165316337373835306365323138663765663034372d6636633938366632663064346563373733653438363932366139393834623234223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32313a7b733a33323a226534353863316533643235626234653934613162366163373338373331616335223b733a33323a226363313032616438336562333434323233393765633938656231363032303035223b733a33323a223738303163396233323231373031386532376461616665613831643065303432223b733a33323a223835366135646633383764646239313035633737343330383733343966376265223b733a33323a226165346166336338336639373161623264613037333835623032323362333264223b733a33323a223163386237396166363934363736306565343066633762653833386633343430223b733a33323a226133663764653833396263323135316136356231623031363635653764383933223b733a33323a223239633739653231346432313138646363363835653862343937643933373062223b733a33323a223731316336336639326261336334303538376638373835306531666538313332223b733a33323a226234346362643633663833656632346231346530383830623763333662626261223b733a33323a223735366266346237323031393764663638343937643664656265376539313238223b733a33323a223230323163343265613930303638656332376335363635303338326536373638223b733a33323a223261333464363136323536323335393937306666626465613964373164633131223b733a33323a223066326333616364656338656336626438656466656466313165356165393436223b733a33323a223963636161656561396333646365633733356235303137643836393861663339223b733a33323a223931633036303362373534623966393630633363356231393431646434643632223b733a33323a223062386636373238636532323862383039303937336562613164373661386435223b733a33323a223331303466353635303130313931613532663339386462616466663632343332223b733a33323a223130396466633638623333336161623664346265343265366539636532313038223b733a33323a223932613030333631363539643039316632356530653366303332373164383361223b733a33323a226338323032336531663762303564613266396561323464663565313265376230223b733a33323a223334323139613133613333383862613763343539613666306336336536623165223b733a33323a226235373839366635613332393734623239336330656331366631653431336132223b733a33323a223333663763323232663135656262306539386362316335363634326239643938223b733a33323a226339303033303633646338646365333239306239616262353230633430303635223b733a33323a226230646162626438303438346333363332306332303736313636643537623461223b733a33323a223963633762303438396535313833373864653763303834383264646263633164223b733a33323a226634356366336435613565343334613938373439386537626137666536396238223b733a33323a226665383639383266653566653033346662623237376136613463653837393062223b733a33323a223930346430313234353536636665653536313038303736303565393366383661223b733a33323a223962376161373038623030336366616537353837633565666133636631353634223b733a33323a223265623365303262663135653361663539633334353639633834326630646666223b733a33323a226330613537366432613139366430356638323336303465666263376435653564223b733a33323a223266356161616531346264396561663065623235383963323633373037356537223b733a33323a223663616138316165386530653838393131386333343062333232303466373139223b733a33323a226239633138386164616533376235366662376362663466346438326631333332223b733a33323a223532646463623234633134323231666664303735616562613735663831373265223b733a33323a226636363065323231373436353432323938303035613361393931376539643234223b733a33323a223161333063333336386661633830353931643965323233313138363063626131223b733a33323a223035313762663934333532666238666537306634653563613032366162393939223b733a33323a226365613735393266663062613432646439636534303133653065316435623031223b733a33323a223739633834363166313037616532366162363035666632353139323132323332223b7d733a343a2268617368223b733a36353a2237396338343631663130376165323661623630356666323531393231323233322d6365613735393266663062613432646439636534303133653065316435623031223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a226637303233313533383730326239613533623438666462363033653330643166223b733a33323a223932326366333361653066653834336462663533653561623234386661363437223b733a33323a223462303865653932633766626139613137396232383461393464656563386263223b733a33323a226531306262363539316230376336663731366366613735306334636334626634223b733a33323a223638633637396231656136363531313230313439396332393431363161383563223b733a33323a223734623763383364383238326135353039313939323039316134633961623737223b733a33323a223065333037623030303061663064616430623034626366373662333362376563223b733a33323a223362633635643530663635326531356361393033303561633537643230316364223b733a33323a223734353732663133373339643465336234386561663935613139663034313432223b733a33323a226165663865616636643266383064373363623865653835333463613733393134223b733a33323a223737643363353332386161303262363335393738663339666631643561623462223b733a33323a223033633735323963306539303035323531336133643039646365646538616234223b733a33323a223737653864636233623539666261653362306663636334326262656239653863223b733a33323a223239306637373438666561646235663239613834666633646533663635323037223b7d733a343a2268617368223b733a36353a2232393066373734386665616462356632396138346666336465336636353230372d3737653864636233623539666261653362306663636334326262656239653863223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465696d706f7274666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226238623565396430623632386631646362303335306531353031623333386364223b733a33323a223330393735363565346666323366626666343738613632316535333633393431223b7d733a343a2268617368223b733a36353a2233303937353635653466663233666266663437386136323165353336333934312d6238623565396430623632386631646362303335306531353031623333386364223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732034695),
('56eug35mqvkloaaf927dg1gqsb', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532343738332e3930343732323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c316a66746e6b66766b6e7134686d31743439326166736d366e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373839353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373931303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373938303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226132353532306431393036323766653138626262633466333333313465396630223b733a33323a223736343365316462653739646163376164386164303833363234386164383566223b733a33323a223932313131383937633661333634326265383335396462616137666337336633223b733a33323a223433653037643533613864386566636565383733333865633733303765623932223b7d733a343a2268617368223b733a36353a2234336530376435336138643865666365653837333338656337333037656239322d3932313131383937633661333634326265383335396462616137666337336633223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226632623563613439323939653961383238386634363361623934626633333262223b733a33323a223861343861653337653531653434313435323232393936346230623438643861223b733a33323a226663306534623333303431626139646139633039623630613836386439353965223b733a33323a226466616333363538363831626361376561316134383832336331333866623163223b7d733a343a2268617368223b733a36353a2264666163333635383638316263613765613161343838323363313338666231632d6663306534623333303431626139646139633039623630613836386439353965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226337376562323365663536373739393965363862383636326464663862363434223b733a33323a223637316663393364376332613739613037386430313530623436303666333662223b733a33323a223161373139653361633234393962626263626537346361623764383065326338223b733a33323a226261333435646265623032303830393232633137353362663230346631386663223b733a33323a226534366135653635316537626537303233323134356364663238353166646137223b733a33323a223239653730366638643164393738353736376261346162353465393530623639223b733a33323a223364326333363465623933653765633731383133323634323431623962396633223b733a33323a223637366632386235666235343235613864303665336362323763633033653636223b733a33323a226437353665623739616262646465306364623232653035633834306261386661223b733a33323a223866376139363838613430363961313538393133373464336563626632313830223b7d733a343a2268617368223b733a36353a2238663761393638386134303639613135383931333734643365636266323138302d6437353665623739616262646465306364623232653035633834306261386661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732524783),
('98luk1m3b0a5qg4ph5ep7to5fe', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532343631372e3834353630383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22396f666575756573653070343972766c32666e61646d63313563223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536353433353b7d7d72656469726563745f75726c7c733a33313a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d70722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223236653534656138396532386464646132613964646130663565643264326439223b733a33323a223139323565653636623766626132633364373466663365386362636433316136223b7d733a343a2268617368223b733a36353a2231393235656536366237666261326333643734666633653863626364333161362d3236653534656138396532386464646132613964646130663565643264326439223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732524617),
('9asjpj2jnmia7p2g6648ca42b1', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323833343631382e30373236313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22326c34746f323768306b66747474746636736868696376753764223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323837363936343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323837373831323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323837373830383b7d7d72656469726563745f75726c7c733a33313a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d70722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223634623364306131643431306130323963626339613135663237376232373666223b733a33323a223335633833643736393065303839383861646565393638663536623439393865223b733a33323a226438356263353232633834326339393935396466323566303562643236616461223b733a33323a226265313164376638623138633837663935633234386436636330303631316362223b7d733a343a2268617368223b733a36353a2262653131643766386231386338376639356332343864366363303036313163622d6438356263353232633834326339393935396466323566303562643236616461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223261323362373836623931363664306465636665616531633431353330363262223b733a33323a223232366536633937636539633038356465383937336366323434316661396439223b733a33323a226135353638373262613965393639363335663736656633393637383638393338223b733a33323a223362663531663132396562643539656533656362303033376535646662656330223b733a33323a226139373431393935323762633863353038643239643062643365363434646266223b733a33323a223966343837633731613837633062346537646633616138336263666661366233223b733a33323a223065653137316434376234653661656632326162656566323566393865396137223b733a33323a223934353066353533333266376262623131323234356164363262396334393839223b733a33323a223564383065363436663038346365363034623161646662656138636536363631223b733a33323a223138646231323839383063373830333735633636303439333434343965376163223b733a33323a226231313366333965363736386661343336346632626466656663656531383738223b733a33323a223039353762323563333430386234353038306432393166656430313336303335223b733a33323a223464313537383435336331656339343530653630623166316463393362343635223b733a33323a223438323636313636656631346230316138326466633237646531313335373366223b733a33323a223535626363646432653439663030373436313462343231616661626538623765223b733a33323a223035303264316638613832643962333937333061396134373837376631666263223b733a33323a226233303965616132343733666235393138653266653839663966313737386138223b733a33323a223832643231363738623764366631663661663230633865623963323534306262223b733a33323a223462646533643736646666646163313132636562643961316466363238306565223b733a33323a223566376661356132643162663236323162303766616465633063633430343939223b733a33323a223338393137653861653361633861386366356536383766613865303061356637223b733a33323a226562653232666237343766626631613731343732393035653539356336366336223b733a33323a223065393666376231383638343664366538346265373964613835303435643030223b733a33323a223539653933343135353431366165303466363461626564326538323631366264223b733a33323a223932613561656138306361346130343835346631636134666662633361656537223b733a33323a223034343736313734353639666531643165303835363431373163643766663433223b733a33323a223464336262626232393735303435346331616637623139356135386330373765223b733a33323a223039666230656435353531636631623464316133323563643037613936363533223b733a33323a223439323237386461323761633362633134366539393262633762396162333966223b733a33323a223939643235386365316635313762396637386530376466653431653739383537223b733a33323a223534393539393231393561313861313533643063666431623333336330656266223b733a33323a226363316335633436663732383262366562393762383166376135363734303637223b733a33323a226366386463313434326438663137613864613930633763353335663132643034223b733a33323a223461353665633538353135613864343165613264373036636237373037333430223b733a33323a223633613231346237656361386366313964623161396230333836323962616666223b733a33323a226663366331303036336336653435396465343565623364303331393465383830223b733a33323a223139393164636434656362383038356435313535613437616332626335373235223b733a33323a223933386462663531333835373536373930663931386239323132363866323136223b733a33323a223866393561343331393865323066663132393264333739613331656361623164223b733a33323a223366366435343335616634376462646539326461666633613532323131633334223b7d733a343a2268617368223b733a36353a2233663664353433356166343764626465393264616666336135323231316333342d3866393561343331393865323066663132393264333739613331656361623164223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31323a7b733a33323a226133333638303832313263626461323035323831306338326466333333656435223b733a33323a226264356431666133633666666234633264633837633038353533393863646566223b733a33323a223230323435613339343431633464326564326566306463613064613464316637223b733a33323a223561303666356136333531316465383930363439363864366161346634313935223b733a33323a226566663030396632623163363764663163383161633834376436346464333838223b733a33323a223830363539633562613732656634623165663638323465393138656563303864223b733a33323a223235633036336362643964326432386334636135383835366137656463386138223b733a33323a226365613430353536636539613132393765386134646235356163613561623738223b733a33323a223434653164653630383737623337356261613136643261323262646539646266223b733a33323a223534396335396139663563633534623538643332383961353830336364666135223b733a33323a223437633564343338353038393662666134353832386431623262663662653432223b733a33323a226266313533343566633435343635343263303736323366303234623634633830223b733a33323a226336306362393239323063333263303164626436373730363561383732643936223b733a33323a223662633766386338333562343266636433663764356136666630376434353534223b733a33323a226336633362353837633630663532393936386163613433353462313332396338223b733a33323a226137613135303735316566316637366262383136343638653032633063623731223b733a33323a223135343562373266623233303539333936626666333135396439643666313730223b733a33323a223865336662346266623464663733313531333933663634643939376632613232223b733a33323a223937626261306538636334393861333536663633613064316464623030653837223b733a33323a223333613336656439303439353036623161376334343865373565373339303061223b733a33323a223163626439313831306465346463363031383633366637313965626461333038223b733a33323a223133646166316630366435333366346265333963343837316264353630613633223b733a33323a226332386432663336386534386230303836653237383839326364623965613461223b733a33323a226639326365376564336432653836366562386237373633643662333432323563223b7d733a343a2268617368223b733a36353a2266393263653765643364326538363665623862373736336436623334323235632d6332386432663336386534386230303836653237383839326364623965613461223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732834618),
('atmu6cocrj42d6l215jjb3ji62', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323533303833362e32383339353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2271696d39736f6e3268626b7133367239366c326c72376d713869223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323537343030373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323537343031383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323537343033353b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226138633238306564376164313334313231326661383030646539383035356561223b733a33323a223139633335303933366635393963623331393134623431303932363330353062223b7d733a343a2268617368223b733a36353a2231396333353039333666353939636233313931346234313039323633303530622d6138633238306564376164313334313231326661383030646539383035356561223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226430313166326466353734623866363832613961653166396436653734633233223b733a33323a223636313561353033643837353861663431356137653439356464343833613037223b733a33323a223138646330333937383465343938643237363936633936366434373939373532223b733a33323a223133353235616366623637373161366165393035393638323539303533386437223b7d733a343a2268617368223b733a36353a2231333532356163666236373731613661653930353936383235393035333864372d3138646330333937383465343938643237363936633936366434373939373532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226233386639356532666336646134396434666263386637353563653730613762223b733a33323a226138316139326338633665336166396431643433643332616165313833356238223b733a33323a223836643232663766333963346263323665656465663363323335363634313638223b733a33323a226339303034393161613665613632356665356664396535306434386566623337223b7d733a343a2268617368223b733a36353a2263393030343931616136656136323566653566643965353064343865666233372d3836643232663766333963346263323665656465663363323335363634313638223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732530836);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('cram8dmsqptsdjqnu5ufeehd4f', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323833343737342e3437383538323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226d6f31716e37383466366d3235616773317435743635356c6370223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323837373831393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323837373936313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323837373935363b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223036393035643162646363333937326530636236386261653865613466323934223b733a33323a226362393438373831653266386339323632653737313039393363653130313838223b7d733a343a2268617368223b733a36353a2263623934383738316532663863393236326537373130393933636531303138382d3036393035643162646363333937326530636236386261653865613466323934223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223632373761373937323636643537393262353763346637623261393738303739223b733a33323a223833336535363065663139393365306633623834633034316664633538353236223b733a33323a223862656161366435376135393230653430623935316434633935623165613337223b733a33323a226662643263336165306239643335393934353837373739613861393061633262223b733a33323a223038663164393739643036646163366330643031353736333266303330623565223b733a33323a223630323837313863306634613465386430396130623262386464656465333966223b733a33323a223235333962356533363961383535373962653266663464616632343065383534223b733a33323a223234396135333635613132343463313538633964373839376231663164313064223b733a33323a223566343966623837383161613732326532633236623663323262386530363737223b733a33323a223037353633323335326130323463616430653537656336636365633161343166223b733a33323a226237383866333162663762353734383763633833613362313861626366623965223b733a33323a226132633135666264663462316261393434633865366534343466303361323931223b7d733a343a2268617368223b733a36353a2261326331356662646634623162613934346338653665343434663033613239312d6237383866333162663762353734383763633833613362313861626366623965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223266666531373535666332383065333836383865323835353265306434373162223b733a33323a223132386166656331393834333866643565343533633461336630663735313832223b733a33323a223361643830363333343766636565333037383737336664616632643330356439223b733a33323a226338306230343234663735353665326261643639643635346466633133313133223b733a33323a223137386433613664316137336535333538633736383566383162336239313231223b733a33323a226331363936663362336164396565346534366566376661393930323832636561223b733a33323a223434366266663737333739613632303063656535346433386234633131363336223b733a33323a226134613737393063303462613332313361373361333665303061643765666364223b733a33323a226437643934633964363531323830353231626431333739303565313631393962223b733a33323a223434653332303637626330623435353565306438356237393539316432666262223b7d733a343a2268617368223b733a36353a2234346533323036376263306234353535653064383562373935393164326662622d6437643934633964363531323830353231626431333739303565313631393962223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732834774),
('eggacdg4ifeohq43ndv84b9ps0', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532343638352e3133343831393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2274363461356d35646a65313063703063676a6f39326e73753874223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373831383b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373837343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373836393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223332333764633536646537326237323236623764666238623434396266393736223b733a33323a223830663166336161386237663062303466303730396263393165383237303064223b7d733a343a2268617368223b733a36353a2238306631663361613862376630623034663037303962633931653832373030642d3332333764633536646537326237323236623764666238623434396266393736223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223063653331343365303238613938396664393066633738323166323562336562223b733a33323a226463383337396166643734306439613261346135386363306362303333353739223b733a33323a223132613330636461336263643733333937623230366131336363303865313333223b733a33323a223964356662336237623431633633393262613735303735313731393435623637223b733a33323a223738396135323963633039366665373466643436653966333266366637653337223b733a33323a223339393661663330613332626233303830626533633036323231363932373966223b7d733a343a2268617368223b733a36353a2233393936616633306133326262333038306265336330363232313639323739662d3738396135323963633039366665373466643436653966333266366637653337223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223066303038323166326531613338363635313337613862626134313861313635223b733a33323a223538366333663930343133646462343638383631633938613163663438663965223b733a33323a223737323262633565303033623866383037306238323136663631353531396633223b733a33323a223566616430633963383137353236666665396665323462363666393234646430223b733a33323a223330356536333336363161313130376436613639636533333665326335633539223b733a33323a223064623062356165396662353266623835663131336136633230613530363563223b733a33323a223765353536316462356362666639313635323939363931353632346433363239223b733a33323a226430626664393339366434383836613233633732323735613736393631373866223b7d733a343a2268617368223b733a36353a2264306266643933393664343838366132336337323237356137363936313738662d3765353536316462356362666639313635323939363931353632346433363239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732524685),
('ljkv8ms6tl336682bs06249lds', 0x5f5f4c616d696e61737c613a323a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323033353837382e3935303530383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226c6a6b76386d7336746c333336363832627330363234396c6473223b7d7d72656469726563745f75726c7c733a35343a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d70722f61646d696e2f637376696d706f72742f706173742d696d706f727473223b, 1732035878),
('lqul7ssgauv1ndjo30e0tcr13n', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733333531363530352e3337393738353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2267356e7472646c737534676639636e71736c6670376e36676f69223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733333535393638383b7d7d72656469726563745f75726c7c733a33313a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d70722f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223862386466656539343864303865666264336435633637396462343866303661223b733a33323a226433313635303832633539313939303834653163383130623063663862343831223b7d733a343a2268617368223b733a36353a2264333136353038326335393139393038346531633831306230636638623438312d3862386466656539343864303865666264336435633637396462343866303661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1733516505),
('plt2h9617jc50k31elf9uo3ht5', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323533303830372e3236363830373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223476636876616d6b656b31383732683070393866347433697232223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373939323b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323537333939373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313733323537333937393b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223262363539656430323363346639366335383064623930393031656535323532223b733a33323a223036636133376135316433323266366638356132366365633437343935383364223b7d733a343a2268617368223b733a36353a2230366361333761353164333232663666383561323663656334373439353833642d3262363539656430323363346639366335383064623930393031656535323532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32393a7b733a33323a226566383861326438336637363963363331653563363363373261663934306663223b733a33323a223965646636313032313464343463613434356334643734303935353835666130223b733a33323a223033306137343564306466643330646364373438666333653835343230373333223b733a33323a226162323135643834333763326361313531303739303931643864333665393232223b733a33323a223835313537326335333230343135623136306363353337666331626461393936223b733a33323a223330353463396439336436393133653036633766396433636330313034333430223b733a33323a226266613230376461633135373436613537636363393432623565653734636136223b733a33323a226463653266353739336136646365636561323130623761636266666461316234223b733a33323a223963613732333831666432653139626464666535613163386565383534623237223b733a33323a226165316537386439383239333163633534326262646132326163633031666334223b733a33323a223032383762313365336564623339396362323039623064626536366362633565223b733a33323a223634316639356263373031336666373935613063383132316137616663386261223b733a33323a223835373738613731346334653766323535653362613334323962386663386132223b733a33323a223537396366396332383530316635353331323937643432663839386133623163223b733a33323a223561343130343662633431336663613264646631656334663531313732353863223b733a33323a226164393962376531383864333437326461626266636236323532313862323939223b733a33323a223531626265383033373531323331626531363439613838623433346633306635223b733a33323a223462613737396666623733396463373937323462326364663961336462303333223b733a33323a223438303331353231656166333661383936333539616163653866313035663864223b733a33323a226634393864616461336263613839356266313566616231663834643838386431223b733a33323a223437306565383362366465376230643534336232353936343864656235633133223b733a33323a223963653833396130333463373033663038366364343334646166613765623666223b733a33323a223839353133323164643735383835393033393163633738363264613866313539223b733a33323a223530323633343836303462376630356364303063663764613439323533666233223b733a33323a226230616231373938343466303765646461623436666137613062633061656431223b733a33323a226136323830353964633863653862663462373265643562333834323334373362223b733a33323a223536356531386132353730313061656537613138626332663066633362633561223b733a33323a223536313166373535663064626264346366613262383334353931313465633430223b733a33323a223232613333633732623136383661323736353666346431393738623030323839223b733a33323a226363643836393861646430333466363539393031336363313862346335663337223b733a33323a223464333835346632303031663765663936356637633733336535643538653264223b733a33323a226234643461326536623330663065363063353139633964313533333632363838223b733a33323a226535343033636534393637366465626365343032313532356437363461353932223b733a33323a226130393562316339373065376132346165313235323333663535623938336338223b733a33323a226463646266323462656134323739326435653163316632363938396439386330223b733a33323a226337663739356331633433633633346165616433346463313565373431323638223b733a33323a223737346137633966663862653338643134333762356339366264386635343735223b733a33323a226362393164366663656135643465643736643361373231373937643965373636223b733a33323a223030383039316664383136353433316536653433396135316136653932623866223b733a33323a223461366565666562373835343238623532663763623637343837306638636466223b733a33323a223236306332386466356361326236613632353461306330356133656636653135223b733a33323a226531646531656237393431333434366565343730316462666638656135663735223b733a33323a226337333531613364643263653566663837623237313665393465646363653632223b733a33323a223666346463323733306161646361633738373261343937313065646264396334223b733a33323a223236373439333563346461653537356231623063643862356165623263313465223b733a33323a223030366165663431316566623433333338656339346362616336396238313031223b733a33323a223437316563313034613061666339323334366461616431333864333163623066223b733a33323a226164376264386334396231643664373237666238383839313962383163633636223b733a33323a226362363730303262313837663633373635653232326133366335326363366462223b733a33323a223763623063633737386139643762333934356437336537343538336436623466223b733a33323a226665303236336565663238393436666233626237386334613266653336626563223b733a33323a223436333939653333376266303439363263393932376234646637306439323137223b733a33323a223531643166356435313461383264393235373161316363633430653831383331223b733a33323a223963306461306234373862616135363830393139306432623330326238313134223b733a33323a223436386435376532383236336664326237333536313564323461643564363532223b733a33323a223937613835363036303832663536393832623364313461323736373463666338223b733a33323a226437356665383561353333333234343736373061353035656235336662396339223b733a33323a226165316231363462303234643037333435343633373339316563653333346663223b7d733a343a2268617368223b733a36353a2261653162313634623032346430373334353436333733393165636533333466632d6437356665383561353333333234343736373061353035656235336662396339223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223766313466633061393535333131386335663634316339363238343562613562223b733a33323a223239653864353461356461653432613365646164393833646634353131316532223b733a33323a223361323264653035626364663737386532356631303438346364366538653931223b733a33323a223936396636343066656161626338353561343033306639633130373635346231223b733a33323a223334636634613964356333353335633162396661663635383839663564626363223b733a33323a223137666635396531636131303036633265666463643761363634353063343764223b733a33323a223531393466303536333635393430343161663534633439333337613836663266223b733a33323a223665626463663632633533333232363536633162633933343833616337386336223b733a33323a223539653532383736653366363135383735343930356438393062383263366532223b733a33323a226163383931313531383064373337376637643433653732393030353134643661223b733a33323a223536303764326639306139646632666663313365323864613734633339343966223b733a33323a223463656337393336663238656539393861373764656431633761626139313266223b733a33323a226139376262343262393839646434623731353830623931343937343732343263223b733a33323a223537633032623531356139396664313939303630343330323361613238626635223b733a33323a223464373530623333643339323662376638653834643563343836396137313865223b733a33323a226466383164356465343762613365366132313566633632366363343461623130223b733a33323a223362316636383033363864633732653134656532393361616333666663663433223b733a33323a223964373962383565636639333534636439653863393135313630376461336233223b733a33323a223535326165613639393635333465343236373161386461303364383930343266223b733a33323a223739326466326363623635666665616637366538353135323531666139366330223b733a33323a223037386139653636646334613935653839353161313631646565313239336363223b733a33323a226137663864636536613261323762306335353938663630613461643135633430223b733a33323a226365393661353038376663613735366337613835356637353239333335316661223b733a33323a226133356531663266303566343438656561366234356666383332323835343538223b733a33323a223961306661633639323637613866343462663731306632633631326138636235223b733a33323a226139656264383836636431643865666338363333313963643565356166626165223b733a33323a223330356265333132343637626339343761333635353238663339383830363535223b733a33323a223030663463353461303138346532663934666465343164393935356635623564223b733a33323a223631653739313035333133343664616335353931663663336234613561613262223b733a33323a226436313339646463336138666532396331303465303566636533376137396636223b733a33323a226633336332633430323864343735303531343030633034396236333363643063223b733a33323a223434353461643032356466646331626632313838646138373432626464393838223b733a33323a223064613831356561623039633137373732356235363735306366376164646539223b733a33323a223735303237636339363361343234333732353137353765633333643432383638223b733a33323a223233353663373837353938616236353831393337386461376666323733343536223b733a33323a223365333939333834663337306263326164363935323331656664653363663939223b733a33323a226234366637616565303832326139666131313035376362616637316536616538223b733a33323a223561343738613763323531646531623531363466316364333137353034373335223b733a33323a223763643236326262613735393862666336386163393934666466613739643533223b733a33323a223562633861363632303463333435396532623366633463376461313636353961223b7d733a343a2268617368223b733a36353a2235626338613636323034633334353965326233666334633764613136363539612d3763643236326262613735393862666336386163393934666466613739643533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732530807),
('v0uvr2vktenm2c9v1gr540iua0', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323532343739322e3133303235373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226165706b63337563367439353637656f703876326a703875646f223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323536373938343b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223462333934643430653439353166326662333761313038303335313731643335223b733a33323a223663306237353833613361366561643836383966373635376335313463373230223b7d733a343a2268617368223b733a36353a2236633062373538336133613665616438363839663736353763353134633732302d3462333934643430653439353166326662333761313038303335313731643335223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1732524792),
('v5ko20erlv4rq00gkoc5ec7lvu', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313733323833363238312e39313435383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746f736e31723437696c6c733862723973686d676b65766c6b73223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323837373937353b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313733323837393438323b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223462353031633134666537343332303738656237653464646232303038303530223b733a33323a226462383465336262303265306630626136333432303563623638633364656465223b7d733a343a2268617368223b733a36353a2264623834653362623032653066306261363334323035636236386333646564652d3462353031633134666537343332303738656237653464646232303038303530223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a363b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223730636434643064343262366263376433643461613462643565623064376135223b733a33323a226635653330616537363633653261336162623538633330396439386138633036223b733a33323a223338613763336561393734396361626334376631663234623436343563313033223b733a33323a226265653236653736346433626637373664396233393961613363656461373462223b733a33323a223264373061633361386365343361633832646263383536646666313135633333223b733a33323a223432323436643861386334666433636538373138396537316431333233633835223b733a33323a223339323764383731663730386230356630303833316132333533636463366139223b733a33323a226364653538363034366230306534313762386335356336663232373363303166223b7d733a343a2268617368223b733a36353a2263646535383630343662303065343137623863353563366632323733633031662d3339323764383731663730386230356630303833316132333533636463366139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1732836283);

-- --------------------------------------------------------

--
-- Structure de la table `setting`
--

CREATE TABLE `setting` (
  `id` varchar(190) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"imane0037@gmail.com\"'),
('default_site', '\"\"'),
('default_to_private', '\"0\"'),
('disable_file_validation', '\"0\"'),
('disable_jsonld_embed', '\"0\"'),
('disable_jsonld_reverse', '\"0\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('favicon', '\"\"'),
('installation_title', '\"Candidature-d-alternance\"'),
('locale', '\"\"'),
('media_alt_text_property', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '\"25\"'),
('property_label_information', '\"none\"'),
('recaptcha_secret_key', '\"\"'),
('recaptcha_site_key', '\"\"'),
('time_zone', '\"Europe\\/Berlin\"'),
('use_htmlpurifier', '\"1\"'),
('value_languages', '[]'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Structure de la table `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `thumbnail_id` int(11) DEFAULT NULL,
  `homepage_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `slug` varchar(190) NOT NULL,
  `theme` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `summary` longtext DEFAULT NULL,
  `navigation` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_block_attachment`
--

CREATE TABLE `site_block_attachment` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `caption` longtext NOT NULL,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_item_set`
--

CREATE TABLE `site_item_set` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `item_set_id` int(11) NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page`
--

CREATE TABLE `site_page` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `slug` varchar(190) NOT NULL,
  `title` varchar(190) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_page_block`
--

CREATE TABLE `site_page_block` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `layout` varchar(80) NOT NULL,
  `data` longtext NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_permission`
--

CREATE TABLE `site_permission` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `site_setting`
--

CREATE TABLE `site_setting` (
  `id` varchar(190) NOT NULL,
  `site_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(190) NOT NULL,
  `name` varchar(190) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) DEFAULT NULL,
  `role` varchar(190) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'imane0037@gmail.com', 'omeka-pr', '2024-10-04 13:14:33', '2024-10-04 13:14:33', '$2y$10$LZ8lPvMn51HRG6ZHcJsEU.Ip3dar1yTGUYrgMLptXB9PDsnTVgU7m', 'global_admin', 1),
(5, 'samuel.szoniecky@univ-paris8.fr', 'samuelszoniecky', '2024-11-28 22:55:54', '2024-11-28 22:56:20', '$2y$10$F1dN0cbjWdh2SvgDaRxIFeNaRawUNC84PA4VlRhMUQRyB6nYoMCmy', 'global_admin', 1),
(6, 'thyp_24-25@api.com', 'thyp_24-25', '2024-11-28 22:58:50', '2024-11-28 22:59:08', '$2y$10$3tTo4O0VXmEwzCJEiHbHjOXr1Ps3Yd0.AC7Se1JwtmMX2ieFqMgTK', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_setting`
--

CREATE TABLE `user_setting` (
  `id` varchar(190) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` longtext NOT NULL COMMENT '(DC2Type:json_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 5, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 6, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 5, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 6, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 5, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 6, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 5, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 6, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 5, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 6, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 5, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 6, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 5, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 6, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 5, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 6, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'false'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 5, '\"\"'),
('default_resource_template', 6, '\"\"'),
('locale', 5, '\"\"'),
('locale', 6, '\"\"');

-- --------------------------------------------------------

--
-- Structure de la table `value`
--

CREATE TABLE `value` (
  `id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `value_resource_id` int(11) DEFAULT NULL,
  `value_annotation_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `uri` longtext DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(63, 3, 1, NULL, NULL, 'literal', '', 'candidat1', NULL, 1),
(64, 3, 245, NULL, NULL, 'literal', '', 'candidat1@gmail.com', NULL, 1),
(65, 3, 244, NULL, NULL, 'literal', '', 'candidat1', NULL, 1),
(66, 3, 243, NULL, NULL, 'literal', '', 'can1', NULL, 1),
(67, 3, 246, NULL, NULL, 'literal', '', '0682875275', NULL, 1),
(68, 3, 250, NULL, NULL, 'literal', '', 'test1', NULL, 1),
(69, 3, 251, NULL, NULL, 'literal', '', 'test', NULL, 1),
(70, 3, 247, NULL, NULL, 'literal', '', 'test', NULL, 1),
(71, 3, 249, NULL, NULL, 'literal', '', 'master2', NULL, 1),
(72, 3, 248, NULL, NULL, 'uri', '', '', 'linkdin/candidat1', 1),
(73, 4, 1, NULL, NULL, 'literal', '', 'candidat2', NULL, 1),
(74, 4, 245, NULL, NULL, 'literal', '', 'candidat2@gmail.com', NULL, 1),
(75, 4, 244, NULL, NULL, 'literal', '', 'candidat2', NULL, 1),
(76, 4, 243, NULL, NULL, 'literal', '', 'cand2', NULL, 1),
(77, 4, 246, NULL, NULL, 'literal', '', '0654852698', NULL, 1),
(78, 4, 250, NULL, NULL, 'literal', '', 'test2', NULL, 1),
(79, 4, 251, NULL, NULL, 'literal', '', 'test', NULL, 1),
(80, 4, 247, NULL, NULL, 'literal', '', 'ttst', NULL, 1),
(81, 4, 249, NULL, NULL, 'literal', '', 'licence', NULL, 1),
(82, 4, 248, NULL, NULL, 'uri', '', '', 'linkdin/candidat2', 1),
(83, 4, 11, 3, NULL, 'resource', NULL, NULL, NULL, 1),
(84, 3, 11, 4, NULL, 'resource', NULL, NULL, NULL, 1),
(85, 5, 1, NULL, NULL, 'literal', '', 'candidature1', NULL, 1),
(86, 5, 4, NULL, NULL, 'literal', '', 'candidature de candidat1', NULL, 1),
(87, 5, 266, NULL, NULL, 'literal', '', 'bien', NULL, 1),
(88, 5, 267, NULL, NULL, 'literal', '', 'expert', NULL, 1),
(89, 5, 252, NULL, NULL, 'literal', '', 'dalf', NULL, 1),
(90, 5, 254, NULL, NULL, 'literal', '', 'html css react js java', NULL, 1),
(91, 5, 263, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(92, 5, 258, NULL, NULL, 'literal', '', 'python php', NULL, 1),
(93, 5, 268, NULL, NULL, 'literal', '', 'cv', NULL, 1),
(94, 5, 256, NULL, NULL, 'literal', '', 'alten', NULL, 1),
(95, 5, 259, NULL, NULL, 'literal', '', '3mois ', NULL, 1),
(96, 5, 257, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(97, 5, 255, NULL, NULL, 'literal', '', 'non', NULL, 1),
(98, 5, 261, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(99, 5, 262, NULL, NULL, 'literal', '', 'anglais', NULL, 1),
(100, 5, 260, NULL, NULL, 'literal', '', 'vs code dart android', NULL, 1),
(101, 5, 264, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(102, 5, 269, NULL, NULL, 'literal', '', 'photo', NULL, 1),
(103, 5, 253, NULL, NULL, 'literal', '', 'application mobile de gestion déchets ', NULL, 1),
(104, 6, 1, NULL, NULL, 'literal', '', 'candidature2', NULL, 1),
(105, 6, 266, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(106, 6, 267, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(107, 6, 252, NULL, NULL, 'literal', '', 'delf', NULL, 1),
(108, 6, 254, NULL, NULL, 'literal', '', 'python html css', NULL, 1),
(109, 6, 263, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(110, 6, 258, NULL, NULL, 'literal', '', 'gestion de temps ', NULL, 1),
(111, 6, 268, NULL, NULL, 'literal', '', 'cv', NULL, 1),
(112, 6, 256, NULL, NULL, 'literal', '', 'cargo ', NULL, 1),
(113, 6, 259, NULL, NULL, 'literal', '', '6 mois', NULL, 1),
(114, 6, 257, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(115, 6, 255, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(116, 6, 261, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(117, 6, 262, NULL, NULL, 'literal', '', 'espagnol', NULL, 1),
(118, 6, 260, NULL, NULL, 'literal', '', 'dart flutter', NULL, 1),
(119, 6, 264, NULL, NULL, 'literal', '', 'oui', NULL, 1),
(120, 6, 269, NULL, NULL, 'literal', '', 'photo', NULL, 1),
(121, 6, 253, NULL, NULL, 'literal', '', 'analyse des fraudes', NULL, 1),
(122, 7, 1, NULL, NULL, 'literal', '', 'Entreprise A', NULL, 1),
(123, 7, 271, NULL, NULL, 'literal', '', 'atos', NULL, 1),
(124, 7, 272, NULL, NULL, 'literal', '', 'paris', NULL, 1),
(125, 7, 270, NULL, NULL, 'literal', '', 'entreprise international ', NULL, 1),
(126, 7, 170, NULL, NULL, 'literal', '', 'technologie ', NULL, 1),
(127, 8, 1, NULL, NULL, 'literal', '', 'Entreprise B ', NULL, 1),
(128, 8, 271, NULL, NULL, 'literal', '', 'orange Business ', NULL, 1),
(129, 8, 272, NULL, NULL, 'literal', '', 'bordeaux', NULL, 1),
(130, 8, 270, NULL, NULL, 'literal', '', 'filière d orange ', NULL, 1),
(131, 8, 170, NULL, NULL, 'literal', '', 'télécommunication', NULL, 1),
(132, 9, 1, NULL, NULL, 'literal', '', 'Offre alternance ', NULL, 1),
(133, 9, 273, NULL, NULL, 'literal', '', 'alternance développement full stuck ', NULL, 1),
(134, 9, 274, NULL, NULL, 'literal', '', 'linkdin', NULL, 1),
(135, 10, 1, NULL, NULL, 'literal', '', 'offre alternance2', NULL, 1),
(136, 10, 273, NULL, NULL, 'literal', '', 'alternance en data analyste ', NULL, 1),
(137, 10, 274, NULL, NULL, 'literal', '', 'hellowork', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `value_annotation`
--

CREATE TABLE `value_annotation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `namespace_uri` varchar(190) NOT NULL,
  `prefix` varchar(190) NOT NULL,
  `label` varchar(255) NOT NULL,
  `comment` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(8, 1, 'https://alt-company.com/alt-candidature#', 'alt', 'alternance', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C912ED9D7E3C61F9` (`owner_id`);

--
-- Index pour la table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`);

--
-- Index pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_84D382F4BE04EA9` (`job_id`);

--
-- Index pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  ADD UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`);

--
-- Index pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD PRIMARY KEY (`id`,`resource`),
  ADD KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`);
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Index pour la table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`);

--
-- Index pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD PRIMARY KEY (`item_id`,`item_set_id`),
  ADD KEY `IDX_6D0C9625126F525E` (`item_id`),
  ADD KEY `IDX_6D0C9625960278D7` (`item_set_id`);

--
-- Index pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD PRIMARY KEY (`item_id`,`site_id`),
  ADD KEY `IDX_A1734D1F126F525E` (`item_id`),
  ADD KEY `IDX_A1734D1FF6BD1646` (`site_id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  ADD KEY `IDX_6A2CA10C126F525E` (`item_id`),
  ADD KEY `item_position` (`item_id`,`position`);

--
-- Index pour la table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`);

--
-- Index pour la table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  ADD KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  ADD KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  ADD KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  ADD KEY `title` (`title`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  ADD KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  ADD KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`);

--
-- Index pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  ADD KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  ADD KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  ADD KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  ADD KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`);

--
-- Index pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  ADD KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  ADD KEY `IDX_4689E2F1549213EC` (`property_id`);

--
-- Index pour la table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  ADD UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  ADD KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  ADD KEY `IDX_694309E47E3C61F9` (`owner_id`);

--
-- Index pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_236473FEE9ED820C` (`block_id`),
  ADD KEY `IDX_236473FE126F525E` (`item_id`),
  ADD KEY `IDX_236473FEEA9FDD75` (`media_id`),
  ADD KEY `block_position` (`block_id`,`position`);

--
-- Index pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  ADD KEY `IDX_D4CE134F6BD1646` (`site_id`),
  ADD KEY `IDX_D4CE134960278D7` (`item_set_id`),
  ADD KEY `position` (`position`);

--
-- Index pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  ADD KEY `is_public` (`is_public`),
  ADD KEY `IDX_2F900BD9F6BD1646` (`site_id`);

--
-- Index pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C593E731C4663E4` (`page_id`),
  ADD KEY `page_position` (`page_id`,`position`);

--
-- Index pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  ADD KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  ADD KEY `IDX_C0401D6FA76ED395` (`user_id`);

--
-- Index pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD PRIMARY KEY (`id`,`site_id`),
  ADD KEY `IDX_64D05A53F6BD1646` (`site_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- Index pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD PRIMARY KEY (`id`,`user_id`),
  ADD KEY `IDX_C779A692A76ED395` (`user_id`);

--
-- Index pour la table `value`
--
ALTER TABLE `value`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  ADD KEY `IDX_1D77583489329D25` (`resource_id`),
  ADD KEY `IDX_1D775834549213EC` (`property_id`),
  ADD KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  ADD KEY `value` (`value`(190)),
  ADD KEY `uri` (`uri`(190)),
  ADD KEY `is_public` (`is_public`);

--
-- Index pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  ADD UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  ADD KEY `IDX_9099C97B7E3C61F9` (`owner_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `property`
--
ALTER TABLE `property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=275;

--
-- AUTO_INCREMENT pour la table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `resource_class`
--
ALTER TABLE `resource_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT pour la table `resource_template`
--
ALTER TABLE `resource_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT pour la table `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page`
--
ALTER TABLE `site_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `site_permission`
--
ALTER TABLE `site_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `value`
--
ALTER TABLE `value`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Contraintes pour la table `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Contraintes pour la table `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Contraintes pour la table `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
