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
COPY inter_athena.conf /root/rAthena/conf/inter_athena.conf
COPY char_athena.conf /root/rAthena/conf/char_athena.conf
COPY defines_post.hpp /root/rAthena/src/custom/defines_post.hpp

RUN ./configure --enable-epoll=yes --enable-prere=no --enable-vip=no --enable-packetver=20190605
RUN make clean && make server
RUN chmod a+x login-server && chmod a+x char-server && chmod a+x map-server && chmod a+x web-server

COPY boot.sh ./boot.sh

RUN dos2unix ./boot.sh
RUN chmod +x ./boot.sh

ENTRYPOINT ["./boot.sh"]