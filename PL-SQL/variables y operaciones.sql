--Declaración de variables
declare
    v_entradaDato1 Number(3):= &entradaPrimerDigito;
    v_entradaDato2 Number(3):=&entradaSegundoDigito;
    
--Bloque anónimo    
begin
dbms_output.put_line('El valor introducido para el primer digito es ' || v_entradaDato1);

dbms_output.put_line('El valor introducido para el segundo digito es ' || v_entradaDato2);

dbms_output.put_line('OPERACIONES:');

dbms_output.put_line(v_entradaDato1 ||'+'||v_entradaDato2 ||'='||(v_entradaDato1+v_entradadato2));
dbms_output.put_line(v_entradaDato1 ||'-'||v_entradaDato2 ||'='||(v_entradaDato1-v_entradadato2));
dbms_output.put_line(v_entradaDato1 ||'/'||v_entradaDato2 ||'='||(v_entradaDato1/v_entradadato2));
dbms_output.put_line(v_entradaDato1 ||'*'||v_entradaDato2 ||'='||(v_entradaDato1*v_entradadato2));

end;


