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

FROM mysql:8.2

RUN yum -y update && yum install -y git

RUN git clone https://github.com/rathena/rathena.git /root/rAthena

RUN cp /root/rAthena/sql-files/*.sql /docker-entrypoint-initdb.d/

RUN rm -rf /root/rAthena/
