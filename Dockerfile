# Use an AI-focused base image, adjust if a specific TPU image is required
FROM tensorflow/tensorflow:latest

WORKDIR /app

# Install git to pull the repository
RUN apt-get update && apt-get install -y git

# Clone the specific repository referenced in the image
RUN git clone https://github.com/darnellwashingtonjr94-art/G-C-64-TPUs.git .

# Install dependencies if a requirements.txt is present
# RUN pip install --no-cache-dir -r requirements.txt

# Define the default command to run your application
CMD ["python", "main.py"]
