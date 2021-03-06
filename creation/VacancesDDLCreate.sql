/* **********************************************************
 DDL - Create
 Schéma MRD: "Cas Village Vacances"  - VERSIONS 1 et 2
 Auteur: Dominique Bégin, Maxime Laboissonniere, Gérémy Sorlini - Cégep de Ste-Foy   
***********************************************************/


/* Création Table Client */
CREATE TABLE CLIENT (
    NO_CLIENT       NUMERIC(6,0),
    NOM             VARCHAR2(15) NOT NULL,
    PRENOM          VARCHAR2(10) NOT NULL,
    SEXE            CHAR(1) NOT NULL,
    TEL_DOMICILE    NUMERIC(10,0) NOT NULL,
    ADRESSE         VARCHAR2(50),
    TEL_BUREAU      NUMERIC(10,0),
    CONSTRAINT PK_CLIENT
        PRIMARY KEY (NO_CLIENT)
);

/* Création Table Catégorie Village */
CREATE TABLE CATEGORIE_VILLAGE (
    NO_CATEGORIE        SMALLINT,
    DESCRIPTION         VARCHAR2(50) NOT NULL UNIQUE,
    CONSTRAINT PK_CATEGORIE_VILLAGE
        PRIMARY KEY (NO_CATEGORIE),
	CONSTRAINT CHK_NO_CATEGORIE
		CHECK (NO_CATEGORIE >= 1 AND NO_CATEGORIE <= 5)
);

/* Création Table Village */
CREATE TABLE VILLAGE (
    NOM_VILLAGE         VARCHAR2(15),
    NO_CATEGORIE        SMALLINT NOT NULL,
    VILLE               VARCHAR2(10) NOT NULL,
    PAYS                VARCHAR2(10) NOT NULL,
    PRIX_TRANSPORT      NUMERIC(6,2) NOT NULL,
    CONSTRAINT PK_VILLAGE
        PRIMARY KEY (NOM_VILLAGE),
    CONSTRAINT FK1_VILLAGE
        FOREIGN KEY (NO_CATEGORIE)
        REFERENCES CATEGORIE_VILLAGE(NO_CATEGORIE),
	CONSTRAINT CHK_PRIX_TRANSPORT
		CHECK (PRIX_TRANSPORT > 0)
);

/* Création Table Réservations */
CREATE TABLE RESERVATION (
    NO_RESERVATION      NUMERIC(6,0),
    DATE_RESERVATION    DATE DEFAULT SYSDATE NOT NULL,
    NO_CLIENT           NUMERIC(6,0) NOT NULL,
    NOM_VILLAGE         VARCHAR2(15) NOT NULL,
    DEBUT_SEJOUR        DATE NOT NULL,
    FIN_SEJOUR          DATE NOT NULL,
    CONSTRAINT PK_RESERVATION
        PRIMARY KEY (NO_RESERVATION),
    CONSTRAINT FK1_RESERVATION
        FOREIGN KEY (NO_CLIENT)
        REFERENCES CLIENT(NO_CLIENT),
    CONSTRAINT FK2_RESERVATION
        FOREIGN KEY (NOM_VILLAGE)
        REFERENCES VILLAGE(NOM_VILLAGE),
	CONSTRAINT CHK_DEBUT_SEJOUR
		CHECK (DEBUT_SEJOUR < FIN_SEJOUR)
);

/* Création Table Types Logements*/
CREATE TABLE TYPE_LOGEMENT (
    CODE_TYPE_LOGEMENT      VARCHAR2(2),
    DESCRIPTION             VARCHAR2(35) NOT NULL UNIQUE,
    NB_MAX_PERSONNES        SMALLINT NOT NULL,
    CONSTRAINT PK_TYPE_LOGEMENT
        PRIMARY KEY (CODE_TYPE_LOGEMENT),
	CONSTRAINT CHK_CODE_TYPE_LOGEMENT
		CHECK (CODE_TYPE_LOGEMENT LIKE '[A-Z]%' AND CODE_TYPE_LOGEMENT LIKE '%[1-9]'),
	CONSTRAINT CHK_NB_MAX_PERSONNES
		CHECK (NB_MAX_PERSONNES <= 10)
);

/* Création Table Tarifs Nuit*/
CREATE TABLE TARIF_NUIT (
    CATEGORIE       SMALLINT NOT NULL,
    TYPE_LOGEMENT   VARCHAR2(2) NOT NULL,
    TARIF_UNITAIRE  NUMERIC(5,2) NOT NULL,
    CONSTRAINT PK_TARIF_NUIT
        PRIMARY KEY (CATEGORIE, TYPE_LOGEMENT),
    CONSTRAINT FK1_TARIF_NUIT
        FOREIGN KEY (CATEGORIE)
        REFERENCES CATEGORIE_VILLAGE(NO_CATEGORIE),
    CONSTRAINT FK2_TARIF_NUIT
        FOREIGN KEY (TYPE_LOGEMENT)
        REFERENCES TYPE_LOGEMENT(CODE_TYPE_LOGEMENT),
	CONSTRAINT CHK_TARIF_UNITAIRE
		CHECK (TARIF_UNITAIRE >= 20 AND TARIF_UNITAIRE <= 300)
);

/* Création Table Logement*/
CREATE TABLE LOGEMENT (
    NO_LOGEMENT             SMALLINT,
    NOM_VILLAGE             VARCHAR2(15),
    CODE_TYPE_LOGEMENT      VARCHAR2(15) NOT NULL,
    COMMENTAIRE             VARCHAR2(75),
    CONSTRAINT PK_LOGEMENT
        PRIMARY KEY (NO_LOGEMENT, NOM_VILLAGE),
    CONSTRAINT FK1_LOGEMENT
        FOREIGN KEY (NOM_VILLAGE)
        REFERENCES VILLAGE(NOM_VILLAGE),
    CONSTRAINT FK2_LOGEMENT
        FOREIGN KEY (CODE_TYPE_LOGEMENT)
        REFERENCES TYPE_LOGEMENT(CODE_TYPE_LOGEMENT)
);

/* Création Table Sejours*/
CREATE TABLE SEJOUR (
    NO_LOGEMENT             SMALLINT,
    NOM_VILLAGE             VARCHAR2(15),
    NO_RESERVATION          NUMERIC(6,0),
    NB_PERSONNES            SMALLINT NOT NULL,
    CONSTRAINT PK_SEJOUR
        PRIMARY KEY (NO_LOGEMENT, NOM_VILLAGE, NO_RESERVATION),
    CONSTRAINT FK1_SEJOUR
        FOREIGN KEY (NO_LOGEMENT, NOM_VILLAGE)
        REFERENCES LOGEMENT(NO_LOGEMENT, NOM_VILLAGE),
    CONSTRAINT FK3_SEJOUR
        FOREIGN KEY (NO_RESERVATION)
        REFERENCES RESERVATION(NO_RESERVATION)
);

DROP SEQUENCE SEQ_NO_CLIENT;

/* Script Séquence Numéro Client */
CREATE SEQUENCE SEQ_NO_CLIENT
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;

DROP SEQUENCE SEQ_NO_RESERVATION;

/* Script Séquence Numéro Réservations */
CREATE SEQUENCE SEQ_NO_RESERVATION
	MINVALUE 1
	MAXVALUE 999999
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
