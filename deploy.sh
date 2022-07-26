echo "[MySQLのクエリログの退避]"

DATE=`TZ=JST-9 date '+%d%H%M%S'`
if sudo [ -e /var/log/mysql/slow.log ]; then
    sudo mv /var/log/mysql/slow.log /var/log/mysql/slow_${DATE}.log
    echo "[change log name success /var/log/mysql/slow${DATE}.log]"
else
    echo "[there is no mysql query log file]"
fi

echo "[git pull]"

git pull origin main

echo "[アプリケーションサーバー再起動]"

sudo systemctl daemon-reload
sudo systemctl restart isuports.service

echo "[init.sh 実行]"

./sql/init.sh

echo "[MySQL再起動]"

sudo systemctl restart mysql
