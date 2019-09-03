#!/bin/sh

#
# Create SSL certificates
#

CERT_PATH=/etc/httpd/conf/ssl.crt
KEY_PATH=/etc/httpd/conf/ssl.key
CSR_PATH=/etc/httpd/conf/ssl.csr
SERVER_KEY=$KEY_PATH/server.key
CA_KEY=$KEY_PATH/ca-bundle.key
CA_CERT=$CERT_PATH/ca-bundle.crt

if [ -z "$1" ]; then
echo "Usage: $0 [host.domain]"
exit 10
fi

openssl req -new -sha256 -key $SERVER_KEY -subj "/C=UA/ST=Dnipropetrovsk Oblast/L=Dnipro/O=Gaura/CN=$1/emailAddress=gaura.panasenko@gmail.com" -out "$CSR_PATH/$1.csr"
openssl x509 -req -in "$CSR_PATH/$1.csr" -CA "$CA_CERT" -CAkey "$CA_KEY" -CAcreateserial -out "$CERT_PATH/$1.crt" -days 500 -sha256
