#!/bin/sh

sudo cp ./caddy.service /etc/systemd/system
sudo systemctl daemon-reload
