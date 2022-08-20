-- zapytanie wybiera punkty znajdujace siê na granicy obrêbów (na granicy gminy/powiatu nie wybiera)

/* podzapytanie zwracajace id punktów nale¿¹cych do dzia³ek z ró¿nych obrêbów (lub 
znajduj¹cych siê na granicy obrêbu) */

with pkt_obr as
(
select idp, count(*) as test 
from
(select dzp.idp
,dz.idobr --, count(*) as liczba_pkt
from EW_DZIALKI_P dzp
join EW_DZIALKI dz on dzp.UIDD = dz.uid
where dz.STATUS IN (0,1)
group by dzp.idp, dz.idobr) 
as punkty
group by idp
having count(*) > 1
)

select pkt.NUMER, pkt.WPX, pkt.WPY
from EW_PUNKTY pkt
where pkt.status IN (0,1)
and pkt.id in 
(select idp from pkt_obr)







--select * from EW_dzialki -- where numer like 'O-2275'


