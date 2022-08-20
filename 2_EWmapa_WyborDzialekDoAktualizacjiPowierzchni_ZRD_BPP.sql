/* Zapytanie zwraca liste dzialek wymagajacych aktualizacji powierzchni, których wszystkie
punkty graniczne spelniaja okreslone wartosci atrybutow ZRD i BPP*/
select
PUNKTY_KONTROLA.DZIALKA,
sum(PUNKTY_KONTROLA.CZY_PKT_OK) as s, --zliczenie punktow nalezacych do dzialki spelniajacych ZRD i BPP
count(PUNKTY_KONTROLA.CZY_PKT_OK) as c --zliczenie wszystkich punktow nalezacych do dzialki
from
(
select
dz.CTRL as dzialka, 1 as CZY_PKT_OK, --dodatkowy atrybut z wartoscia 1 dla pkt spelniajacych ZRD i BPP
dzp.*, p.*
from EW_DZIALKI dz --tabela z dzialkami
left join EW_DZIALKI_P dzp on dz.uid = dzp.uidd and dzp.n <> 0 -- tabela dzialka-punkty
join EW_PUNKTY p on dzp.idp = p.ID --tabela punkty
     and p.status in (0,1) and (p.ZRODLO in (11,15,16,19) and p.BLADPOL in (1,2)) --warunki na ZRD i BPP
where dz.status in (0,1) 
and dz.idobr = 11
union
select
dz.CTRL as dzialka, 0 as CZY_PKT_OK, --dodatkowy atrybut z wartoscia 0 dla pkt nie spelniajacych ZRD i BPP
dzp.*,  p.*
from EW_DZIALKI dz
left join EW_DZIALKI_P dzp on dz.uid = dzp.uidd and dzp.n <> 0
join EW_PUNKTY p on dzp.idp = p.ID 
     and p.status in (0,1) and (p.ZRODLO not in (11,15,16,19) or p.BLADPOL not in (1,2))
where dz.status in (0,1) 
and dz.idobr = 11
)
as PUNKTY_KONTROLA
group by dzialka
having sum(PUNKTY_KONTROLA.CZY_PKT_OK) = count(PUNKTY_KONTROLA.CZY_PKT_OK) --warunek czy wszystkie punkty posiadaja wymagane atrybuty




/*
--wybor aktualnych punktów w bazie dla danego obrebu
select
count(distinct p.CTRL)
from EW_DZIALKI dz
left join EW_DZIALKI_P dzp on dz.uid = dzp.uidd and dzp.n <> 0
left join EW_PUNKTY p on dzp.idp = p.ID
where dz.status in (0,1)
and dz.idobr = 11
and dz.CTRL = '11-473' or dz.CTRL = '11-474/1'
*/