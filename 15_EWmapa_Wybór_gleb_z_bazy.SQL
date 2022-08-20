select
idobr || '-' || idd || '/' || idk AS nr_konturu, typgleby
from EW_KONTURY
where
status = 0
and idobr = 3