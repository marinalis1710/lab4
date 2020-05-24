--перероблене view

create or replace view party as 
    select barmancocktail.barman_name,
    barmancocktail.cocktail_name,
    barmanbar.bar_name,
    location_bar.city_name
    from barmancocktail
    inner join barmanbar on barmanbar.barman_name=barmancocktail.barman_name
    inner join location_bar on location_bar.bar_name=barmanbar.bar_name;
    
create type orders_t as object(
client_name varchar2(50),
cocktail_name varchar(50)
);

create type order_t is table of orders_t;

create or replace function DeleteFactBuyingL(
    clien_name in varchar2, 
    cocktai_name in varchar2) 
return order_t
is
    rez_ int;
    message varchar2(200);
    my_exc exception;
    rezult_table order_t:=order_t();
begin
    select count(*) into rez_ from clientcocktail 
    where clientcocktail.client_name = clien_name 
    and clientcocktail.cocktail_name = cocktai_name;
    
    if (rez_ > 0) then
    
        delete from clientcocktail where clientcocktail.client_name=clien_name and clientcocktail.cocktail_name=cocktai_name;
        dbms_output.put_line('Fact of bying is deleted');
        for c_cursor in (select client_name, cocktail_name from clientcocktail )
            loop
                rezult_table.extend;
                rezult_table(rezult_table.last) := orders_t(c_cursor.client_name, c_cursor.cocktail_name );
            end loop;
        return rezult_table;
    else
        raise my_exc;      
    end if;
exception
   WHEN my_exc THEN
        
       dbms_output.put_line( 'We did not find client or cocktail');
     for c_cursor in (select client_name, cocktail_name from clientcocktail )
            loop
                rezult_table.extend;
                rezult_table(rezult_table.last) := orders_t(c_cursor.client_name, c_cursor.cocktail_name );
            end loop;
        return rezult_table;
end;
