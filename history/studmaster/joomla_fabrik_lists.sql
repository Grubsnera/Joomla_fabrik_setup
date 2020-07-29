-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: sql39.jnb1.host-h.net
-- Generation Time: Jul 29, 2020 at 12:09 PM
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
-- Table structure for table `joomla_fabrik_lists`
--

CREATE TABLE `joomla_fabrik_lists` (
  `id` int(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  `introduction` text NOT NULL,
  `form_id` int(4) NOT NULL,
  `db_table_name` varchar(255) NOT NULL,
  `db_primary_key` varchar(255) NOT NULL,
  `auto_inc` int(1) NOT NULL,
  `connection_id` int(6) NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` int(4) NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(4) NOT NULL,
  `checked_out` int(4) NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `access` int(4) NOT NULL,
  `hits` int(4) NOT NULL,
  `rows_per_page` int(5) NOT NULL,
  `template` varchar(255) NOT NULL,
  `order_by` varchar(255) NOT NULL,
  `order_dir` varchar(255) NOT NULL DEFAULT 'ASC',
  `filter_action` varchar(30) NOT NULL,
  `group_by` varchar(255) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joomla_fabrik_lists`
--

INSERT INTO `joomla_fabrik_lists` (`id`, `label`, `introduction`, `form_id`, `db_table_name`, `db_primary_key`, `auto_inc`, `connection_id`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `published`, `publish_up`, `publish_down`, `access`, `hits`, `rows_per_page`, `template`, `order_by`, `order_dir`, `filter_action`, `group_by`, `private`, `params`) VALUES
(1, 'Postcodes', '', 1, 'sm_postcodes', 'sm_postcodes.sm_post_auto', 1, 1, '2020-07-24 00:00:00', 0, '', '2020-07-24 15:04:25', 414, 0, '0000-00-00 00:00:00', 1, '2020-07-24 15:03:48', '0000-00-00 00:00:00', 1, 7, 10, 'bootstrap', '[\"\"]', '[\"ASC\"]', 'onchange', '', 0, '{\"show-table-filters\":\"1\",\"advanced-filter\":\"0\",\"advanced-filter-default-statement\":\"=\",\"search-mode\":\"0\",\"search-mode-advanced\":\"0\",\"search-mode-advanced-default\":\"all\",\"search_elements\":\"\",\"list_search_elements\":\"null\",\"search-all-label\":\"All\",\"require-filter\":\"0\",\"require-filter-msg\":\"\",\"filter-dropdown-method\":\"0\",\"toggle_cols\":\"0\",\"list_filter_cols\":\"1\",\"empty_data_msg\":\"\",\"outro\":\"\",\"list_ajax\":\"0\",\"show-table-add\":\"1\",\"show-table-nav\":\"1\",\"show_displaynum\":\"1\",\"showall-records\":\"0\",\"show-total\":\"0\",\"sef-slug\":\"\",\"show-table-picker\":\"1\",\"admin_template\":\"\",\"show-title\":\"1\",\"pdf\":\"\",\"pdf_template\":\"\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"a4\",\"pdf_include_bootstrap\":\"1\",\"bootstrap_stripped_class\":\"1\",\"bootstrap_bordered_class\":\"0\",\"bootstrap_condensed_class\":\"0\",\"bootstrap_hover_class\":\"1\",\"responsive_elements\":\"\",\"responsive_class\":\"\",\"list_responsive_elements\":\"null\",\"tabs_field\":\"\",\"tabs_max\":\"10\",\"tabs_all\":\"1\",\"list_ajax_links\":\"0\",\"actionMethod\":\"default\",\"detailurl\":\"\",\"detaillabel\":\"\",\"list_detail_link_icon\":\"search\",\"list_detail_link_target\":\"_self\",\"editurl\":\"\",\"editlabel\":\"\",\"list_edit_link_icon\":\"edit\",\"checkboxLocation\":\"end\",\"addurl\":\"\",\"addlabel\":\"\",\"list_add_icon\":\"plus\",\"list_delete_icon\":\"delete\",\"popup_width\":\"\",\"popup_height\":\"\",\"popup_offset_x\":\"\",\"popup_offset_y\":\"\",\"note\":\"\",\"alter_existing_db_cols\":\"default\",\"process-jplugins\":\"1\",\"cloak_emails\":\"0\",\"enable_single_sorting\":\"default\",\"collation\":\"utf8_general_ci\",\"force_collate\":\"\",\"list_disable_caching\":\"0\",\"distinct\":\"1\",\"group_by_raw\":\"1\",\"group_by_access\":\"1\",\"group_by_order\":\"\",\"group_by_template\":\"\",\"group_by_template_extra\":\"\",\"group_by_order_dir\":\"ASC\",\"group_by_start_collapsed\":\"0\",\"group_by_collapse_others\":\"0\",\"group_by_show_count\":\"1\",\"menu_module_prefilters_override\":\"1\",\"prefilter_query\":\"\",\"join-display\":\"default\",\"delete-joined-rows\":\"0\",\"show_related_add\":\"0\",\"show_related_info\":\"0\",\"rss\":\"0\",\"feed_title\":\"\",\"feed_date\":\"\",\"feed_image_src\":\"\",\"rsslimit\":\"150\",\"rsslimitmax\":\"2500\",\"csv_import_frontend\":\"3\",\"csv_export_frontend\":\"2\",\"csvfullname\":\"0\",\"csv_export_step\":\"100\",\"newline_csv_export\":\"nl2br\",\"csv_clean_html\":\"leave\",\"csv_multi_join_split\":\",\",\"csv_custom_qs\":\"\",\"csv_frontend_selection\":\"0\",\"incfilters\":\"0\",\"csv_format\":\"0\",\"csv_which_elements\":\"selected\",\"show_in_csv\":\"\",\"csv_elements\":\"null\",\"csv_include_data\":\"1\",\"csv_include_raw_data\":\"1\",\"csv_include_calculations\":\"0\",\"csv_filename\":\"\",\"csv_encoding\":\"\",\"csv_double_quote\":\"1\",\"csv_local_delimiter\":\"\",\"csv_end_of_line\":\"n\",\"open_archive_active\":\"0\",\"open_archive_set_spec\":\"\",\"open_archive_timestamp\":\"\",\"open_archive_license\":\"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf\",\"dublin_core_element\":\"\",\"dublin_core_type\":\"dc:description.abstract\",\"raw\":\"0\",\"open_archive_elements\":\"null\",\"search_use\":\"0\",\"search_title\":\"\",\"search_description\":\"\",\"search_date\":\"\",\"search_link_type\":\"details\",\"dashboard\":\"0\",\"dashboard_icon\":\"\",\"allow_view_details\":\"1\",\"allow_edit_details\":\"1\",\"allow_edit_details2\":\"\",\"allow_add\":\"1\",\"allow_delete\":\"2\",\"allow_delete2\":\"\",\"allow_drop\":\"3\",\"menu_access_only\":\"0\",\"isview\":\"0\"}'),
(2, 'Assignment category 2.00', '', 2, 'joomla_aa_assignment_category', 'joomla_aa_assignment_category.id', 1, 1, '2020-07-29 00:00:00', 414, 'Python', '2020-07-29 10:05:03', 414, 0, '0000-00-00 00:00:00', 1, '2020-07-29 10:05:03', '0000-00-00 00:00:00', 1, 5, 10, 'bootstrap', '[\"\"]', '[\"ASC\"]', 'onchange', '', 0, '{\"show-table-filters\":\"1\",\"advanced-filter\":\"0\",\"advanced-filter-default-statement\":\"=\",\"search-mode\":\"0\",\"search-mode-advanced\":\"0\",\"search-mode-advanced-default\":\"all\",\"search_elements\":\"\",\"list_search_elements\":\"null\",\"search-all-label\":\"All\",\"require-filter\":\"0\",\"require-filter-msg\":\"\",\"filter-dropdown-method\":\"0\",\"toggle_cols\":\"0\",\"list_filter_cols\":\"1\",\"empty_data_msg\":\"\",\"outro\":\"\",\"list_ajax\":\"0\",\"show-table-add\":\"1\",\"show-table-nav\":\"1\",\"show_displaynum\":\"1\",\"showall-records\":\"1\",\"show-total\":\"1\",\"sef-slug\":\"\",\"show-table-picker\":\"1\",\"admin_template\":\"\",\"show-title\":\"1\",\"pdf\":\"\",\"pdf_template\":\"\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"a4\",\"pdf_include_bootstrap\":\"1\",\"bootstrap_stripped_class\":\"1\",\"bootstrap_bordered_class\":\"0\",\"bootstrap_condensed_class\":\"1\",\"bootstrap_hover_class\":\"1\",\"responsive_elements\":\"\",\"responsive_class\":\"\",\"list_responsive_elements\":\"null\",\"tabs_field\":\"\",\"tabs_max\":\"10\",\"tabs_all\":\"1\",\"list_ajax_links\":\"0\",\"actionMethod\":\"default\",\"detailurl\":\"\",\"detaillabel\":\"\",\"list_detail_link_icon\":\"search\",\"list_detail_link_target\":\"_self\",\"editurl\":\"\",\"editlabel\":\"\",\"list_edit_link_icon\":\"edit\",\"checkboxLocation\":\"end\",\"addurl\":\"\",\"addlabel\":\"\",\"list_add_icon\":\"plus\",\"list_delete_icon\":\"delete\",\"popup_width\":\"\",\"popup_height\":\"\",\"popup_offset_x\":\"\",\"popup_offset_y\":\"\",\"note\":\"\",\"alter_existing_db_cols\":\"default\",\"process-jplugins\":\"1\",\"cloak_emails\":\"0\",\"enable_single_sorting\":\"default\",\"collation\":\"utf8_general_ci\",\"force_collate\":\"\",\"list_disable_caching\":\"0\",\"distinct\":\"1\",\"group_by_raw\":\"1\",\"group_by_access\":\"1\",\"group_by_order\":\"\",\"group_by_template\":\"\",\"group_by_template_extra\":\"\",\"group_by_order_dir\":\"ASC\",\"group_by_start_collapsed\":\"0\",\"group_by_collapse_others\":\"0\",\"group_by_show_count\":\"1\",\"menu_module_prefilters_override\":\"1\",\"prefilter_query\":\"\",\"join-display\":\"default\",\"delete-joined-rows\":\"0\",\"show_related_add\":\"0\",\"show_related_info\":\"0\",\"rss\":\"0\",\"feed_title\":\"\",\"feed_date\":\"\",\"feed_image_src\":\"\",\"rsslimit\":\"150\",\"rsslimitmax\":\"2500\",\"csv_import_frontend\":\"3\",\"csv_export_frontend\":\"2\",\"csvfullname\":\"0\",\"csv_export_step\":\"100\",\"newline_csv_export\":\"nl2br\",\"csv_clean_html\":\"leave\",\"csv_multi_join_split\":\",\",\"csv_custom_qs\":\"\",\"csv_frontend_selection\":\"0\",\"incfilters\":\"0\",\"csv_format\":\"0\",\"csv_which_elements\":\"selected\",\"show_in_csv\":\"\",\"csv_elements\":\"null\",\"csv_include_data\":\"1\",\"csv_include_raw_data\":\"1\",\"csv_include_calculations\":\"0\",\"csv_filename\":\"\",\"csv_encoding\":\"\",\"csv_double_quote\":\"1\",\"csv_local_delimiter\":\"\",\"csv_end_of_line\":\"n\",\"open_archive_active\":\"0\",\"open_archive_set_spec\":\"\",\"open_archive_timestamp\":\"\",\"open_archive_license\":\"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf\",\"dublin_core_element\":\"\",\"dublin_core_type\":\"dc:description.abstract\",\"raw\":\"0\",\"open_archive_elements\":\"null\",\"search_use\":\"0\",\"search_title\":\"\",\"search_description\":\"\",\"search_date\":\"\",\"search_link_type\":\"details\",\"dashboard\":\"0\",\"dashboard_icon\":\"\",\"allow_view_details\":\"1\",\"allow_edit_details\":\"1\",\"allow_edit_details2\":\"\",\"allow_add\":\"1\",\"allow_delete\":\"2\",\"allow_delete2\":\"\",\"allow_drop\":\"3\",\"menu_access_only\":\"0\",\"isview\":\"0\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joomla_fabrik_lists`
--
ALTER TABLE `joomla_fabrik_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `form_id_INDEX` (`form_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `joomla_fabrik_lists`
--
ALTER TABLE `joomla_fabrik_lists`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
