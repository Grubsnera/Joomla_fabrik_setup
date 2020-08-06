"""
Function to modify the joomla fabrik options per row field in the radiobutton plugin
Copyright (c) AB Janse van Rensburg 20200805
"""

# PYTHON MODULES

# OWN MODULES
from _my_modules import func_configure
from _my_modules import func_file
from _my_modules import func_system

# INDEX
"""
update_options_per_row - Function to update joomla fabrik table options per row
"""


def update_options_per_row(mysql_cxn, s_table: str = '', s_name: str = '', s_label: str = '') -> bool:
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
        if '"options_per_row":"0"' in s_data and '0' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"0"', '"options_per_row":"' + s_label + '"')
        elif '"options_per_row":"1"' in s_data and '1' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"1"', '"options_per_row":"' + s_label + '"')
        elif '"options_per_row":"2"' in s_data and '2' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"2"', '"options_per_row":"' + s_label + '"')
        elif '"options_per_row":"3"' in s_data and '3' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"3"', '"options_per_row":"' + s_label + '"')
        elif '"options_per_row":"4"' in s_data and '4' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"4"', '"options_per_row":"' + s_label + '"')
        elif '"options_per_row":"5"' in s_data and '5' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"5"', '"options_per_row":"' + s_label + '"')
        elif '"options_per_row":"6"' in s_data and '6' != s_label:
            l_updated = True
            s_data = s_data.replace('"options_per_row":"6"', '"options_per_row":"' + s_label + '"')
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
        print('Updated: Fabrik options per row ' + s_name + ' to ' + s_label)
    if func_configure.l_log_project:
        func_file.write_log('%t UPDATE OPTIONS PER ROW: ' + s_name + ' to ' + s_label, func_configure.s_path_project + 'log/')

    return b_return


if __name__ == '__main__':
    try:
        from _my_modules import func_mysql
        sql_cxn = func_mysql.mysql_open(False, func_configure.s_joomla_database)
        s_tab = func_mysql.get_fabrik_table(False, 'element')
        update_options_per_row(sql_cxn, s_tab, 'ia_findlike_value', '1')
    except Exception as e:
        func_system.error_message(e)
