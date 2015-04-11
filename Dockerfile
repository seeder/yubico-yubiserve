FROM alpine:3.1
MAINTAINER Mateusz Pawlowski

RUN apk add py-cffi py-cryptography py-mysqldb --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add --update py-crypto py-openssl python py-six



#RUN pip install sqlite3

RUN mkdir /server
WORKDIR /server

ADD BaseHTTPServer.py /server/
ADD dbconf.py /server/
ADD yubikeys.sqlite /server/
ADD yubikeys.sqlite3 /server/
ADD yubiserve.cfg /server/
ADD yubiserve.png /server/
ADD yubiserve.py /server/
ADD yubiserve.pem /server/


RUN rm -rf /var/cache/apk/*

CMD ./yubiserve.py
EXPOSE 8000 8001
