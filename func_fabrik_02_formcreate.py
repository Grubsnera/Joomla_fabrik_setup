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
    'Some parts of your form have not been correctly filled in.',
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
    \"outro\":\"\",
    \"copy_button\":\"0\",
    \"copy_button_label\":\"Save as copy\",
    \"copy_button_class\":\"\",
    \"copy_icon\":\"\",
    \"copy_icon_location\":\"before\",
    \"reset_button\":\"0\",
    \"reset_button_label\":\"Reset\",
    \"reset_button_class\":\"btn-warning\",
    \"reset_icon\":\"\",
    \"reset_icon_location\":\"before\",
    \"apply_button\":\"0\",
    \"apply_button_label\":\"Apply\",
    \"apply_button_class\":\"\",
    \"apply_icon\":\"\",
    \"apply_icon_location\":\"before\",
    \"goback_button\":\"1\",
    \"goback_button_label\":\"Go back\",
    \"goback_button_class\":\"\",
    \"goback_icon\":\"\",
    \"goback_icon_location\":\"before\",
    \"submit_button\":\"1\",
    \"submit_button_label\":\"Save\",
    \"save_button_class\":\"btn-primary\",
    \"save_icon\":\"\",
    \"save_icon_location\":\"before\",
    \"submit_on_enter\":\"0\",
    \"delete_button\":\"0\",
    \"delete_button_label\":\"Delete\",
    \"delete_button_class\":\"btn-danger\",
    \"delete_icon\":\"\",
    \"delete_icon_location\":\"before\",
    \"ajax_validations\":\"0\",
    \"ajax_validations_toggle_submit\":\"0\",
    \"submit-success-msg\":\"\",
    \"suppress_msgs\":\"0\",
    \"show_loader_on_submit\":\"0\",
    \"spoof_check\":\"1\",
    \"multipage_save\":\"0\",
    \"note\":\"\",
    \"labels_above\":\"0\",
    \"labels_above_details\":\"0\",
    \"pdf_template\":\"\",
    \"pdf_orientation\":\"portrait\",
    \"pdf_size\":\"a4\",
    \"pdf_include_bootstrap\":\"1\",
    \"admin_form_template\":\"\",
    \"admin_details_template\":\"\",
    \"show-title\":\"1\",
    \"print\":\"\",
    \"email\":\"\",
    \"pdf\":\"\",
    \"show-referring-table-releated-data\":\"0\",
    \"tiplocation\":\"tip\",
    \"process-jplugins\":\"2\",
    \"plugins\":[],
    \"plugin_locations\":[],
    \"plugin_events\":[],
    \"plugin_description\":[]    
    }'
    """ + ");"
    # print(s_sql) # DEBUG
    s_sql = s_sql.replace("%LABEL%", s_form_input)
    s_sql = s_sql.replace("%CREATED_BY%", s_created_by)
    curs.execute(s_sql)
    mysql_connection.commit()
    if func_configure.l_log_project:
        func_file.write_log("%t INSERT RECORD: " + s_database_input + "." + s_table_input + ":" + s_form_input)

    # FORM DEFAULT PARAMETERS
    """
    (
    1,
    'form label',
    1,
    'error message',
    '',
    '0000-00-00 00:00:00',
    1,
    'super user',
    '0000-00-00 00:00:00',
    0,
    0,
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00',
    '0000-00-00 00:00:00',
    '',
    'Save',
    'bootstrap',
    'bootstrap',
    1,
    0,
    '{
    \"outro\":\"\",
    \"reset_button\":\"0\",
    \"reset_button_label\":\"Reset\",
    \"reset_button_class\":\"btn-warning\",
    \"reset_icon\":\"\",
    \"reset_icon_location\":\"before\",
    \"copy_button\":\"0\",
    \"copy_button_label\":\"Save as copy\",
    \"copy_button_class\":\"\",
    \"copy_icon\":\"\",
    \"copy_icon_location\":\"before\",
    \"goback_button\":\"0\",
    \"goback_button_label\":\"Go back\",
    \"goback_button_class\":\"\",
    \"goback_icon\":\"\",
    \"goback_icon_location\":\"before\",
    \"apply_button\":\"0\",
    \"apply_button_label\":\"Apply\",
    \"apply_button_class\":\"\",
    \"apply_icon\":\"\",
    \"apply_icon_location\":\"before\",
    \"delete_button\":\"0\",
    \"delete_button_label\":\"Delete\",
    \"delete_button_class\":\"btn-danger\",
    \"delete_icon\":\"\",
    \"delete_icon_location\":\"before\",
    \"submit_button\":\"1\",
    \"submit_button_label\":\"Save\",
    \"save_button_class\":\"btn-primary\",
    \"save_icon\":\"\",
    \"save_icon_location\":\"before\",
    \"submit_on_enter\":\"0\",
    \"labels_above\":\"0\",
    \"labels_above_details\":\"0\",
    \"pdf_template\":\"admin\",
    \"pdf_orientation\":\"portrait\",
    \"pdf_size\":\"letter\",
    \"pdf_include_bootstrap\":\"1\",
    \"show_title\":\"1\",
    \"print\":\"\",
    \"email\":\"\",
    \"pdf\":\"\",
    \"admin_form_template\":\"\",
    \"admin_details_template\":\"\",
    \"note\":\"\",
    \"show_referring_table_releated_data\":\"0\",
    \"tiplocation\":\"tip\",
    \"process_jplugins\":\"2\",
    \"ajax_validations\":\"0\",
    \"ajax_validations_toggle_submit\":\"0\",
    \"submit_success_msg\":\"\",
    \"suppress_msgs\":\"0\",
    \"show_loader_on_submit\":\"0\",
    \"spoof_check\":\"1\",
    \"multipage_save\":\"0\"
    }'
    );
    """

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
