--код для запуска процедуры
declare 
    message varchar(500);
begin
    DeleteFactBuying(clien_name=>'Bob', 
    cocktai_name=>'Margarita',
    message => message);
    DBMS_OUTPUT.PUT_LINE(message);
end;

--код для запуска функции
DECLARE

BEGIN

    DBMS_OUTPUT.put_line(DeleteFactBuyingF('Bob', 'Margarita'));

END;
