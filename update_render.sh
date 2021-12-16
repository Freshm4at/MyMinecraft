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

sh ~/MyMinecraft/stop.sh
sh ~/MyMinecraft/docker/run_map_render.sh
sh ~/MyMinecraft/docker/run_web_server.sh
printf "$green" "Lauching minecraft server..."
sh start_server.sh
printf "$yellow" "Minecraft server started in screen minecraft-server"
printf "$yellow" "Go into and enter your user password."
printf "$yellow" "ex : screen -r minecraft-server"