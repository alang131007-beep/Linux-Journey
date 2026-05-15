#!/bin/bash
FECHA=$(date +%y-%m-%d)
ESTADO=$(systemctl is-active mysql)

echo "=== Estado DE MYSQL ==="
echo $FECHA

if [ $ESTADO = "active" ]; then
  echo "SERVIDOR INICIADO"
  ps aux | grep mysql | head -1
else
  echo "Base de datos inactiva"
  echo "Iniciando servidor"
  sudo systemctl start mysql
fi
echo "======================"

