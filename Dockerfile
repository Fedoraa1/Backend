# Use a lightweight Python base image
FROM python:3.9-slim

# Install PostgreSQL development tools
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Create and activate a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install the wheel package to avoid legacy warnings
RUN pip install --no-cache-dir wheel

# Set working directory
WORKDIR /app

# Copy requirements.txt and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code and startup script
COPY . .
RUN chmod +x start.sh  # Make the script executable

# Start the application using the shell script
CMD ["./start.sh"]
