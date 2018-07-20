#!/bin/bash

set -e

APP_CLASSPATH=/usr/src/app/error-messages/lib/*

PLAY_SECRET=none

CONFIG="-Dplay.crypto.secret=$PLAY_SECRET -Dlagom.cluster.join-self=on"

JVM_OPS="$JVM_HEAP_SIZE $JAVA_OPTS"

JVM_JMX_REMOTE_CONFIG="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.rmi.port=$JMX_PORT -Dcom.sun.management.jmxremote.port=$JMX_PORT -Djava.rmi.server.hostname=$HOST -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false"

PLAY_SERVER_START="play.core.server.ProdServerStart"

echo "$APP_CLASSPATH $JVM_OPS $PLAY_SERVER_START"

#exec java -version

exec java -cp "$APP_CLASSPATH" $JVM_OPS $JVM_JMX_REMOTE_CONFIG $CONFIG $PLAY_SERVER_START
