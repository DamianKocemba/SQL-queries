/* skrypt wypisuje KW przypisane do dzia³ek z danego obrebu */

SELECT
dok.syg AS NR_KW, 
LIST((d.idobr || '-' || d.idd), ', ') AS DZIALKI
--d.idobr || '-' || d.idd -- opcja, gdzie kazda dzia³ka jest wypisana z osobna, a do niej KW (trzeba wtedy zakomentowaæ klauzule group by)
FROM dokumenty dok
INNER JOIN dokumenty_dzialki_rpwl AS rpwl ON rpwl.iddok=dok.id AND dok.kdk=5
LEFT JOIN dzialka AS d ON d.id=rpwl.iddz AND rpwl.status IN (0,1)
WHERE d.status in (0,1) AND d.idobr = 1 -- NALEZY PODAC NR OBREBU
GROUP BY dok.syg
ORDER BY dok.syg