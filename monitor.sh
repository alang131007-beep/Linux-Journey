#!/bin/bash
/bin/mkdir -p logs
date=$(/bin/date +%Y-%m-%d)
df -h >> logs/reporte_$date.txt
free -h >>logs/reporte_$date.txt
echo "log guardado en logs/reporte_$date.txt"
