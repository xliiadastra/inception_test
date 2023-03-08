FROM		alpine:3.16

RUN		apk update && apk upgrade && apk add --no-cache \
		nginx \
		openssl \
		vim && \
		mkdir -p /etc/nginx/ssl

COPY		requirements/nginx/conf/nginx.conf /etc/nginx/http.d/

RUN		openssl req -newkey rsa:2048 -days 365 -nodes -x509 \
		-subj "/C=KR/ST=Seoul/L=42seoul/O=42Seoul/OU=Gam/CN=localhost" \
		-out /etc/nginx/ssl/yichoi.42.fr.crt \
		-keyout /etc/nginx/ssl/yichoi.42.fr.key

EXPOSE		443

ENTRYPOINT	["nginx", "-g", "daemon off;"]
