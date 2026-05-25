.PHONY: help setup install format lint run

# Define python executable
PYTHON = python3

# Default action
help:
	@echo "Makefile for Python Project"
	@echo ""
	@echo "Usage:"
	@echo "  make setup    - Creates a Python virtual environment"
	@echo "  make install  - Installs dependencies from requirements.txt"
	@echo "  make format   - Formats the code using black"
	@echo "  make lint     - Lints the code using ruff"
	@echo "  make run      - Runs the main script"
	@echo ""

# Creates the virtual environment
setup:
	@echo "Creating virtual environment..."
	$(PYTHON) -m venv .venv
	@echo "Virtual environment created in .venv/"
	@echo "Activate it by running: source .venv/bin/activate"

# Installs dependencies
install:
	@echo "Installing dependencies..."
	. .venv/bin/activate && pip install --upgrade pip && pip install -r requirements.txt

# Formats the code
format:
	@echo "Formatting code..."
	. .venv/bin/activate && black src/ tests/

# Lints the code
lint:
	@echo "Linting code..."
	. .venv/bin/activate && ruff check src/ tests/

# Runs the main script
run:
	@echo "Running main script..."
	. .venv/bin/activate && $(PYTHON) src/main.py
