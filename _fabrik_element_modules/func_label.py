"""
Function to modify the joomla fabrik element label field
Copyright (c) AB Janse van Rensburg 20200804
"""

# PYTHON MODULES

# OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_system

# INDEX
"""
update_label - Function to update joomla fabrik table label value
"""


def update_label(mysql_cxn, s_table: str = '', s_name: str = '', s_label: str = '') -> bool:
    """
    :param mysql_cxn: object - Database connection object
    :param s_table: str - Table name to update
    :param s_name: str - Record name to update
    :param s_label: str - New field value
    :return: bool - Id of the updated record
    """

    # DECLARE VARIABLES

    # UPDATE THE RECORD
    mysql_cur = mysql_cxn.cursor()
    s_sql: str = "UPDATE `" + s_table + "` SET `label` = '" + s_label + "' WHERE `name` = '" + s_name + "';"
    # print(s_sql)
    mysql_cur.execute('START TRANSACTION;')
    mysql_cur.execute(s_sql)
    mysql_cur.execute('COMMIT;')
    mysql_cur.close()

    # UPDATE THE LOG
    b_return = True
    if func_configure.l_debug_project:
        print('Updated: Fabrik label ' + s_name + ' to ' + s_label)
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE LABEL: ' + s_name + ' to ' + s_label, func_configure.s_path_project + 'log/')

    return b_return


if __name__ == '__main__':
    try:
        from _my_modules import func_mysql
        sql_cxn = func_mysql.mysql_open(False, func_configure.s_joomla_database)
        s_tab = func_mysql.get_fabrik_table(False, 'element')
        update_label(sql_cxn, s_tab, 'ia_findlike_auto', 'ID')
    except Exception as e:
        func_system.error_message(e)
