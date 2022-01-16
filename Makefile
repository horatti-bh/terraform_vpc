init-dev:
	@terraform init -backend-config=env/dev.tfvars

init-prod:
	@terraform init -backend-config=env/prod.tfvars

plan-dev:
	@terraform plan -var-file=env/dev.tfvars

plan-prod:
	@terraform prod -var-file=env/dev.tfvars

apply-dev:
	@terraform apply -var-file=env/dev.tfvars -auto-approve

apply-prod:
	@terraform apply -var-file=env/prod.tfvars -auto-approve

destroy-prod:
	@terraform destroy -var-file=env/prod.tfvars -auto-approve

destroy-dev:
	@terraform destroy -var-file=env/dev.tfvars -auto-approve

dev: init-dev apply-dev
	@echo

prod: init-prod apply-prod
	@echo

clean:
	@rm -rf .terraform

destroy: init-dev destroy-dev #init-prod destroy-prod
