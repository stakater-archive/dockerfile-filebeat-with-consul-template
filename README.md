# Filebeat with Consul Template

A Consul Template powered Filebeat docker container.

## Supported Tags:
* `5.2-0.18.0`, `latest` - filebeat v5.2 with consul template version 0.18.0 ([5.2-0.18.0/Dockerfile](https://github.com/stakater/dockerfile-filebeat-with-consul-template/blob/master/5.2/Dockerfile))
* `1.2-0.18.0` - filebeat v1.2 with consul template version 0.18.0 ([1.2-0.18.0/Dockerfile](https://github.com/stakater/dockerfile-filebeat-with-consul-template/blob/master/1.2/Dockerfile))

`docker run stakater/filebeat-with-consul-template`

To specify templates:
`docker run -d -v $(PWD)/templates:/templates stakater/filebeat-with-consul-template`

This image is intended to be run together with Consul and Consul-Template

The daemon consul-template queries a Consul instance and updates any number of specified templates on the file system. As an added bonus, consul-template can optionally run arbitrary commands when the update process completes.

```
 consul-template -consul=$CONSUL_URL -template="/templates/filebeat.ctmpl:/etc/filebeat/filebeat.yml:/usr/bin/filebeat -c /etc/filebeat/filebeat.yml"
```
## Sample Template 
We have provided a sample template (in the `templates` directory).

To be able to use that template, you must make sure the following preconditions are met: 

### Preconditions

#### Consul Key-Value entries:
* By default filebeat is configured to read logs from `/var/log/app/*.log`, where `/var/log/app` is the mapped directory inside the filebeat container. If you have logs inside subfolders or a different structure, you can define the path by the key `/filebeat/logsPath`.

Example: `/var/log/app/*/*.log`