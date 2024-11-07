#!/bin/bash



echo -n "Enter the Name: "
read file_name
mkdir ./simple-ca/$file_name
cd ./simple-ca/$file_name

mkdir private cert etc
cp ../email-server/etc/email-server.conf etc/$file_name.conf


openssl req -new -config etc/$file_name.conf -out ../issuing-ca/csr/$file_name.csr -keyout private/$file_name.key

cd ../issuing-ca/
openssl ca -config etc/issuing-ca.conf -in csr/$file_name.csr -out ../email-server/cert/$file_name.crt -extensions email_ext
cd ../..

