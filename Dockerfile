FROM ghcr.io/ptero-eggs/games:source
USER root
ARG VJOLT_VERSION=0.20
RUN apt-get update \
 && apt-get install -y --no-install-recommends git openssh-client ca-certificates unzip \
 && apt-get clean \
 && mkdir -p /opt/vjolt/bin /opt/vjolt64/bin/linux64 \
 && curl -fsSL -o /tmp/vjolt32.zip "https://github.com/misyltoad/VPhysics-Jolt/releases/download/${VJOLT_VERSION}/vphysics_jolt_${VJOLT_VERSION}_gmod_linux32.zip" \
 && unzip -q /tmp/vjolt32.zip -d /tmp/vjolt32 \
 && cp /tmp/vjolt32/bin/*.so /opt/vjolt/bin/ \
 && curl -fsSL -o /tmp/vjolt64.zip "https://github.com/misyltoad/VPhysics-Jolt/releases/download/${VJOLT_VERSION}/vphysics_jolt_${VJOLT_VERSION}_gmod_linux64.zip" \
 && unzip -q /tmp/vjolt64.zip -d /tmp/vjolt64 \
 && cp /tmp/vjolt64/bin/linux64/*.so /opt/vjolt64/bin/linux64/ \
 && ls -l /opt/vjolt/bin /opt/vjolt64/bin/linux64
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
