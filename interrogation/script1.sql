SET LINESIZE 120;
SELECT 
	V.NOM_VILLAGE AS Nom,
	V.PAYS AS Pays,
	V.NO_CATEGORIE AS "Code Cat�gorie",
	C.DESCRIPTION AS "Description Cat�gorie",
	TO_CHAR(V.PRIX_TRANSPORT, '9,999.00') || ' $CAN'  AS "Co�t Transport Par Personne"
FROM VILLAGE V
		INNER JOIN CATEGORIE_VILLAGE C
			ON	V.NO_CATEGORIE = C.NO_CATEGORIE
ORDER BY
	V.PAYS,
	V.NO_CATEGORIE,
	V.NOM_VILLAGE;
	
