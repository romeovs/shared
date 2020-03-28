DIST ?=
CADDY_FILE ?= Caddyfile
CADDY_ARGS ?= --host $(HOST) --name $(SITE_NAME)

.PHONY: Caddyfile
$(DIST)/Caddyfile: Caddyfile
	@$m "Generating Caddyfile..."
	@$(BIN)/template $(CADDY_FILE) $(CADDY_ARGS) > $(DIST)/Caddyfile

.PHONY: caddy
caddy: $(DIST)/Caddyfile
