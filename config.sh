#!/bin/sh

#Genarate config.json
PORT="${PORT:-8080}"
UUID="${UUID:-4f2d6521-6a1a-4c42-8788-52687512165b}"
ALTER="${ALTER:-64}"
TYPE="${TYPE:-tcp}"

cat << EOF > /etc/v2ray/config.json
{
  "inbounds": [
    {
      "port": ${PORT},
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${UUID}",
            "alterId": ${ALTER}
          }
        ]
      },
      "streamSettings": {
        "network": "${TYPE}"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

echo "Genarate config.json done"

/usr/bin/v2ray -config /etc/v2ray/config.json