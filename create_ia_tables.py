"""
Script to build ia standard tables
Copyright (C) AB Janse van Rensburg 20200728
"""

# IMPORT SYSTEM MODULES
import datetime

# IMPORT OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_mysql
from _my_modules import func_system
import func_fabrik_01_groupcreate
import func_fabrik_02_formcreate
import func_fabrik_03_formgroup
import func_fabrik_04_listcreate

"""
INDEX
ENVIRONMENT
ASSIGNMENT CATEGORY
CLOSING
"""

"""****************************************************************************
ENVIRONMENT
****************************************************************************"""

# DECLARE VARIABLES
l_drop_table: bool = True
l_assignment_category: bool = True
s_sql: str = ""

# OPEN THE LOG WRITER
if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log("SCRIPT: CREATE STANDARD TABLES")
    func_file.write_log("------------------------------")

if func_configure.l_debug_project:
    print("OPEN DATABASE")

# INPUT THE DATABASE NAME
print("")
print("Default table database: " + func_configure.s_joomla_database)
s_database: str = input("User DATABASE name? ")
if s_database == "":
    s_database = func_configure.s_joomla_database
func_configure.s_joomla_database = s_database

# CONNECT TO THE DATABASE
mysql_connection = func_mysql.mysql_open(func_configure.s_joomla_database)
curs = mysql_connection.cursor()
if func_configure.l_log_project:
    func_file.write_log("%t OPEN DATABASE: " + func_configure.s_joomla_database)

curs.execute("SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';")
curs.execute("SET AUTOCOMMIT = 0;")
curs.execute("START TRANSACTION;")
curs.execute("SET time_zone = '+00:00';")

"""*************************************************************************
ASSIGNMENT CATEGORY
*************************************************************************"""

if l_assignment_category:

    if func_configure.l_debug_project:
        print("BUILD ASSIGNMENT CATEGORY TABLE")

    # DEFINE VARIABLES
    s_table: str = func_configure.s_joomla_prefix + "_aa_assignment_category"
    i_group: int = 0
    i_form: int = 0
    i_form_group: int = 0
    i_list: int = 0

    # DROP AND CREATE TABLE
    if l_drop_table:
        if func_configure.l_debug_project:
            print("DROP TABLE")
        curs.execute("DROP TABLE IF EXISTS `" + s_table + "`;")

    # CREATE TABLE
    if func_configure.l_debug_project:
        print("CREATE TABLE")
    s_sql = "CREATE TABLE IF NOT EXISTS `%TABLE%` (" \
            "`id` int(11) NOT NULL, " \
            "`name` varchar(50) DEFAULT NULL, " \
            "`description` text, " \
            "`active` text, " \
            "`private` text, " \
            "`from` datetime DEFAULT NULL, " \
            "`to` datetime DEFAULT NULL, " \
            "`created` datetime DEFAULT NULL, " \
            "`created_by` int(11) DEFAULT NULL, " \
            "`modified` datetime DEFAULT NULL, " \
            "`modified_by` int(11) DEFAULT NULL " \
            ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store assignment categories';"
    s_sql = s_sql.replace("%TABLE%", s_table)
    curs.execute(s_sql)

    # INSERT DEFAULT RECORDS
    if l_drop_table:
        if func_configure.l_debug_project:
            print("INSERT VALUES")
        s_sql = "INSERT INTO `%TABLE%` " \
                "(`id`, `name`, `description`, `active`, `private`, `from`, `to`, `created`, `created_by`)" \
                " VALUES " \
                "(1, 'ADMINISTRATION', 'Office administration.', '1', '0', '%NOW%', '2099-12-31', '%NOW%', %CREATED_BY%), " \
                "(2, 'ASSIGNMENT', 'Audit assignments.', '1', '0', '%NOW%', '2099-12-31', '%NOW%', %CREATED_BY%), " \
                "(3, 'CONSULTATION', 'Consultation work.', '1', '0', '%NOW%', '2099-12-31', '%NOW%', %CREATED_BY%), " \
                "(4, 'DEVELOPMENT', 'Software development.', '1', '0', '%NOW%', '2099-12-31', '%NOW%', %CREATED_BY%), " \
                "(5, 'ELECTION', 'Election audits.', '1', '0', '%NOW%', '2099-12-31', '%NOW%', %CREATED_BY%), " \
                "(6, 'PRIVATE', 'Private work.', '1', '1', '%NOW%', '2099-12-31', '%NOW%', %CREATED_BY%);"
        s_sql = s_sql.replace("%TABLE%", s_table)
        s_sql = s_sql.replace("%NOW%", datetime.datetime.now().strftime("%Y%m%d"))
        s_sql = s_sql.replace("%CREATED_BY%", func_configure.s_user_id)
        curs.execute(s_sql)
        mysql_connection.commit()
        if func_configure.l_log_project:
            func_file.write_log("%t INSERT RECORDS: " + s_table)

        # ADD INDEXES
        s_sql = "ALTER TABLE `%TABLE%` ADD PRIMARY KEY (`id`);"
        s_sql = s_sql.replace("%TABLE%", s_table)
        curs.execute(s_sql)

        # ADD AUTO_INCREMENT
        s_sql = "ALTER TABLE `%TABLE%` MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;"
        s_sql = s_sql.replace("%TABLE%", s_table)
        curs.execute(s_sql)

        # CALL THE GROUP CREATE FUNCTION
        try:
            i_group = func_fabrik_01_groupcreate.fabrik_group_create(False, "Assignment category 2.00")
            print("Group: " + str(i_group))
            if func_configure.l_log_project:
                func_file.write_log("%t GROUP CREATED: " + str(i_group))
        except Exception as e:
            func_system.error_message(e)

        # CALL THE FORM CREATE FUNCTION
        try:
            i_form = func_fabrik_02_formcreate.fabrik_form_create(False, "Assignment category 2.00")
            print("Form: " + str(i_form))
            if func_configure.l_log_project:
                func_file.write_log("%t FORM CREATED: " + str(i_form))
        except Exception as e:
            func_system.error_message(e)

        # CALL THE FORM GROUP CREATE FUNCTION
        try:
            i_form_group = func_fabrik_03_formgroup.fabrik_form_group(False, str(i_group), str(i_form))
            print("Form group: " + str(i_form_group))
            if func_configure.l_log_project:
                func_file.write_log("%t FORM GROUP CREATED: " + str(i_form_group))
        except Exception as e:
            func_system.error_message(e)

        # CALL THE LIST CREATE FUNCTION
        try:
            i_list = func_fabrik_04_listcreate.fabrik_list_create(False, "Assignment category 2.00", str(i_form), s_table, "id")
            print("List: " + str(i_list))
            if func_configure.l_log_project:
                func_file.write_log("%t LIST CREATED: " + str(i_list))
        except Exception as e:
            func_system.error_message(e)

    # COMMIT
    mysql_connection.commit()

"""****************************************************************************
CLOSING
****************************************************************************"""

# CLOSE THE LOG WRITER
if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log("COMPLETED: CREATE STANDARD TABLES")
    func_file.write_log("---------------------------------")
