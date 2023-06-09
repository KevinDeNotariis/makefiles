REMOTE_SOURCE_CONTROL ?= github.com

.check-env-variables:
	@test $${TERRAFORM_BACKEND_BUCKET_NAME?Please set env variable TERRAFORM_BACKEND_BUCKET_NAME}
	@test $${TERRAFORM_BACKEND_KEY?Please set env variable TERRAFORM_BACKEND_KEY}
	@test $${TERRAFORM_BACKEND_REGION?Please set env variable TERRAFORM_BACKEND_REGION}
	@test $${TERRAFORM_BACKEND_DYNAMODB_TABLE?Please set env variable TERRAFORM_BACKEND_DYNAMODB_TABLE}

.check-and-set-git-creds:
	@if [ "${GIT_USERNAME}" != "" ] && [ "${GIT_TOKEN}" != "" ]; then\
		echo "Git credentials found, setting up the configuration...";\
		git config --global url."https://${GIT_USERNAME}:${GIT_TOKEN}@${REMOTE_SOURCE_CONTROL}".insteadOf https://${REMOTE_SOURCE_CONTROL};\
	else\
		echo "No Git credentials found, continuing...";\
	fi

# -----------------------------------------------------------------------------------
# Terraform targets
# -----------------------------------------------------------------------------------
terraform/init: .check-env-variables .check-and-set-git-creds # Run terraform init, setting up the Backend
	@echo "Terraform Init"
	@cd ${TERRAFORM_FOLDER} && \
		rm -rf .terraform && \
		terraform init \
			-backend-config="bucket=${TERRAFORM_BACKEND_BUCKET_NAME}"	\
			-backend-config="key=${TERRAFORM_BACKEND_KEY}" \
			-backend-config="region=${TERRAFORM_BACKEND_REGION}" \
			-backend-config="dynamodb_table=${TERRAFORM_BACKEND_DYNAMODB_TABLE}"

terraform/plan: # Run terraform plan
	@echo "Terraform Plan"
	@cd ${TERRAFORM_FOLDER} && \
		terraform plan -input=false

terraform/apply: # Run terraform apply
	@echo "Terraform Apply"
	@cd ${TERRAFORM_FOLDER} && \
		terraform apply -auto-approve -input=false