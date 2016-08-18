#!/bin/sh
if [ ! -e /tmp/bwmon.tmp ]; then

	#$1 time
	tcpdump -q -n -t -e -i br-lan > /tmp/bwmon.tmp &

	PID_tcpdump=$!

	sleep $1

	kill $PID_tcpdump

	mv /tmp/bwmon.tmp /tmp/bwmon.done
else
	sleep $1
fi
