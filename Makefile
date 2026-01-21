# use `make STORE=mem` for suspend to RAM
SHELL := /bin/bash
STORE ?= disk
DAWN ?= 0500
DUSK ?= 2100
DAWNHOURS := $(shell echo $$(($(DAWN) / 100)))
DAWNMINUTES := $(shell echo $$(($(DAWN) % 100)))
DUSKHOURS := $(shell echo $$(($(DUSK) / 100)))
DUSKMINUTES := $(shell echo $$(($(DUSK) % 100)))
STARTMINUTES := $(shell echo $$((($(DUSKHOURS) * 60) + $(DUSKMINUTES))))
ENDMINUTES := $(shell echo $$(((($(DAWNHOURS) + 24) * 60) + $(DAWNMINUTES))))
SLEEPTIME := $((shell echo $$((($(ENDMINUTES) - $(STARTMINUTES)) * 60)))
ifeq ($(SHOWENV),)
 export STORE DAWN DUSK DUSKHOURS DUSKMINUTES SLEEPTIME
else
 export
endif
all:
	@echo '`make install`' to append root.cron to the root crontab >&2
%.cron: %.template.cron Makefile
	envsubst < $< > $@
install: root.cron
	sudo crontab -l | grep -q rtcwake || \
	 cat <(sudo crontab -l) $< | sudo crontab -
	@echo "ignore 'no crontab for root' messages above, if any." >&2
env:
ifeq ($(SHOWENV),)
	$(MAKE) SHOWENV=1 $@
else
	$@
endif
