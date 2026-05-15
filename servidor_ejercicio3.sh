#!/bin/bash
FECHA=$(date +%y-%m-%d)
USO_DISCO=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

echo "=== USO DEL DISCO ==="
echo "$FECHA"

if [ "$USO_DISCO" -gt 80 ]; then
  echo "ALERTA: Uso del disco arriba del %80"
else
  echo "ALERTA: Uso del disco debajo del %80"
fi

echo "Uso actual: $USO_DISCO%"
echo "============================"
