   SET SERVEROUTPUT ON;

-- Version avec boucle FOR
declare
   v_result number;
begin
   dbms_output.put_line('Table de multiplication avec boucle FOR:');
   for i in 1..10 loop
      for j in 1..10 loop
         v_result := i * j;
         dbms_output.put_line(i
                              || ' x '
                              || j
                              || ' = '
                              || v_result);
      end loop;
      dbms_output.put_line('-------------------');
   end loop;
end;
/

-- Version avec boucle WHILE
declare
   i        number := 1;
   j        number;
   v_result number;
begin
   dbms_output.put_line('Table de multiplication avec boucle WHILE:');
   while i <= 10 loop
      j := 1;
      while j <= 10 loop
         v_result := i * j;
         dbms_output.put_line(i
                              || ' x '
                              || j
                              || ' = '
                              || v_result);
         j := j + 1;
      end loop;
      dbms_output.put_line('-------------------');
      i := i + 1;
   end loop;
end;
/

-- Version avec boucle de base (LOOP)
declare
   i        number := 1;
   j        number;
   v_result number;
begin
   dbms_output.put_line('Table de multiplication avec boucle LOOP:');
   loop
      j := 1;
      loop
         v_result := i * j;
         dbms_output.put_line(i
                              || ' x '
                              || j
                              || ' = '
                              || v_result);
         j := j + 1;
         exit when j > 10;
      end loop;
      dbms_output.put_line('-------------------');
      i := i + 1;
      exit when i > 10;
   end loop;
end;
/