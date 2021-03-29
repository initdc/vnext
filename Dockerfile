FROM alpine:latest

WORKDIR /root

COPY . /root
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x *.sh \
	&& /root/v2ray.sh "linux/amd64" \
    && /root/config.sh
    
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]