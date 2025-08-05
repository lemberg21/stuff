# syntax=docker/dockerfile:1

# # builder installs dependencies and builds the application 
# FROM ubuntu:latest as base
# RUN apt -y update && apt -y upgrade
# RUN apt -y install apache2 php
# COPY ./index.php /var/www/html/index.php



# # builder builds the docker image
# FROM ubuntu:latest as builder
# EXPOSE 80

# CMD ["apachectl", "-D", "FOREGROUND"]



 FROM ubuntu:latest 
RUN apt -y update && apt -y upgrade
RUN apt -y install apache2 php
COPY ./index.php /var/www/html/index.php
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]