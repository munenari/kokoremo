#!/bin/bash

url=$1
content_type='Content-Type: application/json'

curl -s -H "$content_type" -d @- $url
