#!/bin/bash

# Arrêter et supprimer les conteneurs s'ils sont en cours d'exécution
for container in nginx1 nginx2 nginx-lb; do
    if [ "$(docker ps -q -f name=$container)" ]; then
        echo "Arrêt du conteneur $container..."
        docker stop $container
        echo "Suppression du conteneur $container..."
        docker rm $container
    else
        echo "Le conteneur $container n'est pas en cours d'exécution."
    fi
done

# Supprimer le réseau s'il existe
if [ "$(docker network ls -q -f name=tplb)" ]; then
    echo "Suppression du réseau tplb..."
    docker network rm tplb
else
    echo "Le réseau tplb n'existe pas."
fi

