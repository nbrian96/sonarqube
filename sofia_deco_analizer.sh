#!/bin/bash

IP_LOCAL="192.168.100.230"
PROJECT_NAME="SOFI-DECO"
TOKEN_WEB="sqp_62623815cb71e2ac151f56af32979182b4f3f697"
DIR_APP="/home/rtadmin/Documentos/sofia-deco"
SONAR_FILE="$DIR_APP/sonar-project.properties"

cat <<EOF > "$SONAR_FILE"
sonar.projectKey=$PROJECT_NAME
sonar.sources=src
sonar.host.url=http://$IP_LOCAL:8000
sonar.login=$TOKEN_WEB
EOF

docker run --rm \
      -e SONAR_HOST_URL="http://$IP_LOCAL:8000" \
      -e SONAR_PROJECTKEY="$PROJECT_NAME" \
      -e SONAR_TOKEN="$TOKEN_WEB" \
      -v "$DIR_APP:/usr/src" \
      sonarsource/sonar-scanner-cli