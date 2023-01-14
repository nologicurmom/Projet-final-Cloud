
create sequence sqtokenadmin;
create sequence sqtokenuser;

create table Utilisateur(
idUtilisateur serial primary key,
nom varchar(20),
prenom varchar(20),
email varchar(20),
mdp varchar(20),
DateInscription date default CURRENT_DATE,
compte float default 0
);

INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Hardi', 'Tojoniaina', 'hardi@gmail.com', 'hardi','2021-10-12');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Bryan', 'Ramarokoto', 'bryan@gmail.com', 'bryan','2020-05-09');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Anjary', 'Raharison', 'anjary@gmail.com', 'anjary','2022-08-11');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('NyAndo', 'Ras', 'Nyando@gmail.com', 'nyando','2022-04-03');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Brown', 'Bob', 'bobbrown@gmail.com', 'password789','2019-05-06');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Johnson', 'Samantha', 'samantha@gmail.com', 'password111','2022-06-16');
INSERT INTO Utilisateur (nom, prenom, email, mdp,DateInscription) VALUES ('Williams', 'Michael', 'michael@gmail.com', 'password222','2019-03-22');


create table Admin(
idAdmin serial primary key,    
email varchar(20),
mdp varchar(20)
);

INSERT INTO Admin (email, mdp) VALUES ('admin@gmail.com', 'admin');


create table RechargementCompte(
idUtilisateur int references Utilisateur(idUtilisateur),
montant float,
DateHeureRechargement TIMESTAMP default CURRENT_TIMESTAMP ,
estValider int default 0
);

create table CategorieProduit(
idCategorieProduit serial primary key,
typeCategorie varchar(20)
);

INSERT INTO CategorieProduit (typeCategorie) VALUES ('Electronique');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Oeuvres darts');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Bijoux');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Livres');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Objets de Collection');
INSERT INTO CategorieProduit (typeCategorie) VALUES ('Vêtements');


create table Produit(
idProduit serial primary key,
nomProduit varchar(50),
description text,
prix float,
numero_serie varchar(30),
DateSortie date,
Etat int,
Provenance varchar(10),
photo text default 'vide.png',
idCategorieProduit int REFERENCES CategorieProduit(idCategorieProduit)
);


INSERT INTO Produit (nomProduit,description,prix,numero_serie,DateSortie,Etat,Provenance,idCategorieProduit) VALUES ('IPHONE 14','le tout nouveau produit de Apple. Elle très puissante',2000,'IPH-OLED-001','2020-10-09',9,'France',1);
INSERT INTO Produit (nomProduit,description,prix,numero_serie,DateSortie,Etat,Provenance,idCategorieProduit) VALUES ('Asus ROG Strix','Un ordinateur avec un processeur rapide',600,'LAP-I7-16G-020','2019-11-07',10,'Canada',1);
INSERT INTO Produit (nomProduit,description,prix,numero_serie,DateSortie,Etat,Provenance,idCategorieProduit) VALUES ('Batterie Panneau Solaire','Une batterie haut de gamme avec une capacité de rechargement rapide',500,'BT-004-6G','2022-05-04',10,'Belgique',1);


-----view-----

create or replace view ProduitCategorie as
select p.idProduit , p.nomProduit , p.description , p.prix , p.numero_serie , p.DateSortie , p.Etat , p.Provenance , p.photo , c.idCategorieProduit , c.typeCategorie  from Produit p inner join CategorieProduit c using(idCategorieProduit)


------
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Tableau', 'Un magnifique tableau de style impressionniste', 500.0, 'A001','2021-04-10',10,'Madagascar',2);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Sculpture', 'Une sculpture en marbre de style classique', 2000.0, 'S001','2022-02-22',10,'Madagascar',2);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Peinture', 'Une peinture à l''huile de style abstrait', 800.0, 'P001','2022-08-07',10,'Madagascar',2);

--------
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Collier', 'Un collier en argent avec pierre précieuse', 100.0, 'C001','2022-11-08',8,'Dubai',3);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Bague', 'Une bague en or avec diamant', 500.0, 'B001','2022-07-09',9,'Chine',3);
INSERT INTO Produit (nomProduit, description, prix, numero_serie,DateSortie,Etat,Provenance,idCategorieProduit)
VALUES ('Bracelet', 'Un bracelet en perles', 150.0, 'BR001','2022-03-23',10,'France',3);


create table Enchere(
idEnchere serial primary key,
idUtilisateur int references Utilisateur(idUtilisateur),
idProduit int references Produit(idProduit),
description text,
prixMinimum float,
prixPlafond float,
prixDeVente float,
durreEnchere int,
DateHeureEnchere TIMESTAMP default CURRENT_TIMESTAMP ,
status int default 0
);

create table Produit_Enchere(
idEnchere int references Enchere(idEnchere),
idProduit int references Produit(idProduit)
);



create table HistoriqueEnchere(
idHistoriqueEnchere serial primary key,
idEnchere int references Enchere(idEnchere),
idUtilisateur int references Utilisateur(idUtilisateur),
durreEnchere int,
prixDeVente float,
DateHeureMise TIMESTAMP default CURRENT_TIMESTAMP 
);

create table Commission(
pourcentage float 
);

insert into Commission(pourcentage) values (12.5);


create table CommissionEnchere(
idCommission serial primary key,
idEnchere int references Enchere(idEnchere),
montantRecu float
);


create table tokenAdmin(
idtokenadmin varchar(10) primary key not null default 'tokena'||nextval('sqtokenadmin'),
idadmin int references Admin(idAdmin),
token varchar(100),
datecreation date,
dateexpiration date,
role varchar(10)
);


create table tokenUser(
idtokenuser varchar(10) primary key not null default 'tokena'||nextval('sqtokenuser'),
idUtilisateur int references Utilisateur(idUtilisateur),    
token varchar(100),
datecreation date,
dateexpiration date,
role varchar(10)
);


--statistiques-----

view 1 : nombre de membres par jour , mois , annee
view 2 : nombre total enchere par jour , mois , annee
view 3 : nombre de lots qui ont été vendus par jour , mois , annee
view 4 : montant total des ventes réalisées  par jour , mois , annee

view 5 : fitambaran view 1 , view 2 , view 3 , view 4 


Annee | Mois | jour | nombre de membres |nombre total enchere | nombre de lots qui ont été vendus | montant total des ventes réalisées 



------










