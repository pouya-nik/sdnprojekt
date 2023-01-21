#!/bin/bash
#deactive deafault docker iptables
echo "{
    	"iptables":false,
    	"bridge":"none"
}"> /etc/docker/daemon.json

#reboot the system
reboot