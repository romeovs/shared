include ./shared/make/log.make
include ./shared/make/info.make
include ./shared/make/help.make

shared: ## Update shared submodule
	cd shared && git pull
