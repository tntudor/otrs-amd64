#!/usr/bin/env bash

OTRS_VERSION="4.0.11" # OTRS
MAJOR_VER="`echo $OTRS_VERSION | awk -F. '{print $1}'`"
ITSM_VERSION="4.0.11" #ITSM

#Download OTRS and ITSM
echo "Download otrs..."
wget –q "http://ftp.otrs.org/pub/otrs/otrs-$OTRS_VERSION.tar.bz2" > /dev/null 2>&1
echo "extract otrs..."
tar xjf otrs-$OTRS_VERSION.tar.bz2 > /dev/null 2>&1
sudo mv otrs-$OTRS_VERSION /opt/otrs

echo "Download ITSM module bundle..."
wget -q "http://ftp.otrs.org/pub/otrs/itsm/bundle$MAJOR_VER/ITSM-$ITSM_VERSION.opm" > /dev/null 2>&1

