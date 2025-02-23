# Instalacion #

### Requisitos necesarios: 

* Docker instalado localmente 
* Setup SonarQube inicial

### Instalación de docker ( Linux Ubuntu )
```bash
# instalación de docker 
apt install docker docker.io -y 

# Instalacion de compose 
curl -SL https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64 -o /usr/bin/docker-compose 
chmod +x /usr/bin/docker-compose
```

### Clonar SonarDev 
```bash
git@github.com:nbrian96/sonarqube.git
```

Dentro de la carpeta del proyecto ejecutar - install.sh 
```bash
bash install.sh
```

### Inciar desde la interfaz web
http://IP-LOCAL:8000 

Para saber la IP local
```bash
hostname -I
```

Ingresar con las siguientes credenciales
* Usuario: admin
* Contraseña: admin


### Generar password propia en el primer ingreso
![image-20241226-151627](https://github.com/user-attachments/assets/4029954e-a0af-4580-b506-c4eea9b89da2)

### Crear quality gate ( luego declararlo como predeterminado )
![image](https://github.com/user-attachments/assets/f63bddd4-9e3e-4df3-b381-48b9c537455a)

### Crear proyecto local 
![image-20241226-151708](https://github.com/user-attachments/assets/ba17580c-6dd3-4234-83fb-1912bd9dd0e8)

#### Configurar nombre al proyecto ( no necesita ser el nombre del repo )
![image-20241226-151808](https://github.com/user-attachments/assets/c1f864f7-c5ea-4ac4-b7fb-9517a7606e13)

#### Configurar reglas análisis por defecto ( pueden modificarlas si gustan )
![image-20241226-151830](https://github.com/user-attachments/assets/d5d9a18c-916d-4792-a6f4-05271bc839a6)

Seleccionar “Create Project” y luego método de análisis, “Locally” 

#### Generar token para el proyecto
![image-20241226-152024](https://github.com/user-attachments/assets/d6b4acba-4c8e-4324-9d40-dc11fc90992d)

Una vez seleccionado “Generate” conseguirán un token del tipo “sqp_79a245700bcf0cc53acc89e0d63aaf8a96fc55ff” 

Luego seleccionarán “Continuar” y “Other”
![image-20241226-152138](https://github.com/user-attachments/assets/d4bf329d-078c-48b5-8e8b-21879dd20316)


Con los datos del scanner podremos configurar nuestro script para ejecutar el análisis. 

Duplicamos el template, para dejalo limpio para otros proyectos:
```bash
cp template_analizer.sh julia_analizer.sh
```
```bash
nano julia_analizer.sh
```

Configuramos nuestra réplica “julia_analizer.sh”: 
```bash
#!/bin/bash
IP_LOCAL=”192.168.0.91” # Dirección interna de propia PC, en mi caso 192.168.0.91 
PROJECT_NAME=”Julia” # Nombre elegido para el proyecto, en mi caso elegí “Julia”
TOKEN_WEB="sqp_79a245700bcf0cc53acc89e0d63aaf8a96fc55ff” # El token ofrecido por la app v
DIR_APP=”/home/rtadmin/julia” #Aquí deberán seleccionar la ruta local en dónde se encuentra clonado el repositorio a analizar
```

Luego de guardar los cambios, podrán ejecutar:
```bash
bash julia_analizer.sh
```

Debería iniciarse un contenedor, ejecutar el análisis y enviar al servidor local los resultados del análisis. 

Demora unos 5 minutitos, y luego ya se puede ver el resultado en la web local.


### Uso diario 

- Luego de instalar y ejecutar el primer análisis, simplemente deberán ejecutar para validar su código el “template_analizer.sh”. Y se agregará el análisis a cada cambio nuevo. 

- El nombre del script para analizar se llama template, dado que podrían copiar el script para cada nuevo proyecto y tener uno particular con sus propias variables configuradas. 



