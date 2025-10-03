# Use lightweight Debian base
FROM debian:stable-slim

# Install watchdog
RUN apt-get update && \
    apt-get install -y watchdog gettext-base && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
COPY watchdog.conf.template /watchdog.conf.template
RUN chmod +x /entrypoint.sh

# Run entrypoint
ENTRYPOINT ["/entrypoint.sh"]