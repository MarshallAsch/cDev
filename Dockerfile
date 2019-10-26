FROM debian


RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
   gcc \
   gdb \
   make \
   valgrind \
   git

