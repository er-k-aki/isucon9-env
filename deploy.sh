#!/bin/bash
NGINX_CONF=/etc/nginx/nginx.conf
MYSQLD_CNF=/etc/mysql/mysql.conf.d/mysqld.cnf

# 各設定ファイルのバックアップを取る
sudo cp $NGINX_CONF $NGINX_CONF+`date +"%Y%m%d_%H%M%S"`
sudo cp $MYSQLD_CNF $MYSQLD_CNF+`date +"%Y%m%d_%H%M%S"`

# 設定ファイルをデプロイする
sudo cp ./nginx.conf $NGINX_CONF
sudo cp ./mysqld.cnf $MYSQLD_CNF

# サービスを再起動する
sudo systemctl restart mysql.service
sudo systemctl restart nginx.service