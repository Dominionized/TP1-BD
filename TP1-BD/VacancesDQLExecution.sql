SQL> START VacancesDQL
SQL> /*********************************************************
SQL>  DQL
SQL>  Schéma MRD: "Cas Village Vacances"  - VERSIONS 1 et 2
SQL>  Auteur: Dominique Bégin, Maxime Laboissonniere, Gérémy Sorlini - Cégep de Ste-Foy
SQL> ***********************************************************/
SQL> 
SQL> 
SQL> /********************** REQUÊTE 1 *************************
SQL> • Produire la liste des villages vacances.
SQL> • Pour chaque village, indiquer dans l’ordre :
SQL> - nom du village,
SQL> - nom du pays,
SQL> - numéro de la catégorie du village,
SQL> - description de la catégorie du village,
SQL> - prix du transport par personne (affichage, exemple : 174.50 $Can).
SQL> • Trier par pays, puis par catégorie de village (no), puis par village.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     V.NOM_VILLAGE AS Nom,
  3  	     V.PAYS AS Pays,
  4  	     V.NO_CATEGORIE AS "Code Catégorie",
  5  	     C.DESCRIPTION AS "Description Catégorie",
  6  	     TO_CHAR(V.PRIX_TRANSPORT, '9,999.00') || ' $CAN'  AS "Coût Transport Par Personne"
  7  FROM VILLAGE V
  8  		     INNER JOIN CATEGORIE_VILLAGE C
  9  			     ON      V.NO_CATEGORIE = C.NO_CATEGORIE
 10  ORDER BY
 11  	     V.PAYS,
 12  	     V.NO_CATEGORIE,
 13  	     V.NOM_VILLAGE;

NOM             PAYS       Code Cat??gorie Description Cat??gorie                             Co??t Transpor            
--------------- ---------- --------------- -------------------------------------------------- --------------            
Porto-Nuevo     Espagne                  2 tennis, piscine, golf, sauna                          949.00 $CAN            
Casa-Dali       Espagne                  3 tennis, piscine, garderie                           1,059.00 $CAN            
Cuidad Blanca   Espagne                  3 tennis, piscine, garderie                             800.00 $CAN            
Kouros          Gr?ce                    3 tennis, piscine, garderie                           1,239.00 $CAN            

SQL> 
SQL> /********************** REQUÊTE 2 *************************
SQL> • Produire la liste des tarifs des nuitées pour chaque type de logement.
SQL> • Pour chaque tarif, indiquer dans l’ordre :
SQL> - code du type de logement,
SQL> - description du type de logement,
SQL> - numéro de la catégorie du village,
SQL> - description de la catégorie du village,
SQL> - prix/nuit/personne en $ canadiens (affichage, exemple : 50.50 $Can).
SQL> • Trier par type de logement, puis catégorie de village
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     TL.CODE_TYPE_LOGEMENT,
  3  	     TL.DESCRIPTION,
  4  	     CV.NO_CATEGORIE,
  5  	     CV.DESCRIPTION,
  6  	     TO_CHAR(TN.TARIF_UNITAIRE, '9999.99') || ' $Can' AS TARIF_NUIT
  7  FROM
  8  	     TARIF_NUIT TN
  9  		     INNER JOIN TYPE_LOGEMENT TL
 10  			     ON TN.TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
 11  		     INNER JOIN CATEGORIE_VILLAGE CV
 12  			     ON TN.CATEGORIE = CV.NO_CATEGORIE
 13  ORDER BY
 14  	     TL.CODE_TYPE_LOGEMENT,
 15  	     CV.NO_CATEGORIE;

CO DESCRIPTION                         NO_CATEGORIE DESCRIPTION                                        TARIF_NUIT       
-- ----------------------------------- ------------ -------------------------------------------------- -------------    
A1 Chambre 4 personnes avec douche                1 tennis, piscine, mini-golf, golf, sauna, garderie     45.00 $Can    
A1 Chambre 4 personnes avec douche                2 tennis, piscine, golf, sauna                          40.00 $Can    
A1 Chambre 4 personnes avec douche                3 tennis, piscine, garderie                             35.00 $Can    
A2 Chambre 4 personnes avec bain                  1 tennis, piscine, mini-golf, golf, sauna, garderie     50.00 $Can    
A2 Chambre 4 personnes avec bain                  2 tennis, piscine, golf, sauna                          45.00 $Can    
A2 Chambre 4 personnes avec bain                  3 tennis, piscine, garderie                             40.00 $Can    
A3 Chambre 2 personnes avec bain                  1 tennis, piscine, mini-golf, golf, sauna, garderie     60.00 $Can    
A3 Chambre 2 personnes avec bain                  2 tennis, piscine, golf, sauna                          50.00 $Can    
A3 Chambre 2 personnes avec bain                  3 tennis, piscine, garderie                             45.00 $Can    
A4 Chambre 1 personne avec bain                   1 tennis, piscine, mini-golf, golf, sauna, garderie     70.00 $Can    
A4 Chambre 1 personne avec bain                   2 tennis, piscine, golf, sauna                          60.00 $Can    

CO DESCRIPTION                         NO_CATEGORIE DESCRIPTION                                        TARIF_NUIT       
-- ----------------------------------- ------------ -------------------------------------------------- -------------    
A4 Chambre 1 personne avec bain                   3 tennis, piscine, garderie                             55.00 $Can    
B1 Suite 1 personne                               1 tennis, piscine, mini-golf, golf, sauna, garderie     75.00 $Can    
B1 Suite 1 personne                               2 tennis, piscine, golf, sauna                          65.00 $Can    
B1 Suite 1 personne                               3 tennis, piscine, garderie                             60.00 $Can    
B2 Suite 2 personnes                              1 tennis, piscine, mini-golf, golf, sauna, garderie     85.00 $Can    
B2 Suite 2 personnes                              2 tennis, piscine, golf, sauna                          75.00 $Can    
B2 Suite 2 personnes                              3 tennis, piscine, garderie                             70.00 $Can    
C1 Bungalow 4 personnes                           1 tennis, piscine, mini-golf, golf, sauna, garderie     40.00 $Can    
C1 Bungalow 4 personnes                           2 tennis, piscine, golf, sauna                          30.00 $Can    
C1 Bungalow 4 personnes                           3 tennis, piscine, garderie                             25.00 $Can    
C2 Bungalow 2 personnes                           1 tennis, piscine, mini-golf, golf, sauna, garderie     35.00 $Can    

CO DESCRIPTION                         NO_CATEGORIE DESCRIPTION                                        TARIF_NUIT       
-- ----------------------------------- ------------ -------------------------------------------------- -------------    
C2 Bungalow 2 personnes                           2 tennis, piscine, golf, sauna                          40.00 $Can    
C2 Bungalow 2 personnes                           3 tennis, piscine, garderie                             35.00 $Can    
D1 Chalet 6 personnes                             1 tennis, piscine, mini-golf, golf, sauna, garderie     40.00 $Can    
D1 Chalet 6 personnes                             2 tennis, piscine, golf, sauna                          30.00 $Can    
D1 Chalet 6 personnes                             3 tennis, piscine, garderie                             25.00 $Can    
D2 Chalet 4 personnes                             1 tennis, piscine, mini-golf, golf, sauna, garderie     50.00 $Can    
D2 Chalet 4 personnes                             2 tennis, piscine, golf, sauna                          40.00 $Can    
D2 Chalet 4 personnes                             3 tennis, piscine, garderie                             35.00 $Can    
D3 Chalet 2 personnes                             1 tennis, piscine, mini-golf, golf, sauna, garderie     80.00 $Can    
D3 Chalet 2 personnes                             2 tennis, piscine, golf, sauna                          60.00 $Can    
D3 Chalet 2 personnes                             3 tennis, piscine, garderie                             55.00 $Can    

33 rows selected.

SQL> 
SQL> /********************** REQUÊTE 3 *************************
SQL> • Produire la liste des logements pour le village Casa-Dali.
SQL> • Pour chaque logement, indiquer dans l’ordre :
SQL> - code du type de logement,
SQL> - numéro du logement.
SQL> • Trier par type de logement.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     L.CODE_TYPE_LOGEMENT AS "Type Logement",
  3  	     L.NO_LOGEMENT AS "No Logement"
  4  FROM LOGEMENT L
  5  WHERE L.NOM_VILLAGE = 'Casa-Dali'
  6  ORDER BY L.CODE_TYPE_LOGEMENT;

Ty No Logement                                                                                                          
-- -----------                                                                                                          
B2           9                                                                                                          
B2           8                                                                                                          
B2          11                                                                                                          
B2          18                                                                                                          
B2          19                                                                                                          
C2         101                                                                                                          
C2         100                                                                                                          
C2         102                                                                                                          
D1         103                                                                                                          
D1         104                                                                                                          
D2         105                                                                                                          

Ty No Logement                                                                                                          
-- -----------                                                                                                          
D2         106                                                                                                          
D2         107                                                                                                          
D2         108                                                                                                          
D2         109                                                                                                          

15 rows selected.

SQL> 
SQL> /********************** REQUÊTE 4 *************************
SQL> • Produire la liste des types de logement proposés dans le village Kouros.
SQL> • Pour chaque type de logement, indiquer dans l’ordre :
SQL> - le code du type de logement,
SQL> - la description du type de logement.
SQL> • Trier par code de type de logement.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     DISTINCT TL.CODE_TYPE_LOGEMENT AS "Type Logement",
  3  	     TL.DESCRIPTION AS "Description Logement"
  4  FROM TYPE_LOGEMENT TL
  5  	     INNER JOIN LOGEMENT L
  6  		     ON TL.CODE_TYPE_LOGEMENT = L.CODE_TYPE_LOGEMENT
  7  WHERE L.NOM_VILLAGE = 'Kouros'
  8  ORDER BY TL.CODE_TYPE_LOGEMENT;

Ty Description Logement                                                                                                 
-- -----------------------------------                                                                                  
A1 Chambre 4 personnes avec douche                                                                                      
A3 Chambre 2 personnes avec bain                                                                                        
A4 Chambre 1 personne avec bain                                                                                         
B2 Suite 2 personnes                                                                                                    
C1 Bungalow 4 personnes                                                                                                 
C2 Bungalow 2 personnes                                                                                                 
D1 Chalet 6 personnes                                                                                                   
D2 Chalet 4 personnes                                                                                                   

8 rows selected.

SQL> 
SQL> /********************** REQUÊTE 5 *************************
SQL> • Produire la liste des tarifs des nuitées pour le type de logement D3.
SQL> • Pour chaque prix, indiquer dans l’ordre :
SQL> - code du type de logement,
SQL> - description du type de logement,
SQL> - numéro de la catégorie du village,
SQL> - description de la catégorie du village,
SQL> - prix/nuit/personne en $ canadiens (affichage, exemple : 50.00 $Can).
SQL> • Trier par catégorie de village.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     TN.TYPE_LOGEMENT AS "Type Logement",
  3  	     TL.DESCRIPTION AS "Description Logement",
  4  	     TN.CATEGORIE AS "Catégorie Village",
  5  	     C.DESCRIPTION AS "Catégorie Village",
  6  	     TO_CHAR(TN.TARIF_UNITAIRE, '9,999.00') || '$Can' AS "Prix/Nuit/Personne"
  7  FROM TARIF_NUIT TN
  8  	     INNER JOIN TYPE_LOGEMENT TL
  9  		     ON TN.TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
 10  	     INNER JOIN CATEGORIE_VILLAGE C
 11  		     ON TN.CATEGORIE = C.NO_CATEGORIE
 12  WHERE TN.TYPE_LOGEMENT = 'D3'
 13  ORDER BY TN.CATEGORIE;

Ty Description Logement                Cat??gorie Village Cat??gorie Village                                            
-- ----------------------------------- ------------------ --------------------------------------------------            
Prix/Nuit/Per                                                                                                           
-------------                                                                                                           
D3 Chalet 2 personnes                                   1 tennis, piscine, mini-golf, golf, sauna, garderie             
    80.00$Can                                                                                                           
                                                                                                                        
D3 Chalet 2 personnes                                   2 tennis, piscine, golf, sauna                                  
    60.00$Can                                                                                                           
                                                                                                                        
D3 Chalet 2 personnes                                   3 tennis, piscine, garderie                                     
    55.00$Can                                                                                                           
                                                                                                                        

SQL> 
SQL> /********************** REQUÊTE 6 *************************
SQL> • Produire le calendrier d’occupation du logement 108 du village Casa Dali pour le mois de mars
SQL> 2014.
SQL> • Indiquer dans l’ordre :
SQL> •
SQL> numéro du logement,
SQL> •
SQL> nom du village,
SQL> •
SQL> nom du pays,
SQL> •
SQL> code du type de logement,
SQL> •
SQL> description du type de logement,
SQL> •
SQL> Version 1 : pour chaque réservation concernant le logement :
SQL> • numéro de la réservation,
SQL> • date de la première nuit (format jj/mm/aaaa),
SQL> • date de la dernière nuit (format jj/mm/aaaa).
SQL> •
SQL> Version 2 : pour chaque date de séjour concernant le logement :
SQL> • numéro de la réservation,
SQL> • date du séjour (de la nuit occupée) (format jj/mm/aaaa).
SQL> • Trier par date(s).
SQL> ***********************************************************/
SQL> 
SQL> SET LINESIZE 120;
SQL> SELECT
  2  	     L.NO_LOGEMENT AS "Numéro Logement",
  3  	     L.NOM_VILLAGE AS "Village",
  4  	     V.PAYS AS Pays,
  5  	     L.CODE_TYPE_LOGEMENT AS "Type Logement",
  6  	     TL.DESCRIPTION AS "Description Logement",
  7  	     R.NO_RESERVATION AS "Numéro Réservation",
  8  	     R.DEBUT_SEJOUR AS "Première Nuit",
  9  	     R.FIN_SEJOUR AS "Dernière Nuit"
 10  FROM LOGEMENT L
 11  	     INNER JOIN VILLAGE V
 12  		     ON L.NOM_VILLAGE = V.NOM_VILLAGE
 13  	     INNER JOIN RESERVATION R
 14  		     ON V.NOM_VILLAGE = R.NOM_VILLAGE
 15  	     INNER JOIN TYPE_LOGEMENT TL
 16  		     ON L.CODE_TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
 17  WHERE L.NO_LOGEMENT = 106
 18  AND     L.NOM_VILLAGE = 'Casa-Dali'
 19  AND R.DEBUT_SEJOUR > TO_DATE('01/04/2014', 'DD/MM/YYYY')
 20  AND R.FIN_SEJOUR < TO_DATE('28/02/2014', 'DD/MM/YYYY')
 21  ORDER BY R.DEBUT_SEJOUR;

no rows selected

SQL> 
SQL> /********************** REQUÊTE 7 *************************
SQL> • Produire les confirmations pour toutes les réservations effectuées (date de réservation) entre le
SQL> 12 et le 20 février 2014 inclusivement.
SQL> • Pour chaque réservation, indiquer dans l’ordre :
SQL> - numéro de la réservation,
SQL> - nom du village,
SQL> - date de départ (format jj/mm/aaaa),
SQL> - date de retour (format jj/mm/aaaa),
SQL> - nombre total de personnes concernées par la réservation,
SQL> - numéro du client,
SQL> - nom du client,
SQL> - prénom du client.
SQL> • Trier par date de réservation, puis par numéro de réservation.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     R.NO_RESERVATION AS "Numéro Réservation",
  3  	     R.NOM_VILLAGE AS "Nom Village",
  4  	     R.DEBUT_SEJOUR AS "Date Départ",
  5  	     R.FIN_SEJOUR AS "Date Retour",
  6  	     S.NB_PERSONNES AS "Nombre Personnes",
  7  	     R.NO_CLIENT AS "Numéro Client",
  8  	     C.NOM AS "Nom Client",
  9  	     C.PRENOM AS "Prénom Client"
 10  FROM RESERVATION R
 11  	     INNER JOIN SEJOUR S
 12  		     ON R.NO_RESERVATION = S.NO_RESERVATION
 13  	     AND R.NOM_VILLAGE = S.NOM_VILLAGE
 14  	     INNER JOIN CLIENT C
 15  		     ON R.NO_CLIENT = C.NO_CLIENT
 16  WHERE
 17  	     R.DATE_RESERVATION BETWEEN TO_DATE('12/02/2014', 'DD/MM/YYYY')
 18  AND TO_DATE('20/02/2014', 'DD/MM/YYYY')
 19  ORDER BY
 20  	     R.DATE_RESERVATION,
 21  	     R.NO_RESERVATION;

Num??ro R??servation Nom Village     Date D??p Date Reto Nombre Personnes Num??ro Client Nom Client      Pr??nom Cl     
-------------------- --------------- --------- --------- ---------------- -------------- --------------- ----------     
                   2 Casa-Dali       15-MAR-14 20-MAR-14                4              2 Daho            ?tienne        
                   2 Casa-Dali       15-MAR-14 20-MAR-14                2              2 Daho            ?tienne        
                   3 Casa-Dali       13-MAR-14 19-MAR-14                2              9 Plante          Jos?e          
                   3 Casa-Dali       13-MAR-14 19-MAR-14                2              9 Plante          Jos?e          
                   5 Casa-Dali       09-MAR-14 13-MAR-14                3              8 St-Onge         ?ric           
                  16 Porto-Nuevo     02-MAR-15 07-MAR-15                2              4 Gosselin        Yvonne         
                  16 Porto-Nuevo     02-MAR-15 07-MAR-15                2              4 Gosselin        Yvonne         
                  16 Porto-Nuevo     02-MAR-15 07-MAR-15                2              4 Gosselin        Yvonne         
                  16 Porto-Nuevo     02-MAR-15 07-MAR-15                2              4 Gosselin        Yvonne         
                   7 Casa-Dali       20-MAR-14 26-MAR-14                5              6 Par?            Marine         
                   7 Casa-Dali       20-MAR-14 26-MAR-14                4              6 Par?            Marine         

Num??ro R??servation Nom Village     Date D??p Date Reto Nombre Personnes Num??ro Client Nom Client      Pr??nom Cl     
-------------------- --------------- --------- --------- ---------------- -------------- --------------- ----------     
                  11 Casa-Dali       31-MAR-14 06-APR-14                6              8 St-Onge         ?ric           
                  19 Porto-Nuevo     01-MAR-14 02-MAR-14                3              5 Dupuis          Pierre         

13 rows selected.

SQL> 
SQL> /********************** REQUÊTE 8 *************************
SQL> • Produire la liste des clients de Montréal.
SQL> • Pour chaque client habitant Montréal, indiquer dans l’ordre :
SQL> - numéro du client,
SQL> - nom du client,
SQL> - prénom du client,
SQL> - adresse du client,
SQL> - téléphone domicile du client (affichage, exemple : (514)412-2296)
SQL> • Trier par no de client.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     C.NO_CLIENT AS "Numéro Client",
  3  	     C.NOM AS "Nom",
  4  	     C.PRENOM AS "Prenom",
  5  	     C.ADRESSE AS "Adresse",
  6  	     '(' || SUBSTR(C.TEL_DOMICILE, 1, 3) || ')' || SUBSTR(C.TEL_DOMICILE, 4, 3) || '-' || SUBSTR(C.TEL_DOMICILE, -4, 4) AS "Téléphone Domicile"
  7  FROM CLIENT C
  8  WHERE
  9  	 C.ADRESSE LIKE '%ontr%eal'
 10  ORDER BY C.NO_CLIENT;

Num??ro Client Nom             Prenom     Adresse                                            T??l??phone D              
-------------- --------------- ---------- -------------------------------------------------- -------------              
            14 Roy             Paul       200, St-jean, montreal                             (514)772-6757              

SQL> 
SQL> /********************** REQUÊTE 9 *************************
SQL> • Calculer le tarif moyen des nuitées pour chaque catégorie de village.
SQL> • Pour chaque catégorie de village, indiquer dans l’ordre :
SQL> - numéro de la catégorie du village,
SQL> - description de la catégorie du village,
SQL> - prix moyen par personne et par nuit des logements
SQL> (affichage, exemple : 43.64
SQL> $Can).
SQL> • Trier par catégorie de village.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     DISTINCT C.NO_CATEGORIE AS "Catégorie Village",
  3  	     C.DESCRIPTION AS "Description Catégorie",
  4  	     TO_CHAR(AVG(T.TARIF_UNITAIRE), '9,999.00') || ' $Can' AS "Tarif Moyen"
  5  FROM CATEGORIE_VILLAGE C
  6  	     INNER JOIN TARIF_NUIT T
  7  		     ON C.NO_CATEGORIE = T.CATEGORIE
  8  GROUP BY C.NO_CATEGORIE, C.DESCRIPTION
  9  ORDER BY C.NO_CATEGORIE;

Cat??gorie Village Description Cat??gorie                             Tarif Moyen                                       
------------------ -------------------------------------------------- --------------                                    
                 1 tennis, piscine, mini-golf, golf, sauna, garderie      57.27 $Can                                    
                 2 tennis, piscine, golf, sauna                           48.64 $Can                                    
                 3 tennis, piscine, garderie                              43.64 $Can                                    

SQL> 
SQL> /********************** REQUÊTE 10 *************************
SQL> • Produire un rapport d’occupation des logements du village Casa-Dali pour le mois de mars 2014.
SQL> • Pour chaque logement du village, indiquer dans l’ordre :
SQL> - numéro du logement,
SQL> - nombre de nuits occupées.
SQL> • Trier par logement.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     L.NO_LOGEMENT AS "Numéro Logement",
  3  	     NVL(SUM(LEAST(R.FIN_SEJOUR, TO_DATE('31/03/2014', 'DD/MM/YYYY')) - GREATEST(R.DEBUT_SEJOUR, TO_DATE('01/03/2014', 'DD/MM/YYYY'))), 0) AS "Nombre Nuits Occupées"
  4  FROM LOGEMENT L
  5  	     LEFT OUTER JOIN SEJOUR S
  6  		     ON L.NO_LOGEMENT = S.NO_LOGEMENT AND L.NOM_VILLAGE = S.NOM_VILLAGE
  7  			     LEFT JOIN RESERVATION R
  8  				     ON S.NO_RESERVATION = R.NO_RESERVATION
  9  WHERE
 10  	     L.NOM_VILLAGE = 'Casa-Dali'
 11  GROUP BY L.NO_LOGEMENT
 12  ORDER BY L.NO_LOGEMENT;

Num??ro Logement Nombre Nuits Occup??es                                                                                 
---------------- ----------------------                                                                                 
               8                      0                                                                                 
               9                     30                                                                                 
              11                      0                                                                                 
              18                      6                                                                                 
              19                     10                                                                                 
             100                     11                                                                                 
             101                     11                                                                                 
             102                     11                                                                                 
             103                      6                                                                                 
             104                      7                                                                                 
             105                      0                                                                                 

Num??ro Logement Nombre Nuits Occup??es                                                                                 
---------------- ----------------------                                                                                 
             106                     11                                                                                 
             107                      0                                                                                 
             108                     12                                                                                 
             109                      5                                                                                 

15 rows selected.

SQL> 
SQL> /********************** REQUÊTE 11 *************************
SQL> • Produire un rapport d’occupation des logements (nombre de nuits occupées pour une période
SQL> donnée) du village Casa-Dali pour la période du 7 mars au 23 mars 2014 inclusivement.
SQL> • Pour chaque logement du village dont le taux d’occupation est inférieur à 30%, indiquer dans
SQL> l’ordre :
SQL> - taux d’occupation (affichage, exemple : 24%),
SQL> - numéro du logement,
SQL> - code du type de logement,
SQL> - description du type de logement.
SQL> • Trier par taux d’occupation.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('23/03/2014', 'DD/MM/YYYY')), TO_DATE('07/03/2014', 'DD/MM/YYYY'))- LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('07/03/2014', 'DD/MM/YYYY')), TO_DATE('23/03/2014', 'DD/MM/YYYY'))), 0 )/ 16 * 100 || '%' AS "Taux d'occupation",
  3  	     L.NO_LOGEMENT AS "Numéro Logement",
  4  	 L.CODE_TYPE_LOGEMENT AS "Code du type du logement",
  5  	 TL.DESCRIPTION AS "Description"
  6  FROM LOGEMENT L
  7  	     LEFT OUTER JOIN SEJOUR S
  8  		     ON L.NO_LOGEMENT = S.NO_LOGEMENT AND L.NOM_VILLAGE = S.NOM_VILLAGE
  9  			     LEFT JOIN RESERVATION R
 10  				     ON S.NO_RESERVATION = R.NO_RESERVATION
 11  	 INNER JOIN TYPE_LOGEMENT TL
 12  	     ON L.CODE_TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
 13  WHERE
 14  	     L.NOM_VILLAGE = 'Casa-Dali'
 15  HAVING
 16  	     NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('23/03/2014', 'DD/MM/YYYY')), TO_DATE('07/03/2014', 'DD/MM/YYYY'))- LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('07/03/2014', 'DD/MM/YYYY')), TO_DATE('23/03/2014', 'DD/MM/YYYY'))), 0 )/ 16 * 100 < 30
 17  GROUP BY L.NO_LOGEMENT, L.CODE_TYPE_LOGEMENT, TL.DESCRIPTION
 18  ORDER BY "Taux d'occupation";

Taux d'occupation                         Num??ro Logement Co Description                                               
----------------------------------------- ---------------- -- -----------------------------------                       
0%                                                     107 D2 Chalet 4 personnes                                        
0%                                                      11 B2 Suite 2 personnes                                         
0%                                                       8 B2 Suite 2 personnes                                         
0%                                                     105 D2 Chalet 4 personnes                                        
18.75%                                                 103 D1 Chalet 6 personnes                                        

SQL> 
SQL> /********************** REQUÊTE 12 *************************
SQL> • Produire la liste des logements du village Casa-Dali disponibles pour toute la période du 17 au 23
SQL> mars 2014 inclusivement.
SQL> • Pour chaque logement disponible, indiquer dans l’ordre :
SQL> - numéro du logement,
SQL> - code du type de logement,
SQL> - description du type de logement.
SQL> • Trier par logement.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     L.NO_LOGEMENT AS "Numéro Logement",
  3  	 L.CODE_TYPE_LOGEMENT AS "Code du type logement",
  4  	 TYPE_LOGEMENT.DESCRIPTION AS "Description"
  5  FROM LOGEMENT L
  6  	     LEFT OUTER JOIN SEJOUR S
  7  		     ON L.NO_LOGEMENT = S.NO_LOGEMENT AND L.NOM_VILLAGE = S.NOM_VILLAGE
  8  			     LEFT JOIN RESERVATION R
  9  				     ON S.NO_RESERVATION = R.NO_RESERVATION
 10  	 INNER JOIN TYPE_LOGEMENT
 11  	     ON L.CODE_TYPE_LOGEMENT = TYPE_LOGEMENT.CODE_TYPE_LOGEMENT
 12  WHERE
 13  	     L.NOM_VILLAGE = 'Casa-Dali'
 14  HAVING
 15  	     NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('23/03/2014', 'DD/MM/YYYY')), TO_DATE('07/03/2014', 'DD/MM/YYYY'))- LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('07/03/2014', 'DD/MM/YYYY')), TO_DATE('23/03/2014', 'DD/MM/YYYY'))), 0 ) = 0
 16  GROUP BY L.NO_LOGEMENT, L.CODE_TYPE_LOGEMENT, TYPE_LOGEMENT.DESCRIPTION
 17  ORDER BY L.NO_LOGEMENT;

Num??ro Logement Co Description                                                                                         
---------------- -- -----------------------------------                                                                 
               8 B2 Suite 2 personnes                                                                                   
              11 B2 Suite 2 personnes                                                                                   
             105 D2 Chalet 4 personnes                                                                                  
             107 D2 Chalet 4 personnes                                                                                  

SQL> 
SQL> /********************** REQUÊTE 13 *************************
SQL> • Produire la liste des réservations sans séjour.
SQL> • Pour chaque réservation, indiquer dans l’ordre :
SQL> - numéro de la réservation,
SQL> - date de la réservation (format jj/mm/aaaa),
SQL> - nom du client,
SQL> - prénom du client.
SQL> • Trier par réservation (numéro).
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     R.NO_RESERVATION AS "Numéro Réservation",
  3  	     TO_CHAR(R.DATE_RESERVATION, 'DD/MM/YYYY') AS "Date Réservation",
  4  	     C.NOM AS "Nom Client",
  5  	     C.PRENOM AS "Prenom Client"
  6  FROM RESERVATION R
  7  	     INNER JOIN CLIENT C
  8  		     ON R.NO_CLIENT = C.NO_CLIENT
  9  WHERE R.NO_RESERVATION NOT IN (SELECT NO_RESERVATION FROM SEJOUR)
 10  ORDER BY R.NO_RESERVATION;

Num??ro R??servation Date R??se Nom Client      Prenom Cli                                                              
-------------------- ---------- --------------- ----------                                                              
                   4 13/01/2014 Gosselin        Yvonne                                                                  
                  15 17/02/2014 Gosselin        Yvonne                                                                  

SQL> 
SQL> /********************** REQUÊTE 14 *************************
SQL> • Calculer le montant total hors taxes à facturer pour les réservations effectuées au mois de février
SQL> 2014 (date de la réservation). Le montant facturé est calculé ainsi :
SQL> (Prix transport/personne * nombre total personnes) +
SQL> Σ [pour chaque logement] (nombre nuits * nombre personnes * tarif/nuit/personne)
SQL> Ainsi, le montant facturé pour la réservation no 2, 5 nuits et 2 logements (108 et 109) dans le village
SQL> Casa-Dali, est de 7404 $.
SQL> • Pour chaque réservation, indiquer dans l’ordre :
SQL> - numéro de la réservation,
SQL> - date de la réservation (format jj/mm/aaaa),
SQL> - montant hors taxes à facturer (affichage, exemple : 2138.00 $Can),
SQL> - nom du pays,
SQL> - nom du village.
SQL> • Trier par réservation.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	 DISTINCT R.NO_RESERVATION AS "No. réservation",
  3  	 TO_CHAR(R.DATE_RESERVATION, 'DD/MM/YYYY') AS "Date de réservation",
  4  	 TO_CHAR((V.PRIX_TRANSPORT * SUM(S.NB_PERSONNES)) + SUM((R.FIN_SEJOUR - R.DEBUT_SEJOUR) * S.NB_PERSONNES * TN.TARIF_UNITAIRE), '99999.00') || '$ Can' AS "Prix",
  5  	 R.NOM_VILLAGE As "Nom village",
  6  	 V.PAYS As "Pays"
  7  FROM RESERVATION R
  8  	 INNER JOIN VILLAGE V
  9  	     ON R.NOM_VILLAGE = V.NOM_VILLAGE
 10  	     INNER JOIN CATEGORIE_VILLAGE CV
 11  		 ON V.NO_CATEGORIE = CV.NO_CATEGORIE
 12  	 INNER JOIN SEJOUR S
 13  	     ON R.NO_RESERVATION = S.NO_RESERVATION
 14  	     AND R.NOM_VILLAGE = S.NOM_VILLAGE
 15  	     INNER JOIN LOGEMENT L
 16  		 ON S.NO_LOGEMENT = L.NO_LOGEMENT
 17  		 AND S.NOM_VILLAGE = L.NOM_VILLAGE
 18  		 INNER JOIN TYPE_LOGEMENT TL
 19  		     ON L.CODE_TYPE_LOGEMENT = TL.CODE_TYPE_LOGEMENT
 20  		     INNER JOIN TARIF_NUIT TN
 21  			 ON TL.CODE_TYPE_LOGEMENT = TN.TYPE_LOGEMENT
 22  			 AND CV.NO_CATEGORIE = TN.CATEGORIE
 23  WHERE
 24  	 R.DATE_RESERVATION BETWEEN TO_DATE('01/02/2014', 'DD/MM/YYYY') AND TO_DATE('28/02/2014', 'DD/MM/YYYY')
 25  GROUP BY
 26  	 R.NO_RESERVATION, R.DATE_RESERVATION, R.NOM_VILLAGE, V.PAYS, V.NOM_VILLAGE, V.PRIX_TRANSPORT
 27  ORDER BY
 28  	 R.NO_RESERVATION;

No. r??servation Date de r? Prix           Nom village     Pays                                                         
---------------- ---------- -------------- --------------- ----------                                                   
               2 12/02/2014   7404.00$ Can Casa-Dali       Espagne                                                      
               3 13/02/2014   5916.00$ Can Casa-Dali       Espagne                                                      
               5 15/02/2014   3597.00$ Can Casa-Dali       Espagne                                                      
               6 24/02/2014  19210.00$ Can Casa-Dali       Espagne                                                      
               7 19/02/2014  11121.00$ Can Casa-Dali       Espagne                                                      
              11 19/02/2014   7614.00$ Can Casa-Dali       Espagne                                                      
              16 17/02/2014   9192.00$ Can Porto-Nuevo     Espagne                                                      
              17 28/02/2014   2138.00$ Can Porto-Nuevo     Espagne                                                      
              18 28/02/2014   4756.00$ Can Porto-Nuevo     Espagne                                                      
              19 19/02/2014   2967.00$ Can Porto-Nuevo     Espagne                                                      
              20 24/02/2014   1519.00$ Can Kouros          Gr?ce                                                        

No. r??servation Date de r? Prix           Nom village     Pays                                                         
---------------- ---------- -------------- --------------- ----------                                                   
              21 25/02/2014   6705.00$ Can Kouros          Gr?ce                                                        

12 rows selected.

SQL> 
SQL> /********************** REQUÊTE 15 *************************
SQL> • Le ou les villages avec le plus grand nombre de nuitées vendues pour le mois de mars 2014. Une
SQL> nuitée représente l’hébergement d’une personne pour une nuit.
SQL> • Indiquer dans l’ordre :
SQL> - pays,
SQL> - nom village,
SQL> - nombre de nuitées.
SQL> ***********************************************************/
SQL> 
SQL> SELECT
  2  	     V.PAYS AS "Pays",
  3  	     V.NOM_VILLAGE AS "Nom du village",
  4  	     NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('31-03-2015', 'dd-mm-yyyy')), TO_DATE('01-03-2015', 'dd-mm-yyyy')) - LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('01-03-2015', 'dd-mm-yyyy')), TO_DATE('31-03-2015', 'dd-mm-yyyy'))), 0) AS "Nombre de nuitées"
  5  FROM
  6  	     VILLAGE V
  7  		     INNER JOIN RESERVATION R
  8  			     ON V.NOM_VILLAGE = R.NOM_VILLAGE
  9  				     LEFT JOIN SEJOUR S
 10  					     ON R.NO_RESERVATION = S.NO_RESERVATION AND
 11  						R.NOM_VILLAGE = S.NOM_VILLAGE
 12  HAVING
 13  	     NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('31-03-2015', 'dd-mm-yyyy')), TO_DATE('01-03-2015', 'dd-mm-yyyy')) - LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('01-03-2015', 'dd-mm-yyyy')), TO_DATE('31-03-2015', 'dd-mm-yyyy'))), 0) = (
 14  	     SELECT
 15  		 MAX("Nombre de nuitées")
 16  	     FROM
 17  	     (
 18  		 SELECT
 19  		     V.PAYS,
 20  		     V.NOM_VILLAGE,
 21  		     NVL(SUM(GREATEST(LEAST(R.FIN_SEJOUR, TO_DATE('31-03-2015', 'dd-mm-yyyy')), TO_DATE('01-03-2015', 'dd-mm-yyyy')) - LEAST(GREATEST(R.DEBUT_SEJOUR, TO_DATE('01-03-2015', 'dd-mm-yyyy')), TO_DATE('31-03-2015', 'dd-mm-yyyy'))), 0) AS "Nombre de nuitées"
 22  		 FROM
 23  		     VILLAGE V
 24  			 INNER JOIN RESERVATION R
 25  			     ON V.NOM_VILLAGE = R.NOM_VILLAGE
 26  				 LEFT JOIN SEJOUR S
 27  				     ON R.NO_RESERVATION = S.NO_RESERVATION AND
 28  					R.NOM_VILLAGE = S.NOM_VILLAGE
 29  		 GROUP BY
 30  		     V.PAYS,
 31  		     V.NOM_VILLAGE
 32  	     )
 33  )
 34  GROUP BY
 35  	 V.PAYS,
 36  	 V.NOM_VILLAGE;

Pays       Nom du village  Nombre de nuit??es                                                                           
---------- --------------- ------------------                                                                           
Espagne    Porto-Nuevo                     20                                                                           

SQL> SPOOL OFF
