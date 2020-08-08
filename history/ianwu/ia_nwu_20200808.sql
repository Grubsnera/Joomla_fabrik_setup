
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ia_nwu`
--
CREATE DATABASE IF NOT EXISTS `Ia_nwu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `Ia_nwu`;

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment`
--

CREATE TABLE `ia_assignment` (
  `ia_assi_auto` int(11) NOT NULL,
  `ia_assi_loaddate` datetime NOT NULL,
  `ia_assi_year` int(4) NOT NULL,
  `ia_assi_period` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assitype_auto` int(11) NOT NULL,
  `ia_assiorig_auto` int(11) NOT NULL,
  `ia_assisite_auto` int(11) NOT NULL,
  `ia_assicate_auto` int(11) NOT NULL,
  `ia_assirepo_auto` int(11) NOT NULL,
  `ia_assistat_auto` int(11) NOT NULL,
  `ia_user_numb` int(11) NOT NULL,
  `ia_assi_priority` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assi_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assi_desc` mediumtext COLLATE utf8mb4_unicode_ci,
  `ia_assi_report` mediumtext COLLATE utf8mb4_unicode_ci,
  `ia_assi_startdate` datetime DEFAULT NULL,
  `ia_assi_completedate` datetime DEFAULT NULL,
  `ia_assi_findingdate` datetime DEFAULT NULL,
  `ia_assi_proofdate` datetime DEFAULT NULL,
  `ia_assi_commentdate` datetime DEFAULT NULL,
  `ia_assi_finishdate` datetime DEFAULT NULL,
  `ia_assi_createdate` datetime DEFAULT NULL,
  `ia_assi_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assi_editdate` datetime DEFAULT NULL,
  `ia_assi_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store assignments';

--
-- Dumping data for table `ia_assignment`
--

INSERT INTO `ia_assignment` (`ia_assi_auto`, `ia_assi_loaddate`, `ia_assi_year`, `ia_assi_period`, `ia_assitype_auto`, `ia_assiorig_auto`, `ia_assisite_auto`, `ia_assicate_auto`, `ia_assirepo_auto`, `ia_assistat_auto`, `ia_user_numb`, `ia_assi_priority`, `ia_assi_name`, `ia_assi_desc`, `ia_assi_report`, `ia_assi_startdate`, `ia_assi_completedate`, `ia_assi_findingdate`, `ia_assi_proofdate`, `ia_assi_commentdate`, `ia_assi_finishdate`, `ia_assi_createdate`, `ia_assi_createby`, `ia_assi_editdate`, `ia_assi_editby`, `report_period`) VALUES
(14, '2020-01-01 00:00:00', 2020, '', 9, 3, 1, 1, 2, 2, 874, '9', 'KFS Creditor payment tests', '', '', '2020-01-01 00:00:00', '2020-12-31 00:00:00', '2020-08-06 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2020-05-13 08:23:00', '21162395', '2020-08-07 05:35:08', 'Albertjvr', NULL),
(15, '2020-07-01 00:00:00', 2020, '1 January 2020 - 31 December 2020', 6, 1, 1, 1, 1, 2, 855, '3', 'Election senate from support staff (2.9.3.8eln)', '', '', '2020-07-01 00:00:00', '2020-07-23 00:00:00', '2020-07-22 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2020-07-22 14:20:00', '21162395', '2020-08-06 15:25:27', 'Albertjvr', '');

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_category`
--

CREATE TABLE `ia_assignment_category` (
  `ia_assicate_auto` int(11) NOT NULL,
  `ia_assicate_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assicate_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_assicate_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assicate_private` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assicate_from` datetime NOT NULL,
  `ia_assicate_to` datetime NOT NULL,
  `ia_assicate_createdate` datetime DEFAULT NULL,
  `ia_assicate_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assicate_editdate` datetime DEFAULT NULL,
  `ia_assicate_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store assignment categories';

--
-- Dumping data for table `ia_assignment_category`
--

INSERT INTO `ia_assignment_category` (`ia_assicate_auto`, `ia_assicate_name`, `ia_assicate_desc`, `ia_assicate_active`, `ia_assicate_private`, `ia_assicate_from`, `ia_assicate_to`, `ia_assicate_createdate`, `ia_assicate_createby`, `ia_assicate_editdate`, `ia_assicate_editby`) VALUES
(1, 'Assignment', 'Audit assignment', '1', '0', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', NULL, NULL),
(2, 'Administration', 'Office administration', '1', '0', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', NULL, NULL),
(3, 'Private', 'Private work', '1', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', NULL, NULL),
(4, 'Consultation', 'Consultation work', '1', '0', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', NULL, NULL),
(5, 'Development', 'Software development', '1', '0', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', NULL, NULL),
(6, 'Elections', 'Election work', '1', '0', '2020-01-01 00:00:00', '2099-12-31 00:00:00', '2020-07-23 12:28:00', 'Albertjvr', '2020-07-23 12:28:50', 'Albertjvr');

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_origin`
--

CREATE TABLE `ia_assignment_origin` (
  `ia_assiorig_auto` int(11) NOT NULL,
  `ia_assiorig_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assiorig_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_assiorig_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assiorig_from` datetime NOT NULL,
  `ia_assiorig_to` datetime NOT NULL,
  `ia_assiorig_createdate` datetime DEFAULT NULL,
  `ia_assiorig_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assiorig_editdate` datetime DEFAULT NULL,
  `ia_assiorig_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store assignment origins';

--
-- Dumping data for table `ia_assignment_origin`
--

INSERT INTO `ia_assignment_origin` (`ia_assiorig_auto`, `ia_assiorig_name`, `ia_assiorig_desc`, `ia_assiorig_active`, `ia_assiorig_from`, `ia_assiorig_to`, `ia_assiorig_createdate`, `ia_assiorig_createby`, `ia_assiorig_editdate`, `ia_assiorig_editby`) VALUES
(1, 'Adhoc', 'Adhoc assignments', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL),
(2, 'Administration', 'Admin tasks', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL),
(3, 'Audit plan', 'Audit plan tasks', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL),
(4, 'Other', 'Non audit tasks', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL),
(5, 'Management', 'Tasks requested by management', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL),
(6, 'Anonymous', 'Reporting box', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL),
(7, 'Risk', 'Risk register', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:06', 'Python', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_report`
--

CREATE TABLE `ia_assignment_report` (
  `ia_assirepo_auto` int(11) NOT NULL,
  `ia_assirepo_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assirepo_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_assirepo_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assirepo_from` datetime NOT NULL,
  `ia_assirepo_to` datetime NOT NULL,
  `ia_assirepo_createdate` datetime DEFAULT NULL,
  `ia_assirepo_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assirepo_editdate` datetime DEFAULT NULL,
  `ia_assirepo_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store assignment report to whom';

--
-- Dumping data for table `ia_assignment_report`
--

INSERT INTO `ia_assignment_report` (`ia_assirepo_auto`, `ia_assirepo_name`, `ia_assirepo_desc`, `ia_assirepo_active`, `ia_assirepo_from`, `ia_assirepo_to`, `ia_assirepo_createdate`, `ia_assirepo_createby`, `ia_assirepo_editdate`, `ia_assirepo_editby`) VALUES
(1, 'Client', 'Report to client', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:09', 'Python', NULL, NULL),
(2, 'Audit committee', 'Report to audit committee', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:09', 'Python', NULL, NULL),
(3, 'Management', 'Report to institutional management', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:09', 'Python', NULL, NULL),
(4, 'Line manager', 'Report to line manager', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:09', 'Python', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_site`
--

CREATE TABLE `ia_assignment_site` (
  `ia_assisite_auto` int(11) NOT NULL,
  `ia_assisite_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assisite_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_assisite_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assisite_from` datetime NOT NULL,
  `ia_assisite_to` datetime NOT NULL,
  `ia_assisite_createdate` datetime DEFAULT NULL,
  `ia_assisite_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assisite_editdate` datetime DEFAULT NULL,
  `ia_assisite_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store the assignment site or location';

--
-- Dumping data for table `ia_assignment_site`
--

INSERT INTO `ia_assignment_site` (`ia_assisite_auto`, `ia_assisite_name`, `ia_assisite_desc`, `ia_assisite_active`, `ia_assisite_from`, `ia_assisite_to`, `ia_assisite_createdate`, `ia_assisite_createby`, `ia_assisite_editdate`, `ia_assisite_editby`) VALUES
(1, 'Nwu', 'NWU Organization', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:07', 'Python', NULL, NULL),
(2, 'Nwu Potchefstroom', 'Potchefstroom Campus', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:07', 'Python', NULL, NULL),
(3, 'Nwu Mafikeng', 'Mafikeng Campus', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:07', 'Python', NULL, NULL),
(4, 'Nwu Vaal', 'Vaal Triangle Campus', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:07', 'Python', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_status`
--

CREATE TABLE `ia_assignment_status` (
  `ia_assistat_auto` int(11) NOT NULL,
  `ia_assicate_auto` int(11) NOT NULL,
  `ia_assistat_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assistat_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_assistat_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assistat_from` datetime NOT NULL,
  `ia_assistat_to` datetime NOT NULL,
  `ia_assistat_createdate` datetime DEFAULT NULL,
  `ia_assistat_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assistat_editdate` datetime DEFAULT NULL,
  `ia_assistat_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store the assignment status';

--
-- Dumping data for table `ia_assignment_status`
--

INSERT INTO `ia_assignment_status` (`ia_assistat_auto`, `ia_assicate_auto`, `ia_assistat_name`, `ia_assistat_desc`, `ia_assistat_active`, `ia_assistat_from`, `ia_assistat_to`, `ia_assistat_createdate`, `ia_assistat_createby`, `ia_assistat_editdate`, `ia_assistat_editby`) VALUES
(1, 1, '00 Deferred', 'Assignment deferred to a later period.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(2, 1, '00 Not started', 'Assignment not yet started.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(3, 1, '01 In progress', 'Assignment started and is in progress.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(4, 1, '10 Planning', 'Assignment in planning phase.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(5, 1, '50 Fieldwork phase', 'Assignment at fieldwork phase.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(6, 1, '80 Draft report', 'Assignment at draft report stage.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(7, 1, '85 Awaiting client', 'Waiting for client for reason specified in notes.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(8, 1, '90 Management comment', 'Waiting for client to deliver management comments.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(9, 1, '95 Client Satisfaction Survey', 'Waiting for client to complete client satisfaction survey.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(10, 1, '99 Completed', 'Assignment completed.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(11, 2, '0 Deferred', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(12, 2, '0 Not started', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(13, 2, '1 Planning', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(14, 2, '2 Meeting', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(15, 2, '3 Fieldwork', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(16, 2, '4 Reporting', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(17, 2, '9 Completed', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(18, 3, 'Private', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(19, 4, '0 Deferred', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(20, 4, '0 Not started', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(21, 4, '1 Planning', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(22, 4, '2 Meeting', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(23, 4, '3 Fieldwork', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(24, 4, '4 Reporting', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(25, 4, '9 Completed', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(26, 5, '0 Deferred', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(27, 5, '0 Not started', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(28, 5, '1 Administration', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(29, 5, '2 Planning', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(30, 5, '3 Fieldwork', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(31, 5, '4 Reporting', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL),
(32, 5, '9 Completed', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:04', 'Python', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_test`
--

CREATE TABLE `ia_assignment_test` (
  `ia_assi_auto` int(11) NOT NULL,
  `ia_assi_loaddate` datetime NOT NULL,
  `ia_assi_year` int(4) NOT NULL,
  `ia_assitype_auto` int(11) NOT NULL,
  `ia_assiorig_auto` int(11) NOT NULL,
  `ia_assisite_auto` int(11) NOT NULL,
  `ia_assicate_auto` int(11) NOT NULL,
  `ia_assirepo_auto` int(11) NOT NULL,
  `ia_assistat_auto` int(11) NOT NULL,
  `ia_user_name` int(11) NOT NULL,
  `ia_assi_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assi_priority` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assi_startdate` datetime DEFAULT NULL,
  `ia_assi_completedate` datetime DEFAULT NULL,
  `ia_assi_findingdate` datetime DEFAULT NULL,
  `ia_assi_proofdate` datetime DEFAULT NULL,
  `ia_assi_commentdate` datetime DEFAULT NULL,
  `ia_assi_finishdate` datetime DEFAULT NULL,
  `ia_assi_createdate` datetime DEFAULT NULL,
  `ia_assi_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assi_editdate` datetime DEFAULT NULL,
  `ia_assi_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ia_assignment_type`
--

CREATE TABLE `ia_assignment_type` (
  `ia_assitype_auto` int(11) NOT NULL,
  `ia_assicate_auto` int(11) NOT NULL,
  `ia_assitype_file` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assitype_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assitype_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_assitype_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_assitype_from` datetime NOT NULL,
  `ia_assitype_to` datetime NOT NULL,
  `ia_assitype_createdate` datetime DEFAULT NULL,
  `ia_assitype_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_assitype_editdate` datetime DEFAULT NULL,
  `ia_assitype_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store the assignment types';

--
-- Dumping data for table `ia_assignment_type`
--

INSERT INTO `ia_assignment_type` (`ia_assitype_auto`, `ia_assicate_auto`, `ia_assitype_file`, `ia_assitype_name`, `ia_assitype_desc`, `ia_assitype_active`, `ia_assitype_from`, `ia_assitype_to`, `ia_assitype_createdate`, `ia_assitype_createby`, `ia_assitype_editdate`, `ia_assitype_editby`) VALUES
(1, 1, '2.9.3.3.', 'Followup audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(2, 1, '2.9.3.4.', 'Assurance audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(3, 1, '2.9.3.5.', 'Adhoc audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(4, 1, '2.9.3.6.', 'Special Investigation audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(5, 1, '2.9.3.7.', 'Compliance audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(6, 1, '2.9.3.8.', 'Verification audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(7, 1, '2.9.3.9.', 'Yearend audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(8, 1, '2.9.3.10.', 'Significant Finding audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(9, 1, '2.9.3.12.', 'Continuous audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(10, 1, '2.9.3.13.', 'IT audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(11, 2, '', 'Collegue support', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(12, 2, '', 'Event organization', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(13, 2, '', 'File review', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(14, 2, '', 'Filing', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(15, 2, '', 'Finance', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(16, 2, '', 'General', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(17, 2, '', 'Hardware support', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(18, 2, '', 'Leave afternoon', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(19, 2, '', 'Leave all other', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(20, 2, '', 'Management review', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(21, 2, '', 'Meeting management', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(22, 2, '', 'Meeting office', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(23, 2, '', 'Social', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(24, 2, '', 'Software support', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(25, 2, '', 'Training prepare', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(26, 2, '', 'Training present', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(27, 2, '', 'Training receive', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(28, 2, '', 'Travel', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(29, 2, '', 'Tender', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(30, 3, '', 'Afternoon', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(31, 3, '', 'Break', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(32, 3, '', 'Family', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(33, 3, '', 'Leave', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(34, 3, '', 'Lunch', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(35, 3, '', 'Medical', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(36, 3, '', 'Other', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(37, 3, '', 'Private', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(38, 3, '', 'Social', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(39, 3, '', 'Telephone', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(40, 4, '', 'External', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(41, 4, '', 'Internal', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(42, 5, '', 'Audit tests', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(43, 5, '', 'Data manipulation', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(44, 5, '', 'Software inhouse', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL),
(45, 5, '', 'Software audit', '', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:02', 'Python', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding`
--

CREATE TABLE `ia_finding` (
  `ia_find_auto` int(11) NOT NULL,
  `ia_assi_auto` int(11) NOT NULL,
  `ia_user_numb` int(11) NOT NULL,
  `ia_find_date` datetime NOT NULL,
  `ia_find_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_pare` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_list` text,
  `ia_find_disp` text,
  `ia_find_edit` text,
  `ia_find_detl` text,
  `ia_findstat_auto` int(11) NOT NULL,
  `ia_findrate_auto` int(11) NOT NULL,
  `ia_find_stat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_stattext` text,
  `ia_find_mailfrom` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_updated` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_updatedate` datetime DEFAULT NULL,
  `ia_find_cron` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_criteria` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_condition` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_effect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_cause` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_risk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_recommend` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_find_r1_mailflag` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ia_find_r1_maildate` datetime DEFAULT NULL,
  `ia_find_r1_mailto` int(11) DEFAULT NULL,
  `ia_find_r1_send` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ia_find_r1_opendate` datetime DEFAULT NULL,
  `ia_find_r1_respauto` int(11) DEFAULT NULL,
  `ia_find_r1_respcomm` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ia_find_r1_respresp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ia_find_r1_respacti` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ia_find_r1_respactd` datetime DEFAULT NULL,
  `ia_find_r1_respdate` datetime DEFAULT NULL,
  `ia_find_r1_audicomm` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ia_find_createdate` datetime NOT NULL,
  `ia_find_createby` int(11) NOT NULL,
  `ia_find_editdate` datetime NOT NULL,
  `ia_find_editby` int(11) NOT NULL,
  `ia_findcont_auto` int(11) NOT NULL,
  `ia_findcalc_auto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store audit findings';

--
-- Dumping data for table `ia_finding`
--

INSERT INTO `ia_finding` (`ia_find_auto`, `ia_assi_auto`, `ia_user_numb`, `ia_find_date`, `ia_find_name`, `ia_find_pare`, `ia_find_list`, `ia_find_disp`, `ia_find_edit`, `ia_find_detl`, `ia_findstat_auto`, `ia_findrate_auto`, `ia_find_stat`, `ia_find_stattext`, `ia_find_mailfrom`, `ia_find_updated`, `ia_find_updatedate`, `ia_find_cron`, `ia_find_desc`, `ia_find_criteria`, `ia_find_condition`, `ia_find_effect`, `ia_find_cause`, `ia_find_risk`, `ia_find_recommend`, `ia_find_r1_mailflag`, `ia_find_r1_maildate`, `ia_find_r1_mailto`, `ia_find_r1_send`, `ia_find_r1_opendate`, `ia_find_r1_respauto`, `ia_find_r1_respcomm`, `ia_find_r1_respresp`, `ia_find_r1_respacti`, `ia_find_r1_respactd`, `ia_find_r1_respdate`, `ia_find_r1_audicomm`, `ia_find_createdate`, `ia_find_createby`, `ia_find_editdate`, `ia_find_editby`, `ia_findcont_auto`, `ia_findcalc_auto`) VALUES
(8, 14, 874, '2020-08-07 00:00:00', 'Test audit finding', '', '{\"label\":\"Parent list of all findings\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\"}', '{\"label\":\"Audit finding detail\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/details\\/28\\/0\"}', '{\"label\":\"reply to audit finding\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/form\\/28\\/0\"}', '{\"label\":\"\",\"link\":\"http:\\/\\/\"}', 1, 1, '1', '1 Open', '1', '1', '2020-07-22 00:00:00', '0', 'This is the description.', 'Criteria', 'Condition', 'Effect', 'Cause', 'Risk', 'Recommendation\r\n1. asdijfh wf  wfij  awij f a.\r\n2. jau hsfv noism sokjv uiose gvfojsrgfn fvjniuerf nv irvj .\r\n3. oiuajnariuh,mk ndciuj iuw ciu h fcwihc dcuy uwyh vwcfw.', '0', '2020-08-06 00:00:00', 855, '1', '0000-00-00 00:00:00', 1, '', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 855, '0000-00-00 00:00:00', 842, 6, NULL),
(9, 15, 855, '2020-07-22 00:00:00', 'Test audit finding', '', '{\"label\":\"Parent list of all findings\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\"}', '{\"label\":\"Audit finding detail\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/details\\/28\\/0\"}', '{\"label\":\"reply to audit finding\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/form\\/28\\/0\"}', '{\"label\":\"\",\"link\":\"http:\\/\\/\"}', 1, 1, '1', '1 Open', '1', '1', '2020-07-22 00:00:00', '0', 'This is the description.', 'Criteria', 'Condition', 'Effect', 'Cause', 'Risk', 'Recommendation\r\n1. asdijfh wf  wfij  awij f a.\r\n2. jau hsfv noism sokjv uiose gvfojsrgfn fvjniuerf nv irvj .\r\n3. oiuajnariuh,mk ndciuj iuw ciu h fcwihc dcuy uwyh vwcfw.', '1', '2020-08-08 00:00:00', 855, '1', '0000-00-00 00:00:00', 1, '', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 855, '0000-00-00 00:00:00', 842, 6, NULL),
(10, 14, 874, '2020-08-06 00:00:00', 'Test', '', '{\"label\":\"Parent list of all findings\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\"}', '{\"label\":\"Audit finding detail\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/details\\/28\\/0\"}', '{\"label\":\"reply to audit finding\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/form\\/28\\/0\"}', '{\"label\":\"\",\"link\":\"http:\\/\\/\"}', 2, 1, '1', '1 Open', '1', '1', '2020-08-06 00:00:00', '0', '', '', '', '', '', '', '', '0', '2020-08-06 00:00:00', NULL, '0', '0000-00-00 00:00:00', 0, '', NULL, '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', 842, '0000-00-00 00:00:00', 842, 6, NULL),
(11, 14, 874, '2020-08-06 00:00:00', 'Test finding', '', '{\"label\":\"Parent list of all findings\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\"}', '{\"label\":\"Audit finding detail\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/details\\/28\\/0\"}', '{\"label\":\"reply to audit finding\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/form\\/28\\/0\"}', '{\"label\":\"\",\"link\":\"http:\\/\\/\"}', 1, 1, '0', '1 Open', '1', '1', '2020-08-06 00:00:00', '0', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 842, '0000-00-00 00:00:00', 842, 6, NULL),
(12, 14, 874, '2020-08-07 00:00:00', 'Test', '', '{\"label\":\"Parent list of all findings\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\"}', '{\"label\":\"Audit finding detail\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/details\\/28\\/0\"}', '{\"label\":\"reply to audit finding\",\"link\":\"http:\\/\\/ia-nwu.co.za\\/index.php\\/menu-main-find-clie\\/form\\/28\\/0\"}', '{\"label\":\"\",\"link\":\"http:\\/\\/\"}', 1, 1, '0', '1 Open', '1', '1', '2020-08-07 00:00:00', '0', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 842, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding_5`
--

CREATE TABLE `ia_finding_5` (
  `ia_find_auto` int(11) DEFAULT NULL,
  `ia_find5_auto` int(11) NOT NULL,
  `ia_find5_campus` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_month` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_current` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_vss_tran_dt` decimal(20,2) DEFAULT NULL,
  `ia_find5_vss_tran_ct` decimal(20,2) DEFAULT NULL,
  `ia_find5_vss_tran` decimal(20,2) DEFAULT NULL,
  `ia_find5_vss_runbal` decimal(20,2) DEFAULT NULL,
  `ia_find5_gl_tran` decimal(20,2) DEFAULT NULL,
  `ia_find5_gl_runbal` decimal(20,2) DEFAULT NULL,
  `ia_find5_diff` decimal(20,2) DEFAULT NULL,
  `ia_find5_move` decimal(20,2) DEFAULT NULL,
  `ia_find5_officer_camp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_officer_name_camp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_officer_mail_camp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_officer_org` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_officer_name_org` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_officer_mail_org` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_supervisor_camp` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_supervisor_name_camp` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_supervisor_mail_camp` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_supervisor_org` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_supervisor_name_org` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find5_supervisor_mail_org` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store vss and gl monthly balances';

--
-- Table structure for table `ia_finding_6`
--

CREATE TABLE `ia_finding_6` (
  `ia_find_auto` int(11) DEFAULT NULL,
  `ia_find6_auto` int(11) NOT NULL,
  `ia_find6_campus` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_month` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_trancode` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_vss_description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_vss_amount` decimal(20,2) DEFAULT NULL,
  `ia_find6_gl_description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_gl_amount` decimal(20,2) DEFAULT NULL,
  `ia_find6_diff` decimal(20,2) DEFAULT NULL,
  `ia_find6_matched` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_period` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_find6_current` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store vss and gl monthly comparisons';

--
-- Table structure for table `ia_finding_attach`
--

CREATE TABLE `ia_finding_attach` (
  `ia_findatta_auto` int(11) NOT NULL,
  `ia_find_auto` int(11) NOT NULL,
  `ia_findatta_acce` int(1) NOT NULL,
  `ia_findatta_date` datetime NOT NULL,
  `ia_findatta_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findatta_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_findatta_atta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findatta_createdate` datetime DEFAULT NULL,
  `ia_findatta_createby` int(11) DEFAULT NULL,
  `ia_findatta_editdate` datetime DEFAULT NULL,
  `ia_findatta_editby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store finding attachments';

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding_control`
--

CREATE TABLE `ia_finding_control` (
  `ia_findcont_auto` int(11) NOT NULL,
  `ia_findcont_name` varchar(50) NOT NULL,
  `ia_findcont_desc` text NOT NULL,
  `ia_findcont_value` decimal(4,2) NOT NULL,
  `ia_findcont_active` text NOT NULL,
  `ia_findcont_from` datetime NOT NULL,
  `ia_findcont_to` datetime NOT NULL,
  `ia_findcont_createdate` datetime NOT NULL,
  `ia_findcont_createby` int(11) NOT NULL,
  `ia_findcont_editdate` datetime NOT NULL,
  `ia_findcont_editby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store audit finding control values';

--
-- Dumping data for table `ia_finding_control`
--

INSERT INTO `ia_finding_control` (`ia_findcont_auto`, `ia_findcont_name`, `ia_findcont_desc`, `ia_findcont_value`, `ia_findcont_active`, `ia_findcont_from`, `ia_findcont_to`, `ia_findcont_createdate`, `ia_findcont_createby`, `ia_findcont_editdate`, `ia_findcont_editby`) VALUES
(1, 'No value', '', 0.00, '1', '2020-07-31 22:00:00', '2099-12-30 22:00:00', '0000-00-00 00:00:00', 842, '0000-00-00 00:00:00', 842),
(2, 'Highly effective', 'The control measure effectively addresses the risk. The design of the control measure is excellent, well documented and is fully being applied and being complied with.', 0.10, '1', '2020-08-05 22:00:00', '2099-12-30 22:00:00', '2020-08-05 22:00:00', 854, '0000-00-00 00:00:00', 0),
(3, 'Good', 'An adequate and acceptable level of control exists. The control measure is adequately designed and is effectively being applied & being complied with. Minimal improvements are required.', 0.25, '1', '2020-08-06 00:00:00', '2099-12-31 00:00:00', '2020-08-06 00:00:00', 854, '0000-00-00 00:00:00', 0),
(4, 'Satisfactory', 'A satisfactory level of control exists. The control measure largely addresses the risk. There is room for improvement regarding its design and / or the effectiveness of its application, enforcement or compliance.', 0.50, '1', '2020-08-06 00:00:00', '2099-12-31 00:00:00', '2020-08-06 00:00:00', 854, '0000-00-00 00:00:00', 0),
(5, 'Requires improvement', 'The operation of correctly designed control is not effective and / or the operation of incorrectly designed control may be good but is still not effective in managing the risk and requires improvement.', 0.80, '1', '2020-08-06 00:00:00', '2099-12-31 00:00:00', '2020-08-06 00:00:00', 854, '0000-00-00 00:00:00', 0),
(6, 'Inadequite', 'There is no confidence that any degree of control is being achieved due to very limited operational effectiveness.', 0.90, '1', '2020-08-06 00:00:00', '2099-12-31 00:00:00', '2020-08-06 00:00:00', 854, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding_likelihood`
--

CREATE TABLE `ia_finding_likelihood` (
  `ia_findlike_auto` int(11) NOT NULL,
  `ia_findlike_name` varchar(50) NOT NULL,
  `ia_findlike_desc` text NOT NULL,
  `ia_findlike_value` text NOT NULL,
  `ia_findlike_active` text NOT NULL,
  `ia_findlike_from` datetime NOT NULL,
  `ia_findlike_to` datetime NOT NULL,
  `ia_findlike_createdate` datetime NOT NULL,
  `ia_findlike_createby` int(11) NOT NULL,
  `ia_findlike_editdate` datetime NOT NULL,
  `ia_findlike_editby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store finding likelihoods';

--
-- Dumping data for table `ia_finding_likelihood`
--

INSERT INTO `ia_finding_likelihood` (`ia_findlike_auto`, `ia_findlike_name`, `ia_findlike_desc`, `ia_findlike_value`, `ia_findlike_active`, `ia_findlike_from`, `ia_findlike_to`, `ia_findlike_createdate`, `ia_findlike_createby`, `ia_findlike_editdate`, `ia_findlike_editby`) VALUES
(1, 'No rating', 'No value.', '0', '1', '2019-12-31 22:00:00', '2099-12-29 22:00:00', '2020-07-29 22:00:00', 0, '2020-08-03 22:00:00', 842),
(2, 'Rare', 'Event may occur in exceptional circumstances, but there is little opportunity for it occurring.', '1', '1', '2019-12-31 22:00:00', '2099-12-29 22:00:00', '2020-07-29 22:00:00', 0, '2020-07-30 22:00:00', 0),
(3, 'Unlikely', 'Based on current information, the event is unlikely to occur although it has occurred within other organizations. ', '2', '1', '2019-12-31 22:00:00', '2099-12-30 22:00:00', '2020-07-29 22:00:00', 0, '2020-07-30 22:00:00', 0),
(4, 'Possible', 'There is a strong possibility that the event can occur at some time within the business operating environment and / or the project lifecycle.', '3', '1', '2019-12-31 22:00:00', '2099-12-30 22:00:00', '2020-07-29 22:00:00', 0, '2020-07-30 22:00:00', 0),
(5, 'Likely', 'Based on the circumstances the event is very likely to occur. It has previously occurred and holds a high risk impact.', '4', '1', '2019-12-31 22:00:00', '2099-12-30 22:00:00', '2020-07-29 22:00:00', 0, '2020-07-30 22:00:00', 0),
(6, 'Certain', 'As the circumstances which cause the risk to eventuate are almost certain to occur, the opportunity or the event to occur is very high.', '5', '1', '2019-12-31 22:00:00', '2099-12-29 22:00:00', '2020-07-29 22:00:00', 0, '2020-07-30 22:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding_rate`
--

CREATE TABLE `ia_finding_rate` (
  `ia_findrate_auto` int(11) NOT NULL,
  `ia_findrate_impact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findrate_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findrate_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_findrate_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findrate_from` datetime NOT NULL,
  `ia_findrate_to` datetime NOT NULL,
  `ia_findrate_createdate` datetime DEFAULT NULL,
  `ia_findrate_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_findrate_editdate` datetime DEFAULT NULL,
  `ia_findrate_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store finding status';

--
-- Dumping data for table `ia_finding_rate`
--

INSERT INTO `ia_finding_rate` (`ia_findrate_auto`, `ia_findrate_impact`, `ia_findrate_name`, `ia_findrate_desc`, `ia_findrate_active`, `ia_findrate_from`, `ia_findrate_to`, `ia_findrate_createdate`, `ia_findrate_createby`, `ia_findrate_editdate`, `ia_findrate_editby`) VALUES
(1, '0', 'No rating', 'No rating.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-08-04 16:57:40', 'Albertjvr'),
(2, '1', 'Positive', 'No findings based on the results of audit performed. An event that does not hold any significant and/or immediate threat to the company or project.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-08-03 12:36:25', 'Albertjvr'),
(3, '2', 'Housekeeping', 'Negligible impact on the business. An event that can be managed under normal operating conditions and which will have a minor impact on the company or project.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-07-31 15:41:35', 'Albertjvr'),
(4, '3', 'Minor', 'Minor impact on the business. An event that can be managed should it occur, but will require additional resources and management effort.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-07-31 15:42:28', 'Albertjvr'),
(5, '4', 'Significant', 'Significant impact on the business. Potentially significant risk exposure that can be endured, but may have a prolonged negative impact and extensive consequences.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-07-31 15:43:32', 'Albertjvr'),
(6, '5', 'Critical', 'Critical impact on the business. Report to audit committee. A risk that is potentially disastrous to the company and that could fundamentally hinder the achievement of its objectives and ultimately lead to the collapse of the business or project.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-07-31 15:45:07', 'Albertjvr');

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding_response`
--

CREATE TABLE `ia_finding_response` (
  `ia_findresp_auto` int(11) NOT NULL,
  `ia_findresp_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findresp_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findresp_from` datetime NOT NULL,
  `ia_findresp_to` datetime NOT NULL,
  `ia_findresp_flagcomm` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_labecomm` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_flagresp` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_laberesp` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_flagacti` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_labeacti` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_flagactd` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_labeactd` text COLLATE utf8mb4_unicode_ci,
  `ia_findresp_createdate` datetime DEFAULT NULL,
  `ia_findresp_createby` int(11) DEFAULT NULL,
  `ia_findresp_editdate` datetime DEFAULT NULL,
  `ia_findresp_editby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store finding responses';

--
-- Dumping data for table `ia_finding_response`
--

INSERT INTO `ia_finding_response` (`ia_findresp_auto`, `ia_findresp_name`, `ia_findresp_desc`, `ia_findresp_active`, `ia_findresp_from`, `ia_findresp_to`, `ia_findresp_flagcomm`, `ia_findresp_labecomm`, `ia_findresp_flagresp`, `ia_findresp_laberesp`, `ia_findresp_flagacti`, `ia_findresp_labeacti`, `ia_findresp_flagactd`, `ia_findresp_labeactd`, `ia_findresp_createdate`, `ia_findresp_createby`, `ia_findresp_editdate`, `ia_findresp_editby`) VALUES
(1, 'No comment', 'No comment.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '0', 'Comment', '0', 'Person responsible', '0', 'Action plan', '0', 'Action date', '2018-01-01 00:00:00', 855, '2018-11-20 08:41:24', 855),
(2, 'Please read auditors comment', 'Auditor left a note.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'Comment', '0', '', '1', 'Action', '0', '', '2018-01-01 00:00:00', 855, '2018-01-01 00:00:00', 855),
(3, 'Action will be taken', 'Action will be taken to rectify. Please specify action plan, who will be responsible, and by what date.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'Possible reason', '1', 'Person responsible', '1', 'Action plan', '1', 'Action date', '2018-01-01 00:00:00', 855, '2018-11-20 08:41:24', 855),
(4, 'Already rectified', 'The finding was already rectified.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'Possible reason', '0', '', '1', 'Rectification proof', '1', 'Date rectified', '2018-01-01 00:00:00', 855, '2018-01-01 00:00:00', 855),
(5, 'False positive', 'A false positive is an error in some evaluation process in which a condition tested for is mistakenly found to have been detected.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'How to prevent', '0', '', '0', '', '0', '', '2018-01-01 00:00:00', 855, '2018-01-01 00:00:00', 855),
(6, 'Noted', 'Took note.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'Comment', '0', '', '1', 'Action', '0', '', '2018-01-01 00:00:00', 855, '2018-01-01 00:00:00', 855),
(7, 'Other', 'Any other response.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'Comment', '0', '', '1', 'Action', '0', '', '2018-01-01 00:00:00', 855, '2018-01-01 00:00:00', 855),
(8, 'System error reported', 'A system error is the cause of this finding. It was reported.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '1', 'Possible reason', '1', 'Reported to whom', '1', 'System request', '1', 'Date reported', '2018-01-01 00:00:00', 855, '2018-11-20 08:33:06', 855);

-- --------------------------------------------------------

--
-- Table structure for table `ia_finding_status`
--

CREATE TABLE `ia_finding_status` (
  `ia_findstat_auto` int(11) NOT NULL,
  `ia_findstat_stat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findstat_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findstat_desc` text COLLATE utf8mb4_unicode_ci,
  `ia_findstat_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_findstat_from` datetime NOT NULL,
  `ia_findstat_to` datetime NOT NULL,
  `ia_findstat_createdate` datetime DEFAULT NULL,
  `ia_findstat_createby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ia_findstat_editdate` datetime DEFAULT NULL,
  `ia_findstat_editby` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store finding statuses';

--
-- Dumping data for table `ia_finding_status`
--

INSERT INTO `ia_finding_status` (`ia_findstat_auto`, `ia_findstat_stat`, `ia_findstat_name`, `ia_findstat_desc`, `ia_findstat_active`, `ia_findstat_from`, `ia_findstat_to`, `ia_findstat_createdate`, `ia_findstat_createby`, `ia_findstat_editdate`, `ia_findstat_editby`) VALUES
(1, '0', 'No status', 'No status.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:13', 'Python', NULL, NULL),
(2, '1', 'Compile', 'Compiling the audit finding.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:00', 'Python', '2020-07-22 14:39:05', 'Albertjvr'),
(3, '2', 'Check', 'Sent for approval.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:13', 'Python', NULL, NULL),
(4, '3', 'Approved', 'Approved by supervisor.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:13', 'Python', NULL, NULL),
(5, '5', 'Comment', 'Sent for commenting to responsible person.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:13', 'Python', NULL, NULL),
(6, '6', 'Review', 'For review and finalization.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:13', 'Python', NULL, NULL),
(7, '9', 'Closed', 'Finalised for reporting.', '1', '2018-01-01 00:00:00', '2099-12-31 00:00:00', '2018-12-07 06:57:13', 'Python', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ia_people`
--

CREATE TABLE `ia_people` (
  `ia_find_auto` int(11) NOT NULL,
  `people_employee_number` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `people_ass_id` int(11) DEFAULT NULL,
  `people_person_id` int(11) DEFAULT NULL,
  `people_ass_numb` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_party_id` int(11) DEFAULT NULL,
  `people_full_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_name_list` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_name_addr` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_known_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_position_full` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_date_of_birth` date DEFAULT NULL,
  `people_nationality` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_nationality_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_idno` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_passport` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_permit` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_permit_expire` date DEFAULT NULL,
  `people_tax_number` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_sex` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_marital_status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_disabled` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_race_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_race_desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_lang_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_lang_desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_int_mail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_email_address` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_curr_empl_flag` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_user_person_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_ass_start` date DEFAULT NULL,
  `people_ass_end` date DEFAULT NULL,
  `people_emp_start` date DEFAULT NULL,
  `people_emp_end` date DEFAULT NULL,
  `people_leaving_reason` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_leave_reason_descrip` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_location_description` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_org_type_desc` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_oe_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_org_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_primary_flag` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_acad_supp` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_faculty` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_division` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_employment_category` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_ass_week_len` int(2) DEFAULT NULL,
  `people_leave_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_grade` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_grade_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_grade_calc` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_position` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_position_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_job_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_job_segment_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_supervisor` int(11) DEFAULT NULL,
  `people_title_full` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_first_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_middle_names` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_last_name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_phone_work` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_phone_mobi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_phone_home` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_address_sars` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_address_post` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_address_home` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_address_othe` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_count_pos` int(11) DEFAULT NULL,
  `people_count_ass` int(11) DEFAULT NULL,
  `people_count_peo` int(11) DEFAULT NULL,
  `people_date_ass_lookup` date DEFAULT NULL,
  `people_ass_active` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_date_emp_lookup` date DEFAULT NULL,
  `people_emp_active` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_mailto` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_proposed_salary_n` decimal(12,2) DEFAULT NULL,
  `people_person_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_acc_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_acc_branch` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_acc_number` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_acc_sars` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_acc_relation` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_sec_fullpart_flag` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_initials` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `people_age` int(3) DEFAULT NULL,
  `people_month` int(2) DEFAULT NULL,
  `people_day` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store detailed people data';

--
-- Table structure for table `ia_people_struct`
--

CREATE TABLE `ia_people_struct` (
  `ia_find_auto` int(11) NOT NULL,
  `struct_employee_one` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `struct_name_list_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_known_name_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_position_full_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_location_description_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_division_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_faculty_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_email_address_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_work_one` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_mobi_one` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_home_one` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_org_name_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_grade_calc_one` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_employee_two` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_name_list_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_known_name_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_position_full_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_location_description_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_division_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_faculty_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_email_address_two` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_work_two` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_mobi_two` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_home_two` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_employee_three` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_name_list_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_known_name_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_position_full_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_location_description_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_division_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_faculty_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_email_address_three` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_work_three` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_mobi_three` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `struct_phone_home_three` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store detailed people structure data';

--
-- Table structure for table `ia_user`
--

CREATE TABLE `ia_user` (
  `ia_user_id` int(11) NOT NULL,
  `ia_user_sysid` int(11) NOT NULL,
  `ia_user_empl` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_numb` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_pass` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_mail` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_block` tinyint(4) NOT NULL,
  `ia_user_group` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_position` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_active` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ia_user_from` datetime NOT NULL,
  `ia_user_to` datetime NOT NULL,
  `ia_user_createdate` datetime NOT NULL,
  `ia_user_createby` int(11) NOT NULL,
  `ia_user_editdate` datetime NOT NULL,
  `ia_user_editby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table to store users';
--
-- Indexes for dumped tables
--

--
-- Indexes for table `ia_assignment`
--
ALTER TABLE `ia_assignment`
  ADD PRIMARY KEY (`ia_assi_auto`),
  ADD KEY `fb_order_ia_user_numb_INDEX` (`ia_user_numb`),
  ADD KEY `fb_order_ia_assi_year_INDEX` (`ia_assi_year`),
  ADD KEY `fb_order_ia_assi_name_INDEX` (`ia_assi_name`),
  ADD KEY `fb_order_ia_assi_startdate_INDEX` (`ia_assi_startdate`);

--
-- Indexes for table `ia_assignment_category`
--
ALTER TABLE `ia_assignment_category`
  ADD PRIMARY KEY (`ia_assicate_auto`),
  ADD KEY `fb_order_ia_assicate_name_INDEX` (`ia_assicate_name`),
  ADD KEY `fb_order_ia_assicate_from_INDEX` (`ia_assicate_from`);

--
-- Indexes for table `ia_assignment_origin`
--
ALTER TABLE `ia_assignment_origin`
  ADD PRIMARY KEY (`ia_assiorig_auto`),
  ADD KEY `fb_order_ia_assiorig_name_INDEX` (`ia_assiorig_name`),
  ADD KEY `fb_order_ia_assiorig_from_INDEX` (`ia_assiorig_from`);

--
-- Indexes for table `ia_assignment_report`
--
ALTER TABLE `ia_assignment_report`
  ADD PRIMARY KEY (`ia_assirepo_auto`),
  ADD KEY `fb_order_ia_assirepo_name_INDEX` (`ia_assirepo_name`),
  ADD KEY `fb_order_ia_assirepo_from_INDEX` (`ia_assirepo_from`);

--
-- Indexes for table `ia_assignment_site`
--
ALTER TABLE `ia_assignment_site`
  ADD PRIMARY KEY (`ia_assisite_auto`),
  ADD KEY `fb_order_ia_assisite_name_INDEX` (`ia_assisite_name`),
  ADD KEY `fb_order_ia_assisite_from_INDEX` (`ia_assisite_from`);

--
-- Indexes for table `ia_assignment_status`
--
ALTER TABLE `ia_assignment_status`
  ADD PRIMARY KEY (`ia_assistat_auto`),
  ADD KEY `fb_order_ia_assistat_name_INDEX` (`ia_assistat_name`),
  ADD KEY `fb_order_ia_assistat_from_INDEX` (`ia_assistat_from`),
  ADD KEY `fb_groupby_ia_assicate_auto_INDEX` (`ia_assicate_auto`);

--
-- Indexes for table `ia_assignment_test`
--
ALTER TABLE `ia_assignment_test`
  ADD PRIMARY KEY (`ia_assi_auto`);

--
-- Indexes for table `ia_assignment_type`
--
ALTER TABLE `ia_assignment_type`
  ADD PRIMARY KEY (`ia_assitype_auto`),
  ADD KEY `fb_order_ia_assitype_name_INDEX` (`ia_assitype_name`),
  ADD KEY `fb_order_ia_assitype_from_INDEX` (`ia_assitype_from`),
  ADD KEY `fb_groupby_ia_assicate_auto_INDEX` (`ia_assicate_auto`);

--
-- Indexes for table `ia_finding`
--
ALTER TABLE `ia_finding`
  ADD PRIMARY KEY (`ia_find_auto`),
  ADD KEY `fb_order_ia_find_name_INDEX` (`ia_find_name`),
  ADD KEY `fb_groupby_ia_assi_auto_INDEX` (`ia_assi_auto`),
  ADD KEY `fb_prefilter_ia_find_stat_INDEX` (`ia_find_stat`(10)),
  ADD KEY `fb_prefilter_ia_find_r1_maildate_INDEX` (`ia_find_r1_maildate`);

--
-- Indexes for table `ia_finding_5`
--
ALTER TABLE `ia_finding_5`
  ADD PRIMARY KEY (`ia_find5_auto`),
  ADD KEY `fb_order_ia_find5_campus_INDEX` (`ia_find5_campus`),
  ADD KEY `fb_order_ia_find5_month_INDEX` (`ia_find5_month`);

--
-- Indexes for table `ia_finding_6`
--
ALTER TABLE `ia_finding_6`
  ADD PRIMARY KEY (`ia_find6_auto`),
  ADD KEY `fb_order_ia_find6_campus_INDEX` (`ia_find6_campus`),
  ADD KEY `fb_order_ia_find6_month_INDEX` (`ia_find6_month`);

--
-- Indexes for table `ia_finding_attach`
--
ALTER TABLE `ia_finding_attach`
  ADD PRIMARY KEY (`ia_findatta_auto`),
  ADD KEY `fb_order_ia_findatta_date_INDEX` (`ia_findatta_date`),
  ADD KEY `fb_order_ia_findatta_name_INDEX` (`ia_findatta_name`);

--
-- Indexes for table `ia_finding_control`
--
ALTER TABLE `ia_finding_control`
  ADD PRIMARY KEY (`ia_findcont_auto`);

--
-- Indexes for table `ia_finding_likelihood`
--
ALTER TABLE `ia_finding_likelihood`
  ADD PRIMARY KEY (`ia_findlike_auto`) USING BTREE;

--
-- Indexes for table `ia_finding_rate`
--
ALTER TABLE `ia_finding_rate`
  ADD PRIMARY KEY (`ia_findrate_auto`),
  ADD KEY `fb_order_ia_findrate_name_INDEX` (`ia_findrate_name`),
  ADD KEY `fb_order_ia_findrate_from_INDEX` (`ia_findrate_from`);

--
-- Indexes for table `ia_finding_response`
--
ALTER TABLE `ia_finding_response`
  ADD PRIMARY KEY (`ia_findresp_auto`),
  ADD KEY `fb_order_ia_findresp_name_INDEX` (`ia_findresp_name`),
  ADD KEY `fb_order_ia_findresp_from_INDEX` (`ia_findresp_from`);

--
-- Indexes for table `ia_finding_status`
--
ALTER TABLE `ia_finding_status`
  ADD PRIMARY KEY (`ia_findstat_auto`),
  ADD KEY `fb_order_ia_findstat_name_INDEX` (`ia_findstat_name`),
  ADD KEY `fb_order_ia_findstat_from_INDEX` (`ia_findstat_from`);

--
-- Indexes for table `ia_people`
--
ALTER TABLE `ia_people`
  ADD PRIMARY KEY (`people_employee_number`),
  ADD KEY `fb_order_people_full_name_INDEX` (`people_full_name`),
  ADD KEY `fb_order_people_known_name_INDEX` (`people_known_name`);

--
-- Indexes for table `ia_people_struct`
--
ALTER TABLE `ia_people_struct`
  ADD PRIMARY KEY (`struct_employee_one`);

--
-- Indexes for table `ia_user`
--
ALTER TABLE `ia_user`
  ADD PRIMARY KEY (`ia_user_id`),
  ADD KEY `fb_order_ia_user_name_INDEX` (`ia_user_name`),
  ADD KEY `fb_order_ia_user_from_INDEX` (`ia_user_from`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ia_assignment`
--
ALTER TABLE `ia_assignment`
  MODIFY `ia_assi_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ia_assignment_category`
--
ALTER TABLE `ia_assignment_category`
  MODIFY `ia_assicate_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ia_assignment_origin`
--
ALTER TABLE `ia_assignment_origin`
  MODIFY `ia_assiorig_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ia_assignment_report`
--
ALTER TABLE `ia_assignment_report`
  MODIFY `ia_assirepo_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ia_assignment_site`
--
ALTER TABLE `ia_assignment_site`
  MODIFY `ia_assisite_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ia_assignment_status`
--
ALTER TABLE `ia_assignment_status`
  MODIFY `ia_assistat_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `ia_assignment_test`
--
ALTER TABLE `ia_assignment_test`
  MODIFY `ia_assi_auto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ia_assignment_type`
--
ALTER TABLE `ia_assignment_type`
  MODIFY `ia_assitype_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `ia_finding`
--
ALTER TABLE `ia_finding`
  MODIFY `ia_find_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ia_finding_5`
--
ALTER TABLE `ia_finding_5`
  MODIFY `ia_find5_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `ia_finding_6`
--
ALTER TABLE `ia_finding_6`
  MODIFY `ia_find6_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1768;

--
-- AUTO_INCREMENT for table `ia_finding_attach`
--
ALTER TABLE `ia_finding_attach`
  MODIFY `ia_findatta_auto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ia_finding_control`
--
ALTER TABLE `ia_finding_control`
  MODIFY `ia_findcont_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ia_finding_likelihood`
--
ALTER TABLE `ia_finding_likelihood`
  MODIFY `ia_findlike_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ia_finding_rate`
--
ALTER TABLE `ia_finding_rate`
  MODIFY `ia_findrate_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ia_finding_response`
--
ALTER TABLE `ia_finding_response`
  MODIFY `ia_findresp_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ia_finding_status`
--
ALTER TABLE `ia_finding_status`
  MODIFY `ia_findstat_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ia_user`
--
ALTER TABLE `ia_user`
  MODIFY `ia_user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
