create or replace trigger Price_bfr_upd
before update of price on cocktail
for each row
declare 
my_exc EXCEPTION;
buy_cocktail varchar2(256);
begin 
    select cocktail_name into buy_cocktail from clientcocktail
     where clientcocktail.cocktail_name = :old.cocktail_name AND ROWNUM = 1;
     :new.price := :old.price;
        dbms_output.put_line('this cocktail is sold, so can not chage cost');
    EXCEPTION
     WHEN my_exc THEN
      :new.price := :new.price;
      dbms_output.put_line('you can change');
END;
