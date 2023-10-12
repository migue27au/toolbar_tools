#!/usr/bin/env python3
#coding utf-8

import pyperclip, subprocess

cmd = "/usr/bin/curl --connect-timeout 2 -s http://ifconfig.co"
p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
ip = p.communicate()[0].decode('utf-8').replace("\n", "")
pyperclip.copy(ip)