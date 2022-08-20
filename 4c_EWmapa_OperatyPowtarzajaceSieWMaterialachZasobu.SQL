/*polecenie sprawdza, czy operaty w Operatach ewidencyjnych powtarzaja sie tez w Materialach zasobu*/
select 
op.numer 
from ew_operaty op
where op.typ = 1 and op.numer in
(
select
o.numer from ew_operaty o
where typ = 8
)