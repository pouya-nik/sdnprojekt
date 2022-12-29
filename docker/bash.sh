#
docker cp ./atomix_cluster/atomix-1.conf atomix-1:/opt/atomix/conf/atomix.conf
docker cp ./atomix_cluster/atomix-2.conf atomix-2:/opt/atomix/conf/atomix.conf

docker exec onos1 mkdir /root/onos/config
docker exec onos2 mkdir /root/onos/config

docker cp ./atomix_cluster/cluster-1.json onos1:/root/onos/config/cluster.json
docker cp ./atomix_cluster/cluster-2.json onos2:/root/onos/config/cluster.json


docker restart atomix-1
docker restart atomix-2
docker restart onos1
docker restart onos2