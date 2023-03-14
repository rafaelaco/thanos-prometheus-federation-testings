#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"

section "Configuring Sample Workloads"

log "Configuring nginx POD and Service"
kubectl create deployment nginx --image="nginx"
kubectl expose deployment nginx --port=80 --target-port=80

log "Configuring httpbin POD and Service"
kubectl create deployment httpbin --image="kennethreitz/httpbin"
kubectl expose deployment httpbin --port=80 --target-port=80