DIST ?=
CADDY_HOSTS ?=
CADDY_ROOT ?= /srv/http/$(SITE_NAME)

.PHONY: Caddyfile
$(DIST)/Caddyfile: Caddyfile
	@$m "Generating Caddyfile..."
	@env HOSTS=$(CADDY_HOSTS) ROOT=$(CADDY_ROOT) node shared/scripts/caddy.js > $(DIST)/Caddyfile

.PHONY: caddy
caddy: $(DIST)/Caddyfile
