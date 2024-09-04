declare
    v_num_dia Number(2) := &dia_semana;

begin
    case v_num_dia
        when 1 then dbms_output.put_line('Lunes');
        when 2 then dbms_output.put_line('Martes');
        when 3 then dbms_output.put_line('Miercoles');
        when 4 then dbms_output.put_line('Jueves');
        when 5 then dbms_output.put_line('Viernes');
        when 6 then dbms_output.put_line('Sábado');
        when 7 then dbms_output.put_line('Domingo');
        else dbms_output.put_line('Debes introducir un número entre 1 y 7');
    end case;
end;
