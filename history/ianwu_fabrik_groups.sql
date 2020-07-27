-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: sql23.jnb1.host-h.net
-- Generation Time: Jul 27, 2020 at 04:33 PM
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
-- Database: `Ia_joomla`
--

-- --------------------------------------------------------

--
-- Table structure for table `ianwu_fabrik_groups`
--

CREATE TABLE `ianwu_fabrik_groups` (
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
-- Dumping data for table `ianwu_fabrik_groups`
--

INSERT INTO `ianwu_fabrik_groups` (`id`, `name`, `css`, `label`, `published`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `is_join`, `private`, `params`) VALUES
(2, 'Assignment Category', '', 'Add/Edit Assignment category', 1, '2016-01-18 18:50:38', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(3, 'Assignment', '', 'Add / edit assignment', 1, '2016-01-19 10:41:40', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"8\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(5, 'Users', '', 'Add/Edit Users', 1, '2016-01-19 14:13:28', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(8, 'Assignment Origin', '', 'Add/Edit Assignment origin', 1, '2016-01-22 12:16:08', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(9, 'Assignment Report', '', 'Add/Edit Assignment report', 1, '2016-01-26 14:07:49', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(10, 'Assignment Site', '', 'Add/Edit Assignment site', 1, '2016-01-28 12:22:17', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(11, 'Assignment Type', '', 'Add/Edit Assignment type', 1, '2018-10-24 15:26:20', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(12, 'Assignment Status', '', 'Add/Edit Assignment status', 1, '2018-10-25 08:47:00', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(33, 'Finding Impact Rating', '', 'Add/Edit finding impact rating', 1, '2018-10-30 03:36:44', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(41, 'Finding Statuses', '', 'Add/Edit finding status', 1, '2018-11-06 19:41:01', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(49, 'Finding admin', '', 'Add / edit an audit finding', 1, '2018-11-08 16:03:11', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(50, 'Finding admin 1st respondent', '', 'First respondent', 1, '2018-11-08 16:04:03', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(51, 'Finding admin text detail', '', 'Finding detail', 1, '2018-11-08 16:04:34', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"1\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(53, 'Employee list detail personal', '', 'Employee personal details', 1, '2018-11-09 11:03:23', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"8\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(54, 'Employee list detail contact', '', 'Employee contact details', 1, '2018-11-10 11:09:08', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"1\",\"list_view_and_query\":\"1\",\"access\":\"8\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(55, 'Employee list detail job', '', 'Employee job details', 1, '2018-11-10 11:12:42', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"1\",\"list_view_and_query\":\"1\",\"access\":\"8\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(56, 'Employee list detail other', '', 'Employee other details', 1, '2018-11-10 11:14:03', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"1\",\"list_view_and_query\":\"1\",\"access\":\"8\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(61, 'Employee list', '', 'Employee details', 1, '2018-11-17 10:32:45', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"2\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(62, 'Finding Responses', '', 'Add/Edit finding responses', 1, '2018-11-19 15:36:27', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"10\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(63, 'Employee birthday', '', 'Employee birthday', 1, '2018-11-20 14:13:52', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"2\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(70, 'Employee hierarchy one', '', 'Employee hierarchy level one', 1, '2018-11-24 05:42:07', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"2\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(71, 'Employee hierarchy two', '', 'Employee hierarchy level two', 1, '2018-11-24 05:49:11', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"1\",\"list_view_and_query\":\"1\",\"access\":\"2\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(72, 'Employee hierarchy three', '', 'Employee hierarchy level three', 1, '2018-11-24 05:49:54', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"1\",\"list_view_and_query\":\"1\",\"access\":\"2\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(73, 'Finding client', '', 'Audit finding awaiting management comment or action', 1, '2018-11-26 09:22:49', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"7\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(74, 'Finding client response', '', 'ia_finding_response', 1, '2018-11-28 08:33:44', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 1, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":1,\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"0\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(75, 'Finding client details', '', 'Details about the audit finding', 1, '2018-11-28 11:09:19', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(76, 'Finding admin 1st respondent commentary', '', 'First respondent commentary', 1, '2018-11-28 16:00:33', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"2\",\"list_view_and_query\":\"0\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(89, 'Finding attachment', '', 'Add / Edit an audit finding attachment', 1, '2018-12-02 15:42:02', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"7\",\"intro\":\"<p>On this page you can upload and attach a document related to an audit finding.<\\/p>\\r\\n<p>\\u00a0<\\/p>\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(90, 'Finding5', '', 'Student debtors - VSS GL Monthly balances', 1, '2019-01-30 09:38:51', 854, 'Python', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(91, 'Finding6', '', 'Student debtors - VSS GL Comparison', 1, '2019-02-01 09:19:24', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"\",\"outro\":\"\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}'),
(92, 'Assignment category 2.00', '', 'Assignment category 2.00', 1, '2020-07-27 14:04:55', 842, 'Albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', 0, 0, '{\"split_page\":\"0\",\"list_view_and_query\":\"1\",\"access\":\"1\",\"intro\":\"<p>\\u00a0<\\/p>\\r\\n<div id=\\\"vidyowebrtcscreenshare_is_installed\\\">\\u00a0<\\/div>\",\"outro\":\"<p>\\u00a0<\\/p>\\r\\n<div id=\\\"vidyowebrtcscreenshare_is_installed\\\">\\u00a0<\\/div>\",\"repeat_group_button\":\"0\",\"repeat_template\":\"repeatgroup\",\"repeat_max\":\"\",\"repeat_min\":\"\",\"repeat_num_element\":\"\",\"repeat_error_message\":\"\",\"repeat_no_data_message\":\"\",\"repeat_intro\":\"\",\"repeat_add_access\":\"1\",\"repeat_delete_access\":\"1\",\"repeat_delete_access_user\":\"\",\"repeat_copy_element_values\":\"0\",\"group_columns\":\"1\",\"group_column_widths\":\"\",\"repeat_group_show_first\":\"1\",\"random\":\"0\",\"labels_above\":\"-1\",\"labels_above_details\":\"-1\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ianwu_fabrik_groups`
--
ALTER TABLE `ianwu_fabrik_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ianwu_fabrik_groups`
--
ALTER TABLE `ianwu_fabrik_groups`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
