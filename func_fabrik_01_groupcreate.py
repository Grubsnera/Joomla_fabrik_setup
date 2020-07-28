"""
Script to CREATE Joomla Fabrik group record
Copyright (C) AB Janse van Rensburg 20200716
"""


def fabrik_group_create(b_input: bool = False, s_lb: str = "New GROUP to setup"):
    """
    Create Joomla Fabrik group record
    :param b_input: Input database parameters if True (Default=False)
    :param s_lb: Fabrik group label (Default=New GROUP to setup)
    :return: int
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
    INSERT GROUP RECORD
    """

    """*************************************************************************
    ENVIRONMENT
    *************************************************************************"""

    if b_input:
        func_configure.l_debug_project = True

    if func_configure.l_debug_project:
        print("FABRIK CREATE GROUP STEP 1")
        print("--------------------------")
        print("ENVIRONMENT")

    # DECLARE VARIABLES
    s_db: str = func_configure.s_joomla_database
    s_tb: str = func_configure.s_joomla_prefix + "_fabrik_groups"
    s_created_by: str = func_configure.s_user_id
    i_return: int = 0

    """*************************************************************************
    INPUT
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("INPUT")

    # Input the joomla mysql fabrik DATABASE name
    s_dbi = s_db
    if b_input:
        print("")
        print("Default fabrik database: " + s_db)
        s_dbi = input("Fabrik DATABASE name? ")
        if s_dbi == "":
            s_dbi = s_db

    # Input the joomla mysql fabrik TABLE name
    s_tbi = s_tb
    if b_input:
        print("")
        print("Default fabrik table: " + s_tb)
        s_tbi = input("Fabrik TABLE name? ")
        if s_tbi == "":
            s_tbi = s_tb

    # Input the joomla mysql fabrik GROUP label
    s_lbi = s_lb
    if b_input:
        print("")
        print("Default fabrik group label: " + s_lb)
        s_lbi = input("Fabrik GROUP label? ")
        if s_lbi == "":
            s_lbi = s_lb

    if func_configure.l_debug_project:
        print("")

    """*************************************************************************
    OPEN DATABASE
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("OPEN DATABASE")

    # Connect to the oracle database
    mysql_connection = func_mysql.mysql_open(s_dbi)
    curs = mysql_connection.cursor()
    if func_configure.l_log_project:
        func_file.write_log("%t OPEN DATABASE: " + s_dbi)

    """*************************************************************************
    INSERT GROUP RECORD
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("INSERT GROUP RECORD")

    # INSERT GROUP RECORD
    s_sql = "INSERT INTO `" + s_tbi + "` (" + """
    `name`,
    `css`,
    `label`,
    `published`,
    `created`,
    `created_by`,
    `created_by_alias`,
    `modified`,
    `modified_by`,
    `checked_out`,
    `checked_out_time`,
    `is_join`,
    `private`,
    `params`
    """ + ") VALUES (" + """
    '%LABEL%',
    '',
    'Add/Edit %LABEL%',
    1,
    NOW(),
    %CREATED_BY%,
    'Python',
    '0000-00-00 00:00:00',
    0,
    0,
    '0000-00-00 00:00:00',
    0,
    0,
    '{
    \"split_page\":\"0\",
    \"list_view_and_query\":\"1\",
    \"access\":\"1\",
    \"intro\":\"\",
    \"outro\":\"\",
    \"repeat_group_button\":\"0\",
    \"repeat_template\":\"repeatgroup\",
    \"repeat_max\":\"\",
    \"repeat_min\":\"\",
    \"repeat_num_element\":\"\",
    \"repeat_error_message\":\"\",
    \"repeat_no_data_message\":\"\",
    \"repeat_intro\":\"\",
    \"repeat_add_access\":\"1\",
    \"repeat_delete_access\":\"1\",
    \"repeat_delete_access_user\":\"\",
    \"repeat_copy_element_values\":\"0\",
    \"group_columns\":\"1\",
    \"group_column_widths\":\"\",
    \"repeat_group_show_first\":\"1\",
    \"random\":\"0\",
    \"labels_above\":\"-1\",
    \"labels_above_details\":\"-1\"
    }'
    """ + ");"
    # print(s_sql)  # DEBUG
    s_sql = s_sql.replace("%LABEL%", s_lbi)
    s_sql = s_sql.replace("%CREATED_BY%", s_created_by)
    curs.execute(s_sql)
    mysql_connection.commit()
    if func_configure.l_log_project:
        func_file.write_log("%t INSERT RECORD: " + s_dbi + "." + s_tbi + ": " + s_lbi)

    # GROUP DEFAULT PARAMETERS
    """
    (
    92,
    'TEST List',
    '',
    'TEST List',
    1,
    '2019-03-20 05:14:04',
    842,
    'Albertjvr',
    '0000-00-00 00:00:00',
    0,
    0,
    '0000-00-00 00:00:00',
    0,
    0,
    '{
    \"split_page\":\"0\",
    \"list_view_and_query\":\"1\",
    \"access\":\"1\",\"intro\":\"\",
    \"outro\":\"\",
    \"repeat_group_button\":0,
    \"repeat_template\":\"repeatgroup\",
    \"repeat_max\":\"\",
    \"repeat_min\":\"\",
    \"repeat_num_element\":\"\",
    \"repeat_error_message\":\"\",
    \"repeat_no_data_message\":\"\",
    \"repeat_intro\":\"\",
    \"repeat_add_access\":\"1\",
    \"repeat_delete_access\":\"1\",
    \"repeat_delete_access_user\":\"\",
    \"repeat_copy_element_values\":\"0\",
    \"group_columns\":\"1\",
    \"group_column_widths\":\"\",
    \"repeat_group_show_first\":1,
    \"random\":\"0\",
    \"labels_above\":\"-1\",
    \"labels_above_details\":\"-1\"
    }'
    );
    """

    # GET NEWLY CREATED GROUP NUMBER
    curs.execute(
        "SELECT " +
        s_tbi + ".id, " +
        s_tbi + ".name FROM " +
        s_tbi + " WHERE " +
        s_tbi + ".name = '" +
        s_lbi + "'")
    for row in curs.fetchall():
        if func_configure.l_debug_project:
            print("Created group " + str(row[0]))
        i_return = row[0]

    # RETURN NEWLY CREATED GROUP NUMBER
    return i_return