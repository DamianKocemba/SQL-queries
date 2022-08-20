/* selekcja operatow przypisanych do budynkow*/
select 
distinct(op.numer || ' rodz: ' || op.typ) as operat_rodzajzasobu
from EW_OBIEKTY ob
left join EW_OPERATY op on ob.operat = op.uid
where status in (0,1)
and idkatalog = 10