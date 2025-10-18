#!/bin/bash
# grant permission on terminal to execute the script with 'chmod +x docker_destroy.sh'
# THE PROCESS CARRIED OUT BY THE FOLLOWING SCRIPT IS IRREVERSIBLE.

# request user confirmation before proceeding
echo -e "This script will stop and remove all docker containers, images, volumes and networks if they exist.\nTHIS PROCESS IS IRREVERSIBLE.\nAre you sure you want to continue? (yes/no): "
read confirmation

# check if the confirmation is "yes" to continue
if [ "$confirmation" != "yes" ]; then
  echo "OMG! it was almost, huh!"
  exit 0
fi

# stop all conteiners running
docker stop $(docker ps -q)

# remove all containers stopped and running
docker rm $(docker ps -aq)

# remove all images not utilized and no tags
yes | docker image prune -a -f

# remove all volumes not utilized (dangling)
docker volume rm $(docker volume ls -qf dangling=true)

# remove all networks
yes | docker network prune

# display information about space on disc
docker system df

# clean the cache of building Docker
yes | docker builder prune

# clean the terminal
clear
