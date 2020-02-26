#!/bin/bash

# Программа пингует одиночные ip и диапазон ip



lan=192.168.103

Is_range()
{
	if [ $2 ] && [ $2 = - ];then
		echo true
	else
		echo false
	fi
}

Ping_single_IP()
{
	timeout 0.1 ping $lan.$1 -c 1 1>/dev/null 2>&1
	if [ $? = 0 ];then echo "$lan.$1 - OK"
	else
		echo "$lan.$1 - ***Error***"
	fi
}

Separate_IP()
{
	min=$1; max=$3;
	for ((i=$min;i<$max;i++));do
		Ping_single_IP $i
	done
}



Ping_all()
{
	while [ $1 ];do
		res=`Is_range $1 $2 $3`
		if [ $res = false ];then
			Ping_single_IP $1; shift
		else
			Separate_IP $1 $2 $3;shift;shift;shift;
		fi
	done
}

params=`echo $* |sed "s/-/ - /g"`

Ping_all $params
