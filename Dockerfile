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

# Command to run the application
CMD ["./bin/focalboard-server"] 