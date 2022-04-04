DROP TABLE if exists emprunt;
DROP TABLE if exists exemplaire;
DROP TABLE if exists oeuvre;
DROP TABLE if exists auteur;
DROP TABLE if exists adherent;




CREATE TABLE adherent(
   id INT AUTO_INCREMENT,
   nom VARCHAR(50),
   adresse VARCHAR(50),
   date_paiement VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE auteur(
   id INT AUTO_INCREMENT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE oeuvre(
   id INT AUTO_INCREMENT,
   titre VARCHAR(50),
   date_parution DATE,
   photo VARCHAR(50),
   auteur_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(auteur_id) REFERENCES auteur(id)
);

CREATE TABLE exemplaire(
   id INT AUTO_INCREMENT,
   etat VARCHAR(50),
   date_achat DATE,
   prix DECIMAL(15,2),
   oeuvre_id INT NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(oeuvre_id) REFERENCES oeuvre(id)
);

CREATE TABLE emprunt(
   date_emprunt DATE,
   date_retour DATE,
   adherent_id INT NOT NULL,
   exemplaire_id INT NOT NULL,
   PRIMARY KEY(date_emprunt,adherent_id,exemplaire_id),
   FOREIGN KEY(adherent_id) REFERENCES adherent(id),
   FOREIGN KEY(exemplaire_id) REFERENCES exemplaire(id)
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

-- R1
SELECT nom , prenom , auteur.id , count(o.id) as nbrOeuvre
FROM auteur
LEFT JOIN oeuvre o on auteur.id = o.auteur_id
GROUP BY auteur.id, prenom, nom
ORDER BY nom;



-- R2

SET @nom = 'Orwell';
SET @prenom = 'George';

Insert INTO auteur ( id,nom, prenom)
VALUE (NULL,@nom,@prenom);

SET @last_id_in_auteur = LAST_INSERT_ID();

-- R3

SELECT *
FROM auteur
WHERE id = @last_id_in_auteur;

UPDATE auteur
SET nom = UPPER(@nom) , prenom = LOWER(@prenom)
WHERE id = @last_id_in_auteur;

SELECT * FROM auteur WHERE id = @last_id_in_auteur;

DELETE FROM auteur
WHERE id = @last_id_in_auteur;

SELECT * from auteur WHERE id = @last_id_in_auteur;




SELECT @nom , @prenom , COUNT(oeuvre.id) as nbOeuvre
FROM oeuvre
INNER JOIN auteur a on oeuvre.auteur_id = a.id
GROUP BY auteur_id;


-- R 2.2 table adhérent
SELECT nom, adresse, date_paiement, id, COUNT(e.date_emprunt) as nbremprunt,
       DATE_ADD(date_paiement, INTERVAL +1 YEAR) as datePaiementFutur,
        IF(CURRENT_DATE()>DATE_ADD(date_paiement, INTERVAL + 1 YEAR),1,0) as retard,
        IF(CURRENT_DATE()>DATE_ADD(date_paiement, INTERVAL + 11 MONTH ),1,0) as retardProche
FROM adherent
LEFT JOIN emprunt e on adherent.id = e.adherent_id AND e.date_retour IS NULL
GROUP BY nom, adresse, date_paiement,id
ORDER BY nom asc;


select *
from adherent;


-- R 2.2.2

SET @nom = 'Jerome';
SET @adresse = '5 rue aberrante';
Set @date_paiement = '2022-05-12';

Insert INTO adherent ( id,nom, adresse, date_paiement)
VALUES (NULL,@nom,@prenom,@date_paiement);

Select @nom , @adresse, @date_paiement
from adherent;
