FROM ghcr.io/ptero-eggs/games:source
USER root
RUN apt-get update \
 && apt-get install -y --no-install-recommends git openssh-client ca-certificates unzip \
 && apt-get clean \
 && mkdir -p /opt/vjolt23/bin /opt/vjolt23_64/bin \
 && curl -fsSL -o /tmp/vjolt23.zip "https://github.com/RaphaelIT7/VPhysics-Jolt/releases/download/Version0.23/vphysics_jolt_gmod_dedicated_linux32.zip" \
 && echo "fd25369059325b7414102588823b27906b3cc373a22eac1ece78ecc0dba54e20  /tmp/vjolt23.zip" | sha256sum -c - \
 && unzip -q /tmp/vjolt23.zip -d /tmp/vjolt23 \
 && cp /tmp/vjolt23/bin/*.so /opt/vjolt23/bin/ \
 && curl -fsSL -o /tmp/vjolt23_64.zip "https://github.com/RaphaelIT7/VPhysics-Jolt/releases/download/Version0.23/vphysics_jolt_gmod_dedicated_linux64.zip" \
 && echo "5108a1b951e5c2cc2a0b2a6329fad7f645160cc92a83169168b4de030254a20e  /tmp/vjolt23_64.zip" | sha256sum -c - \
 && unzip -q /tmp/vjolt23_64.zip -d /tmp/vjolt23_64 \
 && cp /tmp/vjolt23_64/bin/*.so /opt/vjolt23_64/bin/ \
 && ls -l /opt/vjolt23/bin /opt/vjolt23_64/bin
USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container
