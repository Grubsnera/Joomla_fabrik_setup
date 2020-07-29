-- Replace the following data
-- Ia_joomla with correct database
-- ianwu_ with file prefix
-- 2020-01-01 with today date
-- 854 to the user who created the records

--
-- Database: `Ia_joomla`
--
USE Ia_joomla;

--
-- Environment
--
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Drop table just while in development
--
-- DROP TABLE `ianwu_aa_assignment_category`;

--
-- Table structure for table `ianwu_aa_assignment_category`
--
CREATE TABLE `ianwu_aa_assignment_category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `active` text,
  `private` text,
  `created` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store assignment categories';

--
-- Dumping data for table `ianwu_aa_assignment_category`
--
INSERT INTO `ianwu_aa_assignment_category` (`id`, `name`, `description`, `active`, `private`, `created`, `created_by`) VALUES
(1, 'ADMINISTRATION', 'Office administration.', '1', '0', '2020-01-01 00:00:00', 854),
(2, 'ASSIGNMENT', 'Audit assignments.', '1', '0', '2020-01-01 00:00:00', 854),
(3, 'CONSULTATION', 'Consultation work.', '1', '0', '2020-01-01 00:00:00', 854),
(4, 'DEVELOPMENT', 'Software development.', '1', '0', '2020-01-01 00:00:00', 854),
(5, 'PRIVATE', 'Private work.', '1', '1', '2020-01-01 00:00:00', 854);

--
-- Indexes for table `ianwu_aa_assignment_category`
--
ALTER TABLE `ianwu_aa_assignment_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for table `ianwu_aa_assignment_category`
--
ALTER TABLE `ianwu_aa_assignment_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;
