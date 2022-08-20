/*polecenie wybiera operaty powiazane z obrebem*/

WITH operaty_z_obrebu AS
(
SELECT 
	--wybor operatow powiazanych z punktami granicznymi
	DISTINCT(op.uid || '- ' || op.numer || ' ' || op.typ) AS operat_typ
FROM EW_PUNKTY AS pkt
LEFT JOIN EW_OPERATY AS op ON pkt.operat = op.uid
WHERE 
	pkt.status IN (0,1)
	AND op.numer LIKE 'P.%'
	AND pkt.id IN
		(SELECT dzp.idp FROM EW_DZIALKI_P AS dzp
		JOIN EW_DZIALKI AS dz ON dzp.UIDD = dz.uid
		WHERE dz.STATUS IN (0,1)AND dz.idobr IN (1,2,3,4,5)) --nalezy podac numery obrebow!!
UNION
SELECT
	--wybor operatow powiazanych z dzialkami
	DISTINCT(op.uid || '- ' || op.numer || ' ' || op.typ) AS operat_typ
FROM EW_DZIALKI AS d
LEFT JOIN EW_OPERATY AS op ON d.operat = op.uid
WHERE 
	d.status IN (0,1) 
	AND d.idobr IN (1,2,3,4,5)   --nalezy podac numery obrebow!!
	AND op.numer  LIKE 'P.%'
)

SELECT DISTINCT * FROM operaty_z_obrebu