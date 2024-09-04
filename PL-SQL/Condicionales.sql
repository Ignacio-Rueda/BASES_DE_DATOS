declare
    v_numA Number(2) := 22;
    v_numB Number(2) := 4;
    v_numC Number(2) := 13;
    v_numMayor Number(2);


begin
    IF v_numA >= v_numB AND v_numA >= v_numC THEN
        v_numMayor := v_numA;
     ELSIF v_numB >= v_numC THEN
        v_numMayor := v_numB;
    ELSE
        v_numMayor := v_numC;
    END IF;

DBMS_OUTPUT.PUT_LINE('El número mayor es: '|| v_numMayor);
end;