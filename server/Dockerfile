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
RUN npm install wsproxy -g

RUN apt-get install mysql-server -y
RUN git clone https://github.com/rathena/rathena.git /root/rAthena

WORKDIR /root/rAthena
RUN rm /root/rAthena/conf/inter_athena.conf
COPY inter_athena.conf /root/rAthena/conf/inter_athena.conf
RUN ./configure --enable-epoll=yes --enable-prere=no --enable-vip=no --enable-packetver=20210703
RUN make clean && make server
RUN chmod a+x login-server && chmod a+x char-server && chmod a+x map-server && chmod a+x web-server

COPY boottime.sh ./boottime.sh

RUN dos2unix ./boottime.sh
RUN chmod +x ./boottime.sh

ENTRYPOINT ["./boottime.sh"]

