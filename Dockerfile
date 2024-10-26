FROM node:14

# Create app directory
WORKDIR /app

# Copy project files
COPY . .

# Install app dependencies
RUN npm install

# Serve the Honkit project
CMD ["npx", "honkit", "serve"]
