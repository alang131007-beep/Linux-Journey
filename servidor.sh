#!/bin/bash
ESTADO=$(systemctl is-active nginx)
if [ $ESTADO = "active" ]; then 
echo "Servidor corriendo"
else
  sudo systemctl start xginx
  echo "Servidor iniciado"
fi
