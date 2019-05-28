#!/bin/bash
# The MP setup

# This script calls connmanctl to manage Static/DHCP data
# pass in -d {1=static|2=dynamic} -i {ip address} -s {subnet mask} -g {default gateway}

DHCP="dhcp"
IP="192.168.1.200"
SM="255.255.255.0"
GW="192.168.1.1"

while getopts d:i:s:g: INPUTS; do
	case $INPUTS in
		d)
			#1=static or 2=DHCP
			DHCP=$OPTARG
			;;
		i)
			#IP Address
			IP=$OPTARG
			;;
		s)
			#Subnet Mask
			SM=$OPTARG
			;;
		g)
			#Gateway
			GW=$OPTARG
			;;
	esac
done

SVC=`connmanctl services | cut -d ' ' -f18`
#`connmanctl config $SVC --timeservers pool.ntp.org`
#`connmanctl config $SVC --ipv6 off`

if [ $DHCP = "2" ]; then
	# connmanctl config ethernet_024d05415461_cable --ipv4 dhcp --nameservers 4.2.2.2 8.8.8.8
	echo `connmanctl config $SVC --ipv4 dhcp --nameservers 4.2.2.2 8.8.8.8`
	#echo dhcp
else
	# connmanctl config ethernet_024d05415461_cable --ipv4 manual 10.10.10.32 255.255.255.0 10.10.10.250 --nameservers 4.2.2.2 8.8.8.8	
	echo `connmanctl config $SVC --ipv4 manual $IP $SM $GW --nameservers 4.2.2.2 8.8.8.8`
	#echo $SVC $IP $SM $GW
fi

# echo $IP
# echo $SM
# echo $GW