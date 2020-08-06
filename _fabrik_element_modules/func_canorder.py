"""
Function to modify the joomla fabrik can order field
Copyright (c) AB Janse van Rensburg 20200805
"""

# PYTHON MODULES

# OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_system

# INDEX
"""
update_can_order - Function to update joomla fabrik table can order
"""


def update_can_order(mysql_cxn, s_table: str = '', s_name: str = '', s_label: str = '') -> bool:
    """
    :param mysql_cxn: object - Database connection object
    :param s_table: str - Table name to update
    :param s_name: str - Record name to update
    :param s_label: str - New field value
    :return: bool - Id of the updated record
    """

    # DECLARE VARIABLES
    i_record: int = 0
    l_updated: bool = False

    # READ THE CURRENT RECORD
    mysql_cur = mysql_cxn.cursor()
    s_sql = "SELECT `id`,`params` FROM `" + s_table + "` WHERE `name` = '" + s_name + "';"
    # print(s_sql)
    mysql_cur.execute(s_sql)
    o_records = mysql_cur.fetchall()
    # print(mysql_cur.rowcount)
    for row in o_records:
        l_updated = False
        i_record = row[0]
        s_data: str = row[1]
        # print(s_data)
        if '"can_order":"0"' in s_data and '0' != s_label:
            l_updated = True
            s_data = s_data.replace('"can_order":"0"', '"can_order":"' + s_label + '"')
        elif '"can_order":"1"' in s_data and '1' != s_label:
            l_updated = True
            s_data = s_data.replace('"can_order":"1"', '"can_order":"' + s_label + '"')
        # print(s_data)

        # UPDATE THE CURRENT RECORD
        if i_record > 0 and l_updated:
            s_sql = "UPDATE `" + s_table + "` SET `params` = '" + s_data + "' WHERE `id` = " + str(i_record) + ";"
            # print(s_sql)
            mysql_cur.execute('START TRANSACTION;')
            mysql_cur.execute(s_sql)
            mysql_cur.execute('COMMIT;')

    # CLOSE THE CONNECTION
    mysql_cur.close()

    # UPDATE THE LOG
    b_return = True
    if func_configure.l_debug_project:
        print('Updated: Fabrik can order ' + s_name + ' to ' + s_label)
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE CAN ORDER: ' + s_name + ' to ' + s_label, func_configure.s_path_project + 'log/')

    return b_return


if __name__ == '__main__':
    try:
        from _my_modules import func_mysql
        sql_cxn = func_mysql.mysql_open(False, func_configure.s_joomla_database)
        s_tab = func_mysql.get_fabrik_table(False, 'element')
        update_can_order(sql_cxn, s_tab, 'ia_findlike_name', '1')
    except Exception as e:
        func_system.error_message(e)
