LOG_NAME = $(SITE_NAME)
log_color = \033[34m
log_name = $(LOG_NAME)
log_no_color = \033[0m
m = printf "$(log_color)$(log_name)$(log_no_color) %s$(log_no_color)\n"
