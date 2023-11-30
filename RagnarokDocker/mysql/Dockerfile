FROM mysql:5.7

RUN yum -y update && yum install -y git dos2unix

COPY mysql-init-tables.sh /docker-entrypoint-initdb.d/

RUN dos2unix /docker-entrypoint-initdb.d/mysql-init-tables.sh \
    && chmod +x /docker-entrypoint-initdb.d/mysql-init-tables.sh

RUN chmod +x /docker-entrypoint-initdb.d/mysql-init-tables.sh

RUN git clone https://github.com/rathena/rathena.git /root/rAthena


WORKDIR /docker-entrypoint-initdb.d/
