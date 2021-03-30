FROM v2fly/v2fly-core:latest

WORKDIR /root

COPY config.sh /root/config.sh
RUN set -ex \
	&& chmod +x config.sh
    
CMD ["/bin/sh", "/root/config.sh"]