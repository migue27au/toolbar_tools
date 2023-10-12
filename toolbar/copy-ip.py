#!/usr/bin/env python3
#coding utf-8

import pyperclip, subprocess, sys

args = sys.argv[1:]

if len(args) > 0:
	cmd = "ip a s " + args[0] + " 2>/dev/null | grep -o -P '(?<=inet )[0-9]{1,3}(\.[0-9]{1,3}){3}'"
	p = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=True)
	ip = p.communicate()[0].decode('utf-8').replace("\n", "")
	pyperclip.copy(ip)