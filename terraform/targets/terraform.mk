# -----------------------------------------------------------------------------------
# Terraform targets
# -----------------------------------------------------------------------------------
terraform/init:
	@echo "Terraform Init"
	@cd ${TERRAFORM_FOLDER} && \
		rm -rf .terraform && \
		terraform init

terraform/plan:
	@echo "Terraform Plan"
	@cd ${TERRAFORM_FOLDER} && \
		terraform plan

terraform/apply:
	@echo "Terraform Apply"
	@cd ${TERRAFORM_FOLDER} && \
		terraform apply