#!/bin/sh
echo "Installing Mjpg Streamer..."
sudo apt update  # To get the latest package lists
sudo apt install git cmake libjpeg8-dev gcc g++ -y
cd /home/pi
git clone https://github.com/jacksonliam/mjpg-streamer
cd /home/pi/mjpg-streamer/mjpg-streamer-experimental
make

sudo wget -O /etc/systemd/system/mjpg-streamer.service https://raw.githubusercontent.com/mitwelten/mitwelten-iot-hardware-poc/main/RaspberryPi/PoEPiCam/mjpg-streamer.service
sudo wget -O /etc/systemd/system/.mjpgconf https://raw.githubusercontent.com/mitwelten/mitwelten-iot-hardware-poc/main/RaspberryPi/PoEPiCam/.mjpgconf

sudo systemctl daemon-reload
sudo systemctl enable mjpg-streamer.service
sudo systemctl start mjpg-streamer.service

systemctl is-active --quiet mjpg-streamer.service && echo mjpg-service is running || echo mjpg-service is not running
