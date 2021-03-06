#!/bin/bash

################################################################
#
# A bash script to update the Apache SSL configuration file
# with Mekom Solutions' certificates
#
#################################################################
#
# Requires to provide the Apache conf file location, private, public and chain keys as parameters (in this order)
#
#

if [[ ! -z $1 ]]
  then {

    declare -A key
    key[name]="SSLCertificateKeyFile"
    key[path]="$2"
    key[path_escaped]=$(echo ${key[path]} |sed -e 's/\//\\\//g')

    declare -A cert
    cert[name]="SSLCertificateFile"
    cert[path]="$3"
    cert[path_escaped]=$(echo ${cert[path]} |sed -e 's/\//\\\//g')

    declare -A chain
    chain[name]="SSLCertificateChainFile"
    chain[path]="$4"
    chain[path_escaped]=$(echo ${chain[path]} |sed -e 's/\//\\\//g')

    # Key
    if [[ $(grep  "^${key[name]}" $1) ]]
        then {
            echo "Setting ${key[name]} value..."
            sed -i "s/\(^${key[name]}\).*/\1\\t${key[path_escaped]}/" $1
        } else {
            echo "Setting ${key[name]} value..."
            echo "" >> $1
            echo "# Add ${key[name]} directive - Mekom Solutions" >> $1
            echo -e "${key[name]}\t${key[path]}" >> $1
        }
    fi

    # Cert
    if [[ $(grep  "^${cert[name]}" $1) ]]
        then {
            echo "Setting ${cert[name]} value..."
            sed -i "s/\(^${cert[name]}\).*/\1\\t${cert[path_escaped]}/" $1
        } else {
            echo "Setting ${cert[name]} value..."
            echo "" >> $1
            echo "# Add ${cert[name]} directive - Mekom Solutions" >> $1
            echo -e "${cert[name]}\t${cert[path]}" >> $1
        }
    fi

    # Chain
    if [[ $(grep  "^${chain[name]}" $1) ]]
        then {
            echo "Setting ${chain[name]} value..."
            sed -i "s/\(^${chain[name]}\).*/\1\\t${chain[path_escaped]}/" $1
        } else {
            echo "Setting ${chain[name]} value..."
            echo "" >> $1
            echo "# Add ${chain[name]} directive - Mekom Solutions" >> $1
            echo -e "${chain[name]}\t${chain[path]}" >> $1
        }
    fi

} else {
    echo "[ERROR] File name parameter not provided. Please provide the Apache configuration file path as command line parameter"
    echo "Ex: ./install_SSL_certificates.sh /etc/httpd/conf.d/ssl.conf /etc/ssl/private.pem /etc/ssl/public.pem /etc/ssl/chain.pem" 
    exit 1
}
fi

exit 0