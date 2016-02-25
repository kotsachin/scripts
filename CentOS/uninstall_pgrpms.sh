#!/bin/bash


version=9.4.0
mj=94
rpm -e pg_bulkload-3.1.8-1.pg"$mj".rhel6.x86_64
rpm -e postgresql"$mj"-contrib-"$version"-1PGDG.rhel6.x86_64
rpm -e postgresql"$mj"-server-"$version"-1PGDG.rhel6.x86_64
rpm -e postgresql"$mj"-devel-"$version"-1PGDG.rhel6.x86_64
rpm -e postgresql"$mj"-"$version"-1PGDG.rhel6.x86_64
rpm -e postgresql"$mj"-libs-"$version"-1PGDG.rhel6.x86_64


