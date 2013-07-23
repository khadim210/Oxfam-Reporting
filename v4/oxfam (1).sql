-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 22 Juillet 2013 à 18:31
-- Version du serveur: 5.5.31-0ubuntu0.13.04.1
-- Version de PHP: 5.4.9-4ubuntu2.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `oxfam`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add langue', 7, 'add_langue'),
(20, 'Can change langue', 7, 'change_langue'),
(21, 'Can delete langue', 7, 'delete_langue'),
(22, 'Can add monnaie', 8, 'add_monnaie'),
(23, 'Can change monnaie', 8, 'change_monnaie'),
(24, 'Can delete monnaie', 8, 'delete_monnaie'),
(25, 'Can add Country informations', 9, 'add_countriesinfos'),
(26, 'Can change Country informations', 9, 'change_countriesinfos'),
(27, 'Can delete Country informations', 9, 'delete_countriesinfos'),
(28, 'Can add projet', 10, 'add_projet'),
(29, 'Can change projet', 10, 'change_projet'),
(30, 'Can delete projet', 10, 'delete_projet'),
(31, 'Can add Utilisateur', 11, 'add_profile'),
(32, 'Can change Utilisateur', 11, 'change_profile'),
(33, 'Can delete Utilisateur', 11, 'delete_profile'),
(34, 'Can add Budget projet', 12, 'add_budgetprojet'),
(35, 'Can change Budget projet', 12, 'change_budgetprojet'),
(36, 'Can delete Budget projet', 12, 'delete_budgetprojet'),
(37, 'Can add annee comptable', 13, 'add_anneecomptable'),
(38, 'Can change annee comptable', 13, 'change_anneecomptable'),
(39, 'Can delete annee comptable', 13, 'delete_anneecomptable'),
(40, 'Can add plan annuel', 14, 'add_planannuel'),
(41, 'Can change plan annuel', 14, 'change_planannuel'),
(42, 'Can delete plan annuel', 14, 'delete_planannuel'),
(43, 'Can add Mois', 15, 'add_mois'),
(44, 'Can change Mois', 15, 'change_mois'),
(45, 'Can delete Mois', 15, 'delete_mois'),
(46, 'Can add plan mensuel', 16, 'add_planmensuel'),
(47, 'Can change plan mensuel', 16, 'change_planmensuel'),
(48, 'Can delete plan mensuel', 16, 'delete_planmensuel'),
(49, 'Can add element mensuel', 17, 'add_elementmensuel'),
(50, 'Can change element mensuel', 17, 'change_elementmensuel'),
(51, 'Can delete element mensuel', 17, 'delete_elementmensuel'),
(52, 'Can add Theme', 18, 'add_themes'),
(53, 'Can change Theme', 18, 'change_themes'),
(54, 'Can delete Theme', 18, 'delete_themes'),
(55, 'Can add Activite', 19, 'add_activiteb'),
(56, 'Can change Activite', 19, 'change_activiteb'),
(57, 'Can delete Activite', 19, 'delete_activiteb'),
(58, 'Can add Ligne budget', 20, 'add_lignebudget'),
(59, 'Can change Ligne budget', 20, 'change_lignebudget'),
(60, 'Can delete Ligne budget', 20, 'delete_lignebudget'),
(61, 'Can add operation', 21, 'add_operation'),
(62, 'Can change operation', 21, 'change_operation'),
(63, 'Can delete operation', 21, 'delete_operation'),
(64, 'Can add operation bancaire', 22, 'add_operationbancaire'),
(65, 'Can change operation bancaire', 22, 'change_operationbancaire'),
(66, 'Can delete operation bancaire', 22, 'delete_operationbancaire'),
(67, 'Can add operation caisse', 23, 'add_operationcaisse'),
(68, 'Can change operation caisse', 23, 'change_operationcaisse'),
(69, 'Can delete operation caisse', 23, 'delete_operationcaisse'),
(70, 'Can add log entry', 24, 'add_logentry'),
(71, 'Can change log entry', 24, 'change_logentry'),
(72, 'Can delete log entry', 24, 'delete_logentry'),
(73, 'Can add migration history', 25, 'add_migrationhistory'),
(74, 'Can change migration history', 25, 'change_migrationhistory'),
(75, 'Can delete migration history', 25, 'delete_migrationhistory');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$nUaS7OQGifCv$2dUeqTZj04b27X+acGhjCbtCIlbfIoWOaaZIxAL+Ybw=', '2013-07-20 22:53:09', 1, 'nmtsylla', 'Babacar', 'Sylla', '', 1, 1, '2013-07-15 19:18:20'),
(2, 'pbkdf2_sha256$10000$zHounBAcV1tl$375GhWwn3eI5V8aSiuMhJmhJ3Fyd2FlrDkWm8S16p3k=', '2013-07-17 14:07:50', 0, 'niamato', '', '', 'nmtsylla@gmail.com', 1, 1, '2013-07-17 14:07:50'),
(3, 'pbkdf2_sha256$10000$jQiHaSr0Yeo7$akMMy2K2iu7N9Cbur2aRPa0NXWgboPtO6QUyODsqsSo=', '2013-07-17 14:30:32', 0, 'booba', 'Booba', 'Boobs', 'booba@gmail.com', 0, 1, '2013-07-17 14:29:40');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-07-15 19:19:07', 1, 8, '1', 'Francs CFA', 1, ''),
(2, '2013-07-15 19:19:17', 1, 7, '1', 'fr', 1, ''),
(3, '2013-07-15 19:19:19', 1, 9, '1', 'Senegal', 1, ''),
(4, '2013-07-15 19:19:25', 1, 10, '1', 'Developpement des TIC', 1, ''),
(5, '2013-07-15 19:19:28', 1, 11, '1', 'nmtsylla', 1, ''),
(6, '2013-07-15 19:19:57', 1, 13, '1', 'Année 2013', 1, ''),
(8, '2013-07-15 19:23:06', 1, 12, '2', 'Budget du projet Developpement des TIC', 1, ''),
(9, '2013-07-15 19:23:38', 1, 14, '1', 'Plan Année 2013', 1, ''),
(10, '2013-07-15 19:24:01', 1, 18, '1', 'Apprentissage transfrontalier et création de réseaux pour le changement ', 1, ''),
(11, '2013-07-15 19:24:05', 1, 18, '2', 'Initiatives de recherche, de suivi et de plaidoyer de haut niveau', 1, ''),
(12, '2013-07-15 19:24:09', 1, 18, '3', 'Participation politique', 1, ''),
(13, '2013-07-15 19:24:13', 1, 18, '4', 'Sensibilisation du public & renforcement de la coalition', 1, ''),
(14, '2013-07-15 19:27:23', 1, 19, '1', 'Elargir la base de la Coalition en sollicitant les membres de qualité avec priorité faite aux organi', 1, ''),
(15, '2013-07-15 19:30:15', 1, 15, '2', 'Aout', 1, ''),
(16, '2013-07-15 19:30:44', 1, 16, '1', 'PM du mois de aout', 1, ''),
(17, '2013-07-15 19:32:34', 1, 17, '1', 'Entretien et déplacement rencontre ONG Education', 1, ''),
(18, '2013-07-15 19:37:56', 1, 17, '2', 'Frais de lancement avis d''adhésion', 1, ''),
(19, '2013-07-16 11:39:22', 1, 19, '2', 'Faire une cartographie des acteurs de l''éducation au Bénin', 1, ''),
(20, '2013-07-16 11:39:53', 1, 19, '3', 'Organiser une réunion des partenaires pour le lancement du projet transitoire Bridge Fund ', 1, ''),
(21, '2013-07-16 11:40:20', 1, 19, '4', 'Renforcer les capacités des membres des OSC en matière de plaidoyer', 1, ''),
(22, '2013-07-16 11:41:05', 1, 19, '5', 'Renforcer les capacités des membres des OSC en matière de plaidoyer', 1, ''),
(23, '2013-07-16 11:41:18', 1, 19, '5', 'Renforcer les capacités des membres des OSC en matière de plaidoyer', 3, ''),
(24, '2013-07-16 11:41:48', 1, 19, '6', 'Former les membres de la CBO-EPT sur le contenu du PDDSE actualisé', 1, ''),
(25, '2013-07-16 11:42:26', 1, 19, '7', 'Organiser la Semaine Mondiale d''action pour l''Education Pour Tous 2012', 1, ''),
(26, '2013-07-16 11:42:47', 1, 19, '8', 'Evaluer la collaboration avec le MEMP', 1, ''),
(27, '2013-07-16 11:43:15', 1, 19, '9', 'Réaliser une étude sur la sensibilité genre au budget', 1, ''),
(28, '2013-07-16 11:43:38', 1, 19, '10', 'Former les acteurs de l''éducation en matière de planification et de bonne gouvernance', 1, ''),
(29, '2013-07-16 11:44:01', 1, 19, '11', 'Organiser des actions de plaidoyer sur l''éducation des filles', 1, ''),
(30, '2013-07-16 11:44:26', 1, 19, '12', 'Assurer le fonctionnement du Conseil d''Administration et des comités départementaux', 1, ''),
(31, '2013-07-16 11:44:51', 1, 19, '13', 'Participer à un atelier sur la politique éducative et plateforme d''échange et d''apprentissage à Daka', 1, ''),
(32, '2013-07-16 11:45:24', 1, 19, '14', 'Audit de fin de projet', 1, ''),
(33, '2013-07-16 11:45:51', 1, 19, '15', 'Mission de suivie', 1, ''),
(34, '2013-07-16 11:47:18', 1, 17, '2', 'Frais de lancement avis d''adhésion', 3, ''),
(35, '2013-07-16 11:47:18', 1, 17, '1', 'Entretien et déplacement rencontre ONG Education', 3, ''),
(36, '2013-07-16 11:49:06', 1, 16, '1', 'PM du mois de aout', 3, ''),
(37, '2013-07-16 11:50:19', 1, 15, '3', 'Mai', 1, ''),
(38, '2013-07-16 11:50:50', 1, 16, '2', 'PM du mois de Mai', 1, ''),
(39, '2013-07-16 11:51:13', 1, 15, '4', 'Avril', 1, ''),
(40, '2013-07-16 11:51:37', 1, 16, '3', 'PM du mois d''Avril', 1, ''),
(41, '2013-07-16 11:51:58', 1, 15, '5', 'Juin', 1, ''),
(42, '2013-07-16 11:52:23', 1, 16, '4', 'PM du mois de juin', 1, ''),
(43, '2013-07-16 11:52:41', 1, 15, '6', 'Juillet', 1, ''),
(44, '2013-07-16 11:53:06', 1, 16, '5', 'PM du mois de juillet', 1, ''),
(45, '2013-07-16 11:53:30', 1, 16, '6', 'PM du mois de aout', 1, ''),
(46, '2013-07-16 11:53:51', 1, 15, '7', 'Septembre', 1, ''),
(47, '2013-07-16 11:54:15', 1, 16, '7', 'PM du mois de septembre', 1, ''),
(48, '2013-07-16 11:54:35', 1, 15, '8', 'Octobre', 1, ''),
(49, '2013-07-16 11:55:02', 1, 16, '8', 'PM du mois de Octobre', 1, ''),
(50, '2013-07-16 11:55:24', 1, 15, '9', 'Novembre', 1, ''),
(51, '2013-07-16 11:55:41', 1, 16, '9', 'PM du mois de Novembre', 1, ''),
(52, '2013-07-17 14:35:00', 1, 3, '2', 'niamato', 2, 'Modifié password et is_staff.'),
(53, '2013-07-17 17:52:47', 1, 17, '1', 'Frais de lancement avis d''adhésion', 1, ''),
(54, '2013-07-17 17:53:07', 1, 20, '1', 'Frais de lancement avis d''adhésion', 1, ''),
(55, '2013-07-17 17:53:44', 1, 17, '2', 'Entretien et déplacement rencontre ONG Education', 1, ''),
(56, '2013-07-17 17:54:04', 1, 20, '2', 'Entretien et déplacement rencontre ONG Education', 1, ''),
(57, '2013-07-17 17:54:28', 1, 17, '3', 'Frais de transport comité de dépouillement dossier', 1, ''),
(58, '2013-07-17 17:54:37', 1, 20, '3', 'Frais de transport comité de dépouillement dossier', 1, ''),
(59, '2013-07-17 17:55:18', 1, 17, '4', 'Frais de lancement avis d''adhésion', 1, ''),
(60, '2013-07-17 17:56:32', 1, 20, '4', 'Frais de lancement avis d''adhésion', 1, ''),
(61, '2013-07-17 17:57:12', 1, 17, '5', 'Déplacement et entretien pour recherches documenetaires', 1, ''),
(62, '2013-07-17 17:57:33', 1, 20, '5', 'Déplacement et entretien pour recherches documenetaires', 1, ''),
(63, '2013-07-17 17:57:59', 1, 17, '6', 'Frais de transport comité de dépouillement dossier', 1, ''),
(64, '2013-07-17 17:58:10', 1, 20, '6', 'Frais de transport comité de dépouillement dossier', 1, ''),
(65, '2013-07-17 17:58:44', 1, 17, '7', 'Conception et impression du repertoire', 1, ''),
(66, '2013-07-17 17:58:56', 1, 20, '7', 'Conception et impression du repertoire', 1, '');

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'content type', 'contenttypes', 'contenttype'),
(5, 'session', 'sessions', 'session'),
(6, 'site', 'sites', 'site'),
(7, 'langue', 'frontoffice', 'langue'),
(8, 'monnaie', 'frontoffice', 'monnaie'),
(9, 'Country informations', 'frontoffice', 'countriesinfos'),
(10, 'projet', 'frontoffice', 'projet'),
(11, 'Utilisateur', 'frontoffice', 'profile'),
(12, 'Budget projet', 'frontoffice', 'budgetprojet'),
(13, 'annee comptable', 'frontoffice', 'anneecomptable'),
(14, 'plan annuel', 'frontoffice', 'planannuel'),
(15, 'Mois', 'frontoffice', 'mois'),
(16, 'plan mensuel', 'frontoffice', 'planmensuel'),
(17, 'element mensuel', 'frontoffice', 'elementmensuel'),
(18, 'Theme', 'frontoffice', 'themes'),
(19, 'Activite', 'frontoffice', 'activiteb'),
(20, 'Ligne budget', 'frontoffice', 'lignebudget'),
(21, 'operation', 'frontoffice', 'operation'),
(22, 'operation bancaire', 'frontoffice', 'operationbancaire'),
(23, 'operation caisse', 'frontoffice', 'operationcaisse'),
(24, 'log entry', 'admin', 'logentry'),
(25, 'migration history', 'south', 'migrationhistory');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('754spurt1e6kzg4zb6b1u4w878hh5dks', 'OTgwOWY0MGFiMjY4ZWIwOTBiNGYxYzg5MjU4NDBmMjZlNTQ0ODRkMzqAAn1xAS4=', '2013-08-01 00:40:13'),
('i29uuf2l5r0s3u2oxj3kc2ewsdx24i4k', 'OTgwOWY0MGFiMjY4ZWIwOTBiNGYxYzg5MjU4NDBmMjZlNTQ0ODRkMzqAAn1xAS4=', '2013-08-01 16:55:48'),
('jhmd7vbmkovthczzyt033v9a24l4n4rx', 'NjZmYWUyMTdhYjA3ZDI2MGQxZDRkNWNlYzE2MDQyMDY4YmViNzcwODqAAn1xAShVCmZpcnN0X25hbWVYBwAAAEJhYmFjYXJxAlUJbGFzdF9uYW1lWAUAAABTeWxsYXEDVQ1fYXV0aF91c2VyX2lkigEBVQZsYW5ndWVjY29weV9yZWcKX3JlY29uc3RydWN0b3IKcQRjZnJvbnRvZmZpY2UubW9kZWxzCkxhbmd1ZQpxBWNfX2J1aWx0aW5fXwpvYmplY3QKcQZOh1JxB31xCChVC2NvZGVfbGFuZ3VlcQlYAgAAAGZyVQZfc3RhdGVxCmNkamFuZ28uZGIubW9kZWxzLmJhc2UKTW9kZWxTdGF0ZQpxCymBcQx9cQ0oVQZhZGRpbmdxDolVAmRicQ9VB2RlZmF1bHRxEHViVQJpZHERigEBVQpub21fbGFuZ3VlcRJYCQAAAEZyYW7Dp2Fpc3ViVQRwYXlzaARjZnJvbnRvZmZpY2UubW9kZWxzCkNvdW50cmllc0luZm9zCnETaAZOh1JxFH1xFShVCnNob3J0X25hbWVxFlgHAAAAQ09TWURFUFUHY291bnRyeXEXWAcAAABTZW5lZ2FsaApoCymBcRh9cRkoaA6JaA9oEHViVQlsYW5ndWVfaWRxGooBAVULY3VycmVuY3lfaWRxG4oBAVUNY29tcGxldGVfbmFtZXEcWFEAAABDb2FsaXRpb24gZGVzIE9yYWdhbmlzYXRpb25zIGVuIFN5bmVyZ2llIHBvdXIgbGEgRMOpZmVuc2UgZGUgbCdFZHVjYXRpb24gUHVibGlxdWVoEYoBAXViVRJfYXV0aF91c2VyX2JhY2tlbmRVKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kcR1VBnByb2pldFgHAAAAQ09TWURFUFUJcHJvamV0X2lkigEBdS4=', '2013-08-03 22:53:09');

-- --------------------------------------------------------

--
-- Structure de la table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_activiteb`
--

CREATE TABLE IF NOT EXISTS `frontoffice_activiteb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) NOT NULL,
  `libelle_activite` varchar(100) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `montantPrevu` double NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_activiteb_2dcf8fc0` (`theme_id`),
  KEY `frontoffice_activiteb_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `frontoffice_activiteb`
--

INSERT INTO `frontoffice_activiteb` (`id`, `theme_id`, `libelle_activite`, `dateDebut`, `dateFin`, `montantPrevu`, `projet_id`) VALUES
(1, 1, 'Elargir la base de la Coalition en sollicitant les membres de qualité avec priorité faite aux organi', '2013-07-15', '2013-08-15', 250000, 1),
(2, 1, 'Faire une cartographie des acteurs de l''éducation au Bénin', '2013-01-16', '2013-03-16', 600000, 1),
(3, 1, 'Organiser une réunion des partenaires pour le lancement du projet transitoire Bridge Fund ', '2013-01-16', '2013-07-16', 1050000, 1),
(4, 1, 'Renforcer les capacités des membres des OSC en matière de plaidoyer', '2013-01-16', '2013-07-16', 1575000, 1),
(6, 1, 'Former les membres de la CBO-EPT sur le contenu du PDDSE actualisé', '2013-01-16', '2013-07-16', 1716000, 1),
(7, 1, 'Organiser la Semaine Mondiale d''action pour l''Education Pour Tous 2012', '2013-01-16', '2013-07-16', 1100000, 1),
(8, 1, 'Evaluer la collaboration avec le MEMP', '2013-01-16', '2013-07-16', 282000, 1),
(9, 1, 'Réaliser une étude sur la sensibilité genre au budget', '2013-01-16', '2013-07-16', 2480000, 1),
(10, 1, 'Former les acteurs de l''éducation en matière de planification et de bonne gouvernance', '2013-01-16', '2013-07-16', 2051000, 1),
(11, 1, 'Organiser des actions de plaidoyer sur l''éducation des filles', '2013-01-16', '2013-07-16', 360000, 1),
(12, 1, 'Assurer le fonctionnement du Conseil d''Administration et des comités départementaux', '2013-01-16', '2013-07-16', 780000, 1),
(13, 1, 'Participer à un atelier sur la politique éducative et plateforme d''échange et d''apprentissage à Daka', '2013-01-16', '2013-07-16', 845000, 1),
(14, 1, 'Audit de fin de projet', '2013-01-16', '2013-07-16', 2500000, 1),
(15, 1, 'Mission de suivie', '2013-01-16', '2013-07-16', 510000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_anneecomptable`
--

CREATE TABLE IF NOT EXISTS `frontoffice_anneecomptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_annee` varchar(30) NOT NULL,
  `code_annee` varchar(10) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `etat_annee` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_anneecomptable_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frontoffice_anneecomptable`
--

INSERT INTO `frontoffice_anneecomptable` (`id`, `libelle_annee`, `code_annee`, `projet_id`, `etat_annee`) VALUES
(1, 'Année 2013', '2013', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_budgetprojet`
--

CREATE TABLE IF NOT EXISTS `frontoffice_budgetprojet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `montantDemande` double NOT NULL,
  `montantAttribue` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_budgetprojet_37952554` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `frontoffice_budgetprojet`
--

INSERT INTO `frontoffice_budgetprojet` (`id`, `project_id`, `montantDemande`, `montantAttribue`) VALUES
(2, 1, 2543407.11, 2543407.11);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_countries`
--

CREATE TABLE IF NOT EXISTS `frontoffice_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(30) NOT NULL,
  `complete_name` varchar(100) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `langue` varchar(15) NOT NULL,
  `langue_court` varchar(5) NOT NULL,
  `logo` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_countriesinfos`
--

CREATE TABLE IF NOT EXISTS `frontoffice_countriesinfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(40) NOT NULL,
  `complete_name` varchar(100) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `langue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_countriesinfos_b2321453` (`currency_id`),
  KEY `frontoffice_countriesinfos_23b1f36f` (`langue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frontoffice_countriesinfos`
--

INSERT INTO `frontoffice_countriesinfos` (`id`, `country`, `complete_name`, `short_name`, `currency_id`, `langue_id`) VALUES
(1, 'Senegal', 'Coalition des Oraganisations en Synergie pour la Défense de l''Education Publique', 'COSYDEP', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_elementmensuel`
--

CREATE TABLE IF NOT EXISTS `frontoffice_elementmensuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planmensuel_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `libelle_element_mensuel` varchar(100) NOT NULL,
  `montant` double NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_elementmensuel_ace0017a` (`planmensuel_id`),
  KEY `frontoffice_elementmensuel_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `frontoffice_elementmensuel`
--

INSERT INTO `frontoffice_elementmensuel` (`id`, `planmensuel_id`, `code`, `libelle_element_mensuel`, `montant`, `projet_id`) VALUES
(1, 6, 'EMAOUT2013', 'Frais de lancement avis d''adhésion', 50000, 1),
(2, 2, 'EMAOUT2013', 'Entretien et déplacement rencontre ONG Education', 100000, 1),
(3, 2, 'EMAOUT2013', 'Frais de transport comité de dépouillement dossier', 100000, 1),
(4, 2, 'EMMAI2013', 'Frais de lancement avis d''adhésion', 50000, 1),
(5, 2, 'EMMAI2013', 'Déplacement et entretien pour recherches documenetaires', 100000, 1),
(6, 2, 'EMMAI2013', 'Frais de transport comité de dépouillement dossier', 100000, 1),
(7, 2, 'EMMAI2013', 'Conception et impression du repertoire', 35000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_langue`
--

CREATE TABLE IF NOT EXISTS `frontoffice_langue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_langue` varchar(30) NOT NULL,
  `code_langue` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frontoffice_langue`
--

INSERT INTO `frontoffice_langue` (`id`, `nom_langue`, `code_langue`) VALUES
(1, 'Français', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_lignebudget`
--

CREATE TABLE IF NOT EXISTS `frontoffice_lignebudget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activite_id` int(11) NOT NULL,
  `elementPlanMensuel_id` int(11) NOT NULL,
  `libelle_ligne` varchar(100) NOT NULL,
  `montantPrevu` double NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_lignebudget_b9ad2a94` (`activite_id`),
  KEY `frontoffice_lignebudget_81bb03b5` (`elementPlanMensuel_id`),
  KEY `frontoffice_lignebudget_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `frontoffice_lignebudget`
--

INSERT INTO `frontoffice_lignebudget` (`id`, `activite_id`, `elementPlanMensuel_id`, `libelle_ligne`, `montantPrevu`, `projet_id`) VALUES
(1, 1, 1, 'Frais de lancement avis d''adhésion', 50000, 1),
(2, 1, 2, 'Entretien et déplacement rencontre ONG Education', 100000, 1),
(3, 1, 3, 'Frais de transport comité de dépouillement dossier', 100000, 1),
(4, 2, 4, 'Frais de lancement avis d''adhésion', 50000, 1),
(5, 2, 5, 'Déplacement et entretien pour recherches documenetaires', 100000, 1),
(6, 2, 6, 'Frais de transport comité de dépouillement dossier', 100000, 1),
(7, 2, 7, 'Conception et impression du repertoire', 350000, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_mois`
--

CREATE TABLE IF NOT EXISTS `frontoffice_mois` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_id` int(11) NOT NULL,
  `nom_mois` varchar(10) NOT NULL,
  `numero_mois` smallint(5) unsigned NOT NULL,
  `etat` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_mois_191aee20` (`annee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `frontoffice_mois`
--

INSERT INTO `frontoffice_mois` (`id`, `annee_id`, `nom_mois`, `numero_mois`, `etat`) VALUES
(2, 1, 'Aout', 8, 1),
(3, 1, 'Mai', 5, 0),
(4, 1, 'Avril', 4, 0),
(5, 1, 'Juin', 6, 0),
(6, 1, 'Juillet', 7, 1),
(7, 1, 'Septembre', 9, 1),
(8, 1, 'Octobre', 10, 1),
(9, 1, 'Novembre', 11, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_monnaie`
--

CREATE TABLE IF NOT EXISTS `frontoffice_monnaie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_devise` varchar(20) NOT NULL,
  `signe` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frontoffice_monnaie`
--

INSERT INTO `frontoffice_monnaie` (`id`, `nom_devise`, `signe`) VALUES
(1, 'Francs CFA', 'FCFA');

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_operation`
--

CREATE TABLE IF NOT EXISTS `frontoffice_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_operation` varchar(100) NOT NULL,
  `date_operation` date NOT NULL,
  `somme_operation` double NOT NULL,
  `ligne_budget_id` int(11) NOT NULL,
  `memo` longtext NOT NULL,
  `projet_id` int(11) NOT NULL,
  `soumission` smallint(5) unsigned NOT NULL,
  `reference_paiement` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_operation_e7f4e6b6` (`ligne_budget_id`),
  KEY `frontoffice_operation_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `frontoffice_operation`
--

INSERT INTO `frontoffice_operation` (`id`, `libelle_operation`, `date_operation`, `somme_operation`, `ligne_budget_id`, `memo`, `projet_id`, `soumission`, `reference_paiement`) VALUES
(1, 'Frais entretien et transport comité rencontre structures actives en éducation pour élargissement bas', '2013-06-24', 100000, 2, 'az', 1, 2, 'RFT-1223'),
(2, 'Achat de crédit de communication ', '2013-06-03', 20000, 1, 'néant', 1, 2, '76543'),
(3, 'Demarche papiers et titre de voyage', '2013-08-24', 25000, 6, 'néant', 1, 2, 'HT-SDS'),
(4, 'Location voiture déplacement délégation pour rencontre avec le MEMP', '2013-07-18', 45000, 7, 'néant', 1, 4, 'HT-SDS');

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_operationbancaire`
--

CREATE TABLE IF NOT EXISTS `frontoffice_operationbancaire` (
  `operation_id` int(11) NOT NULL,
  `type_operation_bancaire` smallint(5) unsigned NOT NULL,
  `reference_operation` varchar(50) NOT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `frontoffice_operationbancaire`
--

INSERT INTO `frontoffice_operationbancaire` (`operation_id`, `type_operation_bancaire`, `reference_operation`) VALUES
(1, 0, '178982'),
(2, 1, '178981'),
(4, 0, '178984');

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_operationcaisse`
--

CREATE TABLE IF NOT EXISTS `frontoffice_operationcaisse` (
  `operation_id` int(11) NOT NULL,
  `numRecu` int(11) NOT NULL,
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `frontoffice_operationcaisse`
--

INSERT INTO `frontoffice_operationcaisse` (`operation_id`, `numRecu`) VALUES
(3, 8888);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_planannuel`
--

CREATE TABLE IF NOT EXISTS `frontoffice_planannuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_annee` varchar(20) NOT NULL,
  `code_annee` varchar(10) NOT NULL,
  `budgetProjet_id` int(11) NOT NULL,
  `montant_total_prevu` double NOT NULL,
  `projet_id` int(11) NOT NULL,
  `annee_comptable_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_planannuel_3f83b106` (`budgetProjet_id`),
  KEY `frontoffice_planannuel_2aaffac4` (`projet_id`),
  KEY `frontoffice_planannuel_7f7e5987` (`annee_comptable_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frontoffice_planannuel`
--

INSERT INTO `frontoffice_planannuel` (`id`, `libelle_annee`, `code_annee`, `budgetProjet_id`, `montant_total_prevu`, `projet_id`, `annee_comptable_id`) VALUES
(1, 'Plan Année 2013', 'PA2013', 2, 2543407.11, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_planmensuel`
--

CREATE TABLE IF NOT EXISTS `frontoffice_planmensuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mois_id` int(11) NOT NULL,
  `plan_annuel_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_planmensuel_205570b8` (`mois_id`),
  KEY `frontoffice_planmensuel_310d8ec5` (`plan_annuel_id`),
  KEY `frontoffice_planmensuel_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `frontoffice_planmensuel`
--

INSERT INTO `frontoffice_planmensuel` (`id`, `mois_id`, `plan_annuel_id`, `code`, `libelle`, `projet_id`) VALUES
(2, 3, 1, 'CPMMAI2013', 'PM du mois de Mai', 1),
(3, 4, 1, 'CPMAVRIL2013', 'PM du mois d''Avril', 1),
(4, 5, 1, 'CPMJUIN2013', 'PM du mois de juin', 1),
(5, 6, 1, 'CPMJUILLET2013', 'PM du mois de juillet', 1),
(6, 2, 1, 'CPMAOUT2013', 'PM du mois de aout', 1),
(7, 7, 1, 'CPMSEPT2013', 'PM du mois de septembre', 1),
(8, 8, 1, 'CPMOCT2013', 'PM du mois de Octobre', 1),
(9, 9, 1, 'CPNOV2013', 'PM du mois de Novembre', 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_profile`
--

CREATE TABLE IF NOT EXISTS `frontoffice_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `frontoffice_profile_4c751342` (`pays_id`),
  KEY `frontoffice_profile_2aaffac4` (`projet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `frontoffice_profile`
--

INSERT INTO `frontoffice_profile` (`id`, `user_id`, `pays_id`, `projet_id`) VALUES
(1, 1, 1, 1),
(2, 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_projet`
--

CREATE TABLE IF NOT EXISTS `frontoffice_projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_de_code` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `frontoffice_projet`
--

INSERT INTO `frontoffice_projet` (`id`, `nom_de_code`) VALUES
(1, 'Developpement des TIC');

-- --------------------------------------------------------

--
-- Structure de la table `frontoffice_themes`
--

CREATE TABLE IF NOT EXISTS `frontoffice_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_theme` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `frontoffice_themes`
--

INSERT INTO `frontoffice_themes` (`id`, `libelle_theme`) VALUES
(1, 'Apprentissage transfrontalier et création de réseaux pour le changement '),
(2, 'Initiatives de recherche, de suivi et de plaidoyer de haut niveau'),
(3, 'Participation politique'),
(4, 'Sensibilisation du public & renforcement de la coalition');

-- --------------------------------------------------------

--
-- Structure de la table `south_migrationhistory`
--

CREATE TABLE IF NOT EXISTS `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `frontoffice_activiteb`
--
ALTER TABLE `frontoffice_activiteb`
  ADD CONSTRAINT `projet_id_refs_id_4f449fe3` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`),
  ADD CONSTRAINT `theme_id_refs_id_a0d8e856` FOREIGN KEY (`theme_id`) REFERENCES `frontoffice_themes` (`id`);

--
-- Contraintes pour la table `frontoffice_anneecomptable`
--
ALTER TABLE `frontoffice_anneecomptable`
  ADD CONSTRAINT `projet_id_refs_id_41dbe528` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_budgetprojet`
--
ALTER TABLE `frontoffice_budgetprojet`
  ADD CONSTRAINT `project_id_refs_id_c35f06a9` FOREIGN KEY (`project_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_countriesinfos`
--
ALTER TABLE `frontoffice_countriesinfos`
  ADD CONSTRAINT `currency_id_refs_id_303bd609` FOREIGN KEY (`currency_id`) REFERENCES `frontoffice_monnaie` (`id`),
  ADD CONSTRAINT `langue_id_refs_id_404c5be8` FOREIGN KEY (`langue_id`) REFERENCES `frontoffice_langue` (`id`);

--
-- Contraintes pour la table `frontoffice_elementmensuel`
--
ALTER TABLE `frontoffice_elementmensuel`
  ADD CONSTRAINT `planmensuel_id_refs_id_d3311dd9` FOREIGN KEY (`planmensuel_id`) REFERENCES `frontoffice_planmensuel` (`id`),
  ADD CONSTRAINT `projet_id_refs_id_0826f042` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_lignebudget`
--
ALTER TABLE `frontoffice_lignebudget`
  ADD CONSTRAINT `activite_id_refs_id_ffc9f9c8` FOREIGN KEY (`activite_id`) REFERENCES `frontoffice_activiteb` (`id`),
  ADD CONSTRAINT `elementPlanMensuel_id_refs_id_e689fa95` FOREIGN KEY (`elementPlanMensuel_id`) REFERENCES `frontoffice_elementmensuel` (`id`),
  ADD CONSTRAINT `projet_id_refs_id_faf5d414` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_mois`
--
ALTER TABLE `frontoffice_mois`
  ADD CONSTRAINT `annee_id_refs_id_5384a4d0` FOREIGN KEY (`annee_id`) REFERENCES `frontoffice_anneecomptable` (`id`);

--
-- Contraintes pour la table `frontoffice_operation`
--
ALTER TABLE `frontoffice_operation`
  ADD CONSTRAINT `ligne_budget_id_refs_id_0404be4c` FOREIGN KEY (`ligne_budget_id`) REFERENCES `frontoffice_lignebudget` (`id`),
  ADD CONSTRAINT `projet_id_refs_id_080dc205` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_operationbancaire`
--
ALTER TABLE `frontoffice_operationbancaire`
  ADD CONSTRAINT `operation_id_refs_id_8dcd90c8` FOREIGN KEY (`operation_id`) REFERENCES `frontoffice_operation` (`id`);

--
-- Contraintes pour la table `frontoffice_operationcaisse`
--
ALTER TABLE `frontoffice_operationcaisse`
  ADD CONSTRAINT `operation_id_refs_id_95c27a2a` FOREIGN KEY (`operation_id`) REFERENCES `frontoffice_operation` (`id`);

--
-- Contraintes pour la table `frontoffice_planannuel`
--
ALTER TABLE `frontoffice_planannuel`
  ADD CONSTRAINT `annee_comptable_id_refs_id_fbd4237f` FOREIGN KEY (`annee_comptable_id`) REFERENCES `frontoffice_anneecomptable` (`id`),
  ADD CONSTRAINT `budgetProjet_id_refs_id_61dc5984` FOREIGN KEY (`budgetProjet_id`) REFERENCES `frontoffice_budgetprojet` (`id`),
  ADD CONSTRAINT `projet_id_refs_id_92131c80` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_planmensuel`
--
ALTER TABLE `frontoffice_planmensuel`
  ADD CONSTRAINT `mois_id_refs_id_8c196995` FOREIGN KEY (`mois_id`) REFERENCES `frontoffice_mois` (`id`),
  ADD CONSTRAINT `plan_annuel_id_refs_id_59e9d579` FOREIGN KEY (`plan_annuel_id`) REFERENCES `frontoffice_planannuel` (`id`),
  ADD CONSTRAINT `projet_id_refs_id_981eb3d0` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Contraintes pour la table `frontoffice_profile`
--
ALTER TABLE `frontoffice_profile`
  ADD CONSTRAINT `pays_id_refs_id_7667080b` FOREIGN KEY (`pays_id`) REFERENCES `frontoffice_countriesinfos` (`id`),
  ADD CONSTRAINT `projet_id_refs_id_facdd165` FOREIGN KEY (`projet_id`) REFERENCES `frontoffice_projet` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4b6bf90a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
