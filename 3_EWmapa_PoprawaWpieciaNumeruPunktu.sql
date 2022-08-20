/*
update EW_PUNKTY pkt 
set wpnx = wpx, wpny = wpy -- zmienienie wspolrzednych numerow punktow na wspolrzedne tych punktow
where pkt.status in (0,1)
and (wpx <> wpnx and wpy <> wpny) -- wybranie tylko tych punktow gdzie te wspolrzedne sie roznia
and pkt.id in
( -- wybor punktow z obrebu
select dzp.idp 
from EW_DZIALKI_P dzp
join EW_DZIALKI dz on dzp.uidd = dz.uid
where dz.status in (0,1) 
and dz.idobr = 11 --wybor obrebu
);
commit;
*/