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

FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Paris

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nginx php8.1-fpm git npm

COPY nginx-default /etc/nginx/sites-available/default
COPY index.html /var/www/html/index.html

RUN git clone https://github.com/MrAntares/roBrowserLegacy.git /var/www/html/roBrowserLegacy

RUN chmod 777 -R /etc/nginx/sites-available/ && \
    chmod 775 /var/www/html/index.html && \
    chmod -R 755 /var/www/html/roBrowserLegacy

EXPOSE 80

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["nginx", "-g", "daemon off;"]
