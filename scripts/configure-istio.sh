#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$SCRIPT_DIR/common.sh"

section "Configuring Istio"

log "Create Istio's namespace"
kubectl create ns istio-system

log "Installing Istio with Minimal Setup"
istioctl install --set profile=minimal --skip-confirmation

log "Create Istio's Gateway namespace"
kubectl create ns istio-ingress

log "Installing Istio Gateway"
istioctl install -f "$SCRIPT_DIR/istio-gateway-config.yaml" --skip-confirmation