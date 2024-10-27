# Makefile for Honkit project management

# Phony targets
.PHONY: all install import-docbase serve build clean serve up down exec help

# Default target
all: install import-docbase build

# Install dependencies
install:
	@echo "Installing dependencies..."
	npm install

# Import DocBase articles
import-docbase:
	@echo "Importing DocBase articles..."
	npx ts-node scripts/import-docbase.ts

# Serve Honkit locally
serve:
	@echo "Starting Honkit server..."
	npx honkit serve

# Build Honkit project
build:
	@echo "Building Honkit project..."
	npx honkit build

# Clean build artifacts
clean:
	@echo "Cleaning build artifacts..."
	rm -rf _book

# Start the application
serve:
	@echo "Starting the application..."
	npm run serve

# Start Docker containers
up:
	@echo "Starting Docker containers..."
	docker compose up

# Stop Docker containers
down:
	@echo "Stopping Docker containers..."
	docker compose down

# Execute bash in Honkit container
exec:
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
	@echo "  serve          - Start the honkit server"
	@echo "  up             - Start Docker containers"
	@echo "  down           - Stop Docker containers"
	@echo "  exec           - Execute bash in Honkit container"
	@echo "  help           - Display this help message"
