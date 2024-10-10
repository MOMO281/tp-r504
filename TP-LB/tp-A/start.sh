#!/bin/bash

# (a) Créer un réseau interne nommé tplb
docker network create tplb

# (b) Construire l’image basée sur le Dockerfile
docker build .

# (c) Créer les sous-dossiers shared1 et shared2
mkdir -p shared1 shared2

# (d) Y placer deux fichiers index.html
echo '<h1>Hello 1</h1>' > shared1/index.html
echo '<h1>Hello 2</h1>' > shared2/index.html

# (e) Lancer deux conteneurs basés sur l’image nginx
docker run --rm --name nginx1 --network tplb -d -p 81:80 -v $(pwd)/shared1:/usr/share/nginx/html nginx

docker run --rm --name nginx2 --network tplb -d -p 82:80 -v $(pwd)/shared2:/usr/share/nginx/html nginx

# (f) Lancer le conteneur basé sur l’image im-nginx-lb
docker run --rm --name nginx-lb --network tplb -d -p 83:80 im-nginx-lb

