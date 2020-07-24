"""
Script to build joomla fabric tables
Copyright (C) AB Janse van Rensburg 20200717
"""

# IMPORT SYSTEM MODULES

# IMPORT OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_system
import func_fabrik_01_groupcreate
import func_fabrik_02_formcreate
import func_fabrik_03_formgroup
import func_fabrik_04_listcreate


# DECLARE VARIABLES
l_questions: bool = True
i_group: int = 0
i_form: int = 0
i_form_group: int = 0

# OPEN THE LOG WRITER
if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log("SCRIPT: FABRIK_ALL")
    func_file.write_log("------------------")

# CALL THE GROUP CREATE FUNCTION
try:
    i_group = func_fabrik_01_groupcreate.fabrik_group_create(l_questions)
    print("Group: " + str(i_group))
    if func_configure.l_log_project:
        func_file.write_log("%t GROUP CREATED: " + str(i_group))
except Exception as e:
    func_system.error_message(e)

# CALL THE FORM CREATE FUNCTION
try:
    i_form = func_fabrik_02_formcreate.fabrik_form_create(l_questions)
    print("Form: " + str(i_form))
    if func_configure.l_log_project:
        func_file.write_log("%t FORM CREATED: " + str(i_form))
except Exception as e:
    func_system.error_message(e)

# CALL THE FORM GROUP CREATE FUNCTION
try:
    i_form_group = func_fabrik_03_formgroup.fabrik_form_group(l_questions, str(i_group), str(i_form))
    print("Form group: " + str(i_form_group))
    if func_configure.l_log_project:
        func_file.write_log("%t FORM GROUP CREATED: " + str(i_form_group))
except Exception as e:
    func_system.error_message(e)

# CALL THE LIST CREATE FUNCTION
try:
    i_li = func_fabrik_04_listcreate.fabrik_list_create(l_questions, str(i_form))
    print("List: " + str(i_li))
    if func_configure.l_log_project:
        func_file.write_log("%t LIST CREATED: " + str(i_li))
except Exception as e:
    func_system.error_message(e)

# CLOSE THE LOG WRITER
if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log("COMPLETED: FABRIK_ALL")
    func_file.write_log("---------------------")
