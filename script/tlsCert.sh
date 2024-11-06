#!/bin/bash

echo -n "Enter the Name: "
read file_name
mkdir ./simple-ca/$file_name
cd ./simple-ca/$file_name

mkdir private cert etc
cp ../web-server/etc/web-server.conf etc/web-server.conf
cd ..openssl req -new -config etc/web-server.conf -out ../issuing-ca/csr/$file_name.csr -keyout private/$file_name.key


cd ../issuing-ca/
openssl ca -config etc/issuing-ca.conf -in csr/$file_name.csr -out ../$file_name/cert/$file_name.crt -extensions server_ext
cd ../..