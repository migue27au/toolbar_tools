#!/bin/bash


if [[ $1 == "tun" ]]; then
	vpn_ip=$(ip --brief address show | grep tun0 | grep -o -P '[0-9]{1,3}(\.[0-9]{1,3}){3}' | head -n 1)
	if [ $(echo $vpn_ip | wc -c) -gt 3 ]; then
		echo "<icon>network-vpn-symbolic</icon><txt><span weight='Bold' fgcolor='Yellow'>$vpn_ip</span></txt>"
		
		CMD="/opt/tools/toolbar/copy-ip.py wlan0"
		echo "<txtclick>$CMD</txtclick>"
	else
		echo ""
	fi
elif [[ $1 == "wlan" ]]; then
	private_ip=$(ip --brief address show | grep wlan0 | grep -o -P '[0-9]{1,3}(\.[0-9]{1,3}){3}' | head -n 1)
	private_ip_length=$(echo $private_ip | /usr/bin/wc -c)

	if [ $private_ip_length -gt 3 ]; then
		echo "<icon>kali-wifite</icon><txt>$private_ip</txt>"

		CMD="/opt/tools/toolbar/copy-ip.py wlan0"
		echo "<txtclick>$CMD</txtclick>"
	else
		echo ""
	fi
else
	private_ip=$(ip --brief address show | grep eth0 | grep -o -P '[0-9]{1,3}(\.[0-9]{1,3}){3}' | head -n 1)
	private_ip_length=$(echo $private_ip | /usr/bin/wc -c)

	if [ $private_ip_length -gt 3 ]; then
		echo "<icon>gnome-dev-ethernet</icon><txt>$private_ip</txt>"

		CMD="/opt/tools/toolbar/copy-ip.py eth0"
		echo "<txtclick>$CMD</txtclick>"
	else
		echo ""
	fi
fi