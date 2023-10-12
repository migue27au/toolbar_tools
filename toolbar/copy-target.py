#!/usr/bin/env python3
#coding utf-8

import pyperclip

clipboard_text = open("/opt/tools/toolbar/target.txt").read().replace("\n", "")
pyperclip.copy(clipboard_text)