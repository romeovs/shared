.PHONY: upload
upload: ## Upload the dist folder to the DEPLOY_HOST
	@$m "Uploading..."
	@rsync -vr dist/ $(DEPLOY_HOST):$(DEPLOY_PATH) --delete

.PHONY: open
open: ## Open the website at DEPLOY_URL
	@open $(DEPLOY_URL)

.PHONY: deploy
deploy: ## Deploy the site
deploy: clean build caddy upload open
