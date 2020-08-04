"""
Script to create Joomla Fabrik ELEMENT records
Copyright (C) AB Janse van Rensburg 20200729
"""

# IMPORT OWN MODULES
from _my_modules import func_system


def fabrik_element_create(b_input: bool = False,
                          b_loop: bool = False,
                          s_type: str = "0",
                          s_group: str = "0",
                          s_order: str = "0",
                          s_name: str = "0",
                          s_label: str = "0") -> None:
    """
    :param b_input: Force keyboard input
    :param b_loop: Force element input to loop
    :param s_type: Fabrik element type
    :param s_group: Fabrik group id
     1=Internalid
     2=Date created
    :param s_order: Fabrik element ranking order
    :param s_name: Fabrik element field name
    :param s_label: Fabrik element label
    :return: None
    """

    # IMPORT SYSTEM MODULES

    # IMPORT OWN MODULES
    from _my_modules import func_configure
    from _my_modules import func_file
    from _my_modules import func_mysql

    """
    INDEX
    ENVIRONMENT
    INPUT DATABASE
    OPEN DATABASE
    INPUT ELEMENT
    INTERNALID SETUP
    FIELD 50 NOTEMPTY SETUP
    TEXTAREA 1024 SETUP
    RADIOBUTTON 15 SETUP
    JDATE FROM TODAY NOTEMPTY SETUP 
    JDATE TO 2099 SETUP
    JDATE CREATED SETUP
    JDATE MODIFIED SETUP
    FIELD MODIFIED BY SETUP        
    """

    """*************************************************************************
    ENVIRONMENT
    *************************************************************************"""

    if b_input:
        func_configure.l_debug_project = True

    if func_configure.l_debug_project:
        print("FABRIK CREATE ELEMENT STEP 5")
        print("----------------------------")
        print("ENVIRONMENT")

    # DECLARE VARIABLES
    s_database: str = func_configure.s_joomla_database
    s_database_input = s_database
    s_table: str = func_configure.s_joomla_prefix + "_fabrik_elements"
    s_table_input = s_table
    s_created_by: str = func_configure.s_user_id
    l_loop: bool = True
    s_sql_fields = """
    INSERT INTO %TABLE% (
    `name`,
    `group_id`,
    `plugin`,
    `label`,
    `checked_out`,
    `checked_out_time`,
    `created`,
    `created_by`,
    `created_by_alias`,
    `modified`,
    `modified_by`,
    `width`,
    `height`,
    `default`,
    `hidden`,
    `eval`,
    `ordering`,
    `show_in_list_summary`,
    `filter_type`,
    `filter_exact_match`,
    `published`,
    `link_to_detail`,
    `primary_key`,
    `auto_increment`,
    `access`,
    `use_in_page_title`,
    `parent_id`,
    `params`
    ) VALUES ("""

    """*************************************************************************
    INPUT DATABASE
    *************************************************************************"""

    if func_configure.l_debug_project:
        print("INPUT DATABASE AND TABLE")

    # INPUT DATABASE NAME
    if b_input:
        print("")
        print("Default fabrik database: " + s_database)
        s_database_input = input("Fabrik DATABASE name? ")
        if s_database_input == "":
            s_database_input = s_database

    # INPUT TABLE NAME
    if b_input:
        print("")
        print("Default fabrik table: " + s_table)
        s_table_input = input("Fabrik TABLE name? ")
        if s_table_input == "":
            s_table_input = s_table

    # INFUSE TABLE NAME IN SQL STRING
    s_sql_fields = s_sql_fields.replace("%TABLE%", s_table_input)

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
    INPUT ELEMENT
    *************************************************************************"""

    while l_loop:

        # INPUT FABRIK ELEMENT GROUP NUMBER
        s_group_input = s_group
        if b_input or s_group_input == "0" or s_group_input == "":
            print("")
            print("Default fabrik group id: " + s_group)
            while s_group_input == "" or s_group_input == "0":
                s_group_input = input("Fabrik element GROUP id? ")

        # INPUT FABRIK ELEMENT ORDER NUMBER
        s_order_input = s_order
        if b_input or s_order_input == "0" or s_order_input == "":
            print("")
            print("Default fabrik order number: " + s_order)
            while s_order_input == "" or s_order_input == "0":
                s_order_input = input("Fabrik element ORDER number? ")

        # INPUT FABRIK ELEMENT FIELD NAME
        s_name_input = s_name
        if b_input or s_name_input == "0" or s_name_input == "":
            print("")
            print("Default fabrik element field name: " + s_name)
            while s_name_input == "" or s_name_input == "0":
                s_name_input = input("Fabrik element FIELD NAME? ")

        # INPUT FABRIK ELEMENT LABEL
        s_label_input = s_label
        if b_input or s_label_input == "0" or s_label_input == "":
            print("")
            print("Default fabrik element label: " + s_label)
            while s_label_input == "" or s_label_input == "0":
                s_label_input = input("Fabrik element LABEL? ")

        # INPUT FABRIK ELEMENT TYPE
        s_type_input = s_type
        if b_input or s_type_input == "0" or s_type_input == "":
            print("")
            print("INPUT ELEMENT TYPE 0 = CANCEL")
            print("INPUT ELEMENT TYPE 1 = INTERNALID")
            print("INPUT ELEMENT TYPE 99 = EXIT")
            print("")
            print("Default fabrik element type: " + s_type)
            s_type_input = input("Fabrik ELEMENT type? ")
            while s_type_input == "0" or s_type_input == "":
                s_type_input = input("Fabrik ELEMENT type? ")

        # SHOW ALL VARIABLES
        if func_configure.l_debug_project:
            print("")
            print("VALUES COLLECTED:")
            print("Database: " + s_database_input)
            print("Table: " + s_table_input)
            print("Type: " + s_type_input)
            print("Group: " + s_group_input)
            print("Order: " + s_order_input)
            print("Field: " + s_name_input)
            print("Label: " + s_label_input)

        """********************************************************************
        INTERNALID SETUP
        ********************************************************************"""

        if s_type_input == "internalid":

            if func_configure.l_debug_project:
                print("CREATE ELEMENT 1 INTERNALID")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'internalid',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            11,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            0,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "inc_in_adv_search":"0"
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log(
                    "%t INSERT ELEMENT INTERNALID: " + s_database_input + "." + s_table_input + ": " + s_label_input)

        """********************************************************************
        FIELD 50 NOTEMPTY SETUP
        ********************************************************************"""

        if s_type_input == "field_50_notempty":

            if func_configure.l_debug_project:
                print("CREATE FIELD")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'field',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            30,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "maxlength":"50",
            "bootstrap_class":"input-xxlarge",
            "can_order":"1",
            "validations":{"plugin":["notempty"],
            "plugin_published":["1"],
            "validate_in":["both"],
            "validation_on":["both"],
            "validate_hidden":["1"],
            "must_validate":["1"],
            "show_icon":["0"]}
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log("%t INSERT ELEMENT FIELD 50 NOEMPTY: " +
                                    s_database_input + "." +
                                    s_table_input + ": " +
                                    s_label_input)

        """********************************************************************
        TEXTAREA 1024 SETUP
        ********************************************************************"""

        if s_type_input == "textarea_1024":

            if func_configure.l_debug_project:
                print("CREATE FIELD")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'textarea',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            40,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "bootstrap_class":"input-xxlarge",
            "textarea-showmax":"1",
            "textarea-maxlength":"1024",
            "textarea_limit_type":"word"
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log(
                    "%t INSERT ELEMENT TEXTAREA 1024: " + s_database_input + "." + s_table_input + ": " + s_label_input)

        """********************************************************************
        RADIOBUTTON 15 SETUP
        ********************************************************************"""

        if s_type_input == "radiobutton_15":

            if func_configure.l_debug_project:
                print("CREATE FIELD")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'radiobutton',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            40,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "sub_options":{"sub_values":["0","1","2","3","4","5"],
            "sub_labels":["No value","Rare","Unlikely","Possible","Likely","Certain"],
            "sub_initial_selection":["0"]},
            "options_per_row":"1"
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log("%t INSERT ELEMENT RADIOBUTTON 15: " +
                                    s_database_input + "." +
                                    s_table_input + ": " +
                                    s_label_input)

        """********************************************************************
        RADIOBUTTON YESNO SETUP
        ********************************************************************"""

        if s_type_input == "radiobutton_yesno":

            if func_configure.l_debug_project:
                print("CREATE FIELD")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'radiobutton',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            40,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "sub_options":{"sub_values":["1","0"],
            "sub_labels":["Yes","No"],
            "sub_initial_selection":["1"]},
            "btnGroup":"1"            
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log(
                    "%t INSERT ELEMENT RADIOBUTTON YESNO: " + s_database_input + "." + s_table_input + ": " +
                    s_label_input)

        """********************************************************************
        JDATE FROM TODAY NOTEMPTY SETUP
        ********************************************************************"""

        if s_type_input == "jdate_from_today":

            if func_configure.l_debug_project:
                print("CREATE ELEMENT JDATE FROM TODAY")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'jdate',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            10,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "bootstrap_class":"input-small",
            "jdate_store_as_local":"1",
            "jdate_defaulttotoday":"1",
            "validations":{"plugin":["notempty"],
            "plugin_published":["1"],
            "validate_in":["both"],
            "validation_on":["both"],
            "validate_hidden":["1"],
            "must_validate":["1"],
            "show_icon":["0"]}
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log(
                    "%t INSERT ELEMENT JDATE FROM TODAY: " + s_database_input + "." + s_table_input + ": " +
                    s_label_input)

        """********************************************************************
        JDATE TO 2099 SETUP
        ********************************************************************"""

        if s_type_input == "jdate_to_2099":

            if func_configure.l_debug_project:
                print("CREATE ELEMENT JDATE TO 2099")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'jdate',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            10,
            6,
            '2099-12-31',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "bootstrap_class":"input-small",
            "jdate_store_as_local":"1",
            "jdate_defaulttotoday":"1",
            "isgreaterorlessthan-message":["Compulsory date"],
            "isgreaterorlessthan-greaterthan":["3"],
            "isgreaterorlessthan-comparewith":["1134"],
            "compare_value":[""],
            "isgreaterorlessthan-allow_empty":["0"],
            "isgreaterorlessthan-validation_condition":[""],
            "tip_text":["To date must be later than from date above!"],
            "icon":[""],
            "validations":{"plugin":["isgreaterorlessthan"],
            "plugin_published":["1"],
            "validate_in":["both"],
            "validation_on":["both"],
            "validate_hidden":["1"],
            "must_validate":["1"],
            "show_icon":["0"]}            
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log(
                    "%t INSERT ELEMENT JDATE TO 2099: " + s_database_input + "." + s_table_input + ": " + s_label_input)

        """********************************************************************
        JDATE CREATED
        ********************************************************************"""

        if s_type_input == "jdate_created":

            if func_configure.l_debug_project:
                print("CREATE ELEMENT JDATE CREATED")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'jdate',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            10,
            6,
            '',
            1,
            0,
            %ORDERNUMBER%,
            0,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "jdate_store_as_local":"1",
            "jdate_defaulttotoday":"1"
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log(
                    "%t INSERT ELEMENT JDATE CREATED: " + s_database_input + "." + s_table_input + ": " + s_label_input)

        """********************************************************************
        JDATE MODIFIED SETUP
        ********************************************************************"""

        if s_type_input == "jdate_modified":

            if func_configure.l_debug_project:
                print("CREATE ELEMENT JDATE MODIFIED")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'jdate',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            10,
            6,
            '',
            1,
            0,
            %ORDERNUMBER%,
            0,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "jdate_store_as_local":"1",
            "jdate_defaulttotoday":"1",
            "jdate_alwaystoday":"1"
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log("%t INSERT ELEMENT JDATE MODIFIED: " +
                                    s_database_input + "." +
                                    s_table_input + ": " +
                                    s_label_input)

        """********************************************************************
        FIELD MODIFIED BY SETUP
        ********************************************************************"""

        if s_type_input == "field_modified_by":

            if func_configure.l_debug_project:
                print("CREATE FIELD MODIFIED BY")

            # INSERT GROUP RECORD
            s_sql = s_sql_fields + """
            '%FIELDNAME%',
            %GROUPID%,
            'field',
            '%LABEL%',
            0,
            '0000-00-00 00:00:00',
            NOW(),
            %CREATEDBY%,
            'python',
            '0000-00-00 00:00:00',
            0,
            30,
            6,
            '',
            0,
            0,
            %ORDERNUMBER%,
            1,
            NULL,
            1,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            }'
            """ + ");"
            # print(s_sql)  # DEBUG
            s_sql = s_sql.replace("%FIELDNAME%", s_name_input)
            s_sql = s_sql.replace("%GROUPID%", s_group_input)
            s_sql = s_sql.replace("%LABEL%", s_label_input)
            s_sql = s_sql.replace("%CREATEDBY%", s_created_by)
            s_sql = s_sql.replace("%ORDERNUMBER%", s_order_input)
            curs.execute(s_sql)
            mysql_connection.commit()
            if func_configure.l_log_project:
                func_file.write_log("%t INSERT ELEMENT FIELD MODIFIED BY: " +
                                    s_database_input + "." +
                                    s_table_input + ": " +
                                    s_label_input)

        # CLOSE LOOP
        if not b_loop or s_type_input == "99":
            l_loop = False

        # CLEAN UP
        s_group = s_group_input
        s_name = "0"
        s_label = "0"
        s_type = "0"

    # RETURN NEWLY CREATED GROUP NUMBER
    return


if __name__ == '__main__':
    try:
        # fabrik_element_create()
        # fabrik_element_create(False, False, "internalid", "92", "1", "ia_findlike_auto", "ID")
        # fabrik_element_create(False, False, "field_50_notempty", "92", "2", "ia_findlike_name", "Likelihood *")
        # fabrik_element_create(False, False, "textarea_1024", "92", "3", "ia_findlike_desc", "Description")
        # fabrik_element_create(False, False, "radiobutton_15", "92", "4", "ia_findlike_value", "Value *")
        # fabrik_element_create(False, False, "radiobutton_yesno", "92", "5", "ia_findlike_active", "Active *")
        # fabrik_element_create(False, False, "jdate_from_today", "92", "6", "ia_findlike_from", "From date *")
        # fabrik_element_create(False, False, "jdate_to_2099", "92", "7", "ia_findlike_to", "To date *")
        # fabrik_element_create(False, False, "jdate_created", "92", "8", "ia_findlike_createdate", "Date created")
        fabrik_element_create(False, False, "jdate_modified", "92", "9", "ia_findlike_editdate", "Date modified")
    except Exception as e:
        func_system.error_message(e)
