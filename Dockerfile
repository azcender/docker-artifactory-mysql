FROM mysql:latest

MAINTAINER Bryan Belanger bbelanger@azcender.com

RUN apt-get -y update; \
#    apt-get -y install curl
    curl -O http://apt.puppetlabs.com/puppetlabs-release-pc1-jessie.deb; \
    dpkg -i puppetlabs-release-pc1-jessie.deb; \
    apt-get -y install puppet

ENV PATH /opt/puppetlabs/bin:$PATH

COPY site.pp /etc/puppetlabs/code/environments/production/manifests/site.pp

COPY createdb.sql /docker-entrypoint-initdb.d/createdb.sql

RUN puppet module install puppetlabs-stdlib;\
    puppet apply /etc/puppetlabs/code/environments/production/manifests/site.pp
