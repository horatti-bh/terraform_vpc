init-dev:
    @terraform init -backend-config=env/dev.tfvars
init-prod:
    @terraform apply -backend-config=env/prod.tfvars

apply-dev:
    @terraform apply -var-file=env/dev.tfvars

apply-prod:
    @terraform apply -var-file=env/prod.tfvars

destroy:

dev: init-dev apply-dev

prod: init-prod apply-prod
