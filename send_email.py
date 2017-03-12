#!/usr/bin/env python3

from email.mime.text import MIMEText
import smtplib
import sys

FROM_EMAIL = 'davidlandry@outlook.com'
TO_EMAIL = 'davidlandry93@gmail.com'
PASSWORD_FILE_NAME = 'pass.txt'

password = ''
with open(PASSWORD_FILE_NAME) as f:
    password = f.readline()
    f.close()

if not password:
    print('Failed to recover password.', file=sys.stderr)
    sys.exit(1)

device_name = sys.argv[1]

msg = MIMEText('SMART error on hdd {} on Drake.'.format(device_name))
msg['From'] = FROM_EMAIL
msg['To'] = TO_EMAIL
msg['Subject'] = 'SMART error on Drake'

server = smtplib.SMTP('smtp-mail.outlook.com', 587)
server.set_debuglevel(2)
server.starttls()
server.login(FROM_EMAIL, password)

msg_as_text = msg.as_string()
server.send_message(msg)
server.quit()
