#!/bin/bash
set -e
env=$1
DIRECTORY='./tmp'
if [ -d "$DIRECTORY" ]; then
    RM -rf $DIRECTORY 
fi
MKDIR $DIRECTORY
logstashPath="$DIRECTORY/logstash.zip"
curl https://artifacts.elastic.co/downloads/logstash/logstash-oss-7.0.1.zip --output $logstashPath 
unzip -o $logstashPath -d ./logstatsh/

trap "" 1
EXPORT ACCESS_LOG_PATH=${PWD}/example-access.log
EXPORT TAGS= ["weblogic-web", "uat"]
EXPORT ES_SERVICES=["http://localhost:9200"]
EXPORT INDEX="claim-web-uat-%{+YYYY.MM.dd}"
./logstatsh/logstash-7.0.0/bin/logstash -f ./weblogic-access-pipeline.yml

