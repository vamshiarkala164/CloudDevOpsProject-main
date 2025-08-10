
APP_NAME=cloud-devops-app
IMG_TAG?=latest

.PHONY: infra-validate infra-apply docker-build docker-run k8s-apply

infra-validate:
	@cd Terraform && terraform fmt -check && terraform validate

infra-apply:
	@cd Terraform && terraform apply

docker-build:
	@cd Docker/App && docker build -t $(APP_NAME):$(IMG_TAG) .

docker-run:
	@docker run --rm -p 5000:5000 $(APP_NAME):$(IMG_TAG)

k8s-apply:
	@kubectl apply -f Kubernetes/namespace.yaml
	@kubectl apply -f Kubernetes/deployment.yaml
	@kubectl apply -f Kubernetes/service.yaml
