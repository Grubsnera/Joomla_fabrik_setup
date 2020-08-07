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

"""
INDEX
ENVIRONMENT
CREATE FINDING LIKELIHOOD
CREATE FINDING CONTROL VALUE
CLOSING
"""

"""****************************************************************************
ENVIRONMENT
****************************************************************************"""

# DECLARE VARIABLES
l_drop_table: bool = True
l_finding_likelihood: bool = False
l_finding_control_value: bool = True
s_sql: str = ""

if func_configure.l_debug_project:
    print("CREATE IA TABLES")
    print("----------------")
    print("OPEN DATABASE")

# OPEN THE LOG WRITER
if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log("SCRIPT: CREATE IA TABLES")
    func_file.write_log("------------------------")

# CONNECT TO THE DATABASE
mysql_cxn = func_mysql.mysql_open(False, func_configure.s_joomla_database)
mysql_cur = mysql_cxn.cursor()

mysql_cur.execute("SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';")
mysql_cur.execute("SET AUTOCOMMIT = 0;")
mysql_cur.execute("SET time_zone = '+02:00';")

"""*************************************************************************
CREATE FINDING LIKELIHOOD
*************************************************************************"""

if l_finding_likelihood:

    if func_configure.l_debug_project:
        print("BUILD FINDING LIKELIHOOD TABLE")

    # DEFINE VARIABLES
    s_name: str = "Finding Likelihood"
    s_table: str = func_configure.s_user_prefix + "_finding_likelihood"

    # START TRANSACTION
    mysql_cur.execute("START TRANSACTION;")

    # DROP AND CREATE TABLE
    if l_drop_table:
        if func_configure.l_debug_project:
            print("DROP TABLE " + s_table)
        mysql_cur.execute("DROP TABLE IF EXISTS `" + s_table + "`;")

    # CREATE TABLE
    if func_configure.l_debug_project:
        print("CREATE TABLE " + s_table)
    s_sql = "CREATE TABLE IF NOT EXISTS `%TABLE%` (" \
            "`ia_findcont_auto` int(11) NOT NULL, " \
            "`ia_findcont_name` varchar(50) NOT NULL, " \
            "`ia_findcont_desc` text NOT NULL," \
            "`ia_findcont_value` text NOT NULL," \
            "`ia_findcont_active` text NOT NULL," \
            "`ia_findcont_from` datetime NOT NULL, " \
            "`ia_findcont_to` datetime NOT NULL, " \
            "`ia_findcont_createdate` datetime NOT NULL, " \
            "`ia_findcont_createby` int(11) NOT NULL, " \
            "`ia_findcont_editdate` datetime NOT NULL, " \
            "`ia_findcont_editby` int(11) NOT NULL " \
            ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store audit finding likelihood';"
    s_sql = s_sql.replace("%TABLE%", s_table)
    mysql_cur.execute(s_sql)

    # INSERT DEFAULT RECORDS
    if l_drop_table:
        if func_configure.l_debug_project:
            print("INSERT VALUES " + s_table)
        s_sql = "INSERT INTO `%TABLE%` " \
        "(`ia_findcont_auto`, `ia_findcont_name`, `ia_findcont_desc`, `ia_findcont_value`, `ia_findcont_active`, `ia_findcont_from`, `ia_findcont_to`, `ia_findcont_createdate`, `ia_findcont_createby`)" \
        " VALUES " \
        "(1, 'No rating', 'No value.', '0', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(2, 'Rare', 'Event may occur in exceptional circumstances, but there is little opportunity for it occurring.', '1', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(3, 'Unlikely', 'Based on current information, the event is unlikely to occur although it has occurred within other organizations. ', '2', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(4, 'Possible', 'There is a strong possibility that the event can occur at some time within the business operating environment and / or the project lifecycle.', '3', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(5, 'Likely', 'Based on the circumstances the event is very likely to occur. It has previously occurred and holds a high risk impact.', '4', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(6, 'Certain', 'As the circumstances which cause the risk to eventuate are almost certain to occur, the opportunity or the event to occur is very high.', '5', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%);"
        s_sql = s_sql.replace("%TABLE%", s_table)
        s_sql = s_sql.replace("%NOW%", datetime.datetime.now().strftime("%Y%m%d"))
        s_sql = s_sql.replace("%CREATEBY%", func_configure.s_user_id)
        mysql_cur.execute(s_sql)
        if func_configure.l_log_project:
            func_file.write_log("%t INSERT RECORDS: " + s_table)

        # ADD INDEXES
        s_sql = "ALTER TABLE `%TABLE%` ADD PRIMARY KEY (`ia_findcont_auto`);"
        s_sql = s_sql.replace("%TABLE%", s_table)
        mysql_cur.execute(s_sql)

        # ADD AUTO_INCREMENT
        s_sql = "ALTER TABLE `%TABLE%` MODIFY `ia_findcont_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;"
        s_sql = s_sql.replace("%TABLE%", s_table)
        mysql_cur.execute(s_sql)

        # COMMIT
        mysql_cur.execute("COMMIT;")

"""*************************************************************************
CREATE FINDING CONTROL VALUE
*************************************************************************"""

if l_finding_control_value:

    if func_configure.l_debug_project:
        print("BUILD FINDING CONTROL VALUE TABLE")

    # DEFINE VARIABLES
    s_name: str = "Finding Control Value"
    s_table: str = func_configure.s_user_prefix + "_finding_control"

    # START TRANSACTION
    mysql_cur.execute("START TRANSACTION;")

    # DROP AND CREATE TABLE
    if l_drop_table:
        if func_configure.l_debug_project:
            print("DROP TABLE " + s_table)
        mysql_cur.execute("DROP TABLE IF EXISTS `" + s_table + "`;")

    # CREATE TABLE
    if func_configure.l_debug_project:
        print("CREATE TABLE " + s_table)
    s_sql = "CREATE TABLE IF NOT EXISTS `%TABLE%` (" \
            "`ia_findcont_auto` int(11) NOT NULL, " \
            "`ia_findcont_name` varchar(50) NOT NULL, " \
            "`ia_findcont_desc` text NOT NULL," \
            "`ia_findcont_value` decimal(4,2) NOT NULL," \
            "`ia_findcont_active` text NOT NULL," \
            "`ia_findcont_from` datetime NOT NULL, " \
            "`ia_findcont_to` datetime NOT NULL, " \
            "`ia_findcont_createdate` datetime NOT NULL, " \
            "`ia_findcont_createby` int(11) NOT NULL, " \
            "`ia_findcont_editdate` datetime NOT NULL, " \
            "`ia_findcont_editby` int(11) NOT NULL " \
            ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table to store audit finding control values';"
    s_sql = s_sql.replace("%TABLE%", s_table)
    mysql_cur.execute(s_sql)

    # INSERT DEFAULT RECORDS
    if l_drop_table:
        if func_configure.l_debug_project:
            print("INSERT VALUES " + s_table)
        s_sql = "INSERT INTO `%TABLE%` " \
        "(`ia_findcont_auto`, `ia_findcont_name`, `ia_findcont_desc`, `ia_findcont_value`, `ia_findcont_active`, `ia_findcont_from`, `ia_findcont_to`, `ia_findcont_createdate`, `ia_findcont_createby`)" \
        " VALUES " \
        "(1, 'Highly effective', 'The control measure effectively addresses the risk. The design of the control measure is excellent, well documented and is fully being applied and being complied with.', '0.10', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(2, 'Good', 'An adequate and acceptable level of control exists. The control measure is adequately designed and is effectively being applied & being complied with. Minimal improvements are required.', '0.25', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(3, 'Satisfactory', 'A satisfactory level of control exists. The control measure largely addresses the risk. There is room for improvement regarding its design and / or the effectiveness of its application, enforcement or compliance.', '0.50', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(4, 'Requires improvement', 'The operation of correctly designed control is not effective and / or the operation of incorrectly designed control may be good but is still not effective in managing the risk and requires improvement.', '0.80', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%), " \
        "(5, 'Inadequite', 'There is no confidence that any degree of control is being achieved due to very limited operational effectiveness.', '0.90', '1', '%NOW%', '2099-12-31 00:00:00', '%NOW%', %CREATEBY%);"
        s_sql = s_sql.replace("%TABLE%", s_table)
        s_sql = s_sql.replace("%NOW%", datetime.datetime.now().strftime("%Y%m%d"))
        s_sql = s_sql.replace("%CREATEBY%", func_configure.s_user_id)
        mysql_cur.execute(s_sql)
        if func_configure.l_log_project:
            func_file.write_log("%t INSERT RECORDS: " + s_table)

        # ADD INDEXES
        s_sql = "ALTER TABLE `%TABLE%` ADD PRIMARY KEY (`ia_findcont_auto`);"
        s_sql = s_sql.replace("%TABLE%", s_table)
        mysql_cur.execute(s_sql)

        # ADD AUTO_INCREMENT
        s_sql = "ALTER TABLE `%TABLE%` MODIFY `ia_findcont_auto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;"
        s_sql = s_sql.replace("%TABLE%", s_table)
        mysql_cur.execute(s_sql)

        # COMMIT
        mysql_cur.execute("COMMIT;")

"""****************************************************************************
CLOSING
****************************************************************************"""

# CLOSE THE DATABASE
mysql_cur.close()
mysql_cxn.close()

# CLOSE THE LOG WRITER
if func_configure.l_log_project:
    func_file.write_log("Now")
    func_file.write_log("COMPLETED: CREATE STANDARD TABLES")
    func_file.write_log("---------------------------------")
