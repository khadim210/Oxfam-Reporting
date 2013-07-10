-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 27, 2013 at 08:46 PM
-- Server version: 5.5.31-0ubuntu0.13.04.1
-- PHP Version: 5.4.9-4ubuntu2.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oxfam`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
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
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

--
-- Dumping data for table `auth_permission`
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
(25, 'Can add countries infos', 9, 'add_countriesinfos'),
(26, 'Can change countries infos', 9, 'change_countriesinfos'),
(27, 'Can delete countries infos', 9, 'delete_countriesinfos'),
(28, 'Can add profile', 10, 'add_profile'),
(29, 'Can change profile', 10, 'change_profile'),
(30, 'Can delete profile', 10, 'delete_profile'),
(31, 'Can add projet', 11, 'add_projet'),
(32, 'Can change projet', 11, 'change_projet'),
(33, 'Can delete projet', 11, 'delete_projet'),
(34, 'Can add budget projet', 12, 'add_budgetprojet'),
(35, 'Can change budget projet', 12, 'change_budgetprojet'),
(36, 'Can delete budget projet', 12, 'delete_budgetprojet'),
(37, 'Can add annee comptable', 13, 'add_anneecomptable'),
(38, 'Can change annee comptable', 13, 'change_anneecomptable'),
(39, 'Can delete annee comptable', 13, 'delete_anneecomptable'),
(40, 'Can add plan annuel', 14, 'add_planannuel'),
(41, 'Can change plan annuel', 14, 'change_planannuel'),
(42, 'Can delete plan annuel', 14, 'delete_planannuel'),
(43, 'Can add mois', 15, 'add_mois'),
(44, 'Can change mois', 15, 'change_mois'),
(45, 'Can delete mois', 15, 'delete_mois'),
(46, 'Can add plan mensuel', 16, 'add_planmensuel'),
(47, 'Can change plan mensuel', 16, 'change_planmensuel'),
(48, 'Can delete plan mensuel', 16, 'delete_planmensuel'),
(49, 'Can add element mensuel', 17, 'add_elementmensuel'),
(50, 'Can change element mensuel', 17, 'change_elementmensuel'),
(51, 'Can delete element mensuel', 17, 'delete_elementmensuel'),
(52, 'Can add themes', 18, 'add_themes'),
(53, 'Can change themes', 18, 'change_themes'),
(54, 'Can delete themes', 18, 'delete_themes'),
(55, 'Can add activite b', 19, 'add_activiteb'),
(56, 'Can change activite b', 19, 'change_activiteb'),
(57, 'Can delete activite b', 19, 'delete_activiteb'),
(58, 'Can add ligne budget', 20, 'add_lignebudget'),
(59, 'Can change ligne budget', 20, 'change_lignebudget'),
(60, 'Can delete ligne budget', 20, 'delete_lignebudget'),
(61, 'Can add operation', 21, 'add_operation'),
(62, 'Can change operation', 21, 'change_operation'),
(63, 'Can delete operation', 21, 'delete_operation'),
(64, 'Can add log entry', 22, 'add_logentry'),
(65, 'Can change log entry', 22, 'change_logentry'),
(66, 'Can delete log entry', 22, 'delete_logentry');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$10000$FDSo1UntEXU1$S9u50JggckN9m0hCr5rYXCniyRKK2UhEZ2AMm0kKAuo=', '2013-06-27 20:31:01', 1, 'nmtsylla', 'Babacar', 'Sylla', '', 1, 1, '2013-06-24 15:44:41'),
(2, 'pbkdf2_sha256$10000$FDSo1UntEXU1$S9u50JggckN9m0hCr5rYXCniyRKK2UhEZ2AMm0kKAuo=', '2013-06-24 22:43:37', 1, 'nmt', '', '', 'nmt@nmt.com', 1, 1, '2013-06-24 18:36:06');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
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
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2013-06-24 22:56:56', 1, 13, '1', 'Année 2013', 1, ''),
(2, '2013-06-24 22:57:44', 1, 15, '1', 'Mois', 1, ''),
(3, '2013-06-24 22:58:15', 1, 15, '2', 'MAIS', 1, ''),
(4, '2013-06-24 22:59:23', 1, 15, '3', 'Juillet', 1, ''),
(5, '2013-06-24 23:00:09', 1, 11, '1', 'Developpement des TIC', 1, ''),
(6, '2013-06-24 23:00:45', 1, 12, '1', '100000000', 1, ''),
(7, '2013-06-24 23:01:56', 1, 14, '1', 'PlanAnnée 2013', 1, ''),
(8, '2013-06-24 23:02:34', 1, 7, '3', 'fr', 1, ''),
(9, '2013-06-24 23:02:44', 1, 7, '4', 'en', 1, ''),
(10, '2013-06-24 23:03:01', 1, 7, '5', 'pg', 1, ''),
(11, '2013-06-24 23:03:16', 1, 7, '6', 'es', 1, ''),
(12, '2013-06-24 23:03:42', 1, 7, '2', 'en', 3, ''),
(13, '2013-06-24 23:03:49', 1, 7, '1', 'fr', 3, ''),
(14, '2013-06-24 23:05:41', 1, 9, '2', 'Senegal', 1, ''),
(15, '2013-06-24 23:06:17', 1, 10, '2', 'nmtsylla', 1, ''),
(16, '2013-06-24 23:06:55', 1, 18, '1', 'TIC', 1, ''),
(17, '2013-06-24 23:08:22', 1, 18, '1', 'TIC', 3, ''),
(18, '2013-06-24 23:08:39', 1, 18, '2', 'Participation politique', 1, ''),
(19, '2013-06-24 23:08:47', 1, 18, '3', 'Sensibilisation du public & renforcement de la coalition', 1, ''),
(20, '2013-06-24 23:08:54', 1, 18, '4', 'Initiatives de recherche, de suivi et de plaidoyer de haut niveau', 1, ''),
(21, '2013-06-24 23:09:04', 1, 18, '5', 'Apprentissage transfrontalier et création de réseaux pour le changement ', 1, ''),
(22, '2013-06-24 23:11:10', 1, 15, '2', 'MAI', 2, 'Modifié libelle_mois.'),
(23, '2013-06-24 23:11:20', 1, 15, '1', 'Juin', 2, 'Modifié libelle_mois.'),
(24, '2013-06-24 23:11:59', 1, 16, '1', 'Libelle du mois de juin', 1, ''),
(25, '2013-06-24 23:13:41', 1, 17, '1', 'Depense technques ', 1, ''),
(26, '2013-06-24 23:14:42', 1, 17, '2', 'Invesstissements ressources humaines', 1, ''),
(27, '2013-06-24 23:16:47', 1, 19, '1', 'Achat materiels informatiques', 1, ''),
(28, '2013-06-24 23:17:16', 1, 19, '2', 'Formation des futurs formateurs', 1, ''),
(29, '2013-06-24 23:19:14', 1, 20, '1', 'Ligne budget depense technique', 1, ''),
(30, '2013-06-24 23:19:53', 1, 20, '2', 'Voyage de formation', 1, ''),
(31, '2013-06-24 23:24:09', 1, 21, '1', 'Demarche papiers et titre de voyage', 1, ''),
(32, '2013-06-24 23:25:22', 1, 21, '2', 'Achat billets pour voyage', 1, ''),
(33, '2013-06-24 23:27:00', 1, 21, '3', 'Reservation hotel Las grandes villas des reposs', 1, ''),
(34, '2013-06-24 23:28:07', 1, 21, '4', 'Prospection marché des distributeurs', 1, ''),
(35, '2013-06-24 23:29:44', 1, 21, '5', 'Achats serveurs intel px-12', 1, ''),
(36, '2013-06-25 02:13:16', 1, 21, '5', 'Achats serveurs intel px-12', 2, 'Modifié soumission.'),
(37, '2013-06-25 02:13:22', 1, 21, '4', 'Prospection marché des distributeurs', 2, 'Modifié soumission.'),
(38, '2013-06-25 02:13:29', 1, 21, '3', 'Reservation hotel Las grandes villas des reposs', 2, 'Modifié soumission.'),
(39, '2013-06-25 02:13:39', 1, 21, '2', 'Achat billets pour voyage', 2, 'Modifié soumission.'),
(40, '2013-06-25 02:13:46', 1, 21, '1', 'Demarche papiers et titre de voyage', 2, 'Modifié soumission.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_content_type`
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
(9, 'countries infos', 'frontoffice', 'countriesinfos'),
(10, 'profile', 'frontoffice', 'profile'),
(11, 'projet', 'frontoffice', 'projet'),
(12, 'budget projet', 'frontoffice', 'budgetprojet'),
(13, 'annee comptable', 'frontoffice', 'anneecomptable'),
(14, 'plan annuel', 'frontoffice', 'planannuel'),
(15, 'mois', 'frontoffice', 'mois'),
(16, 'plan mensuel', 'frontoffice', 'planmensuel'),
(17, 'element mensuel', 'frontoffice', 'elementmensuel'),
(18, 'themes', 'frontoffice', 'themes'),
(19, 'activite b', 'frontoffice', 'activiteb'),
(20, 'ligne budget', 'frontoffice', 'lignebudget'),
(21, 'operation', 'frontoffice', 'operation'),
(22, 'log entry', 'admin', 'logentry');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('d1z4lwsoxe4jg7xkge4zgz7t6dlpdmvx', 'OTgwOWY0MGFiMjY4ZWIwOTBiNGYxYzg5MjU4NDBmMjZlNTQ0ODRkMzqAAn1xAS4=', '2013-07-08 17:59:01'),
('e7g96p6c8wh3fvktr5kjetdaocqwqkk2', 'YzViZDk3ZjI5OGJmYzc5ODM5YzAyMzAwYzgxZjMxMTJjYmY5ZmEyMTqAAn1xAShVCmZpcnN0X25hbWVYBwAAAEJhYmFjYXJVCWxhc3RfbmFtZVgFAAAAU3lsbGFVDV9hdXRoX3VzZXJfaWSKAQFVBmxhbmd1ZWNjb3B5X3JlZwpfcmVjb25zdHJ1Y3RvcgpxAmNmcm9udG9mZmljZS5tb2RlbHMKTGFuZ3VlCnEDY19fYnVpbHRpbl9fCm9iamVjdApxBE6HUnEFfXEGKFULY29kZV9sYW5ndWVxB1gCAAAAZnJVBl9zdGF0ZXEIY2RqYW5nby5kYi5tb2RlbHMuYmFzZQpNb2RlbFN0YXRlCnEJKYFxCn1xCyhVBmFkZGluZ3EMiVUCZGJxDVUHZGVmYXVsdHEOdWJVAmlkcQ+KAQNVCm5vbV9sYW5ndWVxEFgJAAAARnJhbsOnYWlzdWJVBHBheXNoAmNmcm9udG9mZmljZS5tb2RlbHMKQ291bnRyaWVzSW5mb3MKcRFoBE6HUnESfXETKFUKc2hvcnRfbmFtZXEUWAcAAABDT1NZREVQVQdjb3VudHJ5cRVYBwAAAFNlbmVnYWxoCGgJKYFxFn1xFyhoDIloDWgOdWJVCWxhbmd1ZV9pZHEYigEDVQtjdXJyZW5jeV9pZHEZigEBVQ1jb21wbGV0ZV9uYW1lcRpYUQAAAENvYWxpdGlvbiBkZXMgT3JhZ2FuaXNhdGlvbnMgZW4gU3luZXJnaWUgcG91ciBsYSBEw6lmZW5zZSBkZSBsJ0VkdWNhdGlvbiBQdWJsaXF1ZWgPigECdWJVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVBnByb2pldFgHAAAAQ09TWURFUFUPZGphbmdvX2xhbmd1YWdlWAIAAABmcnEbdS4=', '2013-07-11 20:29:48'),
('iczuqzcnvys1v4a2jarb0ihj969g5cod', 'OTgwOWY0MGFiMjY4ZWIwOTBiNGYxYzg5MjU4NDBmMjZlNTQ0ODRkMzqAAn1xAS4=', '2013-07-08 17:57:07'),
('xhnmtxsw52dk0jx301w22mklv3pyfj07', 'MzBhMDkwYWM3NWJkYjA1ZjZjNmMxZWY0MmQzYTg1NTEzYWQ5ODUxNzqAAn1xAShVCmZpcnN0X25hbWVYBwAAAEJhYmFjYXJVCWxhc3RfbmFtZVgFAAAAU3lsbGFVDV9hdXRoX3VzZXJfaWSKAQFVBmxhbmd1ZWNjb3B5X3JlZwpfcmVjb25zdHJ1Y3RvcgpxAmNmcm9udG9mZmljZS5tb2RlbHMKTGFuZ3VlCnEDY19fYnVpbHRpbl9fCm9iamVjdApxBE6HUnEFfXEGKFULY29kZV9sYW5ndWVxB1gCAAAAZnJVBl9zdGF0ZXEIY2RqYW5nby5kYi5tb2RlbHMuYmFzZQpNb2RlbFN0YXRlCnEJKYFxCn1xCyhVBmFkZGluZ3EMiVUCZGJxDVUHZGVmYXVsdHEOdWJVAmlkcQ+KAQNVCm5vbV9sYW5ndWVxEFgJAAAARnJhbsOnYWlzdWJVBHBheXNoAmNmcm9udG9mZmljZS5tb2RlbHMKQ291bnRyaWVzSW5mb3MKcRFoBE6HUnESfXETKFUKc2hvcnRfbmFtZXEUWAcAAABDT1NZREVQVQdjb3VudHJ5cRVYBwAAAFNlbmVnYWxoCGgJKYFxFn1xFyhoDIloDWgOdWJVCWxhbmd1ZV9pZHEYigEDVQtjdXJyZW5jeV9pZHEZigEBVQ1jb21wbGV0ZV9uYW1lcRpYUQAAAENvYWxpdGlvbiBkZXMgT3JhZ2FuaXNhdGlvbnMgZW4gU3luZXJnaWUgcG91ciBsYSBEw6lmZW5zZSBkZSBsJ0VkdWNhdGlvbiBQdWJsaXF1ZWgPigECdWJVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRVBnByb2pldFgHAAAAQ09TWURFUFUPZGphbmdvX2xhbmd1YWdlcRtYAgAAAGZycRx1Lg==', '2013-07-11 20:36:15');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_activiteb`
--

CREATE TABLE IF NOT EXISTS `frontoffice_activiteb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) NOT NULL,
  `libelle_activite` varchar(100) NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  `montantPrevu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_activiteb_2dcf8fc0` (`theme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `frontoffice_activiteb`
--

INSERT INTO `frontoffice_activiteb` (`id`, `theme_id`, `libelle_activite`, `dateDebut`, `dateFin`, `montantPrevu`) VALUES
(1, 4, 'Achat materiels informatiques', '2013-06-24', '2013-06-20', 15000000),
(2, 3, 'Formation des futurs formateurs', '2013-06-24', '2013-07-14', 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_anneecomptable`
--

CREATE TABLE IF NOT EXISTS `frontoffice_anneecomptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_annee` varchar(30) NOT NULL,
  `code_annee` varchar(10) NOT NULL,
  `etat` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frontoffice_anneecomptable`
--

INSERT INTO `frontoffice_anneecomptable` (`id`, `libelle_annee`, `code_annee`, `etat`) VALUES
(1, 'Année 2013', '2013', 'ouverte');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_budgetprojet`
--

CREATE TABLE IF NOT EXISTS `frontoffice_budgetprojet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `montantDemande` int(11) NOT NULL,
  `montantAttribue` int(11) NOT NULL,
  `montantExecute` int(11) NOT NULL,
  `montantRestant` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frontoffice_budgetprojet`
--

INSERT INTO `frontoffice_budgetprojet` (`id`, `project_id`, `montantDemande`, `montantAttribue`, `montantExecute`, `montantRestant`) VALUES
(1, 1, 100000000, 90000000, 0, 90000000);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_countriesinfos`
--

CREATE TABLE IF NOT EXISTS `frontoffice_countriesinfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(30) NOT NULL,
  `complete_name` varchar(100) NOT NULL,
  `short_name` varchar(20) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `langue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_countriesinfos_b2321453` (`currency_id`),
  KEY `frontoffice_countriesinfos_23b1f36f` (`langue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `frontoffice_countriesinfos`
--

INSERT INTO `frontoffice_countriesinfos` (`id`, `country`, `complete_name`, `short_name`, `currency_id`, `langue_id`) VALUES
(2, 'Senegal', 'Coalition des Oraganisations en Synergie pour la Défense de l''Education Publique', 'COSYDEP', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_elementmensuel`
--

CREATE TABLE IF NOT EXISTS `frontoffice_elementmensuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planmensuel_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `libelle_element_mensuel` varchar(100) NOT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_elementmensuel_ace0017a` (`planmensuel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `frontoffice_elementmensuel`
--

INSERT INTO `frontoffice_elementmensuel` (`id`, `planmensuel_id`, `code`, `libelle_element_mensuel`, `montant`) VALUES
(1, 1, 'EMJUIN2013', 'Depense technques ', 20000000),
(2, 1, 'EM1JUIN2013', 'Invesstissements ressources humaines', 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_langue`
--

CREATE TABLE IF NOT EXISTS `frontoffice_langue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_langue` varchar(30) NOT NULL,
  `code_langue` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `frontoffice_langue`
--

INSERT INTO `frontoffice_langue` (`id`, `nom_langue`, `code_langue`) VALUES
(3, 'Français', 'fr'),
(4, 'English', 'en'),
(5, 'Portugese', 'pg'),
(6, 'Espaniol', 'es');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_lignebudget`
--

CREATE TABLE IF NOT EXISTS `frontoffice_lignebudget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activite_id` int(11) NOT NULL,
  `elementPlanMensuel_id` int(11) NOT NULL,
  `libelle_ligne` varchar(100) NOT NULL,
  `montantPrevu` int(11) NOT NULL,
  `montantExecute` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_lignebudget_b9ad2a94` (`activite_id`),
  KEY `frontoffice_lignebudget_81bb03b5` (`elementPlanMensuel_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `frontoffice_lignebudget`
--

INSERT INTO `frontoffice_lignebudget` (`id`, `activite_id`, `elementPlanMensuel_id`, `libelle_ligne`, `montantPrevu`, `montantExecute`) VALUES
(1, 1, 1, 'Ligne budget depense technique', 15000000, 14000000),
(2, 2, 2, 'Voyage de formation', 10000000, 9600000);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_mois`
--

CREATE TABLE IF NOT EXISTS `frontoffice_mois` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee_id` int(11) NOT NULL,
  `code_mois` varchar(10) NOT NULL,
  `libelle_mois` varchar(20) NOT NULL,
  `etat` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_mois_191aee20` (`annee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `frontoffice_mois`
--

INSERT INTO `frontoffice_mois` (`id`, `annee_id`, `code_mois`, `libelle_mois`, `etat`) VALUES
(1, 1, 'JN2013', 'Juin', 'ouvert'),
(2, 1, 'MAI2013', 'MAI', 'ouvert'),
(3, 1, 'JL2013', 'Juillet', 'ouvert');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_monnaie`
--

CREATE TABLE IF NOT EXISTS `frontoffice_monnaie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_devise` varchar(20) NOT NULL,
  `signe` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frontoffice_monnaie`
--

INSERT INTO `frontoffice_monnaie` (`id`, `nom_devise`, `signe`) VALUES
(1, 'Franc CFA', 'F CFA');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_operation`
--

CREATE TABLE IF NOT EXISTS `frontoffice_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_operation` varchar(100) NOT NULL,
  `date_operation` date NOT NULL,
  `somme_operation` int(11) NOT NULL,
  `ligne_budget_id` int(11) NOT NULL,
  `memo` varchar(100) NOT NULL,
  `reference_paiement` varchar(50) NOT NULL,
  `numRecu` int(11) NOT NULL,
  `type_operation` varchar(20) NOT NULL,
  `type_operation_bancaire` varchar(10) NOT NULL,
  `reference_operation` varchar(50) NOT NULL,
  `soumission` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_operation_e7f4e6b6` (`ligne_budget_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `frontoffice_operation`
--

INSERT INTO `frontoffice_operation` (`id`, `libelle_operation`, `date_operation`, `somme_operation`, `ligne_budget_id`, `memo`, `reference_paiement`, `numRecu`, `type_operation`, `type_operation_bancaire`, `reference_operation`, `soumission`) VALUES
(1, 'Demarche papiers et titre de voyage', '2013-06-03', 500000, 2, 'passport, visites medicales...', 'RFT-1223', 123, 'Caisse', 'Virement', '123-TRE', 'Validée'),
(2, 'Achat billets pour voyage', '2013-06-24', 3500000, 2, 'air france', 'EDS-122', 954, 'Banque', 'Cheque', '1234-4432-433', 'Validée'),
(3, 'Reservation hotel Las grandes villas des reposs', '2013-06-24', 4000000, 2, 'paiement a lavance', 'HT-SDS', 987, 'Banque', 'Virement', '123455667-GFD', 'Rejettée'),
(4, 'Prospection marché des distributeurs', '2013-06-24', 30000, 1, 'visites, contacts des grands fournisseurs', '121-REZZ', 8888, 'Caisse', 'Cheque', '0987654', 'Validée'),
(5, 'Achats serveurs intel px-12', '2013-06-06', 5000000, 1, 'icore7, 64go ram, disk ssd 1To', 'ZEZEEDS-122', 5555, 'Banque', 'Virement', 'MLKJG-4332-TRE', 'En attente'),
(6, 'Demarche papiers et titre de voyage', '2013-06-24', 3500000, 1, 'icore7, 64go ram, disk ssd 1To', 'RFT-1223', 123, 'Caisse', 'Virement', '1234-4432-433', 'Brouillon'),
(7, 'Disque dur 2To', '2013-06-03', 1234000, 1, 'rien', 'HT-SDS', 8888, 'Caisse', 'Virement', '123455667-GFD', 'Brouillon'),
(8, 'Achats imprimante ', '2013-06-27', 250000, 2, 'rien', 'AAZAZ-123', 123456, 'Caisse', 'Virement', '123455667-GFD', 'Brouillon');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_planannuel`
--

CREATE TABLE IF NOT EXISTS `frontoffice_planannuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_annee` varchar(20) NOT NULL,
  `code_annee` varchar(10) NOT NULL,
  `budgetProjet_id` int(11) NOT NULL,
  `montant_total_prevu` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budgetProjet_id` (`budgetProjet_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frontoffice_planannuel`
--

INSERT INTO `frontoffice_planannuel` (`id`, `libelle_annee`, `code_annee`, `budgetProjet_id`, `montant_total_prevu`) VALUES
(1, 'PlanAnnée 2013', 'PA2013', 1, 90000000);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_planmensuel`
--

CREATE TABLE IF NOT EXISTS `frontoffice_planmensuel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mois_id` int(11) NOT NULL,
  `annee_comptable_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `frontoffice_planmensuel_205570b8` (`mois_id`),
  KEY `frontoffice_planmensuel_7f7e5987` (`annee_comptable_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frontoffice_planmensuel`
--

INSERT INTO `frontoffice_planmensuel` (`id`, `mois_id`, `annee_comptable_id`, `code`, `libelle`) VALUES
(1, 1, 1, 'CPMJUIN2013', 'Libelle du mois de juin');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_profile`
--

CREATE TABLE IF NOT EXISTS `frontoffice_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pays_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `frontoffice_profile_4c751342` (`pays_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `frontoffice_profile`
--

INSERT INTO `frontoffice_profile` (`id`, `user_id`, `pays_id`) VALUES
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_projet`
--

CREATE TABLE IF NOT EXISTS `frontoffice_projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_de_code` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `frontoffice_projet`
--

INSERT INTO `frontoffice_projet` (`id`, `nom_de_code`) VALUES
(1, 'Developpement des TIC');

-- --------------------------------------------------------

--
-- Table structure for table `frontoffice_themes`
--

CREATE TABLE IF NOT EXISTS `frontoffice_themes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_theme` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `frontoffice_themes`
--

INSERT INTO `frontoffice_themes` (`id`, `libelle_theme`) VALUES
(2, 'Participation politique'),
(3, 'Sensibilisation du public & renforcement de la coalition'),
(4, 'Initiatives de recherche, de suivi et de plaidoyer de haut niveau'),
(5, 'Apprentissage transfrontalier et création de réseaux pour le changement ');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `frontoffice_activiteb`
--
ALTER TABLE `frontoffice_activiteb`
  ADD CONSTRAINT `theme_id_refs_id_a0d8e856` FOREIGN KEY (`theme_id`) REFERENCES `frontoffice_themes` (`id`);

--
-- Constraints for table `frontoffice_budgetprojet`
--
ALTER TABLE `frontoffice_budgetprojet`
  ADD CONSTRAINT `project_id_refs_id_c35f06a9` FOREIGN KEY (`project_id`) REFERENCES `frontoffice_projet` (`id`);

--
-- Constraints for table `frontoffice_countriesinfos`
--
ALTER TABLE `frontoffice_countriesinfos`
  ADD CONSTRAINT `currency_id_refs_id_303bd609` FOREIGN KEY (`currency_id`) REFERENCES `frontoffice_monnaie` (`id`),
  ADD CONSTRAINT `langue_id_refs_id_404c5be8` FOREIGN KEY (`langue_id`) REFERENCES `frontoffice_langue` (`id`);

--
-- Constraints for table `frontoffice_elementmensuel`
--
ALTER TABLE `frontoffice_elementmensuel`
  ADD CONSTRAINT `planmensuel_id_refs_id_d3311dd9` FOREIGN KEY (`planmensuel_id`) REFERENCES `frontoffice_planmensuel` (`id`);

--
-- Constraints for table `frontoffice_lignebudget`
--
ALTER TABLE `frontoffice_lignebudget`
  ADD CONSTRAINT `activite_id_refs_id_ffc9f9c8` FOREIGN KEY (`activite_id`) REFERENCES `frontoffice_activiteb` (`id`),
  ADD CONSTRAINT `elementPlanMensuel_id_refs_id_e689fa95` FOREIGN KEY (`elementPlanMensuel_id`) REFERENCES `frontoffice_elementmensuel` (`id`);

--
-- Constraints for table `frontoffice_mois`
--
ALTER TABLE `frontoffice_mois`
  ADD CONSTRAINT `annee_id_refs_id_5384a4d0` FOREIGN KEY (`annee_id`) REFERENCES `frontoffice_anneecomptable` (`id`);

--
-- Constraints for table `frontoffice_operation`
--
ALTER TABLE `frontoffice_operation`
  ADD CONSTRAINT `ligne_budget_id_refs_id_0404be4c` FOREIGN KEY (`ligne_budget_id`) REFERENCES `frontoffice_lignebudget` (`id`);

--
-- Constraints for table `frontoffice_planannuel`
--
ALTER TABLE `frontoffice_planannuel`
  ADD CONSTRAINT `budgetProjet_id_refs_id_61dc5984` FOREIGN KEY (`budgetProjet_id`) REFERENCES `frontoffice_budgetprojet` (`id`);

--
-- Constraints for table `frontoffice_planmensuel`
--
ALTER TABLE `frontoffice_planmensuel`
  ADD CONSTRAINT `annee_comptable_id_refs_id_59e9d579` FOREIGN KEY (`annee_comptable_id`) REFERENCES `frontoffice_planannuel` (`id`),
  ADD CONSTRAINT `mois_id_refs_id_8c196995` FOREIGN KEY (`mois_id`) REFERENCES `frontoffice_mois` (`id`);

--
-- Constraints for table `frontoffice_profile`
--
ALTER TABLE `frontoffice_profile`
  ADD CONSTRAINT `pays_id_refs_id_7667080b` FOREIGN KEY (`pays_id`) REFERENCES `frontoffice_countriesinfos` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4b6bf90a` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
