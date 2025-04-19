FROM mattermost/focalboard:latest

# Set environment variables
ENV PORT=8000
ENV DBTYPE=postgres

# Expose the port
EXPOSE 8000

# Use the default entrypoint 