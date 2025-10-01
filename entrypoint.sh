#!/bin/bash
set -e

# Default environment variables
WATCHDOG_DEVICE=${WATCHDOG_DEVICE:-/dev/watchdog0}
WATCHDOG_INTERVAL=${WATCHDOG_INTERVAL:-30}   # seconds
WATCHDOG_TIMEOUT=${WATCHDOG_TIMEOUT:-120}    # seconds

# Substitute environment variables into template
envsubst < /watchdog.conf.template > /etc/watchdog.conf

# Optionally, try to set timeout via sysfs
WDT_SYS="/sys/class/watchdog/$(basename $WATCHDOG_DEVICE)"
if [ -w "$WDT_SYS/timeout" ]; then
    echo $WATCHDOG_TIMEOUT > "$WDT_SYS/timeout" || true
fi

# Start watchdog daemon in foreground
exec watchdog -F -v
