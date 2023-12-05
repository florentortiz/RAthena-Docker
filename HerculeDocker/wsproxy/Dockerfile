FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y  dos2unix \ 
						npm 
                        
RUN npm install wsproxy -g

COPY boot.sh ./boot.sh

RUN dos2unix ./boot.sh
RUN chmod +x ./boot.sh

ENTRYPOINT ["./boot.sh"]