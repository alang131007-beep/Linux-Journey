#!/bin/bash
echo "REPORTE DEL SISTEMA"
date 
whoami
pwd
echo "DISCO" 
df -h
echo "MEMORIA RAM"
free -h 
echo "PROCESOS ACTIVOS"
ps aux | wc -l 
echo "RED"
ip addr
