#!/bin/bash


version=9.2.10
mj=92

rpm -ivh /mnt/vbox_share/postgresql-"$version"-rpms/postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64.rpm
rpm -ivh /mnt/vbox_share/postgresql-"$version"-rpms/postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64.rpm
rpm -ivh /mnt/vbox_share/postgresql-"$version"-rpms/postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64.rpm
rpm -ivh /mnt/vbox_share/postgresql-"$version"-rpms/postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64.rpm
rpm -ivh /mnt/vbox_share/postgresql-"$version"-rpms/postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64.rpm
#rpm -ivh /mnt/vbox_share/pg_bulkload/pg_bulkload-3.1.8-1.pg"$mj".rhel6.x86_64.rpm


