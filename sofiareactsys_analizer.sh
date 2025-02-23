#!/bin/bash

IP_LOCAL="192.168.100.230"
PROJECT_NAME="sofiareactsys"
TOKEN_WEB="sqp_47eb8164782bc73170dbee14a69d561ae516b644"
DIR_APP="/home/rtadmin/Documentos/sofiareactsys"
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