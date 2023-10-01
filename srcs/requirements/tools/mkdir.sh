#!/bin/bash
if [ ! -d "/home/${USER}/data" ]
then
        mkdir -p /home/${USER}/data/db /home/${USER}/data/wp /home/${USER}/data/adminer /home/${USER}/data/portainer
fi
