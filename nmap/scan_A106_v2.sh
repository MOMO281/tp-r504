#!/bin/bash

echo "# - IP - TCP ports - UDP ports" > "scan-result_2.csv"

for ip in $(nmap -sn 172.16.0.0/24 | grep "Nmap scan report for" | awk '{print $5}'); do
  open_tcp_ports=$(nmap --open -T4 -sT $ip | grep "^80/tcp" -c)
  open_udp_ports=$(nmap --open -T4 -sU $ip | grep "^80/udp" -c)
  echo "$ip;$open_tcp_ports;$open_udp_ports" >> "scan-result_2.csv"
done

echo "Scan terminé. Voir scan-result_2.csv."
