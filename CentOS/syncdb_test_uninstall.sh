#!/bin/bash

psql -U oracle -f /newdisk/synctest/syncdb/sql/uninstall_observer_postgresql.sql -d replica_db
psql -U oracle -f /newdisk/synctest/syncdb/sql/uninstall_mlog_postgresql.sql -d master_db
dropdb master_db
dropdb replica_db
