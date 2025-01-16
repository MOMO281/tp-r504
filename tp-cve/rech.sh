#!/bin/bash

# Fichier log
LOGFILE="/var/log/debsecan.log"

# Seuil critique (nombre maximum de CVE non corrigées)
CRITICAL_THRESHOLD=10

# Commande debsecan
RESULT=$(debsecan --suite $(lsb_release --codename --short) --format detail)

# Compter les CVE non corrigées
CVE_COUNT=$(echo "$RESULT" | grep -c "CVE-")

# Historiser les résultats
echo "[$(date)] Total CVE: $CVE_COUNT" >> $LOGFILE

# Vérifier le seuil critique
if [ $CVE_COUNT -gt $CRITICAL_THRESHOLD ]; then
    # Envoyer une alerte par mail (nécessite un serveur mail configuré)
    echo -e "Attention : $CVE_COUNT vulnérabilités détectées.\n\n$RESULT" | mail -s "Alerte CVE sur $(hostname)" root
fi

