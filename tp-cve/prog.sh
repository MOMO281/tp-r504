#!/bin/bash

# Planification de la tâche dans crontab
CRONJOB="30 2 * * * /path/to/rech.sh"
(crontab -l 2>/dev/null; echo "$CRONJOB") | crontab -
echo "Tâche planifiée : $CRONJOB"

