# dawn to dusk
Configuring a Linux system to hybrid suspend-hibernate at sundown and resume
at sunrise, and/or alternatively to hibernate on low battery.

+ <https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate>
+ <https://baeldung.com/linux/auto-suspend-wake>
+ <https://wiki.archlinux.org/title/laptop>

The included file root.cron shows a sample rtcwake command that sleeps for 16
hours a day, probably safe for most places year-round. It must be in root's
crontab.
