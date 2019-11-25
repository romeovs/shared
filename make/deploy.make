DEPLOY_HOST ?=
DEPLOY_PATH ?= /srv/http/$(SITE_NAME)
PRODUCTION ?= production
STAGING ?= staging

.PHONY: upload upload.production
upload: upload.production
upload.production: ## Upload the dist folder to the DEPLOY_HOST production folder
	@$m "Uploading to production..."
	@sleep 2
	@rsync -vr dist/ $(DEPLOY_HOST):$(DEPLOY_PATH)/$(PRODUCTION) --delete --exclude Caddyfile

.PHONY: upload.staging
upload.staging: ## Upload the dist folder to the DEPLOY_HOST staging folder
	@$m "Uploading to staging..."
	@rsync -vr dist/ $(DEPLOY_HOST):$(DEPLOY_PATH)/$(STAGING) --delete --exclude Caddyfile

.PHONY: upload.caddy
upload.caddy: ## Upload the Caddyfile
	@$m "Uploading Caddyfile"
	@scp dist/Caddyfile $(DEPLOY_HOST):$(DEPLOY_PATH)/Caddyfile

.PHONY: open
open: ## Open the website at DEPLOY_URL
	@open $(DEPLOY_URL)

.PHONY: deploy
deploy: ## Deploy the site
deploy: clean build caddy upload.production upload.caddy

.PHONY: stage
stage: ## Deploy staging site
stage: clean build caddy upload.staging upload.caddy
