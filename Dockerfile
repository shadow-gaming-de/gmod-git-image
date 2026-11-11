FROM ghcr.io/ptero-eggs/games:source
USER root
ARG VJOLT_VERSION=0.20
RUN apt-get update \
 && apt-get install -y --no-install-recommends git openssh-client ca-certificates unzip \
 && apt-get clean \
 && mkdir -p /opt/vjolt \
 && curl -fsSL -o /tmp/vjolt.zip "https://github.com/misyltoad/VPhysics-Jolt/releases/download/${VJOLT_VERSION}/vphysics_jolt_${VJOLT_VERSION}_gmod_linux32.zip" \
 && unzip -q /tmp/vjolt.zip -d /tmp/vjolt \
 && mkdir -p /opt/vjolt/bin \
 && cp /tmp/vjolt/bin/*.so /opt/vjolt/bin/ \
 && ls -l /opt/vjolt/bin
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
