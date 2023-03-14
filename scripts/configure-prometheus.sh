#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"
PROM_NAMESPACE="prometheus-federation-server"

section "Configuring Prometheus Federation"

log "Clonning prometheus federation server repository"
git clone https://github.com/rafaelaco/prometheus-server-federation.git "$SCRIPT_DIR/prom/"

log "Creating prometheus namespace"
kubectl create ns $PROM_NAMESPACE

log "Label default namespace"
kubectl label ns default istio-injection=enabled

log "Applying prometheus to the cluster"
helm template prom "$SCRIPT_DIR/prom/" -n $PROM_NAMESPACE \
-f "$SCRIPT_DIR/prometheus-federation-config.yaml" | kubectl -n $PROM_NAMESPACE apply -f -

rm -rf "$SCRIPT_DIR/prom/"

sleep 30
log "Permission to folders $SERVER_DIRECTORY and $AGENT_DIRECTORY"
sudo chmod 777 -R $SERVER_DIRECTORY
sudo chmod 777 -R $AGENT_DIRECTORY