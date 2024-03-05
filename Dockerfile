# Use a minimal base image
FROM alpine:latest

# Update the package repository and install required tools
RUN apk update && \
    apk add --no-cache virt-install qemu-img cdrkit apache2 apache2-ssl

# Set the working directory (optional)
WORKDIR /app

COPY ./index.html /var/www/localhost/htdocs/

RUN sed -i 's/^#LoadModule ssl_module/LoadModule ssl_module/' /etc/apache2/httpd.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/server.key -out /etc/ssl/certs/server.crt \
    -subj "/C=US/ST=California/L=San Francisco/O=MyOrg/OU=Dev/CN=localhost"

RUN sed -i 's/^#Include conf\/extra\/httpd-ssl.conf/Include conf\/extra\/httpd-ssl.conf/' /etc/apache2/httpd.conf

# Start Apache in the foreground
CMD ["httpd", "-DFOREGROUND"]



