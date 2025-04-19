FROM mattermost/focalboard:latest

# Set user to root for permission-sensitive operations
USER root

# Create directory for configuration
WORKDIR /opt/focalboard

# Copy custom configuration
COPY config.json ./config.json

# Create an entrypoint script with executable permissions
RUN echo '#!/bin/sh\nset -e\n\n# Replace environment variables in config.json\nsed -i "s|\${DATABASE_URL}|$DATABASE_URL|g" /opt/focalboard/config.json\n\nexec ./bin/focalboard-server' > /docker-entrypoint.sh && \
    chmod +x /docker-entrypoint.sh

# Expose the port
EXPOSE 8000

# Set environment variables
ENV PORT=8000
ENV DBTYPE=postgres
ENV DATABASE_URL=""

# Switch back to non-root user for security
USER focalboard

# Use the entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"] 