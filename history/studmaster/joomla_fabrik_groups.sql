-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: sql39.jnb1.host-h.net
-- Generation Time: Jul 29, 2020 at 12:08 PM
-- Server version: 10.1.45-MariaDB-1~stretch
-- PHP Version: 5.6.40-0+deb8u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studmaster`
--

-- --------------------------------------------------------

--
-- Table structure for table `joomla_fabrik_groups`
--

CREATE TABLE `joomla_fabrik_groups` (
  `id` int(6) NOT NULL,
  `name` varchar(100) NOT NULL,
  `css` text NOT NULL,
  `label` varchar(100) NOT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `is_join` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joomla_fabrik_groups`
--

INSERT INTO `joomla_fabrik_groups` (`id`, `name`, `css`, `label`, `published`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `is_join`, `private`, `params`) VALUES
(1, 'Postcodes', '', 'Postcodes', 1, '2020-07-24 15:03:48', 414, 'albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":0,\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":1,\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(2, 'Assignment category 2.00', '', 'Add/Edit Assignment category 2.00', 1, '2020-07-29 11:58:37', 414, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joomla_fabrik_groups`
--
ALTER TABLE `joomla_fabrik_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published_INDEX` (`published`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `joomla_fabrik_groups`
--
ALTER TABLE `joomla_fabrik_groups`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
