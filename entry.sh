#!/bin/bash

/usr/local/bin/mvn-entrypoint.sh java -jar /usr/src/poc/target/log4j-rce-1.0-SNAPSHOT-jar-with-dependencies.jar
tail -f /dev/null