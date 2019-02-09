FROM ubuntu:18.04  
LABEL "Author"="Venkatesha"  
LABEL version="0.2"
LABEL description="Flexible IR Compliance" 
RUN echo "nameserver 8.8.8.8" | tee /etc/resolv.conf > /dev/null 
COPY ./main /main
COPY ./scripts /scripts
RUN apt-get -y update && apt-get -y upgrade && apt-get -y install ssh && apt-get -y install sshpass