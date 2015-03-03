SELECT
	V.PAYS AS "Pays",
	V.NOM_VILLAGE AS "Nom du village",
	NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('31-03-2015', 'dd-mm-yyyy')), TO_DATE('01-03-2015', 'dd-mm-yyyy')) - LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('01-03-2015', 'dd-mm-yyyy')), TO_DATE('31-03-2015', 'dd-mm-yyyy'))), 0) AS "Nombre de nuitées"
FROM
	VILLAGE V
		INNER JOIN RESERVATION R
			ON V.NOM_VILLAGE = R.NOM_VILLAGE
				LEFT JOIN SEJOUR S
					ON R.NO_RESERVATION = S.NO_RESERVATION AND
					   R.NOM_VILLAGE = S.NOM_VILLAGE	
HAVING 
	NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('31-03-2015', 'dd-mm-yyyy')), TO_DATE('01-03-2015', 'dd-mm-yyyy')) - LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('01-03-2015', 'dd-mm-yyyy')), TO_DATE('31-03-2015', 'dd-mm-yyyy'))), 0) = (
        SELECT
            MAX("Nombre de nuitées")
        FROM
        (
            SELECT
                V.PAYS,
                V.NOM_VILLAGE,
                NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('31-03-2015', 'dd-mm-yyyy')), TO_DATE('01-03-2015', 'dd-mm-yyyy')) - LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('01-03-2015', 'dd-mm-yyyy')), TO_DATE('31-03-2015', 'dd-mm-yyyy'))), 0) AS "Nombre de nuitées"
            FROM
                VILLAGE V
                    INNER JOIN RESERVATION R
                        ON V.NOM_VILLAGE = R.NOM_VILLAGE
                            LEFT JOIN SEJOUR S
                                ON R.NO_RESERVATION = S.NO_RESERVATION AND
                                   R.NOM_VILLAGE = S.NOM_VILLAGE	
            GROUP BY
                V.PAYS,
                V.NOM_VILLAGE
        )
)
GROUP BY
    V.PAYS,
    V.NOM_VILLAGE;
