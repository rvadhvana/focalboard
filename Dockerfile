FROM mattermost/focalboard:latest

# Create directory for configuration
WORKDIR /opt/focalboard

# Copy custom configuration
COPY config.json ./config.json

# Expose the port
EXPOSE 8000

# Set environment variables
ENV PORT=8000
ENV DBTYPE=postgres
ENV DATABASE_URL=""

# Set the command to run
CMD sed -i "s|\${DATABASE_URL}|$DATABASE_URL|g" /opt/focalboard/config.json && \
    ./bin/focalboard-server 