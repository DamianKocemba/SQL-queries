
--usuniecie punktow niepowiazanych z zadna dzialek
delete
from EW_PUNKTY pkt
where pkt.status in (0,1)
and (pkt.CTRL like '11-%' or pkt.CTRL like '13-%' or pkt.CTRL like '8-%')
and pkt.operat <> 8245
and pkt.id not in
(select dzp.idp from EW_DZIALKI_P dzp
join EW_DZIALKI dz on dzp.UIDD = dz.uid
where dz.STATUS in (0,1) );
commit;

