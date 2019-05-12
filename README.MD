IF you want to debug in the local
Please run the `install-logstash.sh`

IF you want to use the container
Please run the `docker build -t logstash-access-log:1.0 ./` to create the images
AND run the `docker run --rm --name logstash -e ACCESS_LOG_PATH=/usr/share/var/logs/example-access.log -e TAGS= ["weblogic-web", "uat"] -e ES_SERVICES=["http://localhost:9200"] -e INDEX="claim-web-uat-%{+YYYY.MM.dd}" -v {your log folder}:/usr/share/var/logs logstash-access-log:1.0` to start the logstash