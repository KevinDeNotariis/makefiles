.check-env-variables:
	@ test $${TERRAFORM_BACKEND_BUCKET_NAME?Please set env variable TERRAFORM_BACKEND_BUCKET_NAME}
	@ test $${TERRAFORM_BACKEND_KEY?Please set env variable TERRAFORM_BACKEND_KEY}
	@ test $${TERRAFORM_BACKEND_REGION?Please set env variable TERRAFORM_BACKEND_REGION}
	@ test $${TERRAFORM_BACKEND_DYNAMODB_TABLE?Please set env variable TERRAFORM_BACKEND_DYNAMODB_TABLE}

# -----------------------------------------------------------------------------------
# Terraform targets
# -----------------------------------------------------------------------------------
terraform/init: .check-env-variables
	@echo "Terraform Init"
	@cd ${TERRAFORM_FOLDER} && \
		rm -rf .terraform && \
		terraform init \
			-backend-config="bucket=$(TERRAFORM_BACKEND_BUCKET_NAME)"	\
			-backend-config="key=$(TERRAFORM_BACKEND_KEY)" \
			-backend-config="region=$(TERRAFORM_BACKEND_REGION)" \
			-backend-config="dynamodb_table=$(TERRAFORM_BACKEND_DYNAMODB_TABLE)"

terraform/plan:
	@echo "Terraform Plan"
	@cd ${TERRAFORM_FOLDER} && \
		terraform plan -input=false

terraform/apply:
	@echo "Terraform Apply"
	@cd ${TERRAFORM_FOLDER} && \
		terraform apply -auto-approve -input=false