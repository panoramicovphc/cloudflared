#!/bin/bash
network_name=$1

if docker network ls --filter name=^${network_name}$ --format "{{.Name}}" | grep -w ${network_name} > /dev/null; then
  echo "{\"exists\": true}"
else
  echo "{\"exists\": false}"
fi
