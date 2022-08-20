select IDOBR || '-' || IDD as dz, PEW from DZIALKA
where M2=0  and status in (0, 1) order by dz
