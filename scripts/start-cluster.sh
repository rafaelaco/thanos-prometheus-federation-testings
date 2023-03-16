#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"

section "Starting the cluster"

log "Temporary folder: $CLUSTER_DIRECTORY"
mkdir $CLUSTER_DIRECTORY

log "Cluster configuration: 3 nodes (1 system and 2 user)"
k3d cluster create $CLUSTER_NAME --api-port 6550 --servers 1 --agents 2 --port 8282:80@loadbalancer \
-v $CLUSTER_DIRECTORY:/tmp/data@server:0 -v $CLUSTER_DIRECTORY:/tmp/data@agent:0,1 --wait