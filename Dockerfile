FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip

# Download the Healet template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip /var/www/html/

WORKDIR /var/www/html

# Unzip the Healet template
RUN unzip healet.zip

# Copy the contents of the healet folder to the root of /var/www/html/
RUN cp -rvf healet/* .

# Clean up by removing the healet folder and the zip file
RUN rm -rf healet healet.zip

# Set Apache to run in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80

