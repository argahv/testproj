FROM node:20-alpine

# Create non-root user for security
RUN addgroup -g 1000 nodeuser && \
    adduser -D -u 1000 -G nodeuser nodeuser

WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json* ./
RUN npm ci --only=production && \
    chown -R nodeuser:nodeuser /app

# Copy application files
COPY --chown=nodeuser:nodeuser . .

# Switch to non-root user
USER nodeuser

# Expose port
EXPOSE 3000

CMD ["npm", "start"]