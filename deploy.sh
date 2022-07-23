git pull origin main

sudo systemctl daemon-reload
sudo systemctl restart isuports.service

./sql/init.sh
