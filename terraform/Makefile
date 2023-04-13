.PHONY: help
SHELL         := /bin/bash
MAKEFILES_DIR := ./@bin/makefiles

test:
	@echo "$(MAKEFILE_LIST)"

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

makefiles/download:
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/KevinDeNotariis/makefiles.git ${MAKEFILES_DIR} -q
	cd ${MAKEFILES_DIR} && git checkout main -q

-include ${MAKEFILES_DIR}/terraform/targets/terraform.mk