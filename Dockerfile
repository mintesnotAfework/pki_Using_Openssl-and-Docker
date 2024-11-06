FROM ubuntu:rolling

RUN apt-get update && apt-get install -y openssl tree
RUN mkdir /pki
WORKDIR /pki


COPY ./script/* /pki/
COPY ./config/* /pki/

RUN chmod +x /pki/script.sh
RUN chmod +x /pki/tlsCert.sh
RUN chmod +x /pki/emailCert.sh
RUN chmod +x /pki/init.sh

RUN bash /pki/script.sh

CMD [ "bash" ]