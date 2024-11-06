#!/bin/bash

mkdir ./simple-ca
cd ./simple-ca


mkdir root-ca issuing-ca email-server web-server


cd root-ca/
mkdir etc private cert crl database issued-cert csr
touch database/index.dat && touch database/serial.dat && touch database/crl_number
cp /pki/root-ca.conf etc/root-ca.conf
cd ..

cd issuing-ca
mkdir etc private cert crl database issued-cert csr
touch database/index.dat && touch database/serial.dat && touch database/crl_number
cp /pki/issuing-ca.conf etc/issuing-ca.conf
cd ..


cd email-server
mkdir private cert etc
cp /pki/email-server.conf etc/email-server.conf
cd ..

cd web-server
mkdir private cert etc
cp /pki/web-server.conf etc/web-server.conf
cd ..


cd /pki/
rm email-server.conf web-server.conf issuing-ca.conf root-ca.conf script.sh