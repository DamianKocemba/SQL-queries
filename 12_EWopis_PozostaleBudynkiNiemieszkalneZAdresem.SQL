/* skrypt znajduje Pozosta³e budynki niemieszkalne z przypisanym adresem */
select
b.id, b.idobr, b.idb, b.rodzkst, ab.idbud
from budynki b
left join adresy_budynki ab on b.id = ab.idbud
where 
b.status = 0 and b.idobr = 17 and b.rodzkst = 22 -- 22 to Pozostale budynki niemieszkalne
and ab.status = 0

