FROM node:18-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Build TypeScript if needed
RUN npm run build || echo "No build script found"

# Start the server
CMD ["npx", "tsx", "src/server.ts"]