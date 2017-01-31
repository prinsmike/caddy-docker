#!/bin/sh

docker run -d --name caddy \
	-v $HOME/srv:/srv \
	-v $HOME/Caddyfiles:/etc/Caddyfiles \
	-v $HOME/.caddy:/root/.caddy \
	-p 80:80 -p 443:443 \
	prinsmike/caddy
