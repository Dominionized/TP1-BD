/* **********************************************************
 DML - Update
 Schéma MRD: "Cas Village Vacances"  - VERSIONS 1 et 2
 Auteur: Dominique Bégin, Maxime Laboissonniere, Gérémy Sorlini - Cégep de Ste-Foy   
***********************************************************/


/* **********************************************************
Requête 16 - Augmenter de 5,5% tous les tarifs des nuitées pour les villages de catégorie 1 et 2.
***********************************************************/

UPDATE TARIF_NUIT
	SET TARIF_UNITAIRE = TARIF_UNITAIRE*1.055
WHERE CATEGORIE = 1 OR CATEGORIE = 2;


/* **********************************************************
Requête 17 - Supprimer la réservation numéro 16.
***********************************************************/

DELETE SEJOUR
	WHERE NO_RESERVATION = 16;
DELETE RESERVATION
	WHERE NO_RESERVATION = 16;
	
	
/* **********************************************************
Requête 18 - Déplacer tous les séjours de 2 personnes des suites 11 et 19 du village Casa-Dali dans la suite 8.
Pour simplifier, on considère que la disponibilité de ce logement est assurée.
***********************************************************/
	
UPDATE SEJOUR
	SET NO_LOGEMENT = 8
WHERE
	(NO_LOGEMENT = 11
	OR NO_LOGEMENT = 19)
	AND NOM_VILLAGE = 'CASA-DALI'
	AND NB_PERSONNES = 2;
