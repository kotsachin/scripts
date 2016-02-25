#!/bin/bash


CFLAGS="-g -O0" ./configure --with-libxml --enable-cassert --enable-debug --enable-profiling --prefix=/home/oracle/pg_install/install/9.4.4/ --with-python

make

make install
