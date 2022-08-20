/* skrypt wypisuje dotychczasowe id budynku zapisane w archiwum
oraz nowe (aktualne) id */

select 
count(*)
    --b1.idobr, b1.idb, b2.idb
    --b2.idobr || '-' || b2.idb as id_budynku_dotychczasowe, b1.idobr || '-' || b1.idb as id_budynku_nowe
   /* kontrolne sprawdzenie wynikow zapytania*/
    --b1.id as b1_id, b1.idb as b1_idb, b1.dtw as b1_dtw, b1.dtu as b1_dtu, b1.status as b1_status,
    --b2.id as b2_id, b2.idb as b2_idb, b2.dtw as b2_dtw, b2.dtu as b2_dtu, b2.status as b2_status
from budynki as b1
    left join budynki as b2 
        on (b1.dtu = b2.dtw and b1.id = b2.id)
where 
--(b1.status = 0 and b2.status = 3 and b2.idb like '%;%')
(b1.status = 3 and b1.idb not like '%;%') and (b2.status = 3 and b2.idb like '%;%')  and b1.id in (select id from budynki where status = 0)
    and b1.idobr in (1,2,3,4,5)  -- NALEZY PODAC NR OBREBU
--order by b1.idobr 


