create extension dblink_plus ;
CREATE FOREIGN DATA WRAPPER postgres VALIDATOR dblink.postgres;
CREATE SERVER my_server FOREIGN DATA WRAPPER postgres OPTIONS (host 'localhost', dbname 'postgres' , port '5432');
CREATE USER MAPPING FOR oracle SERVER my_server OPTIONS (user 'postgres');
--SELECT * FROM dblink.query('my_server', 'select * from foo') as t (a int, b text, c text[]);


--SELECT dblink_connect_1('dtest1', 'host=localhost dbname=postgres port=5432');
SELECT dblink.connect ( 'my_server');
SELECT * FROM dblink.connections;
SELECT * FROM dblink_send_query('my_server', 'select * from foo where b = ''b''') AS t1;
SELECT dblink_is_busy('my_server');
SELECT dblink_cancel_query('my_server');
SELECT * FROM dblink.connections;
SELECT * FROM dblink_get_result('my_server') AS t1(a int, b text, c text[]);
SELECT dblink.disconnect ('my_server');
SELECT * FROM dblink.connections;
--SELECT dblink_disconnect_1('dtest1');

