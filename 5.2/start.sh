#!/bin/bash

# We just start the filebeat service and then leave consul-template running on the foreground.
# Here we use the CONSUL_URL environment variable that we defined before. Consul template
# expects to find a filebeat.ctmpl file in /templates. This is the template that we would
# mount as a volume from our host. The result is then placed in /etc/filebeat/filebeat.yml
# where filebeat will be able to read from.
# We start filebeat in background with the configuration specified once consul-template has rendered the template
filebeat -c /etc/filebeat/filebeat.yml start &

# Render template and kill all processes related to filebeat via stop-processes.sh
# runit will start them up again with the new configuration
consul-template -consul-addr=$CONSUL_URL \
                -template="/templates/filebeat.ctmpl:/etc/filebeat/filebeat.yml:/etc/scripts/stop-processes.sh filebeat"