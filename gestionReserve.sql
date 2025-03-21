

create database gestionReserve;
use gestionReserve;

create table personne(
    idPersonne int primary key auto_increment,
    prenom varchar(100),
    nom varchar(60),
    telephone int,
    email varchar(100),
    adresse varchar(80),
    profil varchar(100)

);


create table compte(
    login varchar(60) primary key , 
    motPasse varchar(80),
    date_creation date,
    date_modification date,
    statutCompte VARCHAR(60),
    FK_personne int, 
    foreign key  (FK_personne)  references  personne(idpersonne) on delete CASCADE
);


create table materiel(
    idMateriel int primary key auto_increment,
    nomMateriel varchar(30),
    modele VARCHAR(80),
    marque VARCHAR(80),
    quantite int,
    disponibilite  int
);




create table salle(
    idSalle int primary key auto_increment,
    nomSalle varchar(50),
    capacite int, 
    disponibilite int
     
 );



create table reserverMateriel(
    numReservation int primary key auto_increment,
    dateRS DATE,
    heureRS time,
    FK_materiel int,
    FK_personne int,
    dateFin date,
  foreign key (FK_personne) references personne(idPersonne),
  foreign key (FK_materiel) references materiel(idMateriel)
);


create table reserverSalle(
    numReservation int primary key auto_increment,
    dateRS date,
    heureRS time,
    FK_personne int,
    FK_Salle int,
    dateFin date,
    foreign key (FK_personne) references personne(idpersonne),
    foreign key (FK_salle) references salle(idSalle)
);




-- inserer dans  la table salle

INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 300', 48, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 301', 30, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 302', 50, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 303', 60, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 304', 45, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 305', 20, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 306', 30, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 307', 40, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 308', 70, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 309', 24, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 310', 40, 1);
INSERT INTO salle (nomSalle, capacite, disponibilite) VALUES ('salle 200', 90, 1);

-- inserer dans  la table materiel
INSERT INTO materiel (nomMateriel, modele, marque, quantite, disponibilite) VALUES  
('Projecteur', 'Epson EH-TW650', 'Epson', 5, 1),
('Modem', 'TG7', 'Technicolor', 10, 1),
('Ordinateur Portable', 'MacBook Air','Apple', 8, 1),
('Rallonge Électrique', 'Brennes Premium', 'Brennenstuhl', 20, 1),
('Tableau Numérique', 'SMART Board 6000S', 'SMART', 3, 1),
('Imprimante Multifonction', 'HP LaserJet Pro', 'HP', 4, 1),
('Scanner', 'Canon imageFORMULA P-215 II', 'Canon', 6, 1),
('Système Audio', 'JBL Charge 5', 'JBL', 12, 1),
('Kit de Câbles HDMI', 'AmazonBasics High-Speed HDMI', 'AmazonBasics', 30, 1),
('Routeur Wi-Fi', 'Nighthawk AX12', 'NETGEAR', 7, 1);
SELECT * FROM reservermateriel;

select p.* from personne p join reserversalle rs on p.`idPersonne` = rs.`FK_personne` 
join salle s on s.`idSalle` = rs.`FK_Salle`; 
