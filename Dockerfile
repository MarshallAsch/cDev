FROM debian

WORKDIR /root

VOLUME ["/root/code"]

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
   gcc \
   gdb \
   make \
   valgrind \
   git

WORKDIR /root/code