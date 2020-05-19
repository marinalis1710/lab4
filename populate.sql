insert into City(city_name)
values ("Kyiv");
insert into City(city_name)
values ("Lviv");
insert into City(city_name)
values ("Odessa");

insert into Barman(barman_name)
values ("Barman Oleg");
insert into Barman(barman_name)
values ("Barman Vasya");
insert into Barman(barman_name)
values ("Barman Kolya");

insert into Price(price)
values (5);
insert into Price(price)
values (10);
insert into Price(price)
values (40);

insert into Cocktail(cocktail_name)
values ("Margarita");
insert into Cocktail(cocktail_name)
values ("Ocean beach");
insert into Cocktail(cocktail_name)
values ("Snow in winter");

insert into Client(client_name)
values ("Bob");
insert into Client(client_name)
values ("Kevin");
insert into Client(client_name)
values ("Stuart");

insert into Bar(bar_name)
values ("Porter Pub");
insert into Bar(bar_name)
values ("Happy Cake");
insert into Bar(bar_name)
values ("Milk Bar");

insert into barmanbar(barman_name, bar_name)
values ("Barman Oleg","Milk Bar");
insert into barmanbar(barman_name, bar_name)
values ("Barman Kolya","Happy Cake");
insert into barmanbar(barman_name, bar_name)
values ("Barman Vasya","Porter Pub");

insert into barmancocktail(barman_name,cocktail_name)
values ("Barman Vasya", "Margarita");
insert into barmancocktail(barman_name,cocktail_name)
values ("Barman Oleg", "Ocean Beach");
insert into barmancocktail(barman_name,cocktail_name)
values ("Barman Kolya", "Snow in winter");

insert into Location_Of_bar(city_name, bar_name)
values ("Kyiv", "Happy Cake");
insert into Location_Of_bar(city_name, bar_name)
values ("Odessa", "Milk Bar");
insert into Location_Of_bar(city_name, bar_name)
values ("Lviv", "Porter Pub");

insert into clientcocktail(client_name, cocktail_name)
values ("Bob", "Margarita");
insert into clientcocktail(client_name, cocktail_name)
values ("Kevin", "Ocean Beach");
insert into clientcocktail(client_name, cocktail_name)
values ("Stuart", "Snow in winter");

insert into cocktailprice(price, cocktail_name)
values (40, "Snow in winter");
insert into cocktailprice(price, cocktail_name)
values (10, "Ocean Beach");
insert into cocktailprice(price, cocktail_name)
values (5, "Margarita');
