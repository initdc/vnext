FROM v2fly/v2fly-core:latest

ENV UUID 4f2d6521-6a1a-4c42-8788-52687512165b
ENV ALTER 64
ENV TYPE ws
ENV PORT 8080

WORKDIR /root

COPY config.sh ./
RUN set -ex \
	&& chmod +x config.sh
    
CMD ["/bin/sh", "/root/config.sh"]