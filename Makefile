# Makefile for Honkit project management

# Phony targets
.PHONY: all install import-docbase serve build clean start docker-build docker-up docker-down docker-exec help

# Default target
all: install import-docbase build

# Install dependencies
install:
	@echo "Installing dependencies..."
	npm install

# Import DocBase articles
import-docbase:
	@echo "Importing DocBase articles..."
	npm run import-docbase

# Serve Honkit locally
serve:
	@echo "Starting Honkit server..."
	npm run serve

# Build Honkit project
build:
	@echo "Building Honkit project..."
	npm run build

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	npm run clean

# Start the project (import, build, and serve)
start:
	@echo "Starting the project..."
	npm start

# Build Docker containers
docker-build:
	@echo "Building Docker containers..."
	docker compose build

# Start Docker containers
docker-up:
	@echo "Starting Docker containers..."
	docker compose up

# Stop Docker containers
docker-down:
	@echo "Stopping Docker containers..."
	docker compose down

# Execute bash in Honkit container
docker-exec:
	@echo "Executing bash in Honkit container..."
	docker compose exec honkit bash

# Display help information
help:
	@echo "Available targets:"
	@echo "  all            - Install dependencies, import DocBase articles, and build the project"
	@echo "  install        - Install project dependencies"
	@echo "  import-docbase - Import articles from DocBase"
	@echo "  serve          - Start Honkit server for local development"
	@echo "  build          - Build the Honkit project"
	@echo "  clean          - Remove build artifacts"
	@echo "  start          - Import DocBase articles, build the project, and start the server"
	@echo "  docker-build   - Build Docker containers"
	@echo "  docker-up      - Start Docker containers"
	@echo "  docker-down    - Stop Docker containers"
	@echo "  docker-exec    - Execute bash in Honkit container"
	@echo "  help           - Display this help message"
