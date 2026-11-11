FROM ghcr.io/ptero-eggs/games:source
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends git openssh-client ca-certificates \
 && apt-get clean
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
