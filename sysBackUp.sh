#!/bin/bash

function backup_db()
{   
    #数据库备份地址
    dbBackDir='/myBack/db/'
    
    #备份的文件路径
    dbBackFile=${dbBackDir}`date +"%Y%m%d-%H%M%S"`.sql.gz

    dbUser='root'
    dbPasswd=''

    #忽视哪些数据库
    ignoreDb="grep -Ev \"Database|information_schema|mysql|performance_schema\" "
    

    #数据库连接
    mysqlConnSql="mysql -u $dbUser -p$dbPasswd "
    mysqlDumpConnSql="mysqldump -u$dbUser -p$dbPasswd "
    
    #显示所有数据库
    showDbSql="$mysqlConnSql -e 'show databases;' "

    #导出数据库
    exportDbSql=" xargs ${mysqlDumpConnSql} --database "
    
    #压缩
    gzipExce=' | gzip '

    #所有命令拼接
     totalExce="${showDbSql} | ${ignoreDb} |   ${exportDbSql}  ${gzipExce} > ${dbBackFile} ${unzipExce}"
     echo ${totalExce}
     eval ${totalExce}
}
backup_db

#备份文件
function backup_file()
{
    backUpDir="/myBack/file/"
    backUpFile="${backUpDir}html_`date +"%Y%m%d_%H%M%S"`.tar.gz "

    cpCommand="tar -czvf ${backUpFile} /var/www/html "
    echo ${cpCommand}
    eval ${cpCommand}
}
backup_file



