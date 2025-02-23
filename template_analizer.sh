#!/bin/bash

IP_LOCAL=
PROJECT_NAME=
TOKEN_WEB=
DIR_APP=
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