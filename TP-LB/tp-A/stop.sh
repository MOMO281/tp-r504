#!/bin/bash

# Arrêter et supprimer les conteneurs s'ils ne sont pas déjà en mode --rm
docker stop nginx1 nginx2 nginx-lb

# Supprimer les conteneurs s'ils ne sont pas en mode --rm (utile si --rm n'était pas utilisé)
docker rm nginx1 nginx2 nginx-lb

# Supprimer le réseau créé précédemment
docker network rm tplb

