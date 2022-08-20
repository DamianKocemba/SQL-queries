--wybor dzialek z przypisana dok do m2 lub z powierzchnia sugerujaca ze dzialka jest rozliczona do m2

--update dzialka set m2 = 1
select
count(*)
--idobr, idd, pew, m2
from dzialka
where status = 0 and idobr = 17
and (mod(pew, 100) <> 0 or m2 = 1)
