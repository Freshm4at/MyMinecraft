#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'

printf "$yellow" " ###### Minecraft Server - MAP RENDER ######"
printf "$yellow" "  
    _____              _     __  __            _
    |  ___| __ ___  ___| |__ |  \/  | ___  __ _| |_ 
    | |_ | '__/ _ \/ __| '_ \| |\/| |/ _ \/ _ | __|
    |  _|| | |  __/\__ \ | | | |  | |  __/ (_| | |_ 
    |_|  |_|  \___||___/_| |_|_|  |_|\___|\__,_|\__|
    
    
"
printf "$yellow" "Wait..."
sleep 2m
mkdir ~/Projects/MyMinecraft/mapOverview
sudo docker run \
  --rm \
  -e MINECRAFT_VERSION="1.18.1" \
  -v ~/Projects/MyMinecraft/minecraft-data:/home/minecraft/server/:ro \
  -v ~/Projects/MyMinecraft/mapOverview:/home/minecraft/render/:rw \
  mide/minecraft-overviewer:latest
printf "$green" "Map render finished!"
printf "$yellow" "Lauch of the web server for render"
printf "$yellow" "Wait..."
sudo docker run \
-d \
-p 8080:80 \
-v ~/Projects/MyMinecraft/mapOverview:/usr/share/nginx/html \
--hostname nginx-maprender \
--name nginx-maprender \
nginx
printf "$green" "Server listen..."