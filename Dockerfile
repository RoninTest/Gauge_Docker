FROM ubuntu:latest

LABEL authors="alierendasdemir"

RUN apt-get update && apt-get install -y \
    curl \
    zip \
    apt-transport-https \
    gnupg2 \
    ca-certificates \
    maven \
    wget \
    openjdk-11-jdk

RUN curl -SsL https://downloads.gauge.org/stable | sh

RUN gauge install java && \
    gauge install screenshot

WORKDIR /app
COPY . /app

RUN mvn clean package

ENV PATH=$HOME/.gauge:$PATH

CMD ["gauge", "run", "specs", "config", "daemon"]
