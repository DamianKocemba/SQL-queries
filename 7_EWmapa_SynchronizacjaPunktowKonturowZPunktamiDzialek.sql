/*skrypt wybiera wszystkie punkty u¿ytkow wraz z dolaczonymi
punktami dzialek o tych samych wspolrzednych*/
with punkty_dzialki
as
(select * from EW_PUNKTY pkt
where pkt.status in (0,1)
and pkt.id in
( -- wybor punktow z obrebu
select dzp.idp 
from EW_DZIALKI_P dzp
join EW_DZIALKI dz on dzp.uidd = dz.uid
where dz.status in (0,1) 
and dz.idobr = 6) --wybor obrebu, TRZEBA WPISAC NUMER OBREBU
)

select
pk.wpx, pk.wpy, pk.numer as PKT_KONTURU,pd.wpx, pd.wpy, pd.numer AS PKT_DZIALKI
from EW_KONTURY_PUNKTY pk
left join punkty_dzialki pd on pd.wpx = pk.wpx and pd.wpy = pk.wpy 
where pk.status in (0,1)
and pk.id in
( -- wybor punktow z obrebu
select kp.idp 
from EW_KONTURY_P kp
join EW_KONTURY kont on kp.uidd = kont.uid
where kont.status in (0,1) 
and kont.idobr = 6) --wybor obrebu, TRZEBA WPISAC NR OBREBU





