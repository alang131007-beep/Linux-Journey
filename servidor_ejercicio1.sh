#!/bin/bash
FECHA=$(date +%y-%m-%d)
ESTADO=$(systemctl is-active nginx)
echo "=== ESTADO DEL SERVIDOR ==="
echo "$FECHA"
if [ $ESTADO = "active" ]; then
  echo "Servidor: ACTIVO"
  ps aux | grep nginx | head -1
else
  echo "Servidor: INACTIVO"
  echo "Iniciando Servidor. . ."
  sudo systemctl start nginx
fi
echo "==========================="
