include node_modules/hared/make/log.make
include node_modules/hared/make/info.make
include node_modules/hared/make/help.make
include node_modules/hared/make/lint.make
include node_modules/hared/make/caddy.make

.PHONY: shared
shared: ## Update shared submodule
	cd shared && git pull
