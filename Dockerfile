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

# Copy custom nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the built files to nginx
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose port 80 for the website
EXPOSE 80

# Run nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
