# Pobranie obrazu Ubuntu 22.04
FROM ubuntu:22.04

ENV TZ=Europe/Warsaw
ARG DEBIAN_FRONTEND=noninteractive
# Instalacja Pythona 3.8
RUN apt-get update && apt-get install -y zlib1g-dev
RUN apt-get update && apt-get install -y build-essential
RUN apt-get update \
    && apt-get install -y curl \
    && curl -O https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz \
    && tar -zxvf Python-3.8.0.tgz \
    && cd Python-3.8.0 \
    && ./configure --enable-optimizations \
    && make \
    && make install
RUN apt install unzip
RUN apt install zip
# Instalacja Javy 8 i Kotlina
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean && \
    curl -s https://get.sdkman.io | bash && \
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk install kotlin"

EXPOSE 80

# Ustawienie katalogu roboczego
WORKDIR /usr/src/app


# Uruchomienie komendy
CMD ["/bin/bash"]