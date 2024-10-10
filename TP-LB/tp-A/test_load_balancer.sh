#!/bin/bash

# Initialiser les compteurs pour les deux réponses
count_hello1=0
count_hello2=0

# Effectuer 500 appels avec curl
for i in {1..500}
do
    response=$(curl -s http://localhost:83)
    
    # Vérifier le contenu de la réponse et incrémenter les compteurs
    if [[ "$response" == *"<h1>Hello 1</h1>"* ]]; then
        ((count_hello1++))
    elif [[ "$response" == *"<h1>Hello 2</h1>"* ]]; then
        ((count_hello2++))
    fi
done

# Afficher les résultats
echo "Réponses du serveur sur le port 81 (Hello 1) : $count_hello1"
echo "Réponses du serveur sur le port 82 (Hello 2) : $count_hello2"

# Vérification si la répartition est 50/50
total_calls=500
expected_half=$((total_calls / 2))

if [ $count_hello1 -eq $expected_half ] && [ $count_hello2 -eq $expected_half ]; then
    echo "La répartition est 50/50."
else
    echo "La répartition n'est pas 50/50."
fi

