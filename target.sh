#!/bin/bash

CMD="./copy-target.py"

if [[ $1 == "get" ]]; then
	target_bytes=$(/usr/bin/cat /tmp/target_cmd_target.txt | /usr/bin/wc -c)
	if [ $target_bytes -gt 1 ]; then
		INFO="<icon>redeyes</icon><txt><span fgcolor='White'>$(/usr/bin/cat /tmp/target_cmd_target.txt)</span></txt>"
		INFO+="<txtclick>$CMD</txtclick>"
	else
		INFO=""
	fi
	
	echo -e "${INFO}"

else
	echo $1 > /tmp/target_cmd_target.txt
fi
