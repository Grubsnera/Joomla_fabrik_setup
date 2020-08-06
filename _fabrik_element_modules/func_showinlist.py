"""
Function to modify the joomla fabrik show_in_list_summary field
Copyright (c) AB Janse van Rensburg 20200804
"""

# PYTHON MODULES

# OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_system

# INDEX
"""
update_show_in_list - Function to update joomla fabrik table show-in-list-summary value
"""


def update_show_in_list(mysql_cxn, s_table: str = '', s_name: str = '', i_value: int = 0) -> bool:
    """
    :param mysql_cxn: object - Database connection object
    :param s_table: str - Table name to update
    :param s_name: str - Record name to update
    :param i_value: int - New field value
    :return: bool - Id of the updated record
    """

    # DECLARE VARIABLES

    # UPDATE THE RECORD
    mysql_cur = mysql_cxn.cursor()
    s_sql: str = "UPDATE `" + s_table + \
                 "` SET `show_in_list_summary` = " + str(i_value) + \
                 " WHERE `name` = '" + s_name + "';"
    # print(s_sql)
    mysql_cur.execute('START TRANSACTION;')
    mysql_cur.execute(s_sql)
    mysql_cur.execute('COMMIT;')
    mysql_cur.close()

    # UPDATE THE LOG
    b_return = True
    if func_configure.l_debug_project:
        print('Updated: Fabrik show-in-list ' + s_name + ' to ' + str(i_value))
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE SHOW-IN-LIST: ' + s_name + ' to ' + str(i_value),
                            func_configure.s_path_project + 'log/')

    return b_return


if __name__ == '__main__':
    try:
        from _my_modules import func_mysql
        sql_cxn = func_mysql.mysql_open(False, func_configure.s_joomla_database)
        s_tab = func_mysql.get_fabrik_table(False, 'element')
        update_show_in_list(sql_cxn, s_tab, 'ia_findlike_auto', 0)
    except Exception as e:
        func_system.error_message(e)
