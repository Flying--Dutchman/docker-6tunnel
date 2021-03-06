FROM alpine:latest

MAINTAINER Bastian Lemke

RUN apk add --update make g++

RUN wget -O - https://github.com/wojtekka/6tunnel/releases/download/0.13/6tunnel-0.13.tar.gz | tar xvzf - && \
	mv /6tunnel-0.13 /6tunnel

RUN cd /6tunnel && ./configure && make && make install

COPY data/6tunnel.conf /6tunnel.conf
COPY data/start_6tunnel.sh /start_6tunnel.sh

CMD chmod +x /start_6tunnel.sh && ./start_6tunnel.sh
