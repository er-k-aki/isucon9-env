#!/bin/bash
NGINX_CONF=/etc/nginx/nginx.conf
ISUCARI_CONF=/etc/nginx/sites-enabled/isucari.conf
MYSQLD_CNF=/etc/mysql/mysql.conf.d/mysqld.cnf

# 各設定ファイルのバックアップを取る
sudo cp $NGINX_CONF $NGINX_CONF`date +"%Y%m%d_%H%M%S"`
sudo cp $ISUCARI_CONF $ISUCARI_CONF`date +"%Y%m%d_%H%M%S"`
sudo cp $MYSQLD_CNF $MYSQLD_CNF`date +"%Y%m%d_%H%M%S"`

# 設定ファイルをデプロイする
sudo cp ./nginx.conf $NGINX_CONF
sudo cp ./isucari.conf $ISUCARI_CONF
sudo cp ./mysqld.cnf $MYSQLD_CNF
# ./env.sh

# サービスを再起動する
sudo systemctl restart mysql.service
sudo systemctl restart nginx.service
# ちゃんと起動したかもろもろ確認
sudo nginx -t
sudo systemctl status mysql.service
sudo systemctl status nginx.service

# alias
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.s status
git config --global alias.b branch
