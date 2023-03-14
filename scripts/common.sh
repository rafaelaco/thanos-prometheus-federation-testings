#!/bin/bash

RED='\033[1;31m'
GRN='\033[1;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
WHT='\033[1;37m'
MGT='\033[1;95m'
CYA='\033[1;96m'
END='\033[0m'
BLOCK='\033[1;37m'
CLUSTER_NAME="thanos-prom"
SERVER_DIRECTORY="/tmp/k3d-server"
AGENT_DIRECTORY="/tmp/k3d-agents"

function log() {
    if [[ $2 == "error" ]]; then
        printf "${RED}# $1${END}\n";
    elif [[ $2 == "warning" ]]; then
        printf "${YEL}# $1${END}\n";
    elif [[ $2 == "info" ]]; then
        printf "${CYA}# $1${END}\n";
    elif [[ $2 == "section" ]]; then
        printf "${GRN}$1${END}\n";
    else
        printf "# $1\n";
    fi
}

function section() {
    echo ""
    log "############################" "section"
    log "# $1" "section"
    log "############################" "section"
    echo ""
}