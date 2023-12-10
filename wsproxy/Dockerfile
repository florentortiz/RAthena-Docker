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

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y  dos2unix \ 
						npm 
                        
RUN npm install wsproxy -g

COPY boot.sh ./boot.sh

RUN dos2unix ./boot.sh
RUN chmod +x ./boot.sh

ENTRYPOINT ["./boot.sh"]