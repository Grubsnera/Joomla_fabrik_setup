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
UPDATE FINDING LIKELIHOOD
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
l_finding_likelihood = True

"""****************************************************************************
UPDATE FINDING LIKELIHOOD
****************************************************************************"""

if l_finding_likelihood:

    # UPDATE LOG
    if func_configure.l_debug_project:
        print("UPDATE FINDING LIKELIHOOD")
        print("-------------------------")

    if func_configure.l_log_project:
        func_file.write_log('UPDATE FINDING LIKELIHOOD')
        func_file.write_log('-------------------------')

    # UPDATE LIST
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE LIST: Finding likelihood')

    # UPDATE FORM
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE FORM: Finding likelihood')
    s_table = func_mysql.get_fabrik_table(False, 'form')
    func_goback_button.update_goback_button(mysql_cxn, s_table, 'Finding Likelihood', '1')

    # UPDATE GROUP
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE GROUP: Finding likelihood')
    s_table = func_mysql.get_fabrik_table(False, 'group')
    func_label.update_label(mysql_cxn, s_table, 'Finding Likelihood', 'Add / Edit / View an audit likelihood rating')

    # UPDATE ELEMENTS
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE ELEMENTS: Finding likelihood')
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
    func_hidden.update_hidden(mysql_cxn, s_table, 'ia_findlike_editdate', 1)

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
END
****************************************************************************"""

# CLOSE THE DATABASE CONNECTION
mysql_cxn.close()

# CLOSE THE LOG WRITER
func_file.write_log("---------------------------")
func_file.write_log("COMPLETED: UPDATE IA FABRIK")

