#!/bin/bash
NOMBRE="Alan"
FECHA=$(date +%y-%m-%d)
echo "Reporte de $NOMBRE del $FECHA" > Resumen.txt
df -h >> resumen.txt
free -h >> resumen.txt
ls | grep txt

