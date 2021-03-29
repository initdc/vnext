#!/bin/sh

#Config file
PORT="${PORT:-8080}"
UUID="${UUID:-4f2d6521-6a1a-4c42-8788-52687512165b}"
ALTER="${ALTER:-64}"
TYPE="${TYPE:-tcp}"

cat << EOF > config.json
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
        ],
        "disableInsecureEncryption": true
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

mv config.json /etc/v2ray/config.json
echo "Move config.json done"

# Clean
rm -rf ${PWD}/*
echo "Clean done"
