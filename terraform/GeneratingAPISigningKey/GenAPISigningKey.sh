#! /bin/bash

# Not tested. Not sure if this will work as expected but achieves goal of consolidating all the commands in one file.

mkdir ~/.oci \
openssl genrsa -out ~/.oci/oci_api_key.pem 2048 \
chmod go-rwx ~/.oci/oci_api_key.pem \
pempenssl rsa -pubout -in ~/.oci/oci_api_key.pem -out ~/.oci/oci_api_key_public.pem \
cd .oci \
openssl rsa -pubout -outform DER -in ~/.oci/oci_api_key.pem | openssl md5 -c \
clip <  ~/.oci/oci_api_key_public.pem \ 
echo "Paste key copied above into OCI console"
