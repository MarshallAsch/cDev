FROM debian


VOLUME ["/code"]

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
   gcc \
   g++ \
   gdb \
   make \
   valgrind \
   git

WORKDIR /code

CMD bash
