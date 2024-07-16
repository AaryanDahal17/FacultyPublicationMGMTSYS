# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory
WORKDIR /app/FacultyPublicationMGMTSYS

# Copy and install backend dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the backend files
COPY . .

# Expose the application port
EXPOSE 8000

# Run migrations and start the server
CMD ["sh", "-c", "python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
