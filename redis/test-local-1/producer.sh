#!/bin/bash

# Variables
n=1000                  # Nombre de valeurs par burst
pause=3                 # Pause entre les bursts (secondes)
queue_name="mafile"     # Nom de la liste Redis

# Vérification connexion Redis
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]; then
  echo "Erreur, pas de connexion avec le serveur Redis !"
  exit 1
fi

echo "Producteur lancé : envoi de $n valeurs toutes les $pause secondes"

# Boucle infinie
while :
do
  for ((i=0; i<n; i++)); do
    redis-cli LPUSH "$queue_name" $RANDOM >/dev/null
  done

  taille=$(redis-cli LLEN "$queue_name")
  echo "Burst envoyé | Taille actuelle de la liste : $taille"

  sleep "$pause"
done

