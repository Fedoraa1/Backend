import os
import subprocess

if __name__ == "__main__":
    port = os.getenv("PORT", "8000")  # Default to port 8000 if $PORT is not set
    subprocess.run(["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", port])
