# Use the official Apache HTTP Server image as the base image
FROM httpd:2.4


# Copy the Apache configuration file
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf

COPY ./login.html /usr/local/apache2/root/login/login.html

COPY ./startup /usr/local/bin/startup

RUN chmod +x /usr/local/bin/startup

CMD ["startup"]