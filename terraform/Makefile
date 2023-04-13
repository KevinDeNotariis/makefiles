.PHONY: help
SHELL         := /bin/bash
MAKEFILES_DIR := ./@bin/makefiles

test:
	@echo "$(MAKEFILE_LIST)"

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z0-9/ -]+:.*#'  $(MAKEFILE_LIST) | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

makefiles/download: # Downloads the makefiles
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/KevinDeNotariis/makefiles.git ${MAKEFILES_DIR} -q
	cd ${MAKEFILES_DIR} && git checkout main -q

-include ${MAKEFILES_DIR}/terraform/targets/terraform.mk