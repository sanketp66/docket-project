FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get install -y apache2 curl
RUN apt-get install -y zip
RUN apt-get install -y unzip

# Download the Avalon template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page261/avalon.zip /var/www/html/avalon.zip

WORKDIR /var/www/html

# Unzip the Avalon template
RUN unzip avalon.zip

# Copy the contents of the Avalon folder to the root of /var/www/html/
RUN cp -rvf avalon/* .

# Clean up by removing the Avalon folder and the zip file
RUN rm -rf avalon avalon.zip

# Set Apache to run in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl"]
CMD ["-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80
