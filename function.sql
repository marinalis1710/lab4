--перероблене view

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

create or replace function BarmanInBar(bar_n varchar2, city_n varchar2)  
return bars_table
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
