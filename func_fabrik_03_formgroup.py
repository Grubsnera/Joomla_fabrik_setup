"""
Script to CREATE Joomla Fabrik form group record
Copyright (C) AB Janse van Rensburg 20200717
"""


def fabrik_form_group(b_input: bool = False, s_group: str = "0", s_form: str = "0"):
    """
    """

    # IMPORT SYSTEM MODULES

    # IMPORT OWN MODULES
    from _my_modules import func_configure
    from _my_modules import func_file
    from _my_modules import func_mysql

    """ INDEX ******************************************************************
    ENVIRONMENT
    INPUT
    OPEN DATABASE
    INSERT FORM GROUP RECORD
    *************************************************************************"""
    
    if func_configure.l_debug_project:
        print("FABRIK CREATE FORM GROUP STEP 3")
        print("-------------------------------")
        print("ENVIRONMENT")

    # DECLARE VARIABLES
    s_database: str = func_configure.s_joomla_database
    s_table: str = func_configure.s_joomla_prefix + "_fabrik_formgroup"
    i_return: int = 0
    
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
        print("Default fabrik table name: " + s_table)
        s_table_input = input("Fabrik TABLE name? ")
        if s_table_input == "":
            s_table_input = s_table

    # INPUT THE JOOMLA MYSQL FABRIK GROUP NUMBER
    s_group_input = s_group
    if b_input or s_group_input == "0":
        print("")
        print("Default fabrik group id: " + s_group)
        while s_group_input == "" or s_group_input == "0":
            s_group_input = input("Fabrik GROUP number? ")
        print("")
        
    # INPUT THE JOOMLA MYSQL FABRIK FORM NUMBER
    s_form_input = s_form
    if b_input or s_form_input == "0":
        print("")
        print("Default fabrik form id: " + s_form)
        while s_form_input == "" or s_form_input == "0":
            s_form_input = input("Fabrik FORM number? ")

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
    INSERT FORM GROUP RECORD
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("INSERT FORMGROUP RECORD")

    # INSERT GROUP RECORD
    s_sql = "INSERT INTO `" + s_table_input + "` (" + """
    form_id,
    group_id,
    ordering
    """ + ") VALUES (" + """
    %FORM%,
    %GROUP%,
    1
    """ + ");"
    # print(s_sql) # DEBUG
    s_sql = s_sql.replace("%FORM%", s_form_input)
    s_sql = s_sql.replace("%GROUP%", s_group_input)
    # print(s_sql) # DEBUG
    curs.execute(s_sql)
    mysql_connection.commit()
    if func_configure.l_log_project:
        func_file.write_log("%t INSERT RECORD: " +
                            s_database_input + "." +
                            s_table_input + ": Group:" +
                            s_group_input + " Form:" +
                            s_form_input)

    # GET NEWLY CREATED FORMGROUP NUMBER
    s_sql = "SELECT " + s_table_input + ".id " +\
            "FROM " + s_table_input + " " +\
            "WHERE " + s_table_input + ".form_id=%FORM% AND " + s_table_input + ".group_id=%GROUP%"
    s_sql = s_sql.replace("%FORM%", s_form_input)
    s_sql = s_sql.replace("%GROUP%", s_group_input)
    # print(s_sql) # DEBUG
    curs.execute(s_sql)
    for row in curs.fetchall():
        if func_configure.l_debug_project:
            print("Form group " + str(row[0]))
        i_return = row[0]    

    return i_return
