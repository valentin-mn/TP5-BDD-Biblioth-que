DROP TABLE IF EXISTS emprunt, exemplaire, oeuvre, auteur, adherent;
CREATE TABLE IF NOT EXISTS adherent(
   id INT AUTO_INCREMENT,
   nom VARCHAR(50),
   adresse VARCHAR(255),
   date_paiement DATE,
   PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS auteur(
   id INT AUTO_INCREMENT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS oeuvre(
   id INT AUTO_INCREMENT,
   titre VARCHAR(255),
   date_parution DATE,
   photo VARCHAR(50),
   auteur_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(auteur_id) REFERENCES auteur(id)
);

CREATE TABLE IF NOT EXISTS exemplaire(
   id INT AUTO_INCREMENT,
   etat VARCHAR(50),
   date_achat DATE,
   prix DECIMAL(19,4),
   oeuvre_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(oeuvre_id) REFERENCES oeuvre(id)
);

CREATE TABLE IF NOT EXISTS emprunt(
   exemplaire_id INT,
   adherent_id INT,
   date_emprunt DATE,
   date_retour DATE,
   PRIMARY KEY(exemplaire_id, adherent_id, date_emprunt),
   FOREIGN KEY(exemplaire_id) REFERENCES exemplaire(id),
   FOREIGN KEY(adherent_id) REFERENCES adherent(id)
);

INSERT INTO auteur (id, nom, prenom) VALUES
(1, 'Christie', 'Agatha'),
(2, 'Chateaubriand', 'François-René'),
(3, 'Flaubert', 'Gustave'),
(4, 'Prévert', 'Jacques'),
(5, 'De La Fontaine', 'Jean'),
(6, 'Daudet', 'Alphonse'),
(7, 'Hugo', 'Victor'),
(8, 'Kessel', 'Joseph'),
(9, 'Duras', 'Marguerite'),
(10, 'Proust', 'Marcel'),
(11, 'Zola', 'Émile'),
(12, 'Highsmith', 'Patricia'),
(13, 'Kipling', 'Rudyard'),
(14, 'Azimov', 'Isaac'),
(15, 'Baudelaire', 'Charles');
INSERT INTO auteur (id, nom, prenom) VALUE
(16, 'Moliere', 'Jean-Baptiste Poquelin');


INSERT INTO oeuvre (id, titre, date_parution, photo, auteur_id) VALUES
(1, 'le retour de Poirot', '1960-02-12', 'leRetourDePoirot.jpg', 1);
INSERT INTO oeuvre (id, titre, date_parution, photo, auteur_id) VALUES
(2, 'Poirot quitte la scène', '1975-05-01', '', 1);
INSERT INTO oeuvre (id, titre, date_parution, photo, auteur_id) VALUES
(3, 'dix brèves rencontres', '1982-10-01', 'dixBrevesRencontres.jpg', 1),
(4, 'le miroir de la mort', '1961-01-01', 'leMiroirDuMort.jpeg', 1),
(6, 'une créature de rêve', '1992-02-01', '', 12),
(7, 'mémoire d\'outre-tombe', '1949-01-01', '', 2),
(8, 'Madame de Bovary', '1956-12-15', '', 3);
INSERT INTO oeuvre (id, titre, date_parution, photo, auteur_id) VALUES
(9, 'un amour de swam', '2004-06-01', 'unAmourDeSwann.jpeg', 9),
(10, 'les femmes savantes', '1672-03-16', '', 16),
(11, 'le misanthrope', '1666-01-01', '', 16),
(12, 'Les fleurs du mal', '1957-06-25', 'lesFleursDuMal.jpg', 15),
(13, 'petits poèmes en prose', '1969-01-01', '', 15),
(14, 'les mondes perdus', '1980-05-06', 'lesMondesPerdus.jpg', 14),
(15, 'La guerre des mondes', '1970-03-15', '', 14),
(16, 'spectacles', '1948-05-12', '', 4),
(17, 'Les fables', '1694-01-01', '', 5);

INSERT INTO oeuvre (id, titre, date_parution, photo, auteur_id) VALUES
(18, 'Le triomphe de l\'amour', '1980-05-06', '', 5),
(19, 'le livre de la jungle', '1968-12-11', '', 13),
(20, 'kim', '1901-07-01', '', 13),
(21, 'le marin de Gibraltar', '1952-07-12', '', 9),
(22, 'l’assommoir', '1976-01-01', '', 11),
(23, 'j\'accuse', '1898-01-13', '', 11),
(24, 'la terre', '1887-01-01', '', 11);


INSERT INTO exemplaire (id, etat, date_achat, prix, oeuvre_id) VALUES
(1, 'BON', '2021-08-25', '13.50', 1),
(2, 'MOYEN', '2015-09-28', '12.50', 1),
(3, 'MOYEN', '2021-05-26', '12.00', 1),
(4, 'BON', '2015-01-11', '10.00', 1),
(5, 'MAUVAIS', '2020-10-29', '13.00', 2),
(6, 'NEUF', '2021-10-29', '20.00', 2),
(7, 'BON', '2020-12-27', '7.00', 3),
(8, 'MOYEN', '2020-09-25', '13.00', 3),
(9, 'NEUF', '2015-12-29', '18.00', 4),
(10, 'NEUF', '2015-12-29', '21.00', 4),
(11, 'BON', '2015-04-29', '26.00', 4),
(12, 'BON', '2021-01-24', '22.00', 6),
(13, 'BON', '2021-01-24', '22.00', 6),
(14, 'BON', '2021-05-01', '28.00', 7),
(15, 'MAUVAIS', '2021-01-26', '28.00', 7),
(16, 'BON', '2021-01-24', '30.00', 8),
(17, 'BON', '2021-01-23', '32.00', 9),
(18, 'MAUVAIS', '2015-01-29', '17.00', 10),
(19, 'BON', '2020-10-29', '18.00', 10),
(20, 'BON', '2020-10-29', '18.00', 10),
(21, 'BON', '2020-10-29', '19.00', 10),
(22, 'BON', '2021-01-26', '20.00', 11),
(23, 'BON', '2021-10-29', '21.50', 12),
(24, 'MAUVAIS', '2021-01-24', '22.00', 13),
(25, 'BON', '2015-01-28', '22.00', 13),
(26, 'MAUVAIS', '2021-01-23', '26.00', 14),
(27, 'MOYEN', '2015-12-26', '13.00', 14),
(28, 'BON', '2021-02-23', '12.00', 15),
(29, 'BON', '2021-10-29', '15.00', 15),
(30, 'MAUVAIS', '2021-01-26', '32.00', 16),
(31, 'BON', '2021-01-23', '19.00', 17),
(32, 'MAUVAIS', '2017-10-29', '19.00', 17),
(33, 'BON', '2020-01-23', '20.00', 19),
(34, 'BON', '2021-01-25', '11.00', 19),
(35, 'MAUVAIS', '2020-10-29', '15.00', 19),
(36, 'NEUF', '2021-10-29', '18.00', 19),
(37, 'BON', '2021-01-23', '8.00', 19),
(38, 'MAUVAIS', '2020-09-28', '18.00', 20),
(39, 'BON', '2020-12-26', '18.00', 20),
(40, 'BON', '2021-01-23', '11.00', 20);


INSERT INTO adherent (id, nom, adresse, date_paiement) VALUES
(1, 'billot', 'Montbeliard', '2021-11-03'),
(2, 'lauvernay', 'sevenans', '2021-06-13'),
(3, 'axelrad', 'sevenans', '2021-01-12'),
(4, 'bedez', 'hericourt', '2021-04-17'),
(5, 'berger', 'les glacis', '2013-11-03'),
(6, 'cambot', 'sevenans', '2021-12-15'),
(7, 'bonilla', 'sochaux', '2021-02-17'),
(8, 'asproitis', 'grenoble', '2021-12-04'),
(9, 'pereira', 'danjoutin', '2021-11-03'),
(10, 'dupont', 'grenoble', '2021-03-14'),
(11, 'durant', 'belfort', '2021-12-16'),
(12, 'piton', 'belfort', '2021-11-03');

INSERT INTO emprunt (adherent_id, exemplaire_id, date_emprunt, date_retour) VALUES
(6, 2, '2021-09-21', '2021-09-28'),
(7, 2, '2021-10-21', '2021-10-28'),
(8, 2, '2021-11-21', '2021-11-28'),
(3, 3, '2021-09-13', NULL),
(2, 4, '2021-12-01', NULL),
(2, 5, '2021-08-23', '2021-09-23'),
(2, 5, '2021-12-15', NULL),
(3, 5, '2021-07-26', '2021-08-23'),
(3, 5, '2021-11-23', '2021-12-24'),
(4, 6, '2022-01-22', '2022-01-23'),
(4, 6, '2022-01-25', NULL),
(3, 7, '2022-02-22', '2022-03-29'),
(2, 8, '2021-12-30', NULL),
(3, 9, '2022-01-25', NULL),
(8, 9, '2021-07-26', '2021-09-22'),
(3, 11, '2022-01-26', '2022-02-21'),
(3, 13, '2022-01-04', NULL),
(6, 15, '2021-09-23', '2021-09-26'),
(2, 18, '2021-09-23', '2021-10-28'),
(2, 19, '2022-02-26', NULL),
(4, 19, '2021-09-21', NULL),
(4, 27, '2022-02-22', NULL),
(3, 33, '2022-01-30', NULL),
(4, 34, '2022-01-23', '2022-02-20'),
(2, 35, '2021-07-13', '2021-09-21'),
(2, 37, '2022-02-11', NULL),
(7, 38, '2021-07-26', '2021-10-22'),
(2, 40, '2022-01-23', '2022-02-23'),
(3, 40, '2021-11-23', '2021-12-24'),
(5, 40, '2021-07-25', '2021-09-22'),
(9, 15, '2022-02-22', NULL),
(9, 18, '2022-01-30', NULL);

SELECT * from adherent;
SELECT * from auteur;
SELECT * from oeuvre;
SELECT * from exemplaire;
SELECT * from emprunt;

-- -- -- R1_1

-- SELECT nom , prenom , auteur.id , count(o.id) as nbrOeuvre
-- FROM auteur
-- LEFT JOIN oeuvre o on auteur.id = o.auteur_id
-- GROUP BY auteur.id, prenom, nom
-- ORDER BY nom;



-- -- -- R1_2

-- SET @nom = '';
-- SET @prenom = '';

-- Insert INTO auteur ( id,nom, prenom)
-- VALUE (NULL,@nom,@prenom);

-- --  LAST_INSERT_ID() = LAST_INSERT_ID();
-- -- LAST_INSERT_ID()
-- -- -- R1_4

-- SELECT *
-- FROM auteur
-- WHERE id = LAST_INSERT_ID();

-- -- R1_5

-- UPDATE auteur
-- SET nom = UPPER(@nom) , prenom = LOWER(@prenom)
-- WHERE id = LAST_INSERT_ID();

-- SELECT * FROM auteur WHERE id = LAST_INSERT_ID();


-- -- R1_3

-- DELETE FROM auteur
-- WHERE id = LAST_INSERT_ID();
-- --
-- -- SELECT * from auteur WHERE id  = LAST_INSERT_ID();


-- -- R1_6

-- SELECT COUNT(oeuvre.id) as nbOeuvre
-- FROM oeuvre
-- INNER JOIN auteur a on oeuvre.auteur_id = a.id
-- GROUP BY auteur_id;


-- -- R 2.2 table adhérent

-- SELECT nomAdherent, adresse, date_paiement, id, COUNT(e.date_emprunt) as nbremprunt,
--        DATE_ADD(date_paiement, INTERVAL +1 YEAR) as datePaiementFutur,
--         IF(CURRENT_DATE()>DATE_ADD(date_paiement, INTERVAL + 1 YEAR),1,0) as retard,
--         IF(CURRENT_DATE()>DATE_ADD(date_paiement, INTERVAL + 11 MONTH ),1,0) as retardProche
-- FROM adherent
-- LEFT JOIN emprunt e on id = e.adherent_id AND e.date_retour IS NULL
-- GROUP BY nomAdherent, adresse, date_paiement,id
-- ORDER BY nomAdherent asc;


-- -- select *
-- -- from adherent;


-- -- R 2.2.2

-- SET @nomAdherent = 'Garry';
-- SET @adresse = '5 Avenue des Pres';
-- Set @date_paiement = '2022-09-11';


-- Insert INTO adherent ( id,nomAdherent, adresse, date_paiement)
-- VALUES (NULL,@nomAdherent,@prenom,@date_paiement);
-- -- SET LAST_INSERT_ID() = LAST_INSERT_ID();

-- --R 2.2.4

-- SELECT @nomAdherent , @adresse, @date_paiement
-- FROM adherent
-- WHERE id = LAST_INSERT_ID();


-- -- R 2.2.5

-- UPDATE adherent
-- SET nomAdherent = UPPER(@nomAdherent) , adresse = LOWER(@adresse)
-- WHERE adherent.id = LAST_INSERT_ID();
-- --
-- -- Select @nomAdherent , @adresse, @date_paiement
-- -- from adherent
-- -- WHERE id = LAST_INSERT_ID();


-- -- R 2.2.3

-- DELETE FROM adherent
-- WHERE id = LAST_INSERT_ID();
-- --
-- -- Select @nomAdherent , @adresse, @date_paiement
-- -- from adherent
-- -- WHERE id = LAST_INSERT_ID();

-- -- R2.2.6

-- -- pas ce qui est demandé
-- -- SELECT adherent.id, COUNT(date_emprunt) as nbremprunt
-- -- FROM emprunt
-- -- LEFT JOIN adherent on emprunt.adherent_id = adherent.id
-- -- GROUP BY adherent.id;



-- --bonne version

-- SELECT COUNT(date_emprunt) as nbremprunt
-- FROM emprunt
-- LEFT JOIN adherent on emprunt.adherent_id = adherent.id
-- GROUP BY adherent.id;


-- -- REQUETE 3_1


-- SELECT auteur.nom, oeuvre.titre, oeuvre.id, oeuvre.date_parution AS date_parution_en, oeuvre.photo
-- , COUNT(E1.id) AS nbExemplaire
-- , COUNT(E2.id) AS nombreDispo
-- , CONCAT(LPAD(CAST(DAY(oeuvre.date_parution) AS CHAR(2)),2,0), '/', LPAD(CAST(MONTH(oeuvre.date_parution) AS CHAR(2)),2,0), '/', YEAR(oeuvre.date_parution)) as date_parution
-- FROM oeuvre
-- JOIN auteur ON auteur.id = oeuvre.auteur_id
-- LEFT JOIN exemplaire E1 ON E1.oeuvre_id=oeuvre.id
-- LEFT JOIN exemplaire E2 on E2.id = E1.id
-- AND E2.id NOT IN(SELECT emprunt.exemplaire_id FROM emprunt WHERE emprunt.date_retour IS NULL)
-- GROUP BY oeuvre.id, auteur.nom, oeuvre.titre, oeuvre.date_parution,oeuvre.photo
-- ORDER BY auteur.nom ASC, oeuvre.titre ASC;

-- -- REQUETE 3_2

-- SET @titre = 'Les fables 2';
-- SET @date_parution = '1887-05-18';
-- SET @photo = 'fables2fontaine.jpg';
-- SET @auteur_id = '5';

-- INSERT INTO oeuvre (id, titre, date_parution, photo, auteur_id)
-- VALUE(NULL, @titre, @date_parution, @photo, @auteur_id);
-- --
-- -- SET LAST_INSERT_ID() = LAST_INSERT_ID();

-- -- REQUETE 3_4

-- SELECT *
-- FROM oeuvre
-- WHERE id = LAST_INSERT_ID();


-- -- REQUETE 3_5

-- UPDATE oeuvre
-- SET titre = %s, date_parution = %s , photo=%s, auteur_id=%s
-- WHERE id = LAST_INSERT_ID();
-- --
-- -- SELECT *
-- -- FROM oeuvre
-- -- WHERE id = LAST_INSERT_ID();

-- -- REQUETE 3_3

-- DELETE FROM oeuvre
-- WHERE id = LAST_INSERT_ID();
-- --
-- -- SELECT *
-- -- FROM oeuvre
-- -- WHERE id = LAST_INSERT_ID();

-- -- REQUETE 3_6

-- SELECT auteur_id, auteur.nom
-- FROM oeuvre
-- LEFT JOIN auteur on oeuvre.auteur_id=auteur.id
-- GROUP BY auteur_id, auteur.nom
-- ORDER BY auteur.nom ASC;


-- -- REQUETE 3_7

-- SELECT COUNT(date_achat) as nbexemplaires
-- FROM exemplaire
-- LEFT JOIN oeuvre on exemplaire.oeuvre_id = oeuvre.id
-- GROUP BY oeuvre.id;



-- revoir 2_5 et 3_5


--requete 4_1

-- SELECT auteur.nom AS nomAuteur, oeuvre.titre, oeuvre.id AS noOeuvre
-- , COUNT(E1.id) AS nbExemplaire
-- , COUNT(E2.id) AS nombreDispo
-- , CONCAT(LPAD(CAST(DAY(oeuvre.date_parution) AS CHAR(2)),2,0), '/', LPAD(CAST(MONTH(oeuvre.date_parution) AS CHAR(2)),2,0), '/', YEAR(oeuvre.date_parution)) as date_parution
-- FROM oeuvre
-- JOIN auteur ON auteur.id = oeuvre.auteur_id
-- LEFT JOIN exemplaire E1 ON E1.oeuvre_id=oeuvre.id
-- LEFT JOIN exemplaire E2 on E2.id = E1.id
-- AND E2.id NOT IN(SELECT emprunt.exemplaire_id FROM emprunt WHERE emprunt.date_retour IS NULL)
-- WHERE oeuvre.id = '1'; 


-- requete 4_2

-- SELECT E1.id AS noExemplaire, E1.etat, E1.date_achat, E1.prix, oeuvre.titre, oeuvre.id AS noOeuvre, oeuvre.date_parution AS dateParution
-- , E1.id AS Exemplaire
-- , NULLIF(E2.id, 0) AS ExemplaireDispo
-- , CASE WHEN (NULLIF(COUNT(E2.id), 0)) IS NULL THEN 'abs' ELSE 'present' end AS present
-- FROM oeuvre
-- LEFT JOIN exemplaire E1 ON E1.oeuvre_id=oeuvre.id
-- LEFT JOIN exemplaire E2 on E2.id = E1.id
-- AND E2.id NOT IN(SELECT emprunt.exemplaire_id FROM emprunt WHERE emprunt.date_retour IS NULL)
-- WHERE oeuvre.id = '1'
-- GROUP BY noExemplaire,Exemplaire;


-- requete 4_3

-- SELECT a.nom AS nomAuteur, oeuvre.titre, oeuvre.id AS noOeuvre, oeuvre.date_parution AS dateParution
-- FROM oeuvre
-- JOIN auteur a ON a.id = oeuvre.auteur_id
-- WHERE oeuvre.id = '1'
-- GROUP BY noOeuvre;

-- requete 4_5



-- INSERT INTO exemplaire (id, etat, date_achat, prix, oeuvre_id)
-- VALUE(NULL,'MOYEN', '2018-05-24', '23.99', '1');

-- cest ça à ajouter dans le python

-- INSERT INTO exemplaire (id, etat, date_achat, prix, oeuvre_id)
-- VALUES(%s, %s, %s, %s, %s);

-- SELECT * FROM exemplaire WHERE id = LAST_INSERT_ID();


-- Requete 4_10

-- SELECT a.nom, oeuvre.titre, oeuvre.date_parution AS dateParution, oeuvre.id AS noOeuvre
-- FROM oeuvre
-- JOIN auteur a ON a.id = oeuvre.auteur_id
-- JOIN exemplaire e ON e.oeuvre_id = oeuvre.id
-- WHERE e.id = '1'
-- GROUP BY noOeuvre;


-- SELECT a.nom, oeuvre.titre, oeuvre.date_parution AS dateParution, oeuvre.id AS noOeuvre
-- FROM oeuvre
-- JOIN auteur a ON a.id = oeuvre.auteur_id
-- JOIN exemplaire e ON e.oeuvre_id = oeuvre.id
-- WHERE e.id = %s
-- GROUP BY noOeuvre;

-- requete 4_11

-- SELECT * 
-- FROM exemplaire
-- WHERE id = '1';


-- SELECT * 
-- FROM exemplaire
-- WHERE id = %s;


-- requete 4_12

-- UPDATE exemplaire
-- SET etat=%s, date_achat=%s, prix=%s, oeuvre_id=%s
-- WHERE id=%s;

-- UPDATE exemplaire 
-- SET etat= UPPER(etat)
-- WHERE id = LAST_INSERT_ID();

-- SELECT * FROM exemplaire WHERE id = LAST_INSERT_ID();


-- requete 4_7

-- DELETE from exemplaire where id = %s;


-- delete from exemplaire where id = LAST_INSERT_ID();


-- requete 4_8

-- SELECT COUNT(em.date_emprunt) AS nb_emprunts
-- FROM exemplaire
-- LEFT JOIN emprunt em ON em.exemplaire_id = exemplaire.id
-- WHERE id = '2'
-- GROUP BY exemplaire.id;


-- SELECT COUNT(em.date_emprunt) AS nb_emprunts
-- FROM exemplaire
-- LEFT JOIN emprunt em ON em.exemplaire_id = exemplaire.id
-- WHERE id = %s
-- GROUP BY exemplaire.id;


-- requete 4_9

-- SELECT exemplaire.oeuvre_id AS noOeuvre
-- FROM exemplaire
-- LEFT JOIN oeuvre o ON o.id = exemplaire.oeuvre_id
-- WHERE exemplaire.id = '11'
-- GROUP BY exemplaire.oeuvre_id;
