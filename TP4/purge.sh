#!/bin/bash
docker kill $(docker ps -q)  # Arrêter tous les conteneurs
docker rm $(docker ps -aq)    # Supprimer tous les conteneurs
docker network prune -f       # Purger les réseaux inutilisés
docker volume prune -f        # Purger les volumes inutilisés

echo "liste des volumes restant"
docker volume ls
