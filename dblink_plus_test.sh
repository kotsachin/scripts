
psql -d postgres -f /usr/pgsql-9.3/share/contrib/dblink_plus.sql 

#psql -d postgres -c "DROP USER MAPPING FOR test_user SERVER test_server;"
#psql -d postgres -c "DROP SERVER test_server CASCADE;"
#psql -d postgres -c "DROP FOREIGN DATA WRAPPER oracle;"

#psql -d postgres -c "CREATE USER test_user with PASSWORD 'test123';"
psql -d postgres -c "CREATE FOREIGN DATA WRAPPER oracle VALIDATOR dblink.oracle;"

psql -d postgres -c "CREATE SERVER ipds_db_link FOREIGN DATA WRAPPER oracle OPTIONS (dbname 'ORCL');"
psql -d postgres -c "CREATE USER MAPPING FOR test_user SERVER ipds_db_link OPTIONS (user 'ec_ipds', password 'ec_ipds');"
psql -d postgres -c "GRANT USAGE ON SCHEMA dblink TO test_user;"
psql -d postgres -c "GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA dblink TO test_user;"
psql -d postgres -c "GRANT DELETE ON ALL TABLES IN SCHEMA dblink TO test_user;"
psql -d postgres -c "GRANT USAGE ON FOREIGN SERVER ipds_db_link TO test_user;"


