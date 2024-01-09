# Use an official lightweight Python image
FROM nginx:alpine

# Copy HTML files to the default Nginx public folder
COPY *.html /usr/share/nginx/html/

# Expose the default Nginx port
EXPOSE 80
