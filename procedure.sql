--ввод боб и маргарита
--затем удаление этой инфы из таблицы clientcocktail
--exception нет имени или коктейля
SET SERVEROUTPUT ON
begin
DBMS_OUTPUT.enable;
end;

create or replace procedure DeleteFactBuying(
client_name in clientcocktail.client_name%TYPE, 
cocktail_name in clientcocktail.cocktail_name%TYPE, 
rez_ out varchar2)
is
begin
    if (client_name=clientcocktail.client_name 
        and cocktail_name=clientcocktail.cocktail_name) then

        begin
            delete from clientcocktail
            where client_name=clientcocktail.client_name and cocktail_name=clientcocktail.cocktail_name;
            --model NOT IN (SELECT model FROM PC
        end;
    else  
        RAISE exp; 
    end if;
select * into rez_ from clientcocktail;

exception
   WHEN no_data_found THEN
      dbms_output.put_line('ERROR there is no cocktail_name or client_name'); 
end; 

declare 
rez_ varchar2;

begin
DeleteFactBuying(client_name=>'Bob', 
cocktail_name=>'Margarita',
rez_=>rez_);
DBMS_OUTPUT.PUT_LINE(rez_)
end;
