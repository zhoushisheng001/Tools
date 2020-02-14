#!/bin/bash
A=`ps -C mysqld --no-header |wc -l`        
if [ $A -eq 0 ];then                            
      systemctl start mysqld          #重启mysql
      if [ `ps -C mysqld --no-header |wc -l` -eq 0 ];then    #mysql重启失败，则停掉keepalived服务，进行VIP转移
              killall keepalived    #杀掉，vip就漫游到另一台机器                
      fi
fi
