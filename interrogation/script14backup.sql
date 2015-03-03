SELECT
    DISTINCT R.NO_RESERVATION AS "No. réservation",
    TO_CHAR(R.DATE_RESERVATION, 'DD/MM/YYYY') AS "Date de réservation",
    (V.PRIX_TRANSPORT * S.NB_PERSONNES) + ((R.FIN_SEJOUR - R.DEBUT_SEJOUR) * S.NB_PERSONNES * TN.TARIF_UNITAIRE) AS "Prix",
    R.NOM_VILLAGE As "Nom village",
    V.PAYS As "Pays"
FROM RESERVATION R
    INNER JOIN VILLAGE V
        ON R.NOM_VILLAGE = V.NOM_VILLAGE
        INNER JOIN CATEGORIE_VILLAGE CV
            ON V.NO_CATEGORIE = CV.NO_CATEGORIE
    INNER JOIN SEJOUR S
        ON R.NO_RESERVATION = S.NO_RESERVATION
        AND R.NOM_VILLAGE = S.NOM_VILLAGE
        INNER JOIN LOGEMENT L
            ON S.NO_LOGEMENT = L.NO_LOGEMENT
            AND S.NOM_VILLAGE = L.NOM_VILLAGE
            INNER JOIN TYPE_LOGEMENT TL
                ON L.CODE_TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
                INNER JOIN TARIF_NUIT TN
                    ON TL.CODE_TYPE_LOGEMENT = TN.TYPE_LOGEMENT
                    AND CV.NO_CATEGORIE = TN.CATEGORIE
WHERE
    R.DATE_RESERVATION BETWEEN TO_DATE('01/02/2014', 'DD/MM/YYYY') AND TO_DATE('28/02/2014', 'DD/MM/YYYY')
--GROUP BY
--    R.NO_RESERVATION, R.DATE_RESERVATION, R.NOM_VILLAGE, V.PAYS
ORDER BY
    R.NO_RESERVATION;
