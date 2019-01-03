#!/bin/sh
#!/usr/bin/env bash
#IFS=',' ;for itemp_ip in `echo "192.168.1.122,192.168.234.54,124.567.34.5"`;do IFS=',' ;for item_user in `echo "developer,admin,Ttpl"`;do echo $item_user $itemp_ip; done; done; echo ""
# To declare static Array  
# sh spider_data_node.sh '192.168.1.122 192.168.1.56 192.168.1.122' 'Ttpl@123 Ttpl@123 Ttpl@123' 'root root root' '3307 3307 3307' '192.168.1.55';

echo "SERVER_IP"  "USER_NAME"  "Password"  "Port" "Pro_Server"
array_ip=($1); array_user=($2); array_Password=($3); array_port=($4); for ((i=0;i<=${#array_ip[@]}-1;i++)); do echo "$i" "${array_ip[i]}" "${array_user[i]}" "${array_Password[i]}" "${array_port[i]}" "$5"; done;echo ''
#array_ip=$1; array_user=$3; array_Password=$2; array_port=$4; 
#for ((i=0;i<=${#array_ip[@]}-1;i++))
#do 
 #	#mysql -u${array_user[i]} --port ${array_port[i]}  -p${array_Password[i]} -c -h $5 -e "show databases;"
 	
 # done
