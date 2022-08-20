/*polecenie wybiera operaty powiazane z obrebem*/
select 
--pkt.*, 
--distinct(op.numer) as nroperatu
distinct(op.numer || ' rodz:' || op.typ) as operat_rodzajzasobu --opcja wypisuje dodatkowo operacje na operatach
from EW_PUNKTY pkt
left join EW_OPERATY op on pkt.operat = op.uid
where pkt.status in (0,1)
and pkt.id in
(select dzp.idp from EW_DZIALKI_P dzp
join EW_DZIALKI dz on dzp.UIDD = dz.uid
where dz.STATUS in (0,1)
and dz.idobr in (8,11,13,17)); --nalezy podac numery obrebow!!