FLOW_TYPED_ARGS ?= --libdefDir .types

check: ## Typecheck the code
	@$m "Typechecking..."
	@$(BIN)/flow check

types: ## Update type definitions
	@$m "Installing type definitions..."
	@$(BIN)/flow-typed install $(FLOW_TYPED_ARGS)
