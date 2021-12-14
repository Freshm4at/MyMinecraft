#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'

printf "$yellow" " ###### Minecraft Server - UPDATE RENDER ######"
printf "$yellow" "  
    _____              _     __  __            _
    |  ___| __ ___  ___| |__ |  \/  | ___  __ _| |_ 
    | |_ | '__/ _ \/ __| '_ \| |\/| |/ _ \/ _ | __|
    |  _|| | |  __/\__ \ | | | |  | |  __/ (_| | |_ 
    |_|  |_|  \___||___/_| |_|_|  |_|\___|\__,_|\__|
    
    
"
cd ~/MyMinecraft
sh stop.sh
if [ -f .env ]; then
  # Load Environment Variables
  export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
  docker run \
  --rm \
  -e MINECRAFT_VERSION=${MINECRAFT_VERSION} \
  -e ADDITIONAL_ARGS="--no-tile-checks"
  -v ~/MyMinecraft/minecraft-data:/home/minecraft/server/:ro \
  -v ~/MyMinecraft/mapOverview:/home/minecraft/render/:rw \
  -m 6G \
  mide/minecraft-overviewer:latest
  printf "$green" "Map render finished!"
  printf "$yellow" "Lauch of the web server for render"
  printf "$yellow" "Wait..."
  docker run \
  -d \
  -p ${RENDER_SERVER_PORT}:80 \
  -v ~/MyMinecraft/mapOverview:/usr/share/nginx/html \
  --hostname nginx-maprender \
  --name nginx-maprender \
  nginx
  printf "$green" "Web server listen..."
  printf "$green" "Lauching minecraft server..."
  docker-compose up
fi
