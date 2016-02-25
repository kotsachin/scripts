
#psql -d postgres -f /home/amul/pg_install/install/pg8.4D/share/postgresql/contrib/dblink_plus.sql

#psql -d postgres -c "DROP USER MAPPING FOR test_user SERVER test_server;"
#psql -d postgres -c "DROP SERVER test_server CASCADE;"
#psql -d postgres -c "DROP FOREIGN DATA WRAPPER oracle;"

#psql -d postgres -c "CREATE USER test_user with PASSWORD 'test123';"
psql -d test -c "CREATE FOREIGN DATA WRAPPER oracle VALIDATOR dblink.oracle;"

psql -d test -c "CREATE SERVER ipds_db_link FOREIGN DATA WRAPPER oracle OPTIONS (dbname 'ORCL');"
psql -d test -c "CREATE USER MAPPING FOR amul SERVER ipds_db_link OPTIONS (user 'ipds', password 'ipds');"
psql -d test -c "GRANT USAGE ON SCHEMA dblink TO amul;"
psql -d test -c "GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA dblink TO amul;"
psql -d test -c "GRANT DELETE ON ALL TABLES IN SCHEMA dblink TO amul;"
psql -d test -c "GRANT USAGE ON FOREIGN SERVER ipds_db_link TO amul;"


