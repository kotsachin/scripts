#!/bin/bash

version=9.4.0
mj=94
mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql94-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql94-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql94-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql94-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql94-server-"$version"-1PGDG.rhel6.x86_64.rpm


version=9.3.6
mj=93
mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm

version=9.3.5

mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm

version=9.3.3

mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm

version=9.2.10
mj=92
mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm

version=9.2.9

mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm

version=9.2.3

mkdir -p /mnt/vbox_share/postgresql-$version-rpms

wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
wget --no-proxy -P /mnt/vbox_share/postgresql-$version-rpms/ http://172.20.149.1/archive/postgresql/binary/v"$version"/linux/rpms/redhat/rhel-6-x86_64/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm

