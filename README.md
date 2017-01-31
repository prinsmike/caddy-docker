# caddy-docker

Custom caddy docker image.

## Run the caddy server

Place vhost files in $HOME/Caddyfiles directory.

```
docker run -d --name caddy \
	-v $HOME/srv:/srv \
	-v $HOME/Caddyfiles:/etc/Caddyfiles \
	-v $HOME/.caddy:/root/.caddy \
	-p 80:80 -p 443:443 \
	prinsmike/caddy
```

## Enabled plugins

- expires
- filemanager
- filter
- git
- hugo
- ipfilter
- jsonp
- jwt
- mailout
- minify
- multipass
- prometheus
- ratelimit
- search
- upload
