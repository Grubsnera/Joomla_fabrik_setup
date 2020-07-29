"""
Script to CREATE Joomla Fabrik list record
Copyright (C) AB Janse van Rensburg 20200718
"""


def fabrik_list_create(b_input: bool = False,
                       s_label: str = "New LIST to setup",
                       s_form: str = "0",
                       s_target_table: str = "0",
                       s_key_field: str = "0"):
    """
    
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
    if b_input:
        print("")
        print("Default fabrik list label: " + s_label)
        s_label_input = input("Fabrik LIST label? ")
        if s_label_input == "":
            s_label_input = s_label
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
    s_target_table_input = s_target_table
    if b_input or s_target_table_input == "0":
        print("")
        print("Default fabrik target table name: " + s_target_table)
        while s_target_table_input == "" or s_target_table_input == "0":
            s_target_table_input = input("Fabrik LIST target table name? ")
        print("")        

    # INPUT THE JOOMLA MYSQL FABRIK LIST KEY FIELD
    s_key_field_input = s_key_field
    if b_input or s_key_field_input == "0":
        print("")
        print("Default fabrik list key field: " + s_key_field)
        while s_key_field_input == "" or s_key_field_input == "0":
            s_key_field_input = input("Fabrik LIST key field? ")

    if func_configure.l_debug_project:
        print("INPUT")

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
    1,
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
    0,
    10,
    'bootstrap',
    '[\"\"]',
    '[\"ASC\"]',
    'onchange',
    '',
    0,
    '{
    \"show-table-filters\":\"1\",
    \"advanced-filter\":\"0\",
    \"advanced-filter-default-statement\":\"=\",
    \"search-mode\":\"0\",
    \"search-mode-advanced\":\"0\",
    \"search-mode-advanced-default\":\"all\",
    \"search_elements\":\"\",
    \"list_search_elements\":\"null\",
    \"search-all-label\":\"All\",
    \"require-filter\":\"0\",
    \"require-filter-msg\":\"\",
    \"filter-dropdown-method\":\"0\",
    \"toggle_cols\":\"0\",
    \"list_filter_cols\":\"1\",
    \"empty_data_msg\":\"\",
    \"outro\":\"\",
    \"list_ajax\":\"0\",
    \"show-table-add\":\"1\",
    \"show-table-nav\":\"1\",
    \"show_displaynum\":\"1\",
    \"showall-records\":\"1\",
    \"show-total\":\"1\",
    \"sef-slug\":\"\",
    \"show-table-picker\":\"1\",
    \"admin_template\":\"\",
    \"show-title\":\"1\",
    \"pdf\":\"\",
    \"pdf_template\":\"\",
    \"pdf_orientation\":\"portrait\",
    \"pdf_size\":\"a4\",
    \"pdf_include_bootstrap\":\"1\",
    \"bootstrap_stripped_class\":\"1\",
    \"bootstrap_bordered_class\":\"0\",
    \"bootstrap_condensed_class\":\"1\",
    \"bootstrap_hover_class\":\"1\",
    \"responsive_elements\":\"\",
    \"responsive_class\":\"\",
    \"list_responsive_elements\":\"null\",
    \"tabs_field\":\"\",
    \"tabs_max\":\"10\",
    \"tabs_all\":\"1\",
    \"list_ajax_links\":\"0\",
    \"actionMethod\":\"default\",
    \"detailurl\":\"\",
    \"detaillabel\":\"\",
    \"list_detail_link_icon\":\"search\",
    \"list_detail_link_target\":\"_self\",
    \"editurl\":\"\",
    \"editlabel\":\"\",
    \"list_edit_link_icon\":\"edit\",
    \"checkboxLocation\":\"end\",
    \"addurl\":\"\",
    \"addlabel\":\"\",
    \"list_add_icon\":\"plus\",
    \"list_delete_icon\":\"delete\",
    \"popup_width\":\"\",
    \"popup_height\":\"\",
    \"popup_offset_x\":\"\",
    \"popup_offset_y\":\"\",
    \"note\":\"\",
    \"alter_existing_db_cols\":\"default\",
    \"process-jplugins\":\"1\",
    \"cloak_emails\":\"0\",
    \"enable_single_sorting\":\"default\",
    \"collation\":\"utf8_general_ci\",
    \"force_collate\":\"\",
    \"list_disable_caching\":\"0\",
    \"distinct\":\"1\",
    \"group_by_raw\":\"1\",
    \"group_by_access\":\"1\",
    \"group_by_order\":\"\",
    \"group_by_template\":\"\",
    \"group_by_template_extra\":\"\",
    \"group_by_order_dir\":\"ASC\",
    \"group_by_start_collapsed\":\"0\",
    \"group_by_collapse_others\":\"0\",
    \"group_by_show_count\":\"1\",
    \"menu_module_prefilters_override\":\"1\",
    \"prefilter_query\":\"\",
    \"join-display\":\"default\",
    \"delete-joined-rows\":\"0\",
    \"show_related_add\":\"0\",
    \"show_related_info\":\"0\",
    \"rss\":\"0\",
    \"feed_title\":\"\",
    \"feed_date\":\"\",
    \"feed_image_src\":\"\",
    \"rsslimit\":\"150\",
    \"rsslimitmax\":\"2500\",
    \"csv_import_frontend\":\"3\",
    \"csv_export_frontend\":\"2\",
    \"csvfullname\":\"0\",
    \"csv_export_step\":\"100\",
    \"newline_csv_export\":\"nl2br\",
    \"csv_clean_html\":\"leave\",
    \"csv_multi_join_split\":\",
    \",
    \"csv_custom_qs\":\"\",
    \"csv_frontend_selection\":\"0\",
    \"incfilters\":\"0\",
    \"csv_format\":\"0\",
    \"csv_which_elements\":\"selected\",
    \"show_in_csv\":\"\",
    \"csv_elements\":\"null\",
    \"csv_include_data\":\"1\",
    \"csv_include_raw_data\":\"1\",
    \"csv_include_calculations\":\"0\",
    \"csv_filename\":\"\",
    \"csv_encoding\":\"\",
    \"csv_double_quote\":\"1\",
    \"csv_local_delimiter\":\"\",
    \"csv_end_of_line\":\"n\",
    \"open_archive_active\":\"0\",
    \"open_archive_set_spec\":\"\",
    \"open_archive_timestamp\":\"\",
    \"open_archive_license\":\"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf\",
    \"dublin_core_element\":\"\",
    \"dublin_core_type\":\"dc:description.abstract\",
    \"raw\":\"0\",
    \"open_archive_elements\":\"null\",
    \"search_use\":\"0\",
    \"search_title\":\"\",
    \"search_description\":\"\",
    \"search_date\":\"\",
    \"search_link_type\":\"details\",
    \"dashboard\":\"0\",
    \"dashboard_icon\":\"\",
    \"allow_view_details\":\"1\",
    \"allow_edit_details\":\"1\",
    \"allow_edit_details2\":\"\",
    \"allow_add\":\"1\",
    \"allow_delete\":\"2\",
    \"allow_delete2\":\"\",
    \"allow_drop\":\"3\",
    \"menu_access_only\":\"0\",
    \"isview\":\"0\"    
    }'
    """ + ");"
    # print(s_sql)  # DEBUG
    s_sql = s_sql.replace("%LABEL%", s_label_input)
    s_sql = s_sql.replace("%CREATED_BY%", s_created_by)
    s_sql = s_sql.replace("%FORM%", s_form_input)
    s_sql = s_sql.replace("%TABLE_TARGET%", s_target_table_input)
    s_sql = s_sql.replace("%KEY_FIELD%", s_key_field_input)    
    # print(s_sql)  # DEBUG
    curs.execute(s_sql)
    mysql_connection.commit()
    if func_configure.l_log_project:
        func_file.write_log("%t INSERT RECORD: "+s_database_input+"."+s_table_input+": "+s_label_input)

    # LIST DEFAULT PARAMETERS
    """
    (
    1,
    'list label',
    '',
    1,
    'table',
    'table.id',
    1,
    1,
    '0000-00-00 00:00:00',
    0,
    '',
    '0000-00-00 00:00:00',
    1,
    0,
    '0000-00-00 00:00:00',
    1,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00',
    1,
    9,
    10,
    'bootstrap',
    '[\"12\"]',
    '[\"ASC\"]',
    'onchange',
    '',
    0,
    '{
    \"show-table-filters\":\"1\",
    \"advanced-filter\":\"0\",
    \"advanced-filter-default-statement\":\"=\",
    \"search-mode\":\"0\",
    \"search-mode-advanced\":\"0\",
    \"search-mode-advanced-default\":\"all\",
    \"search_elements\":\"\",
    \"list_search_elements\":\"null\",
    \"search-all-label\":\"All\",
    \"require-filter\":\"0\",
    \"require-filter-msg\":\"\",
    \"filter-dropdown-method\":\"0\",
    \"toggle_cols\":\"0\",
    \"list_filter_cols\":\"1\",
    \"empty_data_msg\":\"\",
    \"outro\":\"\",
    \"list_ajax\":\"0\",
    \"show-table-add\":\"1\",
    \"show-table-nav\":\"1\",
    \"show_displaynum\":\"1\",
    \"showall-records\":\"0\",
    \"show-total\":\"0\",
    \"sef-slug\":\"\",
    \"show-table-picker\":\"1\",
    \"admin_template\":\"\",
    \"show-title\":\"1\",
    \"pdf\":\"\",
    \"pdf_template\":\"\",
    \"pdf_orientation\":\"portrait\",
    \"pdf_size\":\"a4\",
    \"pdf_include_bootstrap\":\"1\",
    \"bootstrap_stripped_class\":\"1\",
    \"bootstrap_bordered_class\":\"0\",
    \"bootstrap_condensed_class\":\"0\",
    \"bootstrap_hover_class\":\"1\",
    \"responsive_elements\":\"\",
    \"responsive_class\":\"\",
    \"list_responsive_elements\":\"null\",
    \"tabs_field\":\"\",
    \"tabs_max\":\"10\",
    \"tabs_all\":\"1\",
    \"list_ajax_links\":\"0\",
    \"actionMethod\":\"default\",
    \"detailurl\":\"\",
    \"detaillabel\":\"\",
    \"list_detail_link_icon\":\"search\",
    \"list_detail_link_target\":\"_self\",
    \"editurl\":\"\",
    \"editlabel\":\"\",
    \"list_edit_link_icon\":\"edit\",
    \"checkboxLocation\":\"end\",
    \"addurl\":\"\",
    \"addlabel\":\"\",
    \"list_add_icon\":\"plus\",
    \"list_delete_icon\":\"delete\",
    \"popup_width\":\"\",
    \"popup_height\":\"\",
    \"popup_offset_x\":\"\",
    \"popup_offset_y\":\"\",
    \"note\":\"\",
    \"alter_existing_db_cols\":\"default\",
    \"process-jplugins\":\"1\",
    \"cloak_emails\":\"0\",
    \"enable_single_sorting\":\"default\",
    \"collation\":\"utf8_general_ci\",
    \"force_collate\":\"\",
    \"list_disable_caching\":\"0\",
    \"distinct\":\"1\",
    \"group_by_raw\":\"1\",
    \"group_by_access\":\"1\",
    \"group_by_order\":\"\",
    \"group_by_template\":\"\",
    \"group_by_template_extra\":\"\",
    \"group_by_order_dir\":\"ASC\",
    \"group_by_start_collapsed\":\"0\",
    \"group_by_collapse_others\":\"0\",
    \"group_by_show_count\":\"1\",
    \"menu_module_prefilters_override\":\"1\",
    \"prefilter_query\":\"\",
    \"join-display\":\"default\",
    \"delete-joined-rows\":\"0\",
    \"show_related_add\":\"0\",
    \"show_related_info\":\"0\",
    \"rss\":\"0\",
    \"feed_title\":\"\",
    \"feed_date\":\"\",
    \"feed_image_src\":\"\",
    \"rsslimit\":\"150\",
    \"rsslimitmax\":\"2500\",
    \"csv_import_frontend\":\"3\",
    \"csv_export_frontend\":\"2\",
    \"csvfullname\":\"0\",
    \"csv_export_step\":\"100\",
    \"newline_csv_export\":\"nl2br\",
    \"csv_clean_html\":\"leave\",
    \"csv_multi_join_split\":\",
    \",
    \"csv_custom_qs\":\"\",
    \"csv_frontend_selection\":\"0\",
    \"incfilters\":\"0\",
    \"csv_format\":\"0\",
    \"csv_which_elements\":\"selected\",
    \"show_in_csv\":\"\",
    \"csv_elements\":\"null\",
    \"csv_include_data\":\"1\",
    \"csv_include_raw_data\":\"1\",
    \"csv_include_calculations\":\"0\",
    \"csv_filename\":\"\",
    \"csv_encoding\":\"\",
    \"csv_double_quote\":\"1\",
    \"csv_local_delimiter\":\"\",
    \"csv_end_of_line\":\"n\",
    \"open_archive_active\":\"0\",
    \"open_archive_set_spec\":\"\",
    \"open_archive_timestamp\":\"\",
    \"open_archive_license\":\"http:\\/\\/creativecommons.org\\/licenses\\/by-nd\\/2.0\\/rdf\",
    \"dublin_core_element\":\"\",
    \"dublin_core_type\":\"dc:description.abstract\",
    \"raw\":\"0\",
    \"open_archive_elements\":\"null\",
    \"search_use\":\"0\",
    \"search_title\":\"\",
    \"search_description\":\"\",
    \"search_date\":\"\",
    \"search_link_type\":\"details\",
    \"dashboard\":\"0\",
    \"dashboard_icon\":\"\",
    \"allow_view_details\":\"1\",
    \"allow_edit_details\":\"1\",
    \"allow_edit_details2\":\"\",
    \"allow_add\":\"1\",
    \"allow_delete\":\"2\",
    \"allow_delete2\":\"\",
    \"allow_drop\":\"3\",
    \"menu_access_only\":\"0\",
    \"isview\":\"0\"}'
    );
    """

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
