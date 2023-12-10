###########################################################################
#
# Project: RAthena-Docker
# Source: https://github.com/florentortiz/RAthena-Docker
# Created by: florentortiz, Mido-tw
#
# We highly encourage the community to share their ideas and contributions. 
# Your insights and improvements are valuable to us, and we welcome any form of 
# contribution, be it through issues, pull requests, or discussions.
# Let's build something great together!
#
###############################################################################

FROM php:7.4-apache

RUN apt-get update && \
    apt-get install -y git 

RUN git clone https://github.com/rathena/FluxCP.git /var/www/html/

COPY servers.php /var/www/html/config/servers.php
COPY application.php /var/www/html/config/application.php

RUN docker-php-ext-install pdo_mysql mysqli

RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/  

EXPOSE 80