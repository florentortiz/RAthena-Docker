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
RUN git clone https://github.com/HerculesWS/Hercules.git /hercule/Hercule
# Créer le répertoire hercule et changer le propriétaire
RUN chown -R hercule:hercule /hercule
# Ajouter un nouvel utilisateur 'hercule'
WORKDIR /hercule/Hercule
COPY boot.sh ./boot.sh
COPY sql_connection.conf /hercule/Hercule/conf/global
RUN dos2unix ./boot.sh
RUN chmod +x ./boot.sh
# Changer l'utilisateur pour 'hercule'
USER hercule

RUN ./configure
RUN make clean && make sql
RUN chmod a+x login-server && chmod a+x char-server && chmod a+x map-server && chmod a+x api-server




ENTRYPOINT ["./boot.sh"]