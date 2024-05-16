    # Use Node.js 20 Alpine as base image
    FROM node:20-alpine AS base

    # Update package index
    RUN apk update

    # Create directories
    RUN mkdir -p /app && \
        mkdir -p /tmp/package

    # Copy package.json files to /tmp/package/
    COPY ./data/package*.json /tmp/package/

    # Change working directory to /tmp/package/ and install wrangler globally and npm packages
    RUN cd /tmp/package && \
        npm install -g wrangler@latest && \
        npm install

    # Set working directory to /app
    WORKDIR /app

    # Create a .env file
    RUN touch /app/.env

    # Copy the application code to /app
    COPY ./data /app

    # Define volume for /app
    VOLUME [ "/app" ]

    # Expose port 9999
    EXPOSE 9999

    # Set the default command to run the development server
    CMD ["wrangler", "dev", "-c", "worker/wrangler-dev.toml", "--node-compat", "--port", "9999", "--log-level", "debug"]
