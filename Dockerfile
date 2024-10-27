FROM node:20

# Create app directory
WORKDIR /app

# Copy project files
COPY . .

# Install app dependencies
RUN make install

# Serve the Honkit project
CMD ["make", "start"]
