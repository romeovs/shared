include node_modules/shared/makefile

SITE_NAME = [name]
DEPLOY_HOST = do
DEPLOY_PATH = /srv/http/$(SITE_NAME)
DEPLOY_URL = [url]

BIN = node_modules/.bin
FRAME = $(BIN)/frame

SRC = src
DIST = dist

FRAME_OPTS = -r $(SRC) -v debug -o $(DIST) -C .frame_cache

.PHONY: build
build: ## Build the site in production mode
	@$m "Building..."
	@$(FRAME) $(FRAME_OPTS) build

.PHONY: dev
dev: ## Build the site in development mode
	@$m "Building in dev mode..."
	@$(FRAME) $(FRAME_OPTS) build --dev

.PHONY: watch
watch: ## Watch files and start dev server
	@$m "Watching..."
	@$(FRAME) $(FRAME_OPTS) watch

.PHONY: serve
serve: ## Serve dist folder
	@$m "Serving..."
	@$(FRAME) $(FRAME_OPTS) serve

.PHONY: clean
clean: ## Clean up non-image assets
	@$m "Cleaning non image assets..."
	@find $(DIST) -type f | grep -v $(DIST)/_/im/ | xargs rm
	@find $(DIST) -type d -empty | xargs rm -r
	@find $(DIST) -type d -empty | xargs rm -r
	@find $(DIST) -type d -empty | xargs rm -r

.PHONY: reinstall
reinstall: ## Reinstall the frame dependency
	@$m "Reinstalling Frame.js"
	@yarn add ../frame
	@rm -rf node_modules/frame/node_modules/react
	@rm -rf node_modules/frame/node_modules/react-dom
	@rm -rf node_modules/frame/node_modules/react-head

.PHONY: upload
upload: ## Upload the dist folder to the DEPLOY_HOST
	@$m "Uploading..."
	@rsync -vr dist/ $(DEPLOY_HOST):$(DEPLOY_PATH) --delete

.PHONY: open
open: ## Open the website at DEPLOY_URL
	@open $(DEPLOY_URL)

.PHONY: caddy
caddy: ## Copy the caddy file to dist
	@cp Caddyfile $(DIST)

.PHONY: deploy
deploy: ## Deploy the site
deploy: clean build caddy upload open
