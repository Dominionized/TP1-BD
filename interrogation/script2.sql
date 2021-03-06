SELECT
        TL.CODE_TYPE_LOGEMENT,
        TL.DESCRIPTION,
        CV.NO_CATEGORIE,
        CV.DESCRIPTION,
        TO_CHAR(TN.TARIF_UNITAIRE, '9999.99') || ' $Can' AS TARIF_NUIT
FROM
        TARIF_NUIT TN
                INNER JOIN TYPE_LOGEMENT TL
                        ON TN.TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
                INNER JOIN CATEGORIE_VILLAGE CV
                        ON TN.CATEGORIE = CV.NO_CATEGORIE
ORDER BY
        TL.CODE_TYPE_LOGEMENT,
        CV.NO_CATEGORIE;

