#!/bin/sh

# create 3000 votes (2000 for option a, 1000 for option b)

# exec_time=$(/usr/bin/time -f "%S,%U,%e" ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)
# echo "statsd_votes_command_exec_count:1|c" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_real:$(echo $exec_time | cut -d',' -f3)|g" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_user:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_sys:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
# exec_time=$(/usr/bin/time -f "%S,%U,%e" ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)
# echo "statsd_votes_command_exec_count:1|c" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_real:$(echo $exec_time | cut -d',' -f3)|g" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_user:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_sys:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
# exec_time=$(/usr/bin/time -f "%S,%U,%e" ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)
# echo "statsd_votes_command_exec_count:1|c" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_real:$(echo $exec_time | cut -d',' -f3)|g" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_user:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125
# echo "statsd_votes_command_exec_time_sys:$(echo $exec_time | cut -d',' -f2)|g" > /dev/udp/127.0.0.1/8125


#ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/
exec=$(ab -n 1000 -c 50 -p posta -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)

# exec count++
echo "votes_exec_count:1|c" > /dev/udp/127.0.0.1/8125

# exec time total metrics
echo "votes_exec_conn_time_total_min:$(echo "$exec" | grep Total: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_mean:$(echo "$exec" | grep Total: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_sd:$(echo "$exec" | grep Total: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_med:$(echo "$exec" | grep Total: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_max:$(echo "$exec" | grep Total: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time connect metrics
echo "votes_exec_conn_time_connect_min:$(echo "$exec" | grep Connect: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_mean:$(echo "$exec" | grep Connect: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_sd:$(echo "$exec" | grep Connect: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_med:$(echo "$exec" | grep Connect: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_max:$(echo "$exec" | grep Connect: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time processing metrics
echo "votes_exec_conn_time_proc_min:$(echo "$exec" | grep Processing: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_mean:$(echo "$exec" | grep Processing: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_sd:$(echo "$exec" | grep Processing: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_med:$(echo "$exec" | grep Processing: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_max:$(echo "$exec" | grep Processing: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time waiting metrics
echo "votes_exec_conn_time_wait_min:$(echo "$exec" | grep Waiting: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_mean:$(echo "$exec" | grep Waiting: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_sd:$(echo "$exec" | grep Waiting: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_med:$(echo "$exec" | grep Waiting: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_max:$(echo "$exec" | grep Waiting: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

exec=$(ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)

# exec count++
echo "votes_exec_count:1|c" > /dev/udp/127.0.0.1/8125

# exec time total metrics
echo "votes_exec_conn_time_total_min:$(echo "$exec" | grep Total: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_mean:$(echo "$exec" | grep Total: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_sd:$(echo "$exec" | grep Total: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_med:$(echo "$exec" | grep Total: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_max:$(echo "$exec" | grep Total: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time connect metrics
echo "votes_exec_conn_time_connect_min:$(echo "$exec" | grep Connect: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_mean:$(echo "$exec" | grep Connect: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_sd:$(echo "$exec" | grep Connect: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_med:$(echo "$exec" | grep Connect: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_max:$(echo "$exec" | grep Connect: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time processing metrics
echo "votes_exec_conn_time_proc_min:$(echo "$exec" | grep Processing: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_mean:$(echo "$exec" | grep Processing: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_sd:$(echo "$exec" | grep Processing: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_med:$(echo "$exec" | grep Processing: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_max:$(echo "$exec" | grep Processing: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time waiting metrics
echo "votes_exec_conn_time_wait_min:$(echo "$exec" | grep Waiting: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_mean:$(echo "$exec" | grep Waiting: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_sd:$(echo "$exec" | grep Waiting: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_med:$(echo "$exec" | grep Waiting: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_max:$(echo "$exec" | grep Waiting: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

exec=$(ab -n 1000 -c 50 -p postb -T "application/x-www-form-urlencoded" http://20.121.163.77:5000/)

# exec count++
echo "votes_exec_count:1|c" > /dev/udp/127.0.0.1/8125

# exec time total metrics
echo "votes_exec_conn_time_total_min:$(echo "$exec" | grep Total: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_mean:$(echo "$exec" | grep Total: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_sd:$(echo "$exec" | grep Total: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_med:$(echo "$exec" | grep Total: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_total_max:$(echo "$exec" | grep Total: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time connect metrics
echo "votes_exec_conn_time_connect_min:$(echo "$exec" | grep Connect: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_mean:$(echo "$exec" | grep Connect: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_sd:$(echo "$exec" | grep Connect: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_med:$(echo "$exec" | grep Connect: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_connect_max:$(echo "$exec" | grep Connect: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time processing metrics
echo "votes_exec_conn_time_proc_min:$(echo "$exec" | grep Processing: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_mean:$(echo "$exec" | grep Processing: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_sd:$(echo "$exec" | grep Processing: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_med:$(echo "$exec" | grep Processing: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_proc_max:$(echo "$exec" | grep Processing: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125

# exec time waiting metrics
echo "votes_exec_conn_time_wait_min:$(echo "$exec" | grep Waiting: | awk '{print $2}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_mean:$(echo "$exec" | grep Waiting: | awk '{print $3}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_sd:$(echo "$exec" | grep Waiting: | awk '{print $4}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_med:$(echo "$exec" | grep Waiting: | awk '{print $5}')|g" > /dev/udp/127.0.0.1/8125
echo "votes_exec_conn_time_wait_max:$(echo "$exec" | grep Waiting: | awk '{print $6}')|g" > /dev/udp/127.0.0.1/8125