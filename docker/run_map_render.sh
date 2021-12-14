#!bin/bash
red='\e[1;31m%s\e[0m\n'
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
printf "$yellow" " ###### Minecraft Server - RENDER PROCESS ######"
if [ -f .env ]; then
  # Load Environment Variables
  export $(cat .env | grep -v '#' | awk '/=/ {print $1}')
  docker run \
  --rm \
  -e MINECRAFT_VERSION=${MINECRAFT_VERSION} \
  -e ADDITIONAL_ARGS="--no-tile-checks" \
  -v ~/MyMinecraft/minecraft-data:/home/minecraft/server/:ro \
  -v ~/MyMinecraft/mapOverview:/home/minecraft/render/:rw \
  -m 6G \
  mide/minecraft-overviewer:latest
  printf "$green" "Map render finished!"
fi