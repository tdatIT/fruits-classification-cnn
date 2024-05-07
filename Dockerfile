# Use an official TensorFlow runtime as a parent image
FROM tensorflow/tensorflow:latest-cpu-py3

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run the command to start uWSGI
CMD ["uwsgi --http 127.0.0.1:5000 --module myproject:app"]