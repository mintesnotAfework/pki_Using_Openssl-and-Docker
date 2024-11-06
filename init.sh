#!/bin/bash


sudo docker build -t pki:v1 .
sudo docker run --name pkidemo -it pki:v1 
sudo docker rm -f pkidemo
sudo docker image rm pki:v1