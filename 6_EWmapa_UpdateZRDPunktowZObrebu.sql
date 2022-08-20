//
update EW_PUNKTY pkt
set pkt.ZRODLO = 11 --ZRD nowe
where pkt.STATUS in (0,1) and pkt.ZRODLO = 1 --ZRD stare
and pkt.id in
(--wybor punktow z obrebu
select pkt.id
from EW_PUNKTY pkt
where pkt.status in (0,1) and pkt.id in
(select dzp.idp from EW_DZIALKI_P dzp
join EW_DZIALKI dz on dzp.UIDD = dz.uid
where dz.STATUS in (0,1) and dz.IDOBR = 11) --wybor obrebu
)
