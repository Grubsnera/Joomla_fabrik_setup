-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: sql39.jnb1.host-h.net
-- Generation Time: Jul 29, 2020 at 10:04 AM
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
-- Table structure for table `joomla_fabrik_forms`
--

CREATE TABLE `joomla_fabrik_forms` (
  `id` int(6) NOT NULL,
  `label` varchar(255) NOT NULL,
  `record_in_database` int(4) NOT NULL,
  `error` varchar(150) NOT NULL,
  `intro` text NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(100) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `checked_out` int(11) NOT NULL,
  `checked_out_time` datetime NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset_button_label` varchar(100) NOT NULL,
  `submit_button_label` varchar(100) NOT NULL,
  `form_template` varchar(255) DEFAULT NULL,
  `view_only_template` varchar(255) DEFAULT NULL,
  `published` int(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joomla_fabrik_forms`
--

INSERT INTO `joomla_fabrik_forms` (`id`, `label`, `record_in_database`, `error`, `intro`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `reset_button_label`, `submit_button_label`, `form_template`, `view_only_template`, `published`, `private`, `params`) VALUES
(1, 'Postcodes', 1, 'Some parts of your form have not been correctly filled in', '', '2020-07-24 15:03:48', 414, 'albertjvr', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'Save', 'bootstrap', 'bootstrap', 1, 0, '{\"outro\":\"\",\"reset_button\":\"0\",\"reset_button_label\":\"Reset\",\"reset_button_class\":\"btn-warning\",\"reset_icon\":\"\",\"reset_icon_location\":\"before\",\"copy_button\":\"0\",\"copy_button_label\":\"Save as copy\",\"copy_button_class\":\"\",\"copy_icon\":\"\",\"copy_icon_location\":\"before\",\"goback_button\":\"0\",\"goback_button_label\":\"Go back\",\"goback_button_class\":\"\",\"goback_icon\":\"\",\"goback_icon_location\":\"before\",\"apply_button\":\"0\",\"apply_button_label\":\"Apply\",\"apply_button_class\":\"\",\"apply_icon\":\"\",\"apply_icon_location\":\"before\",\"delete_button\":\"0\",\"delete_button_label\":\"Delete\",\"delete_button_class\":\"btn-danger\",\"delete_icon\":\"\",\"delete_icon_location\":\"before\",\"submit_button\":\"1\",\"submit_button_label\":\"Save\",\"save_button_class\":\"btn-primary\",\"save_icon\":\"\",\"save_icon_location\":\"before\",\"submit_on_enter\":\"0\",\"labels_above\":\"0\",\"labels_above_details\":\"0\",\"pdf_template\":\"admin\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"letter\",\"pdf_include_bootstrap\":\"1\",\"show_title\":\"1\",\"print\":\"\",\"email\":\"\",\"pdf\":\"\",\"admin_form_template\":\"\",\"admin_details_template\":\"\",\"note\":\"\",\"show_referring_table_releated_data\":\"0\",\"tiplocation\":\"tip\",\"process_jplugins\":\"2\",\"ajax_validations\":\"0\",\"ajax_validations_toggle_submit\":\"0\",\"submit_success_msg\":\"\",\"suppress_msgs\":\"0\",\"show_loader_on_submit\":\"0\",\"spoof_check\":\"1\",\"multipage_save\":\"0\"}'),
(3, 'Assignment Categories', 1, 'Some parts of your form have not been correctly filled in', '', '2020-07-29 05:57:38', 414, 'albert', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', 'Save', 'bootstrap', 'bootstrap', 1, 0, '{\"outro\":\"\",\"reset_button\":\"0\",\"reset_button_label\":\"Reset\",\"reset_button_class\":\"btn-warning\",\"reset_icon\":\"\",\"reset_icon_location\":\"before\",\"copy_button\":\"0\",\"copy_button_label\":\"Save as copy\",\"copy_button_class\":\"\",\"copy_icon\":\"\",\"copy_icon_location\":\"before\",\"goback_button\":\"0\",\"goback_button_label\":\"Go back\",\"goback_button_class\":\"\",\"goback_icon\":\"\",\"goback_icon_location\":\"before\",\"apply_button\":\"0\",\"apply_button_label\":\"Apply\",\"apply_button_class\":\"\",\"apply_icon\":\"\",\"apply_icon_location\":\"before\",\"delete_button\":\"0\",\"delete_button_label\":\"Delete\",\"delete_button_class\":\"btn-danger\",\"delete_icon\":\"\",\"delete_icon_location\":\"before\",\"submit_button\":\"1\",\"submit_button_label\":\"Save\",\"save_button_class\":\"btn-primary\",\"save_icon\":\"\",\"save_icon_location\":\"before\",\"submit_on_enter\":\"0\",\"labels_above\":\"0\",\"labels_above_details\":\"0\",\"pdf_template\":\"admin\",\"pdf_orientation\":\"portrait\",\"pdf_size\":\"letter\",\"pdf_include_bootstrap\":\"1\",\"show_title\":\"1\",\"print\":\"\",\"email\":\"\",\"pdf\":\"\",\"admin_form_template\":\"\",\"admin_details_template\":\"\",\"note\":\"\",\"show_referring_table_releated_data\":\"0\",\"tiplocation\":\"tip\",\"process_jplugins\":\"2\",\"ajax_validations\":\"0\",\"ajax_validations_toggle_submit\":\"0\",\"submit_success_msg\":\"\",\"suppress_msgs\":\"0\",\"show_loader_on_submit\":\"0\",\"spoof_check\":\"1\",\"multipage_save\":\"0\"}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `joomla_fabrik_forms`
--
ALTER TABLE `joomla_fabrik_forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published_INDEX` (`published`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `joomla_fabrik_forms`
--
ALTER TABLE `joomla_fabrik_forms`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
