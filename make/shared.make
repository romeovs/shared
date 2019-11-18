include ./shared/make/log.make
include ./shared/make/info.make
include ./shared/make/help.make
include ./shared/make/lint.make

.PHONY: shared
shared: ## Update shared submodule
	cd shared && git pull
