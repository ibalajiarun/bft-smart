# FROM openjdk:latest
FROM openjdk:8u171-jre

WORKDIR /bftsmart

COPY bin bin
COPY lib lib
COPY config config

COPY runscripts/smartrun.sh .
COPY setup-server.sh .

ENTRYPOINT ["/bftsmart/smartrun.sh"]