#!/bin/bash

#En las variables definimos cual es el ID de la VM de proxmox que queremos vigilar y el nombre.

numerovm="101";
nombrevm="W10";

while true; do
estado=$(qm list | grep "$numerovm")
if [[ "$estado" = *"$numerovm"*"$nombrevm"*"running"* ]]; then
echo "ok $estado"
else
fecha=$(date)
echo "$fecha Se detecta VM $numerovm $nombrevm apagada" >> /root/control/log.txt
cat /root/control/log.txt | tail -1
qm start $numerovm
fi
clear
sleep 30
done
