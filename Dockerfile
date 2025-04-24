FROM node:18-alpine

# Use ARG if you ever want to override the default
ARG N8N_VERSION=latest

# Install dependencies
RUN apk add --no-cache graphicsmagick tzdata python3 build-base

# Install n8n globally
RUN npm_config_user=root npm install --location=global n8n@${N8N_VERSION}

# Set working directory
WORKDIR /data

# Set environment variables
ENV N8N_USER_ID=root
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0

# Expose default port
EXPOSE 5678

# Default command
CMD ["n8n", "start"]

