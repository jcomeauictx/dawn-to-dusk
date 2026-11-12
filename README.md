# dawn to dusk
Configuring a Linux system to hybrid suspend-hibernate at sundown and resume
at sunrise, and/or alternatively to hibernate on low battery.

+ <https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate>
+ <https://baeldung.com/linux/auto-suspend-wake>
+ <https://wiki.archlinux.org/title/laptop>

The included file root.cron shows a sample rtcwake command that sleeps for 16
hours a day, probably safe for most places year-round. It must be in root's
crontab.

# developer's notes
+ "disk" has to be in /sys/power/state in order to use the disk for sleep mode
+ `mokutil --sb-state` shows you if SecureBoot is enabled; if it is, `disk`
  will not be an option in /sys/power/state
+ `systemctl reboot --firmware-setup` allows you to get into the BIOS even if
  FastBoot is enabled
