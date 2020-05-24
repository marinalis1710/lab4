--run for function
select * from table(party_pkg.BarmanInBar('Happy Cake', 'Kyiv'));
--run for procedure
declare 
    message varchar(500);
begin
    party_pkg.DeleteFactBuying
    (clien_name=>'Bob', 
    cocktai_name=>'Margarita',
    message => message);
    DBMS_OUTPUT.PUT_LINE(message);
end;
