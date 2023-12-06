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

RUN useradd -ms /bin/bash hercule
RUN apt-get install mysql-server -y
RUN git clone https://github.com/HerculesWS/Hercules.git /hercule/hercule

RUN chown -R hercule:hercule /hercule

WORKDIR /hercule/Hercule
COPY boot.sh ./boot.sh
COPY sql_connection.conf /hercule/Hercule/conf/global
COPY /config/Hercule/api-server.conf /hercule/Hercule/conf/api-server/
COPY /config/Hercule/char-server.conf /hercule/Hercule/conf/char-server/
COPY /config/Hercule/inter-server.conf /hercule/Hercule/conf/inter-server/
COPY /config/Hercule/login-server.conf /hercule/Hercule/conf/login-server/

COPY /config/Server/ /hercule/Hercule/conf/map/battle/



RUN dos2unix ./boot.sh
RUN chmod +x ./boot.sh

USER hercule
WORKDIR /hercule/Hercule
RUN ./configure
RUN make clean && make sql
RUN chmod a+x login-server && chmod a+x char-server && chmod a+x map-server && chmod a+x api-server




ENTRYPOINT ["./boot.sh"]