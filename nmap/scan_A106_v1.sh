#!/bin/bash

nmap -oG out.txt 172.16.0.0/24

echo "# - IP - TCP ports" > "scan-result_1.csv"

for ip in $( cat out.txt | grep "Ports:" | awk '{print $2}'); do
  open_ports=$(cat out.txt | grep $ip | grep -oP '\d+\/open\/tcp' | wc -l)
  
  echo "$ip;$open_ports" >> "scan-result_1.csv"
done

echo "Scan terminé. Voir scan-result_1.csv."
