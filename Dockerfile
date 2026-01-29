# Use an official Python image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file (requirements.txt) to the working directory
COPY requirements.txt .    
# (.) refers to the current working directory (WORKDIR /app)

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt
# It means to install the Python packages listed in requirements.txt without using the cache to reduce image size.

# Copy the application code to the working directory
COPY app.py .
# This copies the app.py file from your local machine to the /app directory in the container.

# Expose the port Flask will run on
EXPOSE 5000
# EXPOSE command is used to inform Docker that the container will listen on the specified network port at runtime.
# It does not opens the port itself.
# docker run -p 5000:5000 <image_name> is used to open the port by mapping the container's port to the host machine's port.
# the first 5000 is the host port and the second 5000 is the container port.

# Command to run the application
CMD ["python", "app.py"]
# CMD specifies the command to run within the container when it starts.
# It is the most important instruction as without it the container would start and then immediately stop.