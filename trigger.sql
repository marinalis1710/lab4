create or replace trigger Price_bfr_upd
before update on cocktail
FOR EACH ROW
declare
    coc varchar2(256);
begin 
    select cocktail_name into coc from clientcocktail
     where clientcocktail.cocktail_name = :old.cocktail_name AND ROWNUM = 1;
    :new.price := :old.price;
    dbms_output.put_line('this game is sold,so can not chage cost');
    EXCEPTION
     WHEN OTHERS THEN
      :new.price := :new.price;
      dbms_output.put_line('you can change');
end;
