#!/bin/bash

cd simple-ca/root-ca
openssl req -new -config etc/root-ca.conf -out csr/root-ca.csr -keyout private/root-ca.key
openssl ca -selfsign -config etc/root-ca.conf -in csr/root-ca.csr -out cert/root-ca.crt -extensions root_ca_ext
cd ../

cd issuing-ca
openssl req -new -config etc/issuing-ca.conf -out ../root-ca/csr/issuing-ca.csr -keyout private/issuing-ca.key
cd ../root-ca

openssl ca -config etc/root-ca.conf -in csr/issuing-ca.csr -out ../issuing-ca/cert/issuing-ca.crt -extensions signing_ca_ext
cd ../..