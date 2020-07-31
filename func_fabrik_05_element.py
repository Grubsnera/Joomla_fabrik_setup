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
    1 INTERNAL ID SETUP
    2 CREATE DATE SETUP    
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
        1 INTERNAL ID SETUP
        ********************************************************************"""

        if s_type_input == "1":

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
            NULL,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "show_in_rss_feed":"0",
            "show_label_in_rss_feed":"0",
            "use_as_rss_enclosure":"0",
            "rollover":"",
            "tipseval":"0",
            "tiplocation":"top-left",
            "labelindetails":"0",
            "labelinlist":"0",
            "comment":"",
            "edit_access":"1",
            "edit_access_user":"",
            "view_access":"1",
            "view_access_user":"",
            "list_view_access":"1",
            "encrypt":"0",
            "store_in_db":"1",
            "default_on_copy":"0",
            "can_order":"0",
            "alt_list_heading":"",
            "custom_link":"",
            "custom_link_target":"",
            "custom_link_indetails":"1",
            "use_as_row_class":"0",
            "include_in_list_query":"1",
            "always_render":"0",
            "icon_folder":"0",
            "icon_hovertext":"1",
            "icon_file":"",
            "icon_subdir":"",
            "filter_length":"20",
            "filter_access":"1",
            "full_words_only":"0",
            "filter_required":"0",
            "filter_build_method":"0",
            "filter_groupby":"text",
            "inc_in_adv_search":"1",
            "filter_class":"input-medium",
            "filter_responsive_class":"",
            "tablecss_header_class":"",
            "tablecss_header":"",
            "tablecss_cell_class":"",
            "tablecss_cell":"",
            "sum_on":"0",
            "sum_label":"Sum",
            "sum_access":"1",
            "sum_split":"",
            "avg_on":"0",
            "avg_label":"Average",
            "avg_access":"1",
            "avg_round":"0",
            "avg_split":"",
            "median_on":"0",
            "median_label":"Median",
            "median_access":"1",
            "median_split":"",
            "count_on":"0",
            "count_label":"Count",
            "count_condition":"",
            "count_access":"1",
            "count_split":"",
            "custom_calc_on":"0",
            "custom_calc_label":"Custom",
            "custom_calc_query":"",
            "custom_calc_access":"1",
            "custom_calc_split":"",
            "custom_calc_php":"",
            "validations":[]
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

            # INTERNAL ID DEFAULT PARAMETERS
            """
            (
            `id`,
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
            )
            VALUES
            (
            'field name',
            0,
            'internalid',
            'label',
            0,
            '0000-00-00 00:00:00',
            '0000-00-00 00:00:00',
            0,
            'super user',
            '0000-00-00 00:00:00',
            0,
            11,
            6,
            '',
            0,
            0,
            %ORDER%,
            1,
            NULL,
            NULL,
            1,
            0,
            0,
            0,
            1,
            0,
            0,
            '{
            "alt_list_heading":"",
            "always_render":"0",
            "avg_access":"1",
            "avg_label":"Average",
            "avg_on":"0",
            "avg_round":"0",
            "avg_split":"",
            "can_order":"0",
            "comment":"",
            "count_access":"1",
            "count_condition":"",
            "count_label":"Count",
            "count_on":"0",
            "count_split":"",
            "custom_calc_access":"1",
            "custom_calc_label":"Custom",
            "custom_calc_on":"0",
            "custom_calc_php":"",
            "custom_calc_query":"",
            "custom_calc_split":"",
            "custom_link":"",
            "custom_link_indetails":"1",
            "custom_link_target":"",
            "default_on_copy":"0",
            "edit_access":"1",
            "edit_access_user":"",
            "encrypt":"0",
            "filter_access":"1",
            "filter_build_method":"0",
            "filter_class":"input-medium",
            "filter_groupby":"text",
            "filter_length":"20",
            "filter_required":"0",
            "filter_responsive_class":"",
            "full_words_only":"0",
            "icon_file":"",
            "icon_folder":"0",
            "icon_hovertext":"1",
            "icon_subdir":"",
            "inc_in_adv_search":"1",
            "include_in_list_query":"1",
            "labelindetails":"0",
            "labelinlist":"0",
            "list_view_access":"1",
            "median_access":"1",
            "median_label":"Median",
            "median_on":"0",
            "median_split":"",
            "rollover":"","tipseval":"0",
            "show_in_rss_feed":"0",
            "show_label_in_rss_feed":"0",
            "store_in_db":"1",
            "sum_access":"1",
            "sum_label":"Sum",
            "sum_on":"0",
            "sum_split":"",
            "tablecss_cell":"",
            "tablecss_cell_class":"",
            "tablecss_header":"",
            "tablecss_header_class":"",
            "tiplocation":"top-left",
            "use_as_row_class":"0",
            "use_as_rss_enclosure":"0",
            "validations":[],
            "view_access":"1",
            "view_access_user":""
            }'
            );
            """

        """********************************************************************
        1 CREATE DATE SETUP
        ********************************************************************"""

        if s_type_input == "2":

            if func_configure.l_debug_project:
                print("CREATE ELEMENT 2 CREATE DATE")

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
            0,
            0,
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
            "bootstrap_class":"input-medium",
            "jdate_showtime":"0",
            "jdate_time_format":"H:i",
            "jdate_time_24":"1",
            "jdate_store_as_local":"1",
            "jdate_table_format":"Y-m-d",
            "jdate_form_format":"Y-m-d H:i",
            "jdate_defaulttotoday":"1",
            "jdate_alwaystoday":"0",
            "jdate_allow_typing_in_field":"0",
            "jdate_show_week_numbers":"0",
            "jdate_csv_offset_tz":"0",
            "show_in_rss_feed":"0",
            "show_label_in_rss_feed":"0",
            "use_as_rss_enclosure":"0",
            "rollover":"",
            "tipseval":"0",
            "tiplocation":"top-left",
            "labelindetails":"0",
            "labelinlist":"0",
            "comment":"",
            "edit_access":"1",
            "edit_access_user":"",
            "view_access":"1",
            "view_access_user":"",
            "list_view_access":"1",
            "encrypt":"0",
            "store_in_db":"1",
            "default_on_copy":"0",
            "can_order":"0",
            "alt_list_heading":"",
            "custom_link":"",
            "custom_link_target":"",
            "custom_link_indetails":"0",
            "use_as_row_class":"0",
            "include_in_list_query":"0",
            "always_render":"0",
            "icon_folder":"0",
            "icon_hovertext":"0",
            "icon_file":"",
            "icon_subdir":"",
            "filter_length":"20",
            "filter_access":"1",
            "full_words_only":"0",
            "filter_required":"0",
            "filter_build_method":"0",
            "filter_groupby":"text",
            "inc_in_adv_search":"1",
            "filter_class":"input-medium",
            "filter_responsive_class":"",
            "tablecss_header_class":"",
            "tablecss_header":"",
            "tablecss_cell_class":"",
            "tablecss_cell":"",
            "sum_on":"0",
            "sum_label":"Sum",
            "sum_access":"1",
            "sum_split":"",
            "avg_on":"0",
            "avg_label":"Average",
            "avg_access":"1",
            "avg_round":"0",
            "avg_split":"",
            "median_on":"0",
            "median_label":"Median",
            "median_access":"1",
            "median_split":"",
            "count_on":"0",
            "count_label":"Count",
            "count_condition":"",
            "count_access":"1",
            "count_split":"",
            "custom_calc_on":"0",
            "custom_calc_label":"Custom",
            "custom_calc_query":"",
            "custom_calc_access":"1",
            "custom_calc_split":"",
            "custom_calc_php":"",
            "validations":[]
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
                    "%t INSERT ELEMENT DATE CREATED: " + s_database_input + "." + s_table_input + ": " + s_label_input)

            # JOOMLA FABRIK JDATE DEFAULT PARAMETERS
            """
            (
            `id`,
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
            )
            VALUES
            (
            0,
            'field name',
            0,
            'jdate',
            'label',
            0,
            '0000-00-00 00:00:00',
            '0000-00-00 00:00:00',
            0,
            'super user',
            '0000-00-00 00:00:00',
            0,
            0,
            0,
            '',
            0,
            0,
            %ORDER%,
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
            "bootstrap_class":"input-medium",
            "jdate_showtime":"0",
            "jdate_time_format":"",
            "jdate_time_24":"1",
            "jdate_store_as_local":"0",
            "jdate_table_format":"Y-m-d",
            "jdate_form_format":"Y-m-d",
            "jdate_defaulttotoday":"0",
            "jdate_alwaystoday":"0",
            "jdate_allow_typing_in_field":"1",
            "jdate_show_week_numbers":"0",
            "jdate_csv_offset_tz":"0",
            "show_in_rss_feed":"0",
            "show_label_in_rss_feed":"0",
            "use_as_rss_enclosure":"0",
            "rollover":"",
            "tipseval":"0",
            "tiplocation":"top-left",
            "labelindetails":"0",
            "labelinlist":"0",
            "comment":"",
            "edit_access":"1",
            "edit_access_user":"",
            "view_access":"1",
            "view_access_user":"",
            "list_view_access":"1",
            "encrypt":"0",
            "store_in_db":"1",
            "default_on_copy":"0",
            "can_order":"0",
            "alt_list_heading":"",
            "custom_link":"",
            "custom_link_target":"",
            "custom_link_indetails":"1",
            "use_as_row_class":"0",
            "include_in_list_query":"1",
            "always_render":"0",
            "icon_folder":"0",
            "icon_hovertext":"1",
            "icon_file":"",
            "icon_subdir":"",
            "filter_length":"20",
            "filter_access":"1",
            "full_words_only":"0",
            "filter_required":"0",
            "filter_build_method":"0",
            "filter_groupby":"text",
            "inc_in_adv_search":"1",
            "filter_class":"input-medium",
            "filter_responsive_class":"",
            "tablecss_header_class":"",
            "tablecss_header":"",
            "tablecss_cell_class":"",
            "tablecss_cell":"",
            "sum_on":"0",
            "sum_label":"Sum",
            "sum_access":"1",
            "sum_split":"",
            "avg_on":"0",
            "avg_label":"Average",
            "avg_access":"1",
            "avg_round":"0",
            "avg_split":"",
            "median_on":"0",
            "median_label":"Median",
            "median_access":"1",
            "median_split":"",
            "count_on":"0",
            "count_label":"Count",
            "count_condition":"",
            "count_access":"1",
            "count_split":"",
            "custom_calc_on":"0",
            "custom_calc_label":"Custom",
            "custom_calc_query":"",
            "custom_calc_access":"1",
            "custom_calc_split":"",
            "custom_calc_php":"",
            "validations":[]
            }'
            );
            """



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
        fabrik_element_create()
        # fabrik_element_create(False, False, "1", "2", "1", "id", "ID")
        # fabrik_element_create(False, False, "2", "2", "2", "created", "Date created")

    except Exception as e:
        func_system.error_message(e)

