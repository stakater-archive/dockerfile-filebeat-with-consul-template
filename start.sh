#!/bin/bash

# We just start the filebeat service and then leave consul-template running on the foreground.
# Here we use the CONSUL_URL environment variable that we defined before. Consul template
# expects to find a filebeat.ctmpl file in /templates. This is the template that we would
# mount as a volume from our host. The result is then placed in /etc/filebeat/filebeat.yml
# where filebeat will be able to read from.
# We start filebeat with the configuration specified once consul-template has rendered the template
consul-template -consul=$CONSUL_URL -template="/templates/filebeat.ctmpl:/etc/filebeat/filebeat.yml:/usr/bin/filebeat -c /etc/filebeat/filebeat.yml>/filebeat.log &"