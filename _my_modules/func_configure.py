"""
Script to define / declare global variables
Copyright (C) AB Janse van Rensburg on 20200717
"""

# CORRESPONDENCE VARIABLES
s_name_project: str = 'IANWU'  # Name of the project.
# s_name_project: str = 'STUDMASTER'  # Name of the project.
l_debug_project: bool = True  # Flag to display on screen print messages.
l_log_project: bool = True  # Flag to save actions in log file.
l_mail_project: bool = False  # Flag to indicate project sending emails.
l_mess_project: bool = False  # Flag to indicate project sending text messages.

# VARIABLES ONLY FOR THE JOOMLA FABRIK PROJECT
if s_name_project == "STUDMASTER":
    s_joomla_database: str = 'web_studmaster'  # The JOOMLA database name.
    s_joomla_prefix: str = 'joomla'  # The JOOMLA table prefix.
    s_user_id: str = '414'  # The JOOMLA super user id. Used to populate the creator id in all fabrik tables.

if s_name_project == "IANWU":
    s_joomla_database = 'ia_joomla'
    s_joomla_prefix = "ianwu"
    s_user_id = "854"
