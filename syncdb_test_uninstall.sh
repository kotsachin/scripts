#!/bin/bash

psql -U oracle -f /home/oracle/syncdb-1.0.0/sql/uninstall_observer_postgresql.sql -d replica_db
dropdb replica_db
#echo exit | sqlplus system/root123@192.168.97.103:1521/test @/home/oracle/syncdb-1.0.1/sql/uninstall_observer_oracle.sql

echo exit | sqlplus oracle/oracle123 @/home/oracle/syncdb-1.0.0/sql/uninstall_mlog_oracle.sql

