# Basic Production Dockerfile for Stretto
FROM node:16

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy application code
COPY . .

# Build webpack bundles
RUN npm run webpack

# Expose port
EXPOSE 3000

# Start application
CMD ["node", "index.js"]
