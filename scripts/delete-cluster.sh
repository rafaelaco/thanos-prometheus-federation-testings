#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"

section "Deleting the cluster"
k3d cluster delete $CLUSTER_NAME

log "Temporary folders: $SERVER_DIRECTORY and $AGENT_DIRECTORY"
sudo rm -rf $SERVER_DIRECTORY
sudo rm -rf $AGENT_DIRECTORY