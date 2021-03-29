FROM --platform=${TARGETPLATFORM} alpine:latest

WORKDIR /root
ARG TARGETPLATFORM

ENV PORT=''
ENV UUID=''
ENV ALTER=''
ENV TYPE=''

COPY . /root
RUN set -ex \
	&& apk add --no-cache tzdata openssl ca-certificates \
	&& mkdir -p /etc/v2ray /usr/local/share/v2ray /var/log/v2ray \
	&& chmod +x *.sh \
	&& /root/v2ray.sh "${TARGETPLATFORM}" \
    && /root/config.sh
    
CMD [ "/usr/bin/v2ray", "-config", "/etc/v2ray/config.json" ]