# Ubuntu based
FROM ubuntu:latest

# Author
LABEL authors="alierendasdemir"

# Package
RUN apt-get update && apt-get install -y \
    curl \
    zip \
    apt-transport-https \
    gnupg2 \
    ca-certificates \
    maven \
    wget \
    openjdk-11-jdk

# Gauge
RUN curl -SsL https://downloads.gauge.org/stable | sh

# Gauge plugins
RUN gauge install java && \
    gauge install screenshot

# Directory
WORKDIR /app
COPY . /app

# Maven
RUN mvn clean package

# Environment variables
ENV PATH=$HOME/.gauge:$PATH

# JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Gauge command
CMD ["gauge", "run", "specs"]
