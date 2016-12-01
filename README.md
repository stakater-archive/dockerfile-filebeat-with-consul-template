# dockerfile-filebeat-with-consul-template
============================

A Consul Template powered Filebeat docker container.

`docker run stakater/filebeat-with-consul-template:latest`

This image is intended to be run together with Consul and Consul-Template

The daemon consul-template queries a Consul instance and updates any number of specified templates on the file system. As an added bonus, consul-template can optionally run arbitrary commands when the update process completes.

```
 consul-template -consul=$CONSUL_URL -template="/templates/filebeat.ctmpl:/etc/filebeat/filebeat.yml:/usr/bin/filebeat -c /etc/filebeat/filebeat.yml"
```
