#!/bin/sh

# Log the value of $PORT
echo "PORT value is: $PORT"

# Set a default value if $PORT is empty
PORT=${PORT:-8000}

# Start the application
exec uvicorn app.main:app --host 0.0.0.0 --port $PORT
