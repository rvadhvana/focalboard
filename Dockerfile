FROM mattermost/focalboard:latest

# Set environment variables
ENV PORT=8000
ENV DBTYPE=postgres
ENV ENABLE_WEBSOCKET_SERVER=true
ENV WEBSOCKET_PORT=8000

# Expose the port
EXPOSE 8000

CMD ["sh", "-c", "focalboard-server"] 