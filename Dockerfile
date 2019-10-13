FROM debian


RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install gcc gdb make valgrind -y

