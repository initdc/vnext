#!/bin/sh

#Genarate config.js
cat << EOF > /etc/v2ray/config.json
{
  "inbounds": [
    {
      "port": "env:PORT",
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