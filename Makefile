.PHONY: start-cluster configure-istio configure-prometheus configure-sample-workloads generate-traffic configure-thanos delete-cluster

start-cluster:
	scripts/start-cluster.sh

configure-istio:
	scripts/configure-istio.sh

configure-prometheus:
	scripts/configure-prometheus.sh

configure-sample-workloads:
	scripts/configure-sample-workloads.sh

generate-traffic:
	scripts/generate-traffic.sh

# configure-thanos:
# 	scripts/configure-thanos.sh

delete-cluster:
	scripts/delete-cluster.sh