"""
Various system functions
Author: AB Janse van Rensburg on 2020-07-13
"""

"""
INDEX
error_message: Error message handler
"""


def error_message(e,
                  s_subject: str = '',
                  s_body: str = ''):
    """
    Error message handler.
    :param e: Error object
    :param s_subject: Mail subject
    :param s_body: Mail body
    :return: Nothing
    """

    # IMPORT OWN MODULES
    from _my_modules import func_configure
    from _my_modules import func_file
    # from _my_modules import func_mail
    # from _my_modules import func_sms

    # DECLARE VARIABLES
    s_mess = str(e).replace("'", "")
    s_mess = s_mess.replace('"', '')
    s_mess = s_mess.replace(':', '')
    s_mess = s_mess.replace('[', '')
    s_mess = s_mess.replace(']', '')
    s_mess = s_mess.replace('(', '')
    s_mess = s_mess.replace(')', '')

    # DISPLAY
    print(s_mess)
    print("E: ", e)
    print("TYPE(E): ", type(e))
    print("TYPE(E)NAME: ", type(e).__name__)
    print("JOIN(E).ARGS: ", e.args)

    # DEFINE THE ERROR TEMPLATE AND MESSAGE
    template = "Exception type {0} occurred. Arguments:\n{1!r}"
    message = template.format(type(e).__name__, e.args)
    print("MESSAGE: ", message)

    """
    # SEND MAIL
    if func_configure.l_mail_project and s_subject != '' and s_body != '':
        # s_body1 = s_body + '\n' + type(e).__name__ + '\n' + "".join(e.args)
        s_body1 = s_body + '\n' + s_mess
        func_mail.Mail('std_fail_gmail', s_subject, s_body1)
    """

    """
    # SEND MESSAGE
    if func_configure.l_mess_project:
        # s_body1 = s_body + ' | ' + type(e).__name__ + ' | ' + "".join(e.args)
        s_body1 = s_body + ' | ' + s_mess
        func_sms.send_telegram('', 'administrator', s_body1)
    """

    # WRITE ERROR TO LOG
    if func_configure.l_log_project:
        func_file.write_log("%t ERROR: " + type(e).__name__, func_configure.s_path_project + 'log/')
        func_file.write_log("%t ERROR: " + s_mess, func_configure.s_path_project + 'log/')

    return
