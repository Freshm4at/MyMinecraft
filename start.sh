#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'

printf "$yellow" " ###### Minecraft Server - START ALL SERVICES######"
printf "$yellow" "  
    _____              _     __  __            _
    |  ___| __ ___  ___| |__ |  \/  | ___  __ _| |_ 
    | |_ | '__/ _ \/ __| '_ \| |\/| |/ _ \/ _ | __|
    |  _|| | |  __/\__ \ | | | |  | |  __/ (_| | |_ 
    |_|  |_|  \___||___/_| |_|_|  |_|\___|\__,_|\__|
    
    
"
if [ -f .env ]; then
    printf " "
    printf "$green" "Preparing render..."
    screen -dmS minecraft-render
	screen -S minecraft-render -X stuff 'sh start_map_render.sh\n'
    printf "$yellow" "Render started in screen minecraft-render"
    printf "$yellow" "Go into and enter your user password."
    printf "$yellow" "ex : screen -r minecraft-render"
    printf "$yellow" "-----------------------------------------"
    screen -dmS minecraft-server
	screen -S minecraft-server -X stuff 'sh start_server.sh\n'
    printf "$yellow" "Minecraft server started in screen minecraft-server"
    printf "$yellow" "Go into and enter your user password."
    printf "$yellow" "ex : screen -r minecraft-server"
fi