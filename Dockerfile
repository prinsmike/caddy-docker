FROM alpine:latest
MAINTAINER prinsmike

ARG plugins="expires%2Cfilemanager%2Cfilter%2Cgit%2Chugo%2Cipfilter%2Cjsonp%2Cjwt%2Cmailout%2Cminify%2Cmultipass%2Cprometheus%2Cratelimit%2Csearch%2Cupload"

RUN apk add --no-cache openssh-client git tar curl

RUN curl --silent --show-error --fail --location \
	--header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
	"https://caddyserver.com/download/build/build?os=linux&arch=amd64&features=${plugins}" \
	| tar --no-same-owner -C /usr/bin/ -xz caddy \
	&& chmod 0755 /usr/bin/caddy \
	&& /usr/bin/caddy -version

EXPOSE 80 443 2015
VOLUME /root/.caddy
WORKDIR /srv

COPY Caddyfile /etc/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
