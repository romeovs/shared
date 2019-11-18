.PHONY: help
help: # nifty self documenter
	@echo
	@make info
	@echo
	@echo "make rules"
	@echo
	@grep -E '^[a-zA-Z_.-]+:[^#]*?## .*$$' $(MAKEFILE_LIST) \
		| sed 's/[^:]*://' \
		| sed 's/: ##*/ :/' \
		| sort \
		| awk 'BEGIN {FS = " :"}; {printf "\033[33m  %-10s\033[0m %s\n", $$1, $$2}'
	@echo
