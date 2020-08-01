"""
Script to create Joomla Fabrik LIST record
Copyright (C) AB Janse van Rensburg 20200718
"""

# IMPORT OWN MODULES
from _my_modules import func_system


def fabrik_list_create(b_input: bool = False,
                       s_form: str = "0",
                       s_target: str = "0",
                       s_key_field: str = "0",
                       s_label: str = "0") -> int:
    """
    :param b_input: bool - Force keyboard input
    :param s_form: str - Fabrik form id
    :param s_target: str - Table name
    :param s_key_field: str - Table key field
    :param s_label: str - Fabrik list label
    :return: int - Fabrik list id
    """

    # IMPORT SYSTEM MODULES

    # IMPORT OWN MODULES
    from _my_modules import func_configure
    from _my_modules import func_file
    from _my_modules import func_mysql

    """
    INDEX
    ENVIRONMENT
    INPUT
    OPEN DATABASE
    INSERT LIST RECORD
    """

    """*************************************************************************
    ENVIRONMENT
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("FABRIK CREATE LIST STEP 4")
        print("--------------------------")
        print("ENVIRONMENT")

    # DECLARE VARIABLES
    s_database: str = func_configure.s_joomla_database
    s_table: str = func_configure.s_joomla_prefix + "_fabrik_lists"
    s_created_by: str = func_configure.s_user_id
    i_return: int = 0

    # DATABASE CONNECTION
    if func_configure.s_name_project == "IANWU":
        s_connection = "2"
    else:
        s_connection = "1"

    """*************************************************************************
    INPUT
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("INPUT")

    # INPUT THE JOOMLA MYSQL FABRIK DATABASE NAME
    s_database_input = s_database
    if b_input:
        print("")
        print("Default fabrik database: " + s_database)
        s_database_input = input("Fabrik DATABASE name? ")
        if s_database_input == "":
            s_database_input = s_database

    # INPUT THE JOOMLA MYSQL TABLE NAME
    s_table_input = s_table
    if b_input:
        print("")
        print("Default fabrik list table: " + s_table)
        s_table_input = input("Fabrik TABLE name? ")
        if s_table_input == "":
            s_table_input = s_table

    # INPUT THE JOOMLA MYSQL FABRIK LIST LABEL
    s_label_input = s_label
    if b_input or s_label_input == "0":
        print("")
        print("Default fabrik list label: " + s_label)
        while s_label_input == "" or s_label_input == "0":
            s_label_input = input("Fabrik LIST label? ")
        print("")

    # INPUT THE JOOMLA MYSQL FABRIK FORM NUMBER
    s_form_input = s_form
    if b_input or s_form_input == "0":
        print("")
        print("Default fabrik form id: " + s_form)
        while s_form_input == "" or s_form_input == "0":
            s_form_input = input("Fabrik FORM number? ")
        print("")        

    # INPUT THE JOOMLA MYSQL FABRIK LIST TARGET TABLE NAME
    s_target_input = s_target
    if b_input or s_target_input == "0":
        print("")
        print("Default fabrik target table name: " + s_target)
        while s_target_input == "" or s_target_input == "0":
            s_target_input = input("Fabrik LIST target table name? ")
        print("")        

    # INPUT THE JOOMLA MYSQL FABRIK LIST KEY FIELD
    s_key_field_input = s_key_field
    if b_input or s_key_field_input == "0":
        print("")
        print("Default fabrik list key field: " + s_key_field)
        while s_key_field_input == "" or s_key_field_input == "0":
            s_key_field_input = input("Fabrik LIST key field? ")

    """*************************************************************************
    OPEN DATABASE
    *************************************************************************"""
    
    if func_configure.l_debug_project:
        print("OPEN DATABASE")

    # Connect to the oracle database
    mysql_connection = func_mysql.mysql_open(s_database_input)
    curs = mysql_connection.cursor()
    if func_configure.l_log_project:
        func_file.write_log("%t OPEN DATABASE: " + s_database_input)

    """*************************************************************************
    INSERT LIST RECORD
    *************************************************************************"""
    
    if func_configure.l_debug_project:
        print("INSERT LIST RECORD")

    # INSERT LIST RECORD
    s_sql = "INSERT INTO `" + s_table_input + "` (" + """
    `label`,
    `introduction`,
    `form_id`,
    `db_table_name`,
    `db_primary_key`,
    `auto_inc`,
    `connection_id`,
    `created`,
    `created_by`,
    `created_by_alias`,
    `modified`,
    `modified_by`,
    `checked_out`,
    `checked_out_time`,
    `published`,
    `publish_up`,
    `publish_down`,
    `access`,
    `hits`,
    `rows_per_page`,
    `template`,
    `order_by`,
    `order_dir`,
    `filter_action`,
    `group_by`,
    `private`,
    `params`
    """ + ") VALUES (" + """    
    '%LABEL%',
    '',
    %FORM%,
    '%TABLE_TARGET%',
    '%TABLE_TARGET%.%KEY_FIELD%',
    1,
    %CONNECTION%, 
    NOW(),
    %CREATED_BY%,
    'Python',
    '0000-00-00 00:00:00',
    0,
    0,
    '0000-00-00 00:00:00',
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00',
    1,
    1,
    10,
    'bootstrap',
    '[""]',
    '["ASC"]',
    'onchange',
    '',
    0,
    '{
    "bootstrap_condensed_class":"1",
    "allow_add":"9",
    "allow_delete":"3"
    }'
    """ + ");"
    # print(s_sql)  # DEBUG
    s_sql = s_sql.replace("%LABEL%", s_label_input)
    s_sql = s_sql.replace("%CONNECTION%", s_connection)
    s_sql = s_sql.replace("%CREATED_BY%", s_created_by)
    s_sql = s_sql.replace("%FORM%", s_form_input)
    s_sql = s_sql.replace("%TABLE_TARGET%", s_target_input)
    s_sql = s_sql.replace("%KEY_FIELD%", s_key_field_input)    
    # print(s_sql)  # DEBUG
    curs.execute(s_sql)
    mysql_connection.commit()
    if func_configure.l_log_project:
        func_file.write_log("%t INSERT RECORD: "+s_database_input+"."+s_table_input+": "+s_label_input)

    # GET NEWLY CREATED LIST NUMBER
    curs.execute("SELECT " + s_table_input + ".id, " + s_table_input + ".label " +
                 "FROM " + s_table_input + " " +
                 "WHERE " + s_table_input + ".label = '" + s_label_input + "'")
    for row in curs.fetchall():
        if func_configure.l_debug_project:
            print("Created list " + str(row[0]))
        i_return = row[0]

    # RETURN NEWLY CREATED GROUP NUMBER
    return i_return


if __name__ == '__main__':
    try:
        fabrik_list_create()
        # fabrik_element_create(False, False, "1", "2", "1", "id", "ID")
        # fabrik_element_create(False, False, "2", "2", "2", "created", "Date created")

    except Exception as e:
        func_system.error_message(e)
