#!/bin/bash
#记录登录我的系统的log

#用户名
# user=$(who | awk '{print $1}')
user=$(whoami)

#ip
loginIp=$(who | awk '{print $NF}' | sed -e 's/[()]//g')

dbUser='root'
dbPasswd=''

#数据库连接
mysqlConnSql="mysql -u $dbUser -p$dbPasswd "

nowTime=$(date +"%Y-%m-%d %H:%M:%S")
mysqlInsert="insert into hdyDb.sshLoginRecord(user,loginTime, loginIp, createTime) 
    values('${user}' , '${loginTime}' , '${loginIp}'  , '${nowTime}'  ) ";

#echo ${mysqlInsert}

#显示所有数据库
showDbSql="$mysqlConnSql -e \"${mysqlInsert}\" "

#echo ${showDbSql}

eval ${showDbSql}

