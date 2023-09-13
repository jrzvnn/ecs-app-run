# Set the base image to Ubuntu 22.04
FROM ubuntu:22.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for the application
RUN mkdir /app

# Set the working directory
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Install the application's Python dependencies
RUN pip3 install -r requirements.txt

# Expose the port that the application will listen on
EXPOSE 5000

# Start the application
CMD ["python3", "app.py"]