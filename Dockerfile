FROM alpine:3.9

LABEL version="0.20.2" \ 
      maintainer="jptx1234@gmail.com"
      
ENV NPS-VERSION 0.20.2
WORKDIR /root/nps/

RUN echo https://github.com/cnlh/nps/releases/download/v${NPS-VERSION}/linux_amd64_server.tar.gz && wget --no-check-certificate -O nps_server.tar.gz https://github.com/cnlh/nps/releases/download/v${NPS-VERSION}/linux_amd64_server.tar.gz && \
    tar -xzvf nps_server.tar.gz --strip-components 1 && \
    rm -f nps_server.tar.gz
    
ADD nps.conf conf/nps.conf

EXPOSE 8050-8070

ENTRYPOINT ["/root/nps"]
