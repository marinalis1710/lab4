create or replace package DeleteFactOfBuying is
    function DeleteFactBuyingF(clien_name in varchar2, cocktai_name in varchar2) return varchar2;
    procedure DeleteFactBuying(clien_name in varchar2, cocktai_name in varchar2, message out varchar2);
end DeleteFactOfBuying;


