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
sed  "s/<env:replacement>/$env/g" ./logstatsh/pipeline/weblogic-error-pipeline-template.yml > weblogic-error-pipeline.yml

# logFolder='./logs'
# rm -rf $logFolder
# mkdir $logFolder

trap "" 1
# exec nohup ./logstatsh/logstash-7.0.0/bin/logstash -f ./weblogic-error-pipeline.yml >> $logFolder/logstash.log 2>&1 &

# echo "the logstash in starting, please check the $logFolder for the result"

# docker pull docker.elastic.co/logstash/logstash-oss:7.0.1

