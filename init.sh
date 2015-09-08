#!/usr/bin/env bash

OTRS_VERSION="4.0.11" # OTRS
MAJOR_VER="`echo $OTRS_VERSION | awk -F. '{print $1}'`"
ITSM_VERSION="4.0.11" #ITSM

echo "Install packages..."
sudo puppet apply /vagrant/puppet/manifests/site.pp --modulepath=/etc/puppet/modules/

echo "apt-get update..."
sudo apt-get update > /dev/null 2>&1
echo "apt-get install..."
sudo apt-get install -y build-essential perl libapache2-mod-perl2 \
libdigest-perl libdigest-md5-file-perl libarchive-zip-perl \
libcrypt-eksblowfish-perl libdbi-perl libjson-xs-perl \
libnet-dns-perl libtemplate-perl libtext-csv-xs-perl libxml-parser-perl \
libyaml-libyaml-perl libcrypt-ssleay-perl libgd-gd2-perl libgd-text-perl \
libgd-graph-perl libmail-imapclient-perl libpdf-api2-perl libdbd-mysql-perl  > /dev/null 2>&1

echo "Add otrs user..."
sudo useradd -d /opt/otrs/ -c 'OTRS user' otrs
sudo usermod -G www-data otrs

cd /opt/otrs/
cp Kernel/Config.pm.dist Kernel/Config.pm
cp Kernel/Config/GenericAgent.pm.dist Kernel/Config/GenericAgent.pm
echo "Check perl dependencies..."
sudo perl /opt/otrs/bin/otrs.CheckModules.pl
sudo perl -cw /opt/otrs/bin/cgi-bin/index.pl
sudo perl -cw /opt/otrs/bin/cgi-bin/customer.pl
sudo perl -cw /opt/otrs/bin/otrs.PostMaster.pl
sudo bin/otrs.SetPermissions.pl --web-group=www-data

echo "Setting webserver and load..."
sudo cp /opt/otrs/scripts/apache2-httpd.include.conf /etc/apache2/conf.d/otrs.conf
sudo service apache2 restart

echo "Setting cron job for OTRS..."
cd /opt/otrs/var/cron
sudo su
for foo in *.dist; do cp $foo `basename $foo .dist`; done
echo "Starting cron job for OTRS..."
sudo -u otrs /opt/otrs/bin/Cron.sh start
