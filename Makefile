SHELL := /bin/bash
all:
	@echo '`make install`' to append root.cron to the root crontab >&2
install:
	sudo crontab -l | grep -q rtcwake || \
	 cat <(sudo crontab -l) root.cron | sudo crontab -
	@echo "ignore 'no crontab for root' messages above, if any." >&2
