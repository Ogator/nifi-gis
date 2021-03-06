#!/bin/bash

set -xe

NAR_VERSION=0.1
NIFI_VERSION_DEBUG=1.15.0-SNAPSHOT
NIFI_VERSION=1.14.0

NIFI_ROOT=~/Tools/nifi
NIFI_HOME=$NIFI_ROOT/nifi-assembly/target/nifi-${NIFI_VERSION_DEBUG}-bin/nifi-${NIFI_VERSION_DEBUG}

# build the package
mvn clean package -DskipTests
# copy new NAR to debug location
cp nifi-gis-api-nar/target/nifi-gis-api-nar-${NAR_VERSION}.nar ${NIFI_HOME}/lib
cp nifi-gis-service-nar/target/nifi-gis-service-nar-${NAR_VERSION}.nar ${NIFI_HOME}/lib
# restart nifi
${NIFI_HOME}/bin/nifi.sh restart --wait-for-init
