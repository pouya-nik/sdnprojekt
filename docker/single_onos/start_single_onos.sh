#!/bin/bash
# How to run single onos
#run docker-compose.yml
docker-compose up -d

#restart all containers
docker restart onos

#add matching host key to ssh config
echo "Host 172.20.1.1
    HostKeyAlgorithms +ssh-rsa
    PubkeyAcceptedKeyTypes +ssh-rsa
"> ~/.ssh/config
