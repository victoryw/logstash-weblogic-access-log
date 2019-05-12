FROM docker.elastic.co/logstash/logstash-oss:7.0.1
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD weblogic-access-pipeline.yml /usr/share/logstash/pipeline/pipelines.yml
VOLUME [/usr/share/var/logs]
ENV ACCESS_LOG_PATH .//usr/share/var/logs/**/access.log
ENV ACCESS_LOG_PATH .//usr/share/var/logs/**/access.log


