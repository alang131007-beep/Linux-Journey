#!/bin/bash
mkdir -p backup
CONTADOR=0
for archivo in *.sh
do
  cp $archivo backup/
  CONTADOR=$((CONTADOR + 1))
done
echo "Copie $CONTADOR archivos"
