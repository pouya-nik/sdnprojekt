#!/bin/bash

#run docker-compose.yml
docker-compose -f docker-compose.yml up -d

#add root user to the local 
#access control list of xhost on your "Docker host"
xhost +si:localuser:root