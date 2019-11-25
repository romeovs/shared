ESLINT = $(BIN)/eslint

lint:
	@$m "Linting..."
	@$(ESLINT) -c .eslintrc.yml src
