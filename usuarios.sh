#!/bin/bash
sudo useradd -m usuarioprueba
cat /etc/passwd | grep usuarioprueba
sudo passwd usuarioprueba
sudo usermod -aG sudo usuarioprueba 
groups usuarioprueba
sudo userdel -r usuarioprueba
cat /etc/passwd | grep usuarioprueba
