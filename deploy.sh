echo "[git pull]"

git pull origin main

echo "[アプリケーションサーバー再起動]"

sudo systemctl daemon-reload
sudo systemctl restart isuports.service

echo "[MySQL再起動]"

sudo systemctl restart mysql

echo "[init.sh 実行]"

./sql/init.sh
