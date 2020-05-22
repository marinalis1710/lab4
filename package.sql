
create or replace package DeleteFactOfBuying is
function DeleteFactBuyingF(clien_name in varchar2, cocktai_name in varchar2) return message;
procedure DeleteFactBuying(clien_name in varchar2, cocktai_name in varchar2, rez_ out int);
end DeleteFactOfBuying;
