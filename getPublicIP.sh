#!/bin/bash

public_ip=$(/usr/bin/curl --connect-timeout 2 -s http://ifconfig.co)
public_ip_length=$(echo $public_ip | /usr/bin/wc -c)

public_ip1="$(echo $public_ip | cut -d "." -f 1).$(echo $public_ip | cut -d "." -f 2)"
public_ip2="$(echo $public_ip | cut -d "." -f 3).$(echo $public_ip | cut -d "." -f 4)"

#echo $public_ip_length

labo_ips="1.1.1.1"

if [ $public_ip_length -gt 3 ] && [ $public_ip_length -lt 17 ]; then
	COLOR="White"
	if [[ $(echo $labo_ips | grep $public_ip  | wc -c) -gt 1 ]]; then
		COLOR="Red"
	fi
	echo " <txt><span weight='Bold' fgcolor='$COLOR'>$public_ip1 "
	echo " $public_ip2 </span></txt>"
	CMD="./copy-public-ip.py"
	printf "<txtclick>$CMD</txtclick>"
fi


