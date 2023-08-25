.PHONY: help
help: ## Display help message
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

########################################################
# Site 1
########################################################

.PHONY: ping-site-1
ping-site-1: ## Ping Nodes
	ansible-playbook playbooks/ping.yml -i sites/site1/inventory.yml -e "target_hosts=SITE1_FABRIC"

.PHONY: build-site-1
build-site-1: ## Build Configs
	ansible-playbook playbooks/build.yml -i sites/site_1/inventory.yml -e "target_hosts=SITE1_FABRIC"

.PHONY: deploy-site-1
deploy-site-1: ## Deploy Configs via eAPI
	ansible-playbook playbooks/deploy_eapi.yml -i sites/site_1/inventory.yml -e "target_hosts=SITE1_FABRIC"

.PHONY: cvp-site-1
cvp-site-1: ## Deploy Configs via eAPI
	ansible-playbook playbooks/cvp1.yml -i sites/site_1/inventory.yml

