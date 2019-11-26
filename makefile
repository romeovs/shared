include node_modules/shared/make/log.make
include node_modules/shared/make/info.make
include node_modules/shared/make/help.make
include node_modules/shared/make/lint.make
include node_modules/shared/make/caddy.make
include node_modules/shared/make/frame.make
include node_modules/shared/make/deploy.make
include node_modules/shared/make/typecheck.make

.PHONY: shared
shared: ## Update shared submodule
	cd shared && git pull
