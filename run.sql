
declare 
    rez_ varchar(500);

begin
    DeleteFactBuying(clien_name=>'Bob', 
    cocktai_name=>'Margarita',
    rez_ => rez_);
    DBMS_OUTPUT.PUT_LINE(rez_);
end;
--для перевірки, що цей рядочок видалився можна зробити далі select по таблицы clientcocktail
