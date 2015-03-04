/*********************************************************
 DQL
 Schéma MRD: "Cas Village Vacances"  - VERSIONS 1 et 2
 Auteur: Dominique Bégin, Maxime Laboissonniere, Gérémy Sorlini - Cégep de Ste-Foy   
***********************************************************/


/********************** REQUÊTE 1 *************************
• Produire la liste des villages vacances.
• Pour chaque village, indiquer dans l’ordre :
- nom du village,
- nom du pays,
- numéro de la catégorie du village,
- description de la catégorie du village,
- prix du transport par personne (affichage, exemple : 174.50 $Can).
• Trier par pays, puis par catégorie de village (no), puis par village.
***********************************************************/

SELECT 
	V.NOM_VILLAGE AS Nom,
	V.PAYS AS Pays,
	V.NO_CATEGORIE AS "Code Catégorie",
	C.DESCRIPTION AS "Description Catégorie",
	TO_CHAR(V.PRIX_TRANSPORT, '9,999.00') || ' $CAN'  AS "Coût Transport Par Personne"
FROM VILLAGE V
		INNER JOIN CATEGORIE_VILLAGE C
			ON	V.NO_CATEGORIE = C.NO_CATEGORIE
ORDER BY
	V.PAYS,
	V.NO_CATEGORIE,
	V.NOM_VILLAGE;

/********************** REQUÊTE 2 *************************
• Produire la liste des tarifs des nuitées pour chaque type de logement.
• Pour chaque tarif, indiquer dans l’ordre :
- code du type de logement,
- description du type de logement,
- numéro de la catégorie du village,
- description de la catégorie du village,
- prix/nuit/personne en $ canadiens (affichage, exemple : 50.50 $Can).
• Trier par type de logement, puis catégorie de village
***********************************************************/

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

/********************** REQUÊTE 3 *************************
• Produire la liste des logements pour le village Casa-Dali.
• Pour chaque logement, indiquer dans l’ordre :
- code du type de logement,
- numéro du logement.
• Trier par type de logement.
***********************************************************/

SELECT
	L.CODE_TYPE_LOGEMENT AS "Type Logement",
	L.NO_LOGEMENT AS "No Logement"
FROM LOGEMENT L
WHERE L.NOM_VILLAGE = 'Casa-Dali'
ORDER BY L.CODE_TYPE_LOGEMENT;

/********************** REQUÊTE 4 *************************
• Produire la liste des types de logement proposés dans le village Kouros.
• Pour chaque type de logement, indiquer dans l’ordre :
- le code du type de logement,
- la description du type de logement.
• Trier par code de type de logement.
***********************************************************/

SELECT
	DISTINCT TL.CODE_TYPE_LOGEMENT AS "Type Logement",
	TL.DESCRIPTION AS "Description Logement"
FROM TYPE_LOGEMENT TL
	INNER JOIN LOGEMENT L
		ON TL.CODE_TYPE_LOGEMENT = L.CODE_TYPE_LOGEMENT
WHERE L.NOM_VILLAGE = 'Kouros'
ORDER BY TL.CODE_TYPE_LOGEMENT;

/********************** REQUÊTE 5 *************************
• Produire la liste des tarifs des nuitées pour le type de logement D3.
• Pour chaque prix, indiquer dans l’ordre :
- code du type de logement,
- description du type de logement,
- numéro de la catégorie du village,
- description de la catégorie du village,
- prix/nuit/personne en $ canadiens (affichage, exemple : 50.00 $Can).
• Trier par catégorie de village.
***********************************************************/

SELECT
	TN.TYPE_LOGEMENT AS "Type Logement",
	TL.DESCRIPTION AS "Description Logement",
	TN.CATEGORIE AS "Catégorie Village",
	C.DESCRIPTION AS "Catégorie Village",
	TO_CHAR(TN.TARIF_UNITAIRE, '9,999.00') || '$Can' AS "Prix/Nuit/Personne"
FROM TARIF_NUIT TN
	INNER JOIN TYPE_LOGEMENT TL
		ON TN.TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
	INNER JOIN CATEGORIE_VILLAGE C
		ON TN.CATEGORIE = C.NO_CATEGORIE
WHERE TN.TYPE_LOGEMENT = 'D3'
ORDER BY TN.CATEGORIE;

/********************** REQUÊTE 6 *************************
• Produire le calendrier d’occupation du logement 108 du village Casa Dali pour le mois de mars
2014.
• Indiquer dans l’ordre :
•
numéro du logement,
•
nom du village,
•
nom du pays,
•
code du type de logement,
•
description du type de logement,
•
Version 1 : pour chaque réservation concernant le logement :
• numéro de la réservation,
• date de la première nuit (format jj/mm/aaaa),
• date de la dernière nuit (format jj/mm/aaaa).
•
Version 2 : pour chaque date de séjour concernant le logement :
• numéro de la réservation,
• date du séjour (de la nuit occupée) (format jj/mm/aaaa).
• Trier par date(s).
***********************************************************/

SET LINESIZE 120;
SELECT
	L.NO_LOGEMENT AS "Numéro Logement",
	L.NOM_VILLAGE AS "Village",
	V.PAYS AS Pays,
	L.CODE_TYPE_LOGEMENT AS "Type Logement",
	TL.DESCRIPTION AS "Description Logement",
	R.NO_RESERVATION AS "Numéro Réservation",
	R.DEBUT_SEJOUR AS "Première Nuit",
	R.FIN_SEJOUR AS "Dernière Nuit"
FROM LOGEMENT L
	INNER JOIN VILLAGE V
		ON L.NOM_VILLAGE = V.NOM_VILLAGE
	INNER JOIN RESERVATION R
		ON V.NOM_VILLAGE = R.NOM_VILLAGE
	INNER JOIN TYPE_LOGEMENT TL
		ON L.CODE_TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
WHERE L.NO_LOGEMENT = 106
AND	L.NOM_VILLAGE = 'Casa-Dali'
AND R.DEBUT_SEJOUR > TO_DATE('01/04/2014', 'DD/MM/YYYY')
AND R.FIN_SEJOUR < TO_DATE('28/02/2014', 'DD/MM/YYYY')
ORDER BY R.DEBUT_SEJOUR;

/********************** REQUÊTE 7 *************************
• Produire les confirmations pour toutes les réservations effectuées (date de réservation) entre le
12 et le 20 février 2014 inclusivement.
• Pour chaque réservation, indiquer dans l’ordre :
- numéro de la réservation,
- nom du village,
- date de départ (format jj/mm/aaaa),
- date de retour (format jj/mm/aaaa),
- nombre total de personnes concernées par la réservation,
- numéro du client,
- nom du client,
- prénom du client.
• Trier par date de réservation, puis par numéro de réservation.
***********************************************************/

SELECT
	R.NO_RESERVATION AS "Numéro Réservation",
	R.NOM_VILLAGE AS "Nom Village",
	R.DEBUT_SEJOUR AS "Date Départ",
	R.FIN_SEJOUR AS "Date Retour",
	S.NB_PERSONNES AS "Nombre Personnes",
	R.NO_CLIENT AS "Numéro Client",
	C.NOM AS "Nom Client",
	C.PRENOM AS "Prénom Client"
FROM RESERVATION R
	INNER JOIN SEJOUR S
		ON R.NO_RESERVATION = S.NO_RESERVATION
        AND R.NOM_VILLAGE = S.NOM_VILLAGE
	INNER JOIN CLIENT C
		ON R.NO_CLIENT = C.NO_CLIENT
WHERE 
	R.DATE_RESERVATION BETWEEN TO_DATE('12/02/2014', 'DD/MM/YYYY')
AND TO_DATE('20/02/2014', 'DD/MM/YYYY')
ORDER BY
	R.DATE_RESERVATION,
	R.NO_RESERVATION;

/********************** REQUÊTE 8 *************************
• Produire la liste des clients de Montréal.
• Pour chaque client habitant Montréal, indiquer dans l’ordre :
- numéro du client,
- nom du client,
- prénom du client,
- adresse du client,
- téléphone domicile du client (affichage, exemple : (514)412-2296)
• Trier par no de client.
***********************************************************/

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

/********************** REQUÊTE 9 *************************
• Calculer le tarif moyen des nuitées pour chaque catégorie de village.
• Pour chaque catégorie de village, indiquer dans l’ordre :
- numéro de la catégorie du village,
- description de la catégorie du village,
- prix moyen par personne et par nuit des logements
(affichage, exemple : 43.64
$Can).
• Trier par catégorie de village.
***********************************************************/

SELECT
	DISTINCT C.NO_CATEGORIE AS "Catégorie Village",
	C.DESCRIPTION AS "Description Catégorie",
	TO_CHAR(AVG(T.TARIF_UNITAIRE), '9,999.00') || ' $Can' AS "Tarif Moyen"
FROM CATEGORIE_VILLAGE C
	INNER JOIN TARIF_NUIT T
		ON C.NO_CATEGORIE = T.CATEGORIE
GROUP BY C.NO_CATEGORIE, C.DESCRIPTION
ORDER BY C.NO_CATEGORIE;

/********************** REQUÊTE 10 *************************
• Produire un rapport d’occupation des logements du village Casa-Dali pour le mois de mars 2014.
• Pour chaque logement du village, indiquer dans l’ordre :
- numéro du logement,
- nombre de nuits occupées.
• Trier par logement.
***********************************************************/

SELECT
	L.NO_LOGEMENT AS "Numéro Logement",
	NVL(SUM(LEAST(R.FIN_SEJOUR, TO_DATE('31/03/2014', 'DD/MM/YYYY')) - GREATEST(R.DEBUT_SEJOUR, TO_DATE('01/03/2014', 'DD/MM/YYYY'))), 0) AS "Nombre Nuits Occupées"
FROM LOGEMENT L
	LEFT OUTER JOIN SEJOUR S
		ON L.NO_LOGEMENT = S.NO_LOGEMENT AND L.NOM_VILLAGE = S.NOM_VILLAGE
			LEFT JOIN RESERVATION R
				ON S.NO_RESERVATION = R.NO_RESERVATION
WHERE 
	L.NOM_VILLAGE = 'Casa-Dali'
GROUP BY L.NO_LOGEMENT
ORDER BY L.NO_LOGEMENT;

/********************** REQUÊTE 11 *************************
• Produire un rapport d’occupation des logements (nombre de nuits occupées pour une période
donnée) du village Casa-Dali pour la période du 7 mars au 23 mars 2014 inclusivement.
• Pour chaque logement du village dont le taux d’occupation est inférieur à 30%, indiquer dans
l’ordre :
- taux d’occupation (affichage, exemple : 24%),
- numéro du logement,
- code du type de logement,
- description du type de logement.
• Trier par taux d’occupation.
***********************************************************/

SELECT
	NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('23/03/2014', 'DD/MM/YYYY')), TO_DATE('07/03/2014', 'DD/MM/YYYY'))- LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('07/03/2014', 'DD/MM/YYYY')), TO_DATE('23/03/2014', 'DD/MM/YYYY'))), 0 )/ 16 * 100 || '%' AS "Taux d'occupation",
	L.NO_LOGEMENT AS "Numéro Logement",
    L.CODE_TYPE_LOGEMENT AS "Code du type du logement",
    TL.DESCRIPTION AS "Description"
FROM LOGEMENT L
	LEFT OUTER JOIN SEJOUR S
		ON L.NO_LOGEMENT = S.NO_LOGEMENT AND L.NOM_VILLAGE = S.NOM_VILLAGE
			LEFT JOIN RESERVATION R
				ON S.NO_RESERVATION = R.NO_RESERVATION
    INNER JOIN TYPE_LOGEMENT TL
        ON L.CODE_TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
WHERE 
	L.NOM_VILLAGE = 'Casa-Dali'
HAVING
	NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('23/03/2014', 'DD/MM/YYYY')), TO_DATE('07/03/2014', 'DD/MM/YYYY'))- LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('07/03/2014', 'DD/MM/YYYY')), TO_DATE('23/03/2014', 'DD/MM/YYYY'))), 0 )/ 16 * 100 < 30
GROUP BY L.NO_LOGEMENT, L.CODE_TYPE_LOGEMENT, TL.DESCRIPTION
ORDER BY "Taux d'occupation";

/********************** REQUÊTE 12 *************************
• Produire la liste des logements du village Casa-Dali disponibles pour toute la période du 17 au 23
mars 2014 inclusivement.
• Pour chaque logement disponible, indiquer dans l’ordre :
- numéro du logement,
- code du type de logement,
- description du type de logement.
• Trier par logement.
***********************************************************/

SELECT
	L.NO_LOGEMENT AS "Numéro Logement",
    L.CODE_TYPE_LOGEMENT AS "Code du type logement",
    TYPE_LOGEMENT.DESCRIPTION AS "Description"
FROM LOGEMENT L
	LEFT OUTER JOIN SEJOUR S
		ON L.NO_LOGEMENT = S.NO_LOGEMENT AND L.NOM_VILLAGE = S.NOM_VILLAGE
			LEFT JOIN RESERVATION R
				ON S.NO_RESERVATION = R.NO_RESERVATION
    INNER JOIN TYPE_LOGEMENT
        ON L.CODE_TYPE_LOGEMENT = TYPE_LOGEMENT.CODE_TYPE_LOGEMENT
WHERE 
	L.NOM_VILLAGE = 'Casa-Dali'
HAVING
	NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('23/03/2014', 'DD/MM/YYYY')), TO_DATE('07/03/2014', 'DD/MM/YYYY'))- LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('07/03/2014', 'DD/MM/YYYY')), TO_DATE('23/03/2014', 'DD/MM/YYYY'))), 0 ) = 0
GROUP BY L.NO_LOGEMENT, L.CODE_TYPE_LOGEMENT, TYPE_LOGEMENT.DESCRIPTION
ORDER BY L.NO_LOGEMENT;

/********************** REQUÊTE 13 *************************
• Produire la liste des réservations sans séjour.
• Pour chaque réservation, indiquer dans l’ordre :
- numéro de la réservation,
- date de la réservation (format jj/mm/aaaa),
- nom du client,
- prénom du client.
• Trier par réservation (numéro).
***********************************************************/

SELECT
	R.NO_RESERVATION AS "Numéro Réservation",
	TO_CHAR(R.DATE_RESERVATION, 'DD/MM/YYYY') AS "Date Réservation",
	C.NOM AS "Nom Client",
	C.PRENOM AS "Prenom Client"
FROM RESERVATION R
	INNER JOIN CLIENT C
		ON R.NO_CLIENT = C.NO_CLIENT
WHERE R.NO_RESERVATION NOT IN (SELECT NO_RESERVATION FROM SEJOUR)
ORDER BY R.NO_RESERVATION;

/********************** REQUÊTE 14 *************************
• Calculer le montant total hors taxes à facturer pour les réservations effectuées au mois de février
2014 (date de la réservation). Le montant facturé est calculé ainsi :
(Prix transport/personne * nombre total personnes) +
Σ [pour chaque logement] (nombre nuits * nombre personnes * tarif/nuit/personne)
Ainsi, le montant facturé pour la réservation no 2, 5 nuits et 2 logements (108 et 109) dans le village
Casa-Dali, est de 7404 $.
• Pour chaque réservation, indiquer dans l’ordre :
- numéro de la réservation,
- date de la réservation (format jj/mm/aaaa),
- montant hors taxes à facturer (affichage, exemple : 2138.00 $Can),
- nom du pays,
- nom du village.
• Trier par réservation.
***********************************************************/

SELECT
    DISTINCT R.NO_RESERVATION AS "No. réservation",
    TO_CHAR(R.DATE_RESERVATION, 'DD/MM/YYYY') AS "Date de réservation",
    TO_CHAR((V.PRIX_TRANSPORT * SUM(S.NB_PERSONNES)) + SUM((R.FIN_SEJOUR - R.DEBUT_SEJOUR) * S.NB_PERSONNES * TN.TARIF_UNITAIRE), '99999.00') || '$ Can' AS "Prix",
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
GROUP BY
    R.NO_RESERVATION, R.DATE_RESERVATION, R.NOM_VILLAGE, V.PAYS, V.NOM_VILLAGE, V.PRIX_TRANSPORT
ORDER BY
    R.NO_RESERVATION;

/********************** REQUÊTE 15 *************************
• Le ou les villages avec le plus grand nombre de nuitées vendues pour le mois de mars 2014. Une
nuitée représente l’hébergement d’une personne pour une nuit.
• Indiquer dans l’ordre :
- pays,
- nom village,
- nombre de nuitées.
***********************************************************/

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
