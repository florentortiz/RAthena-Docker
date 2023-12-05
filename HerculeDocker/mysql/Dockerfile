FROM mysql:5.7

RUN yum -y update && yum install -y git

RUN git clone https://github.com/HerculesWS/Hercules.git /root/Hercule

RUN cp /root/Hercule/sql-files/*.sql /docker-entrypoint-initdb.d/

RUN rm -rf /root/Hercule/