#!/bin/bash
#yum install java-1.8.0-openjdk-devel

createdb master_db
#createdb replica_db
psql -U oracle -f /home/oracle/syncdb-1.0.1/sql/mlog_postgresql.sql -d master_db
#psql -U oracle -f /home/oracle/syncdb-1.0.1/sql/observer_postgresql.sql -d replica_db

#echo exit | sqlplus oracle/oracle123 @/home/oracle/syncdb-1.0.0/sql/mlog_oracle.sql
echo exit | sqlplus oracle/oracle123 @/home/oracle/syncdb-1.0.0/sql/observer_oracle.sql
#psql -U oracle -f /home/oracle/syncdb-1.0.0/sql/observer_postgresql.sql -d replica_db

pgbench -i -s 1 master_db -U oracle
#echo exit | sqlplus oracle/oracle123 @/home/oracle/create_master_table.sql
echo exit | sqlplus oracle/oracle123 @/home/oracle/create_replica_table.sql
#psql -c 'CREATE TABLE rep_accounts (aid int, bid int, abalance int, PRIMARY KEY (aid))' -d replica_db -U oracle

time syncdb create --master postgres1 --schema public --table pgbench_accounts
time syncdb attach --query "\" SELECT aid, bid, abalance FROM \"public\".\"pgbench_accounts\" \"" --master postgres1 --server oracle1 --schema observer --table rep_accounts

#time syncdb status --master oracle1 --server postgres2
time syncdb refresh --server oracle1 --schema observer --table rep_accounts --mode auto
time syncdb status --master postgres1 --server oracle
#time syncdb refresh --server postgres2 --schema public --table rep_accounts --mode auto
#time syncdb status --master oracle1 --server postgers2

time syncdb detach --server oracle1 --schema observer --table rep_accounts
time syncdb drop --master postgres1 --schema public --table pgbench_accounts

