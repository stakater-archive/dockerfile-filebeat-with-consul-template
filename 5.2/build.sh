#!/bin/bash
_consul_template_version=$1
_filebeat_with_consul_template_tag=$2
_release_build=false

if [ -z "${_consul_template_version}" ]; then
	source CONSUL_TEMPLATE_VERSION
	_consul_template_version=$CONSUL_TEMPLATE_VERSION
	_filebeat_with_consul_template_tag="${FILEBEAT_VERSION}-${CONSUL_TEMPLATE_VERSION}"
	_release_build=true
fi

echo "CONSUL_TEMPLATE_VERSION: ${_consul_template_version}"
echo "DOCKER TAG: ${_filebeat_with_consul_template_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg CONSUL_TEMPLATE_VERSION=${_consul_template_version} --tag "stakater/filebeat-with-consul-template:${_filebeat_with_consul_template_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker tag "stakater/filebeat-with-consul-template:${_filebeat_with_consul_template_tag}" "stakater/filebeat-with-consul-template:latest" 
