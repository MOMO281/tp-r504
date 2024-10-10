#!/bin/bash

# Arrêter et supprimer les conteneurs s'ils existent
for container in nginx1 nginx2 nginx-lb; do
    if [ "$(docker ps -q -f name=$container)" ]; then
        echo "Arrêt du conteneur $container..."
        docker stop $container
    fi

    if [ "$(docker ps -aq -f name=$container)" ]; then
        echo "Suppression du conteneur $container..."
        docker rm $container
    fi
done

# Supprimer le réseau tplb s'il existe
docker network rm tplb

