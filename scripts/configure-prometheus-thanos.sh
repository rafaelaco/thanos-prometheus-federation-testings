#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"
PROM_NAMESPACE="prometheus-federation-server"
PROM_BRANCH="adding-thanos"

section "Configuring Prometheus Federation"

log "Clonning prometheus federation server repository"
git clone https://github.com/rafaelaco/prometheus-server-federation.git "$SCRIPT_DIR/prom/"
cd "$SCRIPT_DIR/prom/"
git checkout $PROM_BRANCH
cd ../../

log "Creating prometheus namespace"
kubectl create ns $PROM_NAMESPACE

log "Applying prometheus to the cluster"
helm template prom "$SCRIPT_DIR/prom/" -n $PROM_NAMESPACE \
-f "$SCRIPT_DIR/prometheus-federation-config.yaml" | kubectl -n $PROM_NAMESPACE apply -f -

rm -rf "$SCRIPT_DIR/prom/"

sleep 40
log "Permission to folder $CLUSTER_DIRECTORY"
sudo chmod 777 -R $CLUSTER_DIRECTORY