
create or replace view party as 
    select barmancocktail.barman_name,
    barmancocktail.cocktail_name,
    barmanbar.bar_name,
    location_bar.city_name
    from barmancocktail
    inner join barmanbar on barmanbar.barman_name=barmancocktail.barman_name
    inner join location_bar on location_bar.bar_name=barmanbar.bar_name;
    
    
create type bars_type as object(
    barman_name varchar2(50),
    bar_name varchar(50)
);

create type bars_table is table of bars_type;

create or replace package party_pkg is
    type bars_str_type is record (
    barman_name varchar2(50),
    bar_name varchar(50));
    
    type bars_str_table_type is table of bars_str_type;
    
    function BarmanInBar(bar_n varchar2, city_n varchar2)  
        return bars_str_table_type
        PIPELINED;
        
    procedure DeleteFactBuying(clien_name in varchar2, cocktai_name in varchar2, message out varchar2) ;
end party_pkg;

create or replace package body party_pkg is
    function BarmanInBar(bar_n varchar2, city_n varchar2)  
    return bars_str_table_type
    PIPELINED
    is
    begin 
        for cur in ( 
            select barman_name, bar_name from party
            where bar_name = bar_n and city_name = city_n)
        loop
            pipe row(cur);
        end loop;
    end;
--procedure
    procedure DeleteFactBuying(clien_name in varchar2, cocktai_name in varchar2, message out varchar2) 
    is rez_ int;
    my_exc exception;
    begin
        select count(*) into rez_ from clientcocktail 
        where clientcocktail.client_name = clien_name 
        and clientcocktail.cocktail_name = cocktai_name;
        
        if (rez_ > 0) then
        
            delete from clientcocktail
            where clientcocktail.client_name=clien_name 
            and clientcocktail.cocktail_name=cocktai_name;
            message:='Fact of bying is deleted';
        else
            raise my_exc;
        end if;
    exception
       WHEN my_exc THEN
          message:='ERROR there is no cocktail_name or client_name'; 
    end; 


end party_pkg;


