#!/usr/bin/env python3

from email.mime.text import MIMEText
import smtplib
import sys

FROM_EMAIL = 'davidlandry@outlook.com'
TO_EMAIL = 'davidlandry93@gmail.com'
PASSWORD_FILE_NAME = '/home/david/.outlookpass'

password = ''
with open(PASSWORD_FILE_NAME) as f:
    password = f.readline()
    f.close()

if not password:
    print('Failed to recover password.', file=sys.stderr)
    sys.exit(1)

subject = sys.argv[1]
message = sys.argv[2]

msg = MIMEText(message)
msg['From'] = FROM_EMAIL
msg['To'] = TO_EMAIL
msg['Subject'] = subject

server = smtplib.SMTP('smtp-mail.outlook.com', 587)
server.set_debuglevel(2)
server.starttls()
server.login(FROM_EMAIL, password)

msg_as_text = msg.as_string()
server.send_message(msg)
server.quit()
