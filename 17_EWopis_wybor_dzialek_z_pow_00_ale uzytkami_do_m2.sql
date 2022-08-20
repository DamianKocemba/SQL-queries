/* skrypt wypisuje dzialki, ktorych powierzchnia konczy sie na ..00
ale uzytki rozliczone sa do m2*/

SELECT
  d.idobr AS obreb, d.idd AS nr_dzialki, d.pew AS pow_dzialki, 
  d.m2 AS dokladnosc, u.ofu, u.ozu, u.ozk, u.pew AS pow_uzytku
-- ,LIST(u.ofu || '/' || u.ozu|| u.ozk|| '=' || CAST(u.pew AS INT), '#') AS uzytki
FROM dzialka AS d
JOIN uzytki AS u ON d.id = u.rdze
WHERE
  d.status = 0 AND d.pew IS NOT NULL AND MOD(d.pew,100) = 0 AND  d.idobr = 5 --nalezy podac nr obrebu
  AND u.status = 0 AND MOD(u.pew,100) <> 0
--GROUP BY d.idobr, d.idd, d.pew
ORDER BY d.idobr, d.idd