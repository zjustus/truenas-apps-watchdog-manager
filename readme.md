# TrueNAS WatchDog Manager

This is a docker file that seeks to fix another short coming of TrueNAS (at least the community / scale version)  
I can not blame them on this one, its a little specific and it seems no one really needs this one.

This is a Docker Image that "Pets" a bios WatchDog, and is very beneficial for a motherboard that is unstable for who knows what reason and cannot be fixed because there are no logs when the firmware hangs.

you might be able to do this through scrips, or other simpler means, but this method allows for better monitoring of how petting is going.

```yaml
services:
	watchdog:
		build:
			context: https://github.com/zjustus/truenas-apps-network-manager.git
		devices:
			- "/dev/watchdog0:/dev/watchdog0"
		restart: unless-stopped
		privileged: true # Needed to access the hardware watchdog

```
