--для процедуры

declare 
    message varchar(500);
begin
    DeleteFactOfBuying.DeleteFactBuying(clien_name=>'Bob', 
    cocktai_name=>'Margarita',
    message => message);
    DBMS_OUTPUT.PUT_LINE(message);
end;

--для функции

DECLARE

BEGIN

    DBMS_OUTPUT.put_line(DeleteFactOfBuying.DeleteFactBuyingF('Bob', 'Margarita'));

END;
