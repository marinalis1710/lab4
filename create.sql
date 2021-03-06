CREATE TABLE bar (
    bar_name VARCHAR2(50) NOT NULL
);

ALTER TABLE bar ADD CONSTRAINT bar_pk PRIMARY KEY ( bar_name );

CREATE TABLE barman (
    barman_name VARCHAR2(50) NOT NULL
);

ALTER TABLE barman ADD CONSTRAINT barman_pk PRIMARY KEY ( barman_name );

CREATE TABLE barmanbar (
    barman_name  VARCHAR2(50) NOT NULL,
    bar_name        VARCHAR2(50) NOT NULL
);

ALTER TABLE barmanbar ADD CONSTRAINT barmanbar_pk PRIMARY KEY ( barman_name,
                                                                bar_name );

CREATE TABLE barmancocktail (
    barman_name      VARCHAR2(50) NOT NULL,
    cocktail_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE barmancocktail ADD CONSTRAINT barmancocktail_pk PRIMARY KEY ( barman_name,
                                                                          cocktail_name );

CREATE TABLE city (
    city_name VARCHAR2(50) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( city_name );

CREATE TABLE client (
    client_name VARCHAR2(50) NOT NULL
);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( client_name );

CREATE TABLE clientcocktail (
    client_name      VARCHAR2(50) NOT NULL,
    cocktail_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE clientcocktail ADD CONSTRAINT clientcocktail_pk PRIMARY KEY ( client_name,
                                                                          cocktail_name );

CREATE TABLE cocktail (
    cocktail_name  VARCHAR2(50) NOT NULL,
    price          INTEGER
);

ALTER TABLE cocktail ADD CONSTRAINT cocktail_pk PRIMARY KEY ( cocktail_name );

CREATE TABLE location_bar (
    bar_name    VARCHAR2(50) NOT NULL,
    city_name  VARCHAR2(50) NOT NULL
);

ALTER TABLE location_bar ADD CONSTRAINT location_bar_pk PRIMARY KEY ( bar_name,
                                                                      city_name );

ALTER TABLE barmanbar
    ADD CONSTRAINT barmanbar_bar_fk FOREIGN KEY ( bar_name )
        REFERENCES bar ( bar_name );

ALTER TABLE barmanbar
    ADD CONSTRAINT barmanbar_barman_fk FOREIGN KEY ( barman_name )
        REFERENCES barman ( barman_name );

ALTER TABLE barmancocktail
    ADD CONSTRAINT barmancocktail_barman_fk FOREIGN KEY ( barman_name )
        REFERENCES barman ( barman_name );

ALTER TABLE barmancocktail
    ADD CONSTRAINT barmancocktail_cocktail_fk FOREIGN KEY ( cocktail_name )
        REFERENCES cocktail ( cocktail_name );

ALTER TABLE clientcocktail
    ADD CONSTRAINT clientcocktail_client_fk FOREIGN KEY ( client_name )
        REFERENCES client ( client_name );

ALTER TABLE clientcocktail
    ADD CONSTRAINT clientcocktail_cocktail_fk FOREIGN KEY ( cocktail_name )
        REFERENCES cocktail ( cocktail_name );

ALTER TABLE location_bar
    ADD CONSTRAINT location_bar_bar_fk FOREIGN KEY ( bar_name )
        REFERENCES bar ( bar_name );

ALTER TABLE location_bar
    ADD CONSTRAINT location_bar_city_fk FOREIGN KEY ( city_name )
        REFERENCES city ( city_name );

