SRC ?= src
DIST ?= dist
FRAME_OPTS ?= -r $(SRC) -v debug -o $(DIST) -C .frame_cache

.PHONY: build d
b: build
build: ## Build the site in production mode
	@$m "Building..."
	@$(FRAME) $(FRAME_OPTS) build

.PHONY: dev d
d: dev
dev: ## Build the site in development mode
	@$m "Building in dev mode..."
	@$(FRAME) $(FRAME_OPTS) build --dev

.PHONY: watch w
w: watch
watch: ## Watch files and start dev server
	@$m "Watching..."
	@$(FRAME) $(FRAME_OPTS) watch

.PHONY: serve s
s: serve
serve: ## Serve dist folder
	@$m "Serving..."
	@$(FRAME) $(FRAME_OPTS) serve

.PHONY: reinstall r
reinstall: ## Reinstall the frame dependency
reinstall: frame.install clean.install

.PHONY: clean c
c: clean
clean: ## Clean up non-image assets
	@$m "Cleaning non image assets..."
	@find $(DIST) -type f | grep -v $(DIST)/_/im/ | xargs rm
	@find $(DIST) -type d -empty | xargs rm -r
	@find $(DIST) -type d -empty | xargs rm -r
	@find $(DIST) -type d -empty | xargs rm -r


.PHONY: frame.install
frame.install:
	@$m "Reinstalling Frame.js"
	@yarn add ../frame

.PHONY: clean.install
clean.install:
	@rm -rf node_modules/frame/node_modules/react
	@rm -rf node_modules/frame/node_modules/react-dom
	@rm -rf node_modules/frame/node_modules/react-head
