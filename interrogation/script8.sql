SELECT
	C.NO_CLIENT AS "Numéro Client",
	C.NOM AS "Nom",
	C.PRENOM AS "Prenom",
	C.ADRESSE AS "Adresse",
	'(' || SUBSTR(C.TEL_DOMICILE, 1, 3) || ')' || SUBSTR(C.TEL_DOMICILE, 4, 3) || '-' || SUBSTR(C.TEL_DOMICILE, -4, 4) AS "Téléphone Domicile"
FROM CLIENT C
WHERE
    C.ADRESSE LIKE '%ontr%eal'
ORDER BY C.NO_CLIENT;
