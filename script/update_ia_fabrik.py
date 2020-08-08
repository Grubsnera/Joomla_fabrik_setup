"""
Script to update joomla fabrik internal audit standard tables
Copyright (c) AB Janse van Rensburg 20200804
"""

# OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_mysql
from _fabrik_element_modules import func_bootstrap_class
from _fabrik_element_modules import func_buttongroup
from _fabrik_element_modules import func_canorder
from _fabrik_element_modules import func_hidden
from _fabrik_element_modules import func_label
from _fabrik_element_modules import func_optionsperrow
from _fabrik_element_modules import func_showinlist
from _fabrik_form_modules import func_goback_button

# INDEX
"""
ENVIRONMENT
UPDATE FINDING MASTER
UPDATE FINDING LIKELIHOODS
UPDATE FINDING CONTROL VALUES
END
"""

"""****************************************************************************
ENVIRONMENT
****************************************************************************"""

# UPDATE LOG
if func_configure.l_debug_project:
    print("SCRIPT: UPDATE IA FABRIK")
    print("------------------------")

if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log('SCRIPT: UPDATE IA FABRIK')
    func_file.write_log('------------------------')

# DECLARE VARIABLES
mysql_cxn = func_mysql.mysql_open(False, func_configure.s_joomla_database)
l_finding_master: bool = True
l_finding_likelihood: bool = False
l_finding_control_value: bool = False

"""****************************************************************************
UPDATE FINDING MASTER
****************************************************************************"""

if l_finding_master:

    # UPDATE LOG
    if func_configure.l_debug_project:
        print("UPDATE FINDING MASTER")
        print("---------------------")

    if func_configure.l_log_project:
        func_file.write_log('UPDATE FINDING MASTER')
        func_file.write_log('---------------------')

    # UPDATE LIST
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE LIST: Finding Master')

    # UPDATE FORM
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE FORM: Finding Master')
    s_table = func_mysql.get_fabrik_table(False, 'form')
    func_goback_button.update_goback_button(mysql_cxn, s_table, 'Finding Master', '1')

    # UPDATE GROUP
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE GROUP: Finding Master')
    s_table = func_mysql.get_fabrik_table(False, 'group')
    func_label.update_label(mysql_cxn, s_table, 'Finding Master', 'Finding')

    # UPDATE ELEMENTS
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE ELEMENTS:Finding Master')
    s_table = func_mysql.get_fabrik_table(False, 'element')

    func_label.update_label(mysql_cxn, s_table, 'ia_find_auto', 'Finding ID')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_date', 'Finding date')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_name', 'Audit finding')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_note', 'Personal notes')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_desc', 'Finding description')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_createdate', 'Created')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_createby', 'Created by')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_editdate', 'Modified')
    func_label.update_label(mysql_cxn, s_table, 'ia_find_editby', 'Modified by')

    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_find_auto', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_find_desc', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_find_createdate', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_find_createby', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_find_editdate', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_find_editby', 0)

    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_find_createdate', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_find_createby', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_find_editdate', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_find_editby', 1)

"""****************************************************************************
UPDATE FINDING LIKELIHOODS
****************************************************************************"""

if l_finding_likelihood:

    # UPDATE LOG
    if func_configure.l_debug_project:
        print("UPDATE FINDING LIKELIHOODS")
        print("--------------------------")

    if func_configure.l_log_project:
        func_file.write_log('UPDATE FINDING LIKELIHOODS')
        func_file.write_log('--------------------------')

    # UPDATE LIST
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE LIST: Finding likelihoods')

    # UPDATE FORM
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE FORM: Finding likelihoods')
    s_table = func_mysql.get_fabrik_table(False, 'form')
    func_goback_button.update_goback_button(mysql_cxn, s_table, 'Finding Likelihoods', '1')

    # UPDATE GROUP
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE GROUP: Finding likelihoods')
    s_table = func_mysql.get_fabrik_table(False, 'group')
    func_label.update_label(mysql_cxn, s_table, 'Finding Likelihoods', 'Add / Edit / View an audit likelihood rating')

    # UPDATE ELEMENTS
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE ELEMENTS: Finding likelihoods')
    s_table = func_mysql.get_fabrik_table(False, 'element')

    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_auto', 'ID')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_name', 'Likelihood *')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_desc', 'Description')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_value', 'Value')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_active', 'Active')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_from', 'From *')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_to', 'To *')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_createdate', 'Created')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_createby', 'Created by')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_editdate', 'Modified')
    func_label.update_label(mysql_cxn, s_table, 'ia_findlike_editby', 'Modified by')

    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findlike_auto', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findlike_desc', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findlike_createdate', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findlike_createby', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findlike_editdate', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findlike_editby', 0)

    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findlike_createdate', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findlike_createby', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findlike_editdate', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findlike_editby', 1)

    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findlike_name', 'input-xxlarge')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findlike_desc', 'input-xxlarge')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findlike_from', 'input-small')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findlike_to', 'input-small')

    func_optionsperrow.update_options_per_row(mysql_cxn, s_table, 'ia_findlike_value', '1')
    func_optionsperrow.update_options_per_row(mysql_cxn, s_table, 'ia_findlike_active', '1')

    func_buttongroup.update_button_group(mysql_cxn, s_table, 'ia_findlike_active', '1')

    func_canorder.update_can_order(mysql_cxn, s_table, 'ia_findlike_name', '1')
    func_canorder.update_can_order(mysql_cxn, s_table, 'ia_findlike_desc', '1')
    func_canorder.update_can_order(mysql_cxn, s_table, 'ia_findlike_from', '1')

"""****************************************************************************
UPDATE FINDING CONTROL VALUE
****************************************************************************"""

if l_finding_control_value:

    # UPDATE LOG
    if func_configure.l_debug_project:
        print("UPDATE FINDING CONTROL VALUES")
        print("-----------------------------")

    if func_configure.l_log_project:
        func_file.write_log('UPDATE FINDING CONTROL VALUES')
        func_file.write_log('-----------------------------')

    # UPDATE LIST
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE LIST: Finding control values')

    # UPDATE FORM
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE FORM: Finding control values')
    s_table = func_mysql.get_fabrik_table(False, 'form')
    func_goback_button.update_goback_button(mysql_cxn, s_table, 'Finding Control Values', '1')

    # UPDATE GROUP
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE GROUP: Finding control values')
    s_table = func_mysql.get_fabrik_table(False, 'group')
    func_label.update_label(mysql_cxn, s_table, 'Finding Control Values', 'Add / Edit / View an audit control value')

    # UPDATE ELEMENTS
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE ELEMENTS: Finding control values')
    s_table = func_mysql.get_fabrik_table(False, 'element')

    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_auto', 'ID')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_name', 'Control value *')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_desc', 'Description')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_value', 'Value')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_active', 'Active')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_from', 'From *')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_to', 'To *')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_createdate', 'Created')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_createby', 'Created by')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_editdate', 'Modified')
    func_label.update_label(mysql_cxn, s_table, 'ia_findcont_editby', 'Modified by')

    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findcont_auto', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findcont_desc', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findcont_createdate', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findcont_createby', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findcont_editdate', 0)
    func_showinlist.update_show_in_list(mysql_cxn, s_table, 'ia_findcont_editby', 0)

    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findcont_createdate', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findcont_createby', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findcont_editdate', 1)
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findcont_editby', 1)

    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findcont_name', 'input-xxlarge')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findcont_desc', 'input-xxlarge')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findcont_value', 'input-mini')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findcont_from', 'input-small')
    func_bootstrap_class.update_bootstrap_class(mysql_cxn, s_table, 'ia_findcont_to', 'input-small')

    func_optionsperrow.update_options_per_row(mysql_cxn, s_table, 'ia_findcont_active', '1')

    func_buttongroup.update_button_group(mysql_cxn, s_table, 'ia_findcont_active', '1')

    func_canorder.update_can_order(mysql_cxn, s_table, 'ia_findcont_name', '1')
    func_canorder.update_can_order(mysql_cxn, s_table, 'ia_findcont_desc', '1')
    func_canorder.update_can_order(mysql_cxn, s_table, 'ia_findcont_from', '1')

"""****************************************************************************
END
****************************************************************************"""

# CLOSE THE DATABASE CONNECTION
mysql_cxn.close()

# CLOSE THE LOG WRITER
func_file.write_log("---------------------------")
func_file.write_log("COMPLETED: UPDATE IA FABRIK")
