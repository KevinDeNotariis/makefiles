.PHONY: help
SHELL         := /bin/bash
MAKEFILES_DIR := ./@bin/makefiles

makefiles/download:
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/KevinDeNotariis/makefiles.git ${MAKEFILES_DIR} -q
	cd ${MAKEFILES_DIR} && git checkout main -q

-include ${MAKEFILES_DIR}/terraform/targets/terraform.mk