#!/bin/bash

echo "Instalando Docker"
# instalación de docker 
apt install docker docker.io -y 
# Instalacion de copose 
curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o /usr/bin/docker-compose 
chmod +x /usr/bin/docker-compose

echo "########  Creando volumen SonarQube #########"

docker volume create --name=sonarqube_data

echo "########  Iniciando SonarQube en el puerto 8000 ########"

docker-compose up -d 


