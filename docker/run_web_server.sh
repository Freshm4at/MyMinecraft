#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
printf "$yellow" " ###### Minecraft Server - WEB SERVER ######"
if [ -f .env ]; then
export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
docker stop nginx-maprender
docker rm nginx-maprender
  printf "$yellow" "Lauch of the web server for render"
  printf "$yellow" "Wait..."
  docker run \
  -d \
  -p ${RENDER_SERVER_PORT}:80 \
  -v ~/MyMinecraft/mapOverview:/usr/share/nginx/html \
  --hostname nginx-maprender \
  --name nginx-maprender \
  nginx
  printf "$green" "Server listen on http://localhost:${RENDER_SERVER_PORT}"
fi