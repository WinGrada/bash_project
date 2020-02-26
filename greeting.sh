#!/bin/bash


# Программа  Показывает имя пользователя, его IP, дату и версию ядра.
#


Get_date()
{
	echo -e "\tDate: `date +%T`"
}

Get_IP()
{
	IP=`ifconfig |grep "inet" |awk '{print $2}' |grep -v 127.0.0.1 |grep -v 192.168.122.1`
	echo -e "\tIP: $IP"
}

Get_name()
{
	echo -e "\tServer: `hostname`"
}

Get_name_kernel()
{
	echo -e "\tKernel: `uname -r`"
}

echo
Get_date
Get_IP
Get_name
Get_name_kernel
echo

