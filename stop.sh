#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'

printf "$yellow" " ###### Minecraft Server - STOP ALL ######"
printf "$yellow" "  
    _____              _     __  __            _
    |  ___| __ ___  ___| |__ |  \/  | ___  __ _| |_ 
    | |_ | '__/ _ \/ __| '_ \| |\/| |/ _ \/ _ | __|
    |  _|| | |  __/\__ \ | | | |  | |  __/ (_| | |_ 
    |_|  |_|  \___||___/_| |_|_|  |_|\___|\__,_|\__|
    
    
"
screen -S minecraft-render -X quit
screen -S minecraft-server -X quit
docker stop nginx-maprender
docker rm nginx-maprender
docker-compose down
printf "$red" "Server and render server are stoped"