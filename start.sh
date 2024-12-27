#!/bin/sh

# Set the default port to 8000 if $PORT is not provided
PORT=${PORT:-8000}

# Start the application
exec uvicorn app.main:app --host 0.0.0.0 --port $PORT
