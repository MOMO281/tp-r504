#!/bin/bash

declare -A counts
counts[1]=0
counts[2]=0

for i in {1..500}; do
    response=$(curl -s http://localhost:83)
    if [[ $response == *"Hello 1"* ]]; then
        counts[1]=$((counts[1] + 1))
    elif [[ $response == *"Hello 2"* ]]; then
        counts[2]=$((counts[2] + 1))
    fi
done

echo "Réponses Hello 1: ${counts[1]}"
echo "Réponses Hello 2: ${counts[2]}"

# Vérification de la répartition
if [[ ${counts[1]} -gt ${counts[2]} ]]; then
    echo "Plus de réponses de Hello 1."
elif [[ ${counts[1]} -lt ${counts[2]} ]]; then
    echo "Plus de réponses de Hello 2."
else
    echo "Répartition égale."
fi

