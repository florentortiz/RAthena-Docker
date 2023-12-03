# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

# Set the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update the package list, upgrade, and install necessary packages
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx php8.1-fpm git npm

# Copy the Nginx configuration and HTML files
COPY nginx-default /etc/nginx/sites-available/default
COPY index.html /var/www/html/index.html

# Clone the roBrowserLegacy repository
RUN git clone https://github.com/MrAntares/roBrowserLegacy.git /var/www/html/roBrowserLegacy

# Give appropriate permissions to files and directories
RUN chmod 777 -R /etc/nginx/sites-available/ && \
    chmod 775 /var/www/html/index.html && \
    chmod -R 755 /var/www/html/roBrowserLegacy

# Expose port 80
EXPOSE 80

# Clean up unnecessary files and start Nginx
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["nginx", "-g", "daemon off;"]
