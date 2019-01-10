#!/bin/sh
#!/usr/bin/env bash
#IFS=',' ;for itemp_ip in `echo "192.168.1.122,192.168.234.54,124.567.34.5"`;do IFS=',' ;for item_user in `echo "developer,admin,Ttpl"`;do echo $item_user $itemp_ip; done; done; echo ""
# To declare static Array  
# sh spider_data_node.sh '192.168.1.122 192.168.1.56 192.168.1.122' 'Ttpl@123 Ttpl@123 Ttpl@123' 'root root root' '3307 3307 3307' '192.168.1.55' 'xfusion_performance_data_node_1 xfusion_performance_data_node_2 xfusion_performance_data_node_1' 'srv_node1 srv_node2 srv_node3' 'Exicom' 'xfusion_auth_engine';
array_ip=($1); array_user=($3); array_Password=($2); array_port=($4); array_node=($6); array_server=($7); array_pro=($8);
echo "ID" "SERVER_IP"  "USER_NAME"  "Password"  "Port" "Pro_Server" "Data_node_name" "Node_server"
for ((i=0;i<=${#array_ip[@]}-1;i++)); do
echo "$i" "${array_ip[i]}" "${array_user[i]}" "${array_Password[i]}" "${array_port[i]}" "$5" "${array_node[i]}" "${array_server[i]}" "${array_pro[0]}" "${array_pro[1]}" "${array_pro[2]}" "${array_pro[3]}" "${array_pro[4]}" ;
done; echo ''
if [ "${array_pro[1]}" == "xfusion_performance_data" ]
then
  
#verisoning_table=($(mysql -u${array_user[i]} --port ${array_port[i]}  -p${array_Password[i]} -c -h $5 -BSe "show databases;"))
function in_array {
  ARRAY=$2
  for e in ${ARRAY[*]}
  do
    if [[ "$e" == "$1" ]]
    then
      return 0
    fi
  done
  return 1
}

ORGANIZATION="${array_pro[0]}"
APPLICATION="${array_pro[1]}"
Master_IPADDRESS="$5"
Master_USERID="${array_pro[5]}"
Master_PASSWORD="${array_pro[6]}"
Master_PORT="${array_pro[7]}"
versioning_db="${array_pro[2]}"
versioning_table="${array_pro[3]}"
jenkins_path="${array_pro[4]}"
slave_IPADDRESS="${array_ip[i]}"


echo "ORGANIZATION=${array_pro[0]}"
echo "APPLICATION=${array_pro[1]}"
echo "Master_IPADDRESS=$5"
echo "Master_USERID=${array_pro[5]}"
echo "Master_PASSWORD=${array_pro[6]}"
echo "Master_PORT=${array_pro[7]}"
echo "versioning_db=${array_pro[2]}"
echo "versioning_table=${array_pro[3]}"
echo "jenkins_path=${array_pro[4]}"
echo "slave_IPADDRESS=${array_ip[i]}"



for filename in $jenkins_path/xfusion_data_node_20*.sql; do
Array1=("${Array1[@]}" "$(basename "$filename")")
done

Array2=($(mysql -u$Master_USERID --port $Master_PORT  -p$Master_PASSWORD -c -h $Master_IPADDRESS -Bse "select trim(git_script_name) from $versioning_db.$versioning_table  where project_name='$ORGANIZATION' and model_name='$APPLICATION' and master_ip='$Master_IPADDRESS' and slave_ip='slave_IPADDRESS' order by script_date;"))


Array3=()
for i in "${Array1[@]}"; do
    skip=
    for j in "${Array2[@]}"; do
        [[ $i == $j ]] && { skip=1; break; }
    done
    [[ -n $skip ]] || Array3+=("$i")
done
declare -a  Array3

echo "Array 1 " ${Array1[@]}
echo "Array 2 " ${Array2[@]}
echo "Array 3(diffrence) " ${Array3[@]}

# verisoning_table=($(mysql -u${array_pro[5]} --port ${array_pro[7]}  -p${array_pro[6]} -c -h "$10" -Bse "select trim(script_name) from ${array_pro[3]}.${array_pro[4]}  where project_name=${array_pro[0]} and model_name=${array_pro[1} order by script_date;"))
verisoning_table=(xfusion_performance_data_node_1 xfusion_performance_data_node_2 xfusion_performance_data_node_3)
echo "verisoning_table" ${verisoning_table[@]}
# verisoning_table=($(mysql -u$PRO_USERID --port $PRO_PORT  -p$PRO_PASSWORD -c -h $PROD_IPADDRESS -Bse "SELECT count(*) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME ='$versioning_table' and TABLE_SCHEMA='$versioning_db'  ;"))
for ((m=0;m<=${#array_node[@]}-1;m++)); do
  echo "${array_node[m]}"
if in_array "${array_node[m]}" "${verisoning_table[*]}"
  then
    echo "Data Node" "${array_node[m]}" "allready installed!!"
  else
echo "Data Node" "${array_node[m]}" "not installed!!"
# prepare sql script for current node
cat /home/ttpl/.jenkins/workspace/xfusion_data_node/xfusion_data_node_2019-01-03.sql > "${array_node[m]}".sql
#echo /home/ttpl/.jenkins/workspace/xfusion_data_node/xfusion_data_node_2019-01-03.sql >"${array_node[m]}".sql
#update script as per current node
sed -i "s/xfusion_performance_data_node_1/${array_node[m]}/g" /home/ttpl/.jenkins/workspace/xfusion_data_node/"${array_node[m]}".sql
# install data node and partition on particular server 
#mysql -u"${array_user[j]}" --port "${array_port[j]}"  -p"${array_Password[j]}" -c -h "$5" -e "show databases;";
# create server on spider node and config server
#mysql -u"${array_user[j]}" --port "${array_port[j]}"  -p"${array_Password[j]}" -c -h "$5" -e "show databases;";
echo "${array_pro[0]}" "${array_pro[1]}" "${array_ip[m]}" "${array_user[m]}" "${array_Password[m]}" "${array_port[m]}" "${array_pro[2]}" "${array_pro[3]}" "${array_pro[4]}"
echo "Rahul Panwar"


ORGANIZATION="${array_pro[0]}"
APPLICATION="${array_pro[1]}"
PROD_IPADDRESS="${array_ip[m]}"
PRO_USERID="${array_user[m]}"
PRO_PASSWORD="${array_Password[m]}"
PRO_PORT="${array_port[m]}"
versioning_db="${array_pro[2]}"
versioning_table="${array_pro[3]}"
jenkins_path="${array_pro[4]}"
file_name="${array_node[m]}.sql"


# . ./jenkins_1.sh "${array_pro[0]}" "${array_pro[1]}" "${array_ip[m]}" "${array_user[m]}" "${array_Password[m]}" "${array_port[m]}" "${array_pro[2]}" "${array_pro[3]}" "${array_pro[4]}"

# drop all spider tables from mysql_spider
mysql -u$PRO_USERID --port $PRO_PORT  -p$PRO_PASSWORD -c -h $PROD_IPADDRESS -e "source $jenkins_path/$file_name;"
#mysql -u$PRO_USERID --port $PRO_PORT  -p$PRO_PASSWORD -c -h $PROD_IPADDRESS -e "truncate mysql.spider_tables;"
# create server for particulaer node
#mysql -u$PRO_USERID --port $PRO_PORT  -p$PRO_PASSWORD -c -h $PROD_IPADDRESS -e "delete from mysql.servers where server_name='${array_server[m]}';" 
fi
done; echo ''
# for ((j=0;j<=${#array_ip[@]}-1;j++)); do
# . ./jenkins_1.sh "$8" "$9" "${array_ip[j]}" "${array_user[j]}" "${array_Password[j]}" "${array_port[j]}" "$10" "$11" "$12"
# mysql -u"${array_user[j]}" --port "${array_port[j]}"  -p"${array_Password[j]}" -c -h "$5" -e "show databases;";
# done; echo ''


elif [ "${array_pro[1]}" == "xfusion_spider_platform" ]
then
  echo "Hello Patform deployement"
else
  echo "Both strings are different"
fi
