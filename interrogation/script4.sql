SELECT
	DISTINCT TL.CODE_TYPE_LOGEMENT AS "Type Logement",
	TL.DESCRIPTION AS "Description Logement"
FROM TYPE_LOGEMENT TL
	INNER JOIN LOGEMENT L
		ON TL.CODE_TYPE_LOGEMENT = L.CODE_TYPE_LOGEMENT
WHERE L.NOM_VILLAGE = 'Kouros'
ORDER BY TL.CODE_TYPE_LOGEMENT;
