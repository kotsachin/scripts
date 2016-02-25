#!/bin/bash - 
#===============================================================================
#
#          FILE: wal_replay_bug.sh
# 
#         USAGE: ./wal_replay_bug.sh 
# 
#   DESCRIPTION:  
# 
#        AUTHOR: Sachin Kotwal (kotsachin@gmail.com) 
#       CREATED: 04/10/2014 14:10
#===============================================================================

#NOTE:Please install btree_gist from contrib before executing this script

nr=1
while [ $nr -gt 0 ]
do

psql -d postgres -p 5432 -c "CREATE EXTENSION btree_gist;"
psql -d postgres -p 5432 -c "CREATE TABLE gisttest (id int4);"
psql -d postgres -p 5432 -c "INSERT INTO gisttest SELECT g from generate_series(1, 100000) g;"
psql -d postgres -p 5432 -c "CREATE INDEX gisttest_idx ON gisttest USING gist (id);"
psql -d postgres -p 5432 -c "CHECKPOINT;"

psql -d postgres -p 5432 -f /tmp/gisttestfunc.sql
sleep 5

psql -d postgres -p 5433 -c "SELECT gisttestfunc();" &
func_pid=$!
psql -d postgres -p 5432 -c "INSERT INTO gisttest SELECT 50000 from generate_series(1, 100000) g;"

wait $func_pid

psql -d postgres -p 5432 -c "DROP TABLE gisttest ;"
psql -d postgres -p 5432 -c "DROP FUNCTION gisttestfunc();" 
psql -d postgres -p 5432 -c "DROP EXTENSION btree_gist;"

nr=$((nr-1))

done
