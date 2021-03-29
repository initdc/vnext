FROM alpine:latest

WORKDIR /root
ARG TARGETPLATFORM

ENV PORT 8080
ENV UUID 4f2d6521-6a1a-4c42-8788-52687512165b
ENV ALTER 64
ENV TYPE tcp

COPY . /root
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x *.sh \
	&& /root/v2ray.sh "linux/amd64" \
    && /root/config.sh
    
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]