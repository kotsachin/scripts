CREATE OR REPLACE FUNCTION gisttestfunc() RETURNS int AS
$$
declare
   i int4;
   t text;
   cur CURSOR FOR SELECT 'foo' FROM gisttest WHERE id >= 0;
begin
   set enable_seqscan=off; 
   set enable_bitmapscan=off;

   i = 0;
   OPEN cur;
   FETCH cur INTO t;

   perform pg_sleep(10);

   LOOP
     EXIT WHEN NOT FOUND; 
        i = i + 1;
     FETCH cur INTO t;
   END LOOP;
   CLOSE cur;
   RETURN i;
END;
$$ LANGUAGE plpgsql;


