declare
    v_i Number(2) := 1;
begin 
dbms_output.put_line('BUCLE WHILE');
    while v_i <=  10
        loop
            dbms_output.put_line(v_i);
            v_i :=v_i + 1;
        end loop;
    
end;
/
begin
dbms_output.put_line('BUCLE FOR');
    for v_i in 1..10 
        loop
        dbms_output.put_line(v_i);
        end loop;

end;

/
declare 
    v_i Number(10) := 1;
begin
dbms_output.put_line('LOOP');
loop
    dbms_output.put_line(v_i);
    exit when v_i>=10 ;
    v_i := v_i + 1;
end loop;

end;





