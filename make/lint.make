ESLINT = $(BIN)/eslint

lint:
	@$m "Linting..."
	@$(ESLINT) -c node_modules/shared/eslintrc.yml src
