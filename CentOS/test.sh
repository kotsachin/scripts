#!/bin/bash

version=9.2.3
mj=92
mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-2PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-2PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-2PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-2PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-2PGDG.rhel6.x86_64.rpm


