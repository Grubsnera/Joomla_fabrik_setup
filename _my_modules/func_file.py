"""
File handling and log file functions
Author: AB Janse van Rensburg on 2020-07-13
"""

# IMPORT SYSTEM OBJECTS
import datetime

"""
INDEX
write_log: Write log entry to file
"""


def write_log(s_entry="\n",
              s_path="log/",
              s_file="Python_log_" +
                     datetime.datetime.now().strftime("%Y%m%d") +
                     ".txt"):
    """
    Function to create log file
    :param s_entry: Log file entry
    :param s_path: Log file path
    :param s_file: Log file name
    :return: Nothing
    """

    # IMPORT OWN MODULES
    from _my_modules import func_configure
    from _my_modules import func_system

    # DECLARE VARIABLES
    l_success: bool = False
    s_project: str = "WRITE_LOG: " + s_file

    try:

        with open(s_path + s_file, 'a', encoding="utf-8") as fl:
            # file opened for writing. write to it here
            # Write the log
            if s_entry == "Now":
                fl.write("----------------\n")
                s_entry = datetime.datetime.now().strftime("%Y-%m-%d %H:%M") + "\n"
            elif "%t" in s_entry:
                s_entry = s_entry.replace("%t", datetime.datetime.now().strftime("%H:%M:%S"))
                s_entry += "\n"
            else:
                s_entry += "\n"
            fl.write(s_entry)
            fl.close()
            pass
            l_success = True

    except Exception as err:

        func_system.error_message(err,
                                  func_configure.s_name_project + ':Fail:' + s_project,
                                  func_configure.s_name_project + ': Fail: ' + s_project)

    return l_success
