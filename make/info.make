print_info = printf "  \033[33m%-11s\033[0m  %s\n"

.PHONY: info
info: ## Print some site info
	@$(print_info) "site name" $(SITE_NAME)
	@$(print_info) "deploy path"  "$(DEPLOY_HOST):$(DEPLOY_PATH)"
	@$(print_info) "site url"     $(DEPLOY_URL)
