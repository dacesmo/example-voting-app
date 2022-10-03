#!/bin/sh

# create 3000 votes (2000 for option a, 1000 for option b)

exec_time=$(/usr/bin/time -f "%S,%U,%e" ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)
echo "statsd_votes_command_exec_count:1|c" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_real:$(echo $exec_time | cut -d',' -f3)|g" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_user:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_sys:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
exec_time=$(/usr/bin/time -f "%S,%U,%e" ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)
echo "statsd_votes_command_exec_count:1|c" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_real:$(echo $exec_time | cut -d',' -f3)|g" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_user:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_sys:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
exec_time=$(/usr/bin/time -f "%S,%U,%e" ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)
echo "statsd_votes_command_exec_count:1|c" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_real:$(echo $exec_time | cut -d',' -f3)|g" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_user:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
echo "statsd_votes_command_exec_time_sys:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125