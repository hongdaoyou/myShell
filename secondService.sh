#!/bin/bash

option=$1

function start_service()
{	
	while true ; do
		/usr/bin/php /var/www/html/line/interface/crond/cronTest.php >>/var/www/html/line/log/auto/auto.log 2>&1
		sleep 3;
	done
}

function stop_service()
{
	killall -9 secondService
}

case $option in
	'start')
		echo '111'
		stop_service
		start_service
	;;
	'stop')
		echo '222'
		stop_service
	;;
	'reload')
		echo '33';
		stop_service
		start_service
	;;
	*)
		echo 'other'
	;;
esac

exit


