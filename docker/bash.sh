#!/bin/bash

#run docker-compose.yml
docker-compose up -d

#copy atomix config file in atomix container
docker cp ./atomix_cluster/atomix-1.conf atomix-1:/opt/atomix/conf/atomix.conf
docker cp ./atomix_cluster/atomix-2.conf atomix-2:/opt/atomix/conf/atomix.conf

#make a directory for onos config file
docker exec onos1 mkdir /root/onos/config
docker exec onos2 mkdir /root/onos/config

#copy onos config file in onos container
docker cp ./atomix_cluster/cluster-1.json onos1:/root/onos/config/cluster.json
docker cp ./atomix_cluster/cluster-2.json onos2:/root/onos/config/cluster.json

#restart all containers
docker restart atomix-1
docker restart atomix-2
docker restart onos1
docker restart onos2

#add matching host key to ssh config
echo "Host 172.20.0.4
    HostKeyAlgorithms +ssh-rsa
    PubkeyAcceptedKeyTypes +ssh-rsa
Host 172.20.0.5
    HostKeyAlgorithms +ssh-rsa
    PubkeyAcceptedKeyTypes +ssh-rsa
"> ~/.ssh/config