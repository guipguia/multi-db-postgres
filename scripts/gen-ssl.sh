#/bin/bash


# Check if 'certs' folder exists, if not, create it
if [ ! -d "./certs" ]; then
    mkdir -p "./certs"
fi

# Define variables
CERT_DIR="./certs"
CERT_NAME="postgresql"
CERT_KEY="${CERT_DIR}/${CERT_NAME}.key"
CERT_CSR="${CERT_DIR}/${CERT_NAME}.csr"
CERT_CRT="${CERT_DIR}/${CERT_NAME}.crt"

# Certificate subject information
COUNTRY="US"
STATE="California"
CITY="San Francisco"
ORGANIZATION="My Company"
ORG_UNIT="IT Department"
COMMON_NAME="localhost"

# Generate private key
openssl genrsa -out "${CERT_KEY}" 4096

# Generate certificate signing request (CSR)
openssl req -new -key "${CERT_KEY}" -out "${CERT_CSR}" \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION}/OU=${ORG_UNIT}/CN=${COMMON_NAME}"

# Generate self-signed certificate
openssl x509 -req -days 365 -in "${CERT_CSR}" -signkey "${CERT_KEY}" -out "${CERT_CRT}"

# Secure the private key
chmod 600 "${CERT_KEY}"

# Move the certificate files to the appropriate location
mv "${CERT_KEY}" "${CERT_DIR}"
mv "${CERT_CSR}" "${CERT_DIR}"
mv "${CERT_CRT}" "${CERT_DIR}"