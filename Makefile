# use `make STORE=mem` for suspend to RAM
STORE ?= disk
SHELL := /bin/bash
all:
	@echo '`make install`' to append root.cron to the root crontab >&2
%.cron: %.template.cron
	envsubst < $< > $@
install: root.cron
	sudo crontab -l | grep -q rtcwake || \
	 cat <(sudo crontab -l) $< | sudo crontab -
	@echo "ignore 'no crontab for root' messages above, if any." >&2
