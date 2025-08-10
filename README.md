# CloudDevOpsProject-main

## What this does
- Builds a Flask app Docker image.
- Runs it in a local **kind** Kubernetes cluster.
- Exposes it via a ClusterIP Service; use port-forward to access.

## Quick start
```bash
# 0) From repo root
docker build -t ivolve-app:0.1 ./Docker/App
kind create cluster --name dev || true
kind load docker-image ivolve-app:0.1 --name dev

kubectl apply -f Kubernetes/namespace.yaml
kubectl apply -f Kubernetes/deployment.yaml
kubectl apply -f Kubernetes/service.yaml

# If the Deployment container is named "flask-container"
kubectl -n ivolve set image deploy/ivolve-app flask-container=ivolve-app:0.1
kubectl -n ivolve patch deploy ivolve-app -p '{"spec":{"template":{"spec":{"containers":[{"name":"flask-container","imagePullPolicy":"IfNotPresent"}]}}}}'

# Wait, then port-forward
kubectl -n ivolve rollout status deploy/ivolve-app --timeout=180s
kubectl -n ivolve port-forward svc/ivolve-service 8080:80
# Open http://localhost:8080

eof
