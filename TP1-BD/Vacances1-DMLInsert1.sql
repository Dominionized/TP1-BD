/* **********************************************************
	DML Insert - SCRIPT No 1
	Schéma MRD:	"Cas Village Vacances"  - VERSIONS 1 et 2
	Auteur:		Sylvie Monjal - Cégep de Ste-Foy  	
***********************************************************/

/* AVANT L'EXÉCUTION DE CE SCRIPT No 1:
	- ASSUREZ-VOUS D'AVOIR SUPPRIMÉ PUIS RECRÉÉ LA SÉQUENCE SEQ_NO_CLIENT */

/* APRÈS L'EXÉCUTION DE CE SCRIPT No 1:
	- N'OUBLIEZ PAS DE FAIRE UN COMMIT
	- EXÉCUTEZ LE SCRIPT "Vacances1-DMLInsert2.sql" */

/*===============================================================================
     Table CATÉGORIE_VILLAGE: 3 catégories de village
/*===============================================================================*/	
SAVEPOINT CATEGORIES_VILLAGE;
INSERT INTO
	CATEGORIE_VILLAGE
		(NO_CATEGORIE,
		 DESCRIPTION)
	VALUES
		(1,
		 'tennis, piscine, mini-golf, golf, sauna, garderie');
INSERT INTO
	CATEGORIE_VILLAGE
		(NO_CATEGORIE,
		 DESCRIPTION)
	VALUES
		(2,
		 'tennis, piscine, golf, sauna');
INSERT INTO
	CATEGORIE_VILLAGE
		(NO_CATEGORIE,
		 DESCRIPTION)
	VALUES
		(3,
		 'tennis, piscine, garderie');

/*===============================================================================
     Table TYPE_LOGEMENT: 11 types de logement
/*===============================================================================*/	
SAVEPOINT TYPES_LOGEMENT;
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('A1',
		 'Chambre 4 personnes avec douche',
		 4);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('A2',
		 'Chambre 4 personnes avec bain',
		 4);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('A3',
		 'Chambre 2 personnes avec bain',
		 2);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('A4',
		 'Chambre 1 personne avec bain',
		 1);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('B1',
		 'Suite 1 personne',
		 1);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('B2',
		 'Suite 2 personnes',
		 2);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('C1',
		 'Bungalow 4 personnes',
		 4);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('C2',
		 'Bungalow 2 personnes',
		 2);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('D1',
		 'Chalet 6 personnes',
		 6);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('D2',
		 'Chalet 4 personnes',
		 4);
INSERT INTO
	TYPE_LOGEMENT
		(CODE_TYPE_LOGEMENT,
		 DESCRIPTION,
		 NB_MAX_PERSONNES)
	VALUES
		('D3',
		 'Chalet 2 personnes',
		 2);

/*===============================================================================
     Table TARIF_NUIT:
/*===============================================================================*/	
SAVEPOINT TARIFS;
-- Catégorie 1
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'A1',
		 45);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'A2',
		 50);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'A3',
		 60);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'A4',
		 70);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'B1',
		 75);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'B2',
		 85);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'C1',
		 40);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'C2',
		 35);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'D1',
		 40);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'D2',
		 50);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('1',
		 'D3',
		 80);
-- Catégorie 2
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'A1',
		 40);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'A2',
		 45);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'A3',
		 50);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'A4',
		 60);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'B1',
		 65);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'B2',
		 75);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'C1',
		 30);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'C2',
		 40);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'D1',
		 30);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'D2',
		 40);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('2',
		 'D3',
		 60);
-- Catégorie 3
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'A1',
		 35);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'A2',
		 40);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'A3',
		 45);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'A4',
		 55);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'B1',
		 60);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'B2',
		 70);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'C1',
		 25);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'C2',
		 35);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'D1',
		 25);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'D2',
		 35);
INSERT INTO
	TARIF_NUIT
		(CATEGORIE,
		 TYPE_LOGEMENT,
		 TARIF_UNITAIRE)
	VALUES
		('3',
		 'D3',
		 55);
		 
/*===============================================================================
     Table VILLAGE: 4 villages
/*===============================================================================*/	
SAVEPOINT VILLAGES;
INSERT INTO
	VILLAGE
		(NOM_VILLAGE,
		 VILLE,
		 PAYS,
		 NO_CATEGORIE,
		 PRIX_TRANSPORT)
	VALUES
		('Casa-Dali',
		 'Figueïras',
		 'Espagne',
		 3,
		 1059);
INSERT INTO
	VILLAGE
		(NOM_VILLAGE,
		 VILLE,
		 PAYS,
		 NO_CATEGORIE,
		 PRIX_TRANSPORT)
	VALUES
		('Porto-Nuevo',
		 'Valencia',
		 'Espagne',
		 2,
		 949);
INSERT INTO
	VILLAGE
		(NOM_VILLAGE,
		 VILLE,
		 PAYS,
		 NO_CATEGORIE,
		 PRIX_TRANSPORT)
	VALUES
		('Cuidad Blanca',
		 'Barcelona',
		 'Espagne',
		 3,
		 800);
INSERT INTO
	VILLAGE
		(NOM_VILLAGE,
		 VILLE,
		 PAYS,
		 NO_CATEGORIE,
		 PRIX_TRANSPORT)
	VALUES
		('Kouros',
		 'Corfou',
		 'Grèce',
		 3,
		 1239);

/*===============================================================================
     Table LOGEMENT
/*===============================================================================*/	
SAVEPOINT LOGEMENTS;
/* logements Village Casa-Dali */
-- logements Casa-Dali - type B2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(8,
		 'Casa-Dali',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(9,
		 'Casa-Dali',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(11,
		 'Casa-Dali',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(18,
		 'Casa-Dali',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(19,
		 'Casa-Dali',
		 'B2',
		 NULL);
-- logements Casa-Dali - type C2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(100,
		 'Casa-Dali',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(101,
		 'Casa-Dali',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(102,
		 'Casa-Dali',
		 'C2',
		 NULL);
-- logements Casa-Dali - type D1
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(103,
		 'Casa-Dali',
		 'D1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(104,
		 'Casa-Dali',
		 'D1',
		 NULL);
-- logements Casa-Dali - type D2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(105,
		 'Casa-Dali',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(106,
		 'Casa-Dali',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(107,
		 'Casa-Dali',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(108,
		 'Casa-Dali',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(109,
		 'Casa-Dali',
		 'D2',
		 NULL);
/* logements Village Porto-Nuevo */
-- logements Porto-Nuevo - type C2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(1,
		 'Porto-Nuevo',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(2,
		 'Porto-Nuevo',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(3,
		 'Porto-Nuevo',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(108,
		 'Porto-Nuevo',
		 'D2',
		 NULL);
/* logements Village Cuidad Blanca */
-- logements Cuidad Blanca - type A1
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(1,
		 'Cuidad Blanca',
		 'A1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(2,
		 'Cuidad Blanca',
		 'A1',
		 NULL);
-- logements Ciudad Blanca - type A2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(3,
		 'Cuidad Blanca',
		 'A2',
		 NULL);
-- logements Ciudad Blanca - type A3
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(10,
		 'Cuidad Blanca',
		 'A3',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(20,
		 'Cuidad Blanca',
		 'A3',
		 NULL);

/* logements Village Kouros */
-- logements Kouros - type A1
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(4,
		 'Kouros',
		 'A1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(5,
		 'Kouros',
		 'A1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(6,
		 'Kouros',
		 'A1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(7,
		 'Kouros',
		 'A1',
		 NULL);
-- logements Kouros - type A3
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(10,
		 'Kouros',
		 'A3',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(11,
		 'Kouros',
		 'A3',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(13,
		 'Kouros',
		 'A3',
		 NULL);
-- logements Kouros - type A4
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(1,
		 'Kouros',
		 'A4',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(2,
		 'Kouros',
		 'A4',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(3,
		 'Kouros',
		 'A4',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(16,
		 'Kouros',
		 'A4',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(17,
		 'Kouros',
		 'A4',
		 NULL);
-- logements Kouros - type B2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(8,
		 'Kouros',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(9,
		 'Kouros',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(18,
		 'Kouros',
		 'B2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(19,
		 'Kouros',
		 'B2',
		 NULL);
-- logements Kouros - type C1
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(106,
		 'Kouros',
		 'C1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(107,
		 'Kouros',
		 'C1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(108,
		 'Kouros',
		 'C1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(109,
		 'Kouros',
		 'C1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(110,
		 'Kouros',
		 'C1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(111,
		 'Kouros',
		 'C1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(112,
		 'Kouros',
		 'C1',
		 NULL);
-- logements Kouros - type C2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(100,
		 'Kouros',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(101,
		 'Kouros',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(102,
		 'Kouros',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(103,
		 'Kouros',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(104,
		 'Kouros',
		 'C2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(105,
		 'Kouros',
		 'C2',
		 NULL);
-- logements Kouros - type D1
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(113,
		 'Kouros',
		 'D1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(114,
		 'Kouros',
		 'D1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(115,
		 'Kouros',
		 'D1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(116,
		 'Kouros',
		 'D1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(117,
		 'Kouros',
		 'D1',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(118,
		 'Kouros',
		 'D1',
		 NULL);
-- logements Kouros - type D2
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(119,
		 'Kouros',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(120,
		 'Kouros',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(121,
		 'Kouros',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(122,
		 'Kouros',
		 'D2',
		 NULL);
INSERT INTO
	LOGEMENT
		(NO_LOGEMENT,
		 NOM_VILLAGE,
		 CODE_TYPE_LOGEMENT,
		 COMMENTAIRE)
	VALUES
		(123,
		 'Kouros',
		 'D2',
		 NULL);

/*===============================================================================
     Table CLIENT
/*===============================================================================*/	
SAVEPOINT CLIENTS;
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Daho',
		 'Étienne',
		 'M',
		 4503452511,
		 'Montréal',
		 NULL);

INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Fiset',
		 'Raymond',
		 'M',
		 5143456513,
		 '159, Av Turcotte, G1K 4X6, Montréal',
		 5143496879);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Gosselin',
		 'Yvonne',
		 'F',
		 4186884212,
		 '159, Rue Brown, Québec',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Dupuis',
		 'Pierre',
		 'M',
		 5143452511,
		 'Des Érables, MONTRÉAL',
		 5143496879);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Paré',
		 'Marine',
		 'F',
		 4459879351,
		 'Magog',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Caron',
		 'Léo',
		 'M',
		 5144122296,
		 '12, ROYALE, MONTREAL',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'St-Onge',
		 'Éric',
		 'M',
		 5146796600,
		 '181, St-Louis, Montréal',
		 5146795656);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Plante',
		 'Josée',
		 'F',
		 5142365510,
		 '471, Veillon, Montréal, Qc',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Fortin',
		 'Marine',
		 'F',
		 4184122296,
		 '412, 3Rue, QUEBEC',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Plante',
		 'Josée',
		 'F',
		 5142385510,
		 '471, Veillon, Montréal, Qc',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'St-Onge',
		 'Éric',
		 'M',
		 5144122296,
		 '12, ROYALE, MONTREAL',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Fiset',
		 'Valérie',
		 'F',
		 4187726453,
		 NULL,
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Roy',
		 'Paul',
		 'M',
		 5147726757,
		 '200, St-jean, montreal',
		 NULL);
INSERT INTO
	CLIENT
		(NO_CLIENT,
		 NOM,
		 PRENOM,
		 SEXE,
		 TEL_DOMICILE,
		 ADRESSE,
		 TEL_BUREAU)
	VALUES
		(SEQ_NO_CLIENT.NEXTVAL,
		 'Dallaire',
		 'Karine',
		 'F',
		 4152315212,
		 'mégantic',
		 NULL);
