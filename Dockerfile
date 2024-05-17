# Use Node.js slim base image
FROM node:slim

# Create and set the working directory
WORKDIR /app

# Copy the application code to the working directory
COPY ./data /app

# Install global npm packages and local dependencies
RUN npm install -g npm wrangler typescript 

RUN wrangler build -c worker/wrangler-dev.toml

# Create a .env file
RUN touch .env

# Define volume for /app
VOLUME [ "/app" ]

# Expose port 9999
EXPOSE 9999

# Set the default command to run the development server
CMD ["wrangler", "dev", "-c", "worker/wrangler-dev.toml", "--tsconfig", "worker/tsconfig.json", "--no-bundle", "--node-compat", "--port", "9999", "--log-level", "debug"]
