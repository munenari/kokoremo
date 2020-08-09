#!/bin/bash

member_id=$1
place_id=$2
unique_key=00000000-0000-0000-0000-000000000000

url='https://smart.pichk.chuden.jp/api/v1/air-condition'
content_type='Content-Type: application/json'
user_agent='RemoteController/62 CFNetwork/1128.0.1 Darwin/19.6.0'
data=$(cat <<EOF
{
	"member_id": "$member_id",
	"place_id": $place_id,
	"unique_key": "$unique_key"
}
EOF
)

echo $data | curl -s -H "$content_type" -H "$user_agent" -d @- "$url" | jq --arg d $(date -u '+%FT%TZ') '. + {time: $d}'
