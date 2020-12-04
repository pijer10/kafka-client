FROM openjdk:8-alpine

ENV KAFKA_VERSION 2.5.1
ENV SCALA_VERSION 2.13

RUN apk add tar gzip curl bash
RUN curl http://apache.mirrors.spacedump.net/kafka/"$KAFKA_VERSION"/kafka_"$SCALA_VERSION"-"$KAFKA_VERSION".tgz | tar xvz

WORKDIR /kafka_"$SCALA_VERSION"-"$KAFKA_VERSION"

CMD tail -f /dev/null
