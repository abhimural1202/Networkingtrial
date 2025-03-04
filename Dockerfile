# Use an official Nginx image as the base image
FROM nginx:latest

# Copy the content of your local app into the container
COPY ./index.html /usr/share/nginx/html/index.html

# Expose port 80 to make the app accessible
EXPOSE 80

# Run Nginx in the foreground (as the main process)
CMD ["nginx", "-g", "daemon off;"]
