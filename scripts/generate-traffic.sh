#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"

section "Generate Traffic"

for i in {1..10}; do
    log "Calling HTTPBIN IP endpoint" "info"
    kubectl exec -it deployment/nginx -- curl httpbin/ip
done