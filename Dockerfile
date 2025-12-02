FROM node:20-alpine

# Use the existing 'node' user (UID 1000) that comes with the base image
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm ci --only=production && \
    chown -R node:node /app

# Copy application files
COPY --chown=node:node . .

# Switch to non-root user (node user already exists with UID 1000)
USER node

# Expose port
EXPOSE 3000

CMD ["npm", "start"]