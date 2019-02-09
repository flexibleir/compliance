FROM ubuntu:18.04  
LABEL "Author"="Venkatesha"  
LABEL version="0.2"
LABEL description="ssh client installed" 
RUN echo "nameserver 8.8.8.8" | tee /etc/resolv.conf > /dev/null 
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install ssh
ENTRYPOINT service ssh restart && bash