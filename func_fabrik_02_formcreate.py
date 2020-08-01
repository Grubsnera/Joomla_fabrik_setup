"""
Script to CREATE Joomla Fabrik form record
Copyright (C) AB Janse van Rensburg 20190310
"""


def fabrik_form_create(b_input: bool = False,
                       s_form: str = "0") -> int:
    """
    :param b_input: bool - Force keyboard input
    :param s_form: str - Fabrik form label
    :return: int - Fabrik form id
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
    INSERT FORM RECORD
    """

    """*************************************************************************
    ENVIRONMENT
    *************************************************************************"""

    if b_input:
        func_configure.l_debug_project = True

    if func_configure.l_debug_project:
        print("FABRIK CREATE FORM STEP 2")
        print("-------------------------")
        print("ENVIRONMENT")

    # DECLARE VARIABLES
    s_database: str = func_configure.s_joomla_database
    s_table: str = func_configure.s_joomla_prefix + "_fabrik_forms"
    s_created_by: str = func_configure.s_user_id
    i_return: int = 0

    """*************************************************************************
    INPUT
    *************************************************************************"""
    
    if func_configure.l_debug_project:
        print("INPUT")

    # Input the joomla mysql fabrik DATABASE name
    s_database_input = s_database
    if b_input:
        print("")
        print("Default fabrik database: "+s_database)
        s_database_input = input("Fabrik DATABASE name? ")
        if s_database_input == "":
            s_database_input = s_database

    # Input the joomla mysql fabrik TABLE name
    s_table_input = s_table
    if b_input:
        print("")
        print("Default fabrik table name: "+s_table)
        s_table_input = input("Fabrik TABLE name? ")
        if s_table_input == "":
            s_table_input = s_table

    # INPUT THE JOOMLA MYSQL FABRIK LIST LABEL
    s_form_input = s_form
    if b_input or s_form_input == "0":
        print("")
        print("Default fabrik list form: " + s_form)
        while s_form_input == "" or s_form_input == "0":
            s_form_input = input("Fabrik FORM label? ")
        print("")

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
    INSERT FORM RECORD
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("INSERT FORM RECORD")

    # INSERT FORM RECORD
    s_sql = "INSERT INTO `" + s_table_input + "` (" + """
    `label`,
    `record_in_database`,
    `error`,
    `intro`,
    `created`,
    `created_by`,
    `created_by_alias`,
    `modified`,
    `modified_by`,
    `checked_out`,
    `checked_out_time`,
    `publish_up`,
    `publish_down`,
    `reset_button_label`,
    `submit_button_label`,
    `form_template`,
    `view_only_template`,
    `published`,
    `private`,
    `params`
    """ + ") VALUES (" + """
    '%LABEL%',
    1,
    'Some parts of your form have not been correctly filled in!',
    '',
    NOW(),
    %CREATED_BY%,
    'Python',
    '0000-00-00 00:00:00',
    0,
    0,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00',
    'Reset',
    'Save',
    'bootstrap',
    'bootstrap',
    1,
    0,
    '{
    "apply_button":"1",
    "goback_button":"1",
    "pdf_size":"a4"    
    }'
    """ + ");"
    # print(s_sql) # DEBUG
    s_sql = s_sql.replace("%LABEL%", s_form_input)
    s_sql = s_sql.replace("%CREATED_BY%", s_created_by)
    curs.execute(s_sql)
    mysql_connection.commit()
    if func_configure.l_log_project:
        func_file.write_log("%t INSERT RECORD: " + s_database_input + "." + s_table_input + ":" + s_form_input)

    # GET NEWLY CREATED FORM NUMBER
    curs.execute("SELECT " +
                 s_table_input + ".id, " +
                 s_table_input + ".label FROM " +
                 s_table_input + " WHERE " +
                 s_table_input + ".label = '" +
                 s_form_input + "'")
    for row in curs.fetchall():
        if func_configure.l_debug_project:
            print("Created list " + str(row[0]))
        i_return = row[0]

    # RETURN NEWLY CREATED FORM NUMBER
    return i_return
