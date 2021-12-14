#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'

printf "$yellow" " ###### Minecraft Server - START ALL SERVICES ######"
printf "$yellow" "  
    _____              _     __  __            _
    |  ___| __ ___  ___| |__ |  \/  | ___  __ _| |_ 
    | |_ | '__/ _ \/ __| '_ \| |\/| |/ _ \/ _ | __|
    |  _|| | |  __/\__ \ | | | |  | |  __/ (_| | |_ 
    |_|  |_|  \___||___/_| |_|_|  |_|\___|\__,_|\__|
    
    
"
if [ -f .env ]; then
    if [ -x "$(command -v curl)" ]; then
        printf "$yellow" "curl deja installé, skip..."
    else
        printf "$red" "curl non installé, installation : "
        sudo apt install curl
        printf "$green" "OK"
    fi
    if [ -x "$(command -v screen)" ]; then
        printf "$yellow" "screen deja installé, skip..."
    else
        printf "$red" "screen non installé, installation : "
        sudo apt-get install screen
        printf "$green" "OK"
    fi
    if [ -x "$(command -v docker)" ]; then
        printf "$yellow" "docker deja installé, skip..."
    else
        printf "$red" "docker non installé, installation : "
        sudo apt install apt-transport-https ca-certificates curl software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
        sudo apt update
        sudo apt install docker-ce
        sudo systemctl status docker
        printf "$green" "OK"
    fi
    if [ -x "$(command -v docker-compose)" ]; then
        printf "$yellow" "docker-compose deja installé, skip..."
    else
        printf "$red" "docker-compose non installé, installation : "
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        printf "$green" "OK"
    fi
    screen -dmS minecraft-render
    screen -S minecraft-render -X stuff 'sh start_map_render.sh\n'
    printf "$green" "Render started in screen minecraft-render"
    printf "$yellow" "Go into and enter your user password."
    printf "$yellow" "ex : screen -r minecraft-render"
    printf "$yellow" "-----------------------------------------"
    screen -dmS minecraft-server
    screen -S minecraft-server -X stuff 'sh start_server.sh\n'
    printf "$green" "Minecraft server started in screen minecraft-server"
    printf "$yellow" "Go into and enter your user password."
    printf "$yellow" "ex : screen -r minecraft-server"
fi