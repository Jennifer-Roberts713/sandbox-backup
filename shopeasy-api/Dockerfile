FROM node:18-slim

WORKDIR /app

# Install dependencies first (cached unless package.json changes)
COPY package*.json ./
RUN npm install --production

# Copy application code
COPY . .

# Expose port and run
EXPOSE 8080
CMD ["npm", "start"]