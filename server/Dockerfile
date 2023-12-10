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

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git \
                        make \
                        libmariadb-dev \
                        libmariadb-dev-compat \
                        gcc \
                        g++ \
                        zlib1g-dev \
                        libpcre3-dev \
                        vim dos2unix \
                        npm 



RUN apt-get install mysql-server -y
RUN git clone https://github.com/rathena/rathena.git /root/rAthena

WORKDIR /root/rAthena
COPY /config/Athena/ /root/rAthena/conf/
COPY /config/Server/ /root/rAthena/conf/battle/
COPY defines_post.hpp /root/rAthena/src/custom/defines_post.hpp

RUN ./configure --enable-epoll=yes --enable-prere=no --enable-vip=no --enable-packetver=20190605
RUN make clean && make server
RUN chmod a+x login-server && chmod a+x char-server && chmod a+x map-server && chmod a+x web-server

COPY boot.sh ./boot.sh

RUN dos2unix ./boot.sh
RUN chmod +x ./boot.sh

ENTRYPOINT ["./boot.sh"]