#!/bin/bash
#yum install java-1.8.0-openjdk-devel

createdb master_db
createdb replica_db
psql -U oracle -f /newdisk/synctest/syncdb/sql/mlog_postgresql.sql -d master_db
psql -U oracle -f /newdisk/synctest/syncdb/sql/observer_postgresql.sql -d replica_db

pgbench -i -s 5 master_db -U oracle
psql -c 'CREATE TABLE rep_accounts (aid int, bid int, abalance int, PRIMARY KEY (aid))' -d replica_db -U oracle

time syncdb create --master postgres1 --schema public --table pgbench_accounts
time syncdb attach --query "\" SELECT aid, bid, abalance FROM \"public\".\"pgbench_accounts\" \"" --master postgres1 --server postgres2 --schema public --table rep_accounts

time syncdb status --master postgres1 --server postgres2
time syncdb refresh --server postgres2 --schema public --table rep_accounts --mode auto
time syncdb status --master postgres1 --server postgres2
time syncdb refresh --server postgres2 --schema public --table rep_accounts --mode auto
time syncdb status --master postgres1 --server postgres2

time syncdb detach --server postgres2 --schema public --table rep_accounts
time syncdb drop --master postgres1 --schema public --table pgbench_accounts

