create or replace function DeleteFactBuyingF(
    clien_name in varchar2, 
    cocktai_name in varchar2) 
return int
is
    rez_ int;
    my_exc exception;
begin
    select count(*) into rez_ from clientcocktail 
    where clientcocktail.client_name = clien_name 
    and clientcocktail.cocktail_name = cocktai_name;
    
    if (rez_ > 0) then
    
        delete from clientcocktail
        where clientcocktail.client_name=clien_name 
        and clientcocktail.cocktail_name=cocktai_name;
        return rez_;
    else
        --dbms_output.put_line('ERROR');
        raise my_exc;
    end if;
exception
   WHEN my_exc THEN
      dbms_output.put_line('ERROR there is no cocktail_name or client_name'); 
end; 