FROM httpd:2.4
<<<<<<< HEAD
RUN apt update \
  && apt install -y curl iproute2 less nano tree
=======

MAINTAINER fabien  <fabien@mekomsolutions.com>

RUN apt update
RUN apt install -y nano tree less iputils-ping


>>>>>>> BAH-783: Add Apache reverse proxy (#5)
COPY resources/httpd.conf /usr/local/apache2/conf/httpd.conf
