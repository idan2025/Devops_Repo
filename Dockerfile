# Use Alpine-based Python
FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Flask (and build tools for pip if needed)
RUN pip install --no-cache-dir flask

# Expose Flask default port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
