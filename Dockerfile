# Use node image for building the app
FROM node:18-alpine AS builder

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code to the container
COPY . .

# Build the production version of the app
RUN npm run build

# Use nginx to serve the built files
FROM nginx:alpine

# Copy the built files to nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Install json-server to serve the API
RUN apk add --no-cache nodejs npm
RUN npm install -g json-server

# Copy jobs.json file for json-server
COPY src/jobs.json /data/jobs.json

# Expose port 80 for the website and port 8000 for json-server
EXPOSE 80 8000

# Run nginx and json-server together
CMD ["sh", "-c", "json-server --watch /data/jobs.json --port 8000 & nginx -g 'daemon off;'"]
