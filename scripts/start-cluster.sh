#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"

section "Starting the cluster"

log "Temporary folders: $SERVER_DIRECTORY and $AGENT_DIRECTORY"
mkdir $SERVER_DIRECTORY
mkdir $AGENT_DIRECTORY

log "Cluster configuration: 3 nodes (1 system and 2 user)"
k3d cluster create $CLUSTER_NAME --api-port 6550 --servers 1 --agents 2 --port 8282:80@loadbalancer \
-v $SERVER_DIRECTORY:/tmp/data@server:0 -v $AGENT_DIRECTORY:/tmp/data@agent:0,1 --wait