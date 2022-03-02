#!/bin/bash

chat_id="" # telegram chat id
bot_id="" # telegram bot id
bot_name="myuptimebot" # telegram bot name
telegram_base_url="https://api.telegram.org/bot${bot_id}/sendMessage"
speed_trashold=100 # speed trashold in mbits
test_server_url="" # your server's url

speed=`curl -sL ${telegram_base_url}/api/speedtest/latest | jq -M -r '.data.download'`
if (( $(echo "${speed} < ${speed_trashold}" | bc -l) )); then
    curl -X POST ${telegram_base_url} -d "chat_id=${chat_id}&text=Current Speed is ${speed}"
fi
