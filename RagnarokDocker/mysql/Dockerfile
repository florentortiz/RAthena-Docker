FROM mysql:5.7

RUN yum -y update && yum install -y git

RUN git clone https://github.com/rathena/rathena.git /root/rAthena

RUN cp /root/rAthena/sql-files/*.sql /docker-entrypoint-initdb.d/

RUN rm -rf /root/rAthena/