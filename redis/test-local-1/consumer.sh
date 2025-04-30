#!/bin/bash

# Variables
threshold=30000         # Seuil d'alarme
delay_process=4         # Pause si alarme (secondes)
queue_name="mafile"     # Nom de la file
wait_if_empty=2         # Pause si la file est vide (secondes)

# Vérification connexion Redis
redis-cli DBSIZE >/dev/null
if ! [ $? = 0 ]; then
  echo "Erreur, pas de connexion avec le serveur Redis !"
  exit 1
fi

echo "Consommateur lancé : seuil = $threshold | pause alarme = $delay_process s"

# Boucle infinie
while :
do
  nb=$(redis-cli --raw LLEN "$queue_name")

  if [ "$nb" -gt 0 ]; then
    valeur=$(redis-cli --raw RPOP "$queue_name")
    echo "Valeur reçue : $valeur"

    if [ "$valeur" -gt "$threshold" ]; then
      echo "ALARME ! Valeur critique : $valeur"
      sleep "$delay_process"
    fi
  else
    echo "Liste vide, attente $wait_if_empty s..."
    sleep "$wait_if_empty"
  fi
done

