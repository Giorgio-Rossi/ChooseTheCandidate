INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('admin', 'admin', null,'admin@gmail.com', null, null, null, null, null, 'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Giorgio', 'Rossi', null, 'giorgiorossi@gmail.com', null, null, null, null, null, 'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)VALUES ('Nicolo', 'Drovandi', null,'nicolodrovandi@gmail.com', null, null, null, null, null, 'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Lorenzo', 'Franco', null,'lorenzofranco@gmail.com', null, null, null, null, null, 'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Luca', 'Sanguinetti', null, 'lucasanguinetti@gmail.com', null, null, null, null, null, 'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)VALUES ('Claudio', 'Balzani', null,'claudiobalzani@gmail.com', null, null, null, null, null, 'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Biagio', 'Ricci', null,'biagioricci@gmail.com', null, null, null, null, null, 'admin', 'admin' );

insert into Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) values ('Matteo','Salvo','CF1','matteosalvo@gmail.com','20000203','Via Marconi 2','1','17900','347689876','user','salvini');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)values ('Fiona','Giusti','CF2','fionagiusti@gmail.com','20030806','Via Roma 29','1','16177','349680856','user','fiona');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)values ('Gianluca','Torre','CF3','gianlu@gmail.com','19800407','Via Milano 56','2','20321','387689806','user','torre');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)values ('Marta','Lupu','CF4','mlupu@gmail.com','20030203','Via Rodi 70','2','16167','339880856','user','marta');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','ciao','1','1',NULL,'aperta','20231101','Sistemista');

INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','hola','1','2',NULL,'aperta','20231102','Web Developer');


insert into CandidaturaUser (id_posizione, id_user , data_candidatura) values ('1','10','20231101');
insert into CandidaturaUser (id_posizione, id_user , data_candidatura) values ('2','10','20231102');




INSERT INTO Regione (nome) values('Abbruzzo');
 INSERT INTO Regione (nome) values('Basilicata');
 INSERT INTO Regione (nome) values('Calabria');
 INSERT INTO Regione (nome) values('Campania');
 INSERT INTO Regione (nome) values('Emilia-Romagna');
 INSERT INTO Regione (nome) values('Friuli-Venezia-Giulia');
 INSERT INTO Regione (nome) values('Lazio');
 INSERT INTO Regione (nome) values('Liguria');
 INSERT INTO Regione (nome) values('Lombardia');
 INSERT INTO Regione (nome) values('Marche');
 INSERT INTO Regione (nome) values('Molise');
 INSERT INTO Regione (nome) values('Piemonte');
 INSERT INTO Regione (nome) values('Puglia');
 INSERT INTO Regione (nome) values('Sardegna');
 INSERT INTO Regione (nome) values('Sicilia');
 INSERT INTO Regione (nome) values('Toscana');
 INSERT INTO Regione (nome) values('Trentino-Alto-Adige');
 INSERT INTO Regione (nome) values('Umbria');
 INSERT INTO Regione (nome) values('Valle D Aosta');
 INSERT INTO Regione (nome) values('Veneto');


insert into Citta (id_regione,nome) values ('8','Genova');
insert into Citta (id_regione,nome) values ('7','Roma');
insert into Citta (id_regione,nome) values ('4','Napoli');
insert into Citta (id_regione,nome) values ('9','Lodi');
insert into Citta (id_regione,nome) values ('12','Torino');
insert into Citta (id_regione,nome) values ('20','Venezia');
insert into Citta (id_regione,nome) values ('16','Firenze');
insert into Citta (id_regione,nome) values ('5','Bologna');