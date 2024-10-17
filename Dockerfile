FROM docker.elastic.co/logstash/logstash-oss:8.15.3
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD weblogic-log-pipeline.yml /usr/share/logstash/pipeline/pipelines.yml
VOLUME [/usr/share/var/logs]
ENV ACCESS_LOG_PATH /usr/share/var/logs/**/access.log


