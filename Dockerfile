FROM debian:buster


LABEL org.opencontainers.version="v1.0.0"

LABEL org.opencontainers.image.authors="Marshall Asch <masch@uoguelph.ca> (https://marshallasch.ca)"
LABEL org.opencontainers.image.url="https://github.com/MarshallAsch/cDev.git"
LABEL org.opencontainers.image.source="https://github.com/MarshallAsch/cDev.git"
LABEL org.opencontainers.image.vendor="Marshall Asch"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.title="C development"
LABEL org.opencontainers.image.description="A docker image to debug C programs on Mac"


VOLUME [ "/code" ]
WORKDIR "/code"
CMD [ "bash" ]

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
   gcc \
   g++ \
   gdb \
   make \
   valgrind \
   git

# these two labels will change every time the container is built
# put them at the end because of layer caching
ARG VCS_REF
LABEL org.opencontainers.image.revision="${VCS_REF}"

ARG BUILD_DATE
LABEL org.opencontainers.image.created="${BUILD_DATE}"
