use master
drop database ProjectWork2
go
create database ProjectWork2
go
use Projectwork2
go

create table CategoriaPosizione(
id_Categoria int identity not null primary key,
nome_categoria varchar(70)
);

create table Regione(
id_regione int identity not null primary key,
nome varchar(50) not null,
)

create table Citta(
id_citta int identity not null primary key,
nome varchar(100) not null,
id_regione int,
CONSTRAINT FK_citta_regione FOREIGN KEY (id_regione) REFERENCES Regione (id_regione)
)
 
create table Utente(
id_user int identity not null primary key,
nome varchar(50) not null,
cognome varchar(50) not null,
codice_fiscale varchar(16),
email varchar(50) not null,
data_nascita date,
indirizzo varchar(200),
id_citta int,
cap varchar(5),
telefono varchar(10),
ruolo_admin varchar(10) not null check(ruolo_admin in('user','admin'))  CONSTRAINT FK_DFUtenti_Admin default 'user',
password varchar(200) not null,
foto_profilo varchar(100),
genere varchar(30)  check(genere in('uomo','donna','non specificare')),
CV varchar(600),
token varchar(200),

CONSTRAINT FK_utente_citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta)
)
 
create table Istruzione(
id_istruzione int identity not null primary key,
grado varchar(500) not null,
id_citta int not null,
descrizione_istruzione varchar(1000) not null,
data_inizio date,
data_fine date,
id_user int not null,
valutazione smallint,
CONSTRAINT FK_istruzione_citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta),
CONSTRAINT FK_utente_istruzione FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Esperienza(
id_esperienza int identity not null primary key,
anni smallint,
descrizione_attivita varchar(1000),
id_user int not null,
azienda varchar(500),
data_inizio date,
data_fine date,
ral int,
tipo_contratto varchar(500),
settore varchar(500),
posizione_lavorativa varchar(500),
id_citta int,

CONSTRAINT FK_citta_esperienza FOREIGN KEY (id_citta) REFERENCES citta (id_citta),
CONSTRAINT FK_utente_esperienza FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Quiz(
id_quiz int identity not null primary key,
descrizione varchar(500),
n_domande smallint
)
 
create table Domanda(
id_domanda int identity not null primary key,
testo varchar(500),
punteggio smallint
)
 
create table QuizDomanda(
id_quiz_domanda int identity not null primary key,
id_domanda int not null,
id_quiz int not null
 
CONSTRAINT FK_Quiz_QuizDomanda FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),
CONSTRAINT FK_Domanda_QuizDomanda FOREIGN KEY (id_domanda) REFERENCES Domanda (id_domanda)
)
 
create table RisposteDomanda(
id_risposta int identity not null primary key,
scelta1 varchar(500) not null,
scelta2 varchar(500),
scelta3 varchar(500),
scelta4 varchar(500),
scelta_corretta varchar(500) check(scelta_corretta in('scelta1','scelta2','scelta3','scelta4')),
id_domanda int not null,
 
CONSTRAINT FK_Risposte_Domanda FOREIGN KEY (id_domanda) REFERENCES Domanda (id_domanda),
)
 
create table UtenteQuiz(
id_utente_quiz int identity not null primary key,
id_quiz int not null,
id_user int not null,
punteggio float not null,
data_inserimento datetime,
 
CONSTRAINT FK_Quiz_UtenteQuiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),
CONSTRAINT FK_Utente_UtenteQuiz FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Skill(
id_skill int identity not null primary key,
nome varchar(500),
tipo_skill varchar(500) not null check(tipo_skill in('soft','hard')),
id_quiz int,
CONSTRAINT FK_Skill_Quiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz)
)
 
create table UserSkills(
id_user_skills int identity not null primary key,
id_user int not null,
id_skill int not null,
verificata bit,
CONSTRAINT FK_Skill_UserSkills FOREIGN KEY (id_skill) REFERENCES Skill (id_skill),
CONSTRAINT FK_Utente_UserSkills FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Posizione(
id_posizione int identity not null primary key,
n_ammissioni smallint,
descrizione varchar(1000),
id_citta int not null,
id_Categoria int not null,
id_quiz int,
stato varchar(500) not null check(stato in('aperta','chiusa')),
data_inserimento datetime,
ruolo varchar(500),
 
CONSTRAINT FK_Posizione_Citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta),
CONSTRAINT FK_Posizione_Categoria FOREIGN KEY (id_Categoria) REFERENCES CategoriaPosizione (id_Categoria),
CONSTRAINT FK_Posizione_Quiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz)
)
 
create table CandidaturaUser(
id_candidatura_user int identity not null primary key,
id_posizione int not null,
id_user int not null,
data_candidatura datetime,
 
CONSTRAINT FK_Posizione_CandidaturaUser FOREIGN KEY (id_posizione) REFERENCES Posizione (id_posizione),
CONSTRAINT FK_User_CandidaturaUser FOREIGN KEY (id_user) REFERENCES Utente (id_user),
)


/*INSERIMENTO CATEGORIE SEZIONE IT*/
     

/*	Inserimento delle Regione	*/
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

/* Abbruzzo 1*/
INSERT INTO Citta (nome, id_regione) VALUES ('Aquila', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Pescara', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Avezzano', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Sulmona', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Chieti', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Teramo', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Roseto degli Abruzzi', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Lanciano', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Vasto', 1);
INSERT INTO Citta (nome, id_regione) VALUES ('Atri', 1);

/* Basilicata 2*/
INSERT INTO Citta (nome, id_regione) VALUES ('Potenza', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Matera', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Pisticci', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Lauria', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Rionero in Vulture', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Melfi', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Venosa', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Lavello', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Tricarico', 2);
INSERT INTO Citta (nome, id_regione) VALUES ('Montescaglioso', 2);

/* Calabria 3 */
INSERT INTO Citta (nome, id_regione) VALUES ('Reggio Calabria', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Catanzaro', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Cosenza', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Crotone', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Vibo Valentia', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Lamezia Terme', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Rossano', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Pizzo', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Amantea', 3);
INSERT INTO Citta (nome, id_regione) VALUES ('Paola', 3);

/* Campania 4*/
INSERT INTO Citta (nome, id_regione) VALUES ('Napoli', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Salerno', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Avellino', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Benevento', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Caserta', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Pompei', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Torre del Greco', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Cava de Tirreni', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Castellammare di Stabia', 4);
INSERT INTO Citta (nome, id_regione) VALUES ('Nocera Inferiore', 4);

/* Emilia-Romagna 5*/
INSERT INTO Citta (nome, id_regione) VALUES ('Bologna', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Modena', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Parma', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Reggio Emilia', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Ferrara', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Ravenna', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Forlì', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Cesena', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Piacenza', 5);
INSERT INTO Citta (nome, id_regione) VALUES ('Imola', 5);

/* Friuli-Venezia-Giulia 6*/
INSERT INTO Citta (nome, id_regione) VALUES ('Trieste', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Udine', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Pordenone', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Gorizia', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Monfalcone', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Sacile', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Cividale del Friuli', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Palmanova', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('Aquileia', 6);
INSERT INTO Citta (nome, id_regione) VALUES ('San Daniele del Friuli', 6);

/* Lazio 7*/
INSERT INTO Citta (nome, id_regione) VALUES ('Roma', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Latina', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Viterbo', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Frosinone', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Rieti', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Civitavecchia', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Tivoli', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Anzio', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Fiumicino', 7);
INSERT INTO Citta (nome, id_regione) VALUES ('Nettuno', 7);

/* Liguria 8*/
INSERT INTO Citta (nome, id_regione) VALUES ('Genova', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Savona', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('La Spezia', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Sanremo', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Sestri Levante', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Alassio', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Chiavari', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Imperia', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Ventimiglia', 8);
INSERT INTO Citta (nome, id_regione) VALUES ('Rapallo', 8);

/* Lombardia 9*/
INSERT INTO Citta (nome, id_regione) VALUES ('Milano', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Bergamo', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Brescia', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Monza', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Como', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Pavia', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Cremona', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Lodi', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Varese', 9);
INSERT INTO Citta (nome, id_regione) VALUES ('Mantova', 9);

/* Marche 10*/
INSERT INTO Citta (nome, id_regione) VALUES ('Ancona', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Pesaro', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Macerata', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Fano', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Jesi', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Civitanova Marche', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Ascoli Piceno', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Senigallia', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Recanati', 10);
INSERT INTO Citta (nome, id_regione) VALUES ('Fermo', 10);

/* Molise 11*/
INSERT INTO Citta (nome, id_regione) VALUES ('Campobasso', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Termoli', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Isernia', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Venafro', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Larino', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Trivento', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Bojano', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Guglionesi', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Campomarino', 11);
INSERT INTO Citta (nome, id_regione) VALUES ('Riccia', 11);

/* Piemonte 12*/
INSERT INTO Citta (nome, id_regione) VALUES ('Torino', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Novara', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Alessandria', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Asti', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Cuneo', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Vercelli', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Biella', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Alba', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Casale Monferrato', 12);
INSERT INTO Citta (nome, id_regione) VALUES ('Chieri', 12);

/* Puglia 13*/
INSERT INTO Citta (nome, id_regione) VALUES ('Bari', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Lecce', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Taranto', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Foggia', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Brindisi', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Andria', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Barletta', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Molfetta', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Bitonto', 13);
INSERT INTO Citta (nome, id_regione) VALUES ('Cerignola', 13);

/* Sardegna 14*/
INSERT INTO Citta (nome, id_regione) VALUES ('Cagliari', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Sassari', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Olbia', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Alghero', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Nuoro', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Oristano', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Quartu Sant Elena', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Iglesias', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Carbonia', 14);
INSERT INTO Citta (nome, id_regione) VALUES ('Ozieri', 14);

-- Sicilia (Regione 15)
INSERT INTO Citta (nome, id_regione) VALUES ('Palermo', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Catania', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Messina', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Siracusa', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Trapani', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Marsala', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Agrigento', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Caltanissetta', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Enna', 15);
INSERT INTO Citta (nome, id_regione) VALUES ('Gela', 15);

-- Toscana (Regione 16)
INSERT INTO Citta (nome, id_regione) VALUES ('Firenze', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Pisa', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Siena', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Livorno', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Lucca', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Prato', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Massa', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Grosseto', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Arezzo', 16);
INSERT INTO Citta (nome, id_regione) VALUES ('Carrara', 16);

-- Trentino-Alto-Adige (Regione 17)
INSERT INTO Citta (nome, id_regione) VALUES ('Bolzano', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Trento', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Rovereto', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Merano', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Bressanone', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Caldaro', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Cavalese', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Egna', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Ortisei', 17);
INSERT INTO Citta (nome, id_regione) VALUES ('Vipiteno', 17);

-- Umbria (Regione 18)
INSERT INTO Citta (nome, id_regione) VALUES ('Perugia', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Assisi', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Terni', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Foligno', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Spoleto', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Gubbio', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Città di Castello', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Orvieto', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Narni', 18);
INSERT INTO Citta (nome, id_regione) VALUES ('Amelia', 18);

-- Valle d'Aosta (Regione 19)
INSERT INTO Citta (nome, id_regione) VALUES ('Aosta', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Courmayeur', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Saint-Vincent', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Champoluc', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Cogne', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('La Thuile', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Gressoney-Saint-Jean', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Bard', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Nus', 19);
INSERT INTO Citta (nome, id_regione) VALUES ('Hone', 19);

-- Veneto (Regione 20)
INSERT INTO Citta (nome, id_regione) VALUES ('Venezia', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Verona', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Padova', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Vicenza', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Treviso', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Belluno', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Rovigo', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Chioggia', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Bassano del Grappa', 20);
INSERT INTO Citta (nome, id_regione) VALUES ('Conegliano', 20);


/*	Inserimento degli utenti	*/

INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Marco', 'Russo', 'RSSMRC92C15F839B', 'marco@email.com', '1992-03-10', 'Via Dante 21', 4, '00400', '7778889999', 'user', 'pwdMarco1011',  'uomo');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Giorgia', 'Ferrari', 'FRRGGR91R21D859C', 'giorgia@email.com', '1991-12-05', 'Via Leonardo 33', 1, '00100', '3334445555', 'user', 'pwdGiorgia1213',  'donna');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Alessandro', 'Martini', 'MRTLSN90A02H501E', 'alessandro@email.com', '1990-04-18', 'Via Roma 10', 2, '00200', '9998887776', 'user', 'pwdAlessandro1415',  'uomo');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Sofia', 'Conti', 'CNTSF90M41F839D', 'sofia@email.com', '1990-09-22', 'Via Garibaldi 5', 3, '00300', '1112223333', 'user', 'pwdSofia1617',  'donna');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Matteo', 'Moretti', 'MRTTMT89T30F839E', 'matteo@email.com', '1989-07-12', 'Via Vespucci 7', 4, '00400', '6667778888', 'user', 'pwdMatteo1819',  'uomo');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Elisa', 'Gallo', 'GLLELS88P41D859F', 'elisa@email.com', '1988-11-30', 'Via Mazzini 56', 1, '00100', '4445556666', 'user', 'pwdElisa2021', 'donna');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Giovanni', 'Romano', 'RMNGVN87R31H501G', 'giovanni@email.com', '1987-06-07', 'Via Colombo 23', 2, '00200', '0001112222', 'user', 'pwdGiovanni2324', 'uomo');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Alice', 'Rossi', 'RSSLCR95L13H501T', 'alice@email.com', '1995-08-25', 'Via Verdi 12', 1, '00100', '1234567890', 'user', 'pwdAlice123', 'donna');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Luca', 'Bianchi', 'BNCLCU94M14Z352P', 'luca@email.com', '1994-06-18', 'Via Roma 45', 2, '00200', '9876543210', 'user', 'pwdLuca456', 'uomo');
INSERT INTO Utente (nome, cognome, codice_fiscale, email, data_nascita, indirizzo, id_citta, cap, telefono, ruolo_admin, password, genere) VALUES ('Sophia', 'Verdi', 'VRDSHP93H45F839A', 'sophia@email.com', '1993-11-02', 'Via Garibaldi 78', 3, '00300', '5556667777', 'user', 'pwdSophia789', 'donna');
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('admin', 'admin', null,'admin@gmail.com', null, null, null, null, null,'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Giorgio', 'Rossi', null, 'giorgiorossi@gmail.com', null, null, null, null, null,'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)VALUES ('Nicolo', 'Drovandi', null,'nicolodrovandi@gmail.com', null, null, null, null, null,'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Lorenzo', 'Franco', null,'lorenzofranco@gmail.com', null, null, null, null, null, 'admin','admin');
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Luca', 'Sanguinetti', null, 'lucasanguinetti@gmail.com', null, null, null, null, null,'admin', 'admin');
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)VALUES ('Claudio', 'Balzani', null,'claudiobalzani@gmail.com', null, null, null, null, null,'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) VALUES ('Biagio', 'Ricci', null,'biagioricci@gmail.com', null, null, null, null, null,'admin', 'admin' );
insert into Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password) values ('Matteo','Salvo','slvmtt00b03e300m','matteosalvo@gmail.com','20000203','Via Marconi 2','1','17900','3547689876','user','salvini');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)values ('Fiona','Giusti','gstfna03h06e300m','fionagiusti@gmail.com','20030806','Via Roma 29','1','16177','3495680856','user','fiona');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)values ('Gianluca','Torre','trrglc80d07e300m','gianlu@gmail.com','19800407','Via Milano 56','2','20321','3857689806','user','torre');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,password)values ('Marta','Lupu','lpumrt03b03e300m','mlupu@gmail.com','20030203','Via Rodi 70','2','16167','3398805856','user','marta');

/* Insert esperienze */

INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (3, 'Sviluppo software e gestione database', 1, 'Tech Solutions', '2018-05-01', '2021-06-30', 60000, 'Tempo pieno', 'Tecnologia', 'Sviluppatore Software',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (5, 'Analisi dei mercati finanziari e gestione portafogli clienti', 1, 'Investment Bank', '2016-10-15', '2021-10-15', 85000, 'Tempo pieno', 'Finanza', 'Analista Finanziario',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (4, 'Progettazione e sviluppo di siti web', 3, 'Web Solutions Co.', '2017-09-01', '2021-09-01', 55000, 'Tempo pieno', 'Tecnologia', 'Web Developer',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (6, 'Gestione strategica e sviluppo di prodotti', 4, 'Prodotti Innovativi Srl', '2015-07-20', '2021-07-20', 72000, 'Tempo pieno', 'Produzione', 'Product Manager',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (2, 'Ricerca e sviluppo nuovi materiali', 5, 'Lab Research', '2020-04-10', '2022-04-10', 60000, 'Tempo pieno', 'Ricerca', 'Ricercatore',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (4, 'Analisi dati e sviluppo di modelli statistici', 6, 'Data Analytics Inc.', '2017-01-05', '2021-01-05', 65000, 'Tempo pieno', 'Analisi dati', 'Data Scientist',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (3, 'Sviluppo strategie marketing e campagne pubblicitarie', 7, 'Marketing Agency', '2018-08-12', '2021-08-12', 58000, 'Tempo pieno', 'Marketing', 'Marketing Manager',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (5, 'Gestione progetti di sviluppo software', 8, 'Tech Solutions', '2016-06-30', '2021-06-30', 70000, 'Tempo pieno', 'Tecnologia', 'Project Manager',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (4, 'Sviluppo e implementazione strategie di vendita', 9, 'Sales Company', '2017-11-25', '2021-11-25', 60000, 'Tempo pieno', 'Vendite', 'Sales Manager',1);
INSERT INTO Esperienza (anni, descrizione_attivita, id_user, azienda, data_inizio, data_fine, ral, tipo_contratto, settore, posizione_lavorativa,id_citta)
VALUES (7, 'Gestione operativa e logistica', 10, 'Logistics Solutions', '2014-09-08', '2021-09-08', 68000, 'Tempo pieno', 'Logistica', 'Operations Manager',1);

/* Istruzione */
-- Istruzione per Marco Russo
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 4, 'Diploma in Informatica presso Scuola Tecnica Informatica XYZ', '2008-09-01', '2010-07-01', 1, 88),
    ('Laurea in Informatica Applicata', 4, 'Corso di laurea triennale in Informatica Applicata presso Università XYZ', '2010-09-01', '2013-07-01', 1, 95),
    ('Master in Data Science', 4, 'Master in Data Science presso Università XYZ', '2014-09-01', '2016-07-01', 1, 98);

-- Istruzione per Giorgia Ferrari
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 1, 'Diploma in Informatica presso Scuola Tecnica Informatica ABC', '2008-09-01', '2010-07-01', 2, 86),
    ('Laurea in Economia e Informatica', 1, 'Corso di laurea triennale in Economia e Informatica presso Università ABC', '2010-09-01', '2013-07-01', 2, 92),
    ('Dottorato in Informatica Aziendale', 1, 'Dottorato in Informatica Aziendale presso Università ABC', '2014-09-01', '2018-07-01', 2, 96);

-- Istruzione per Alessandro Martini
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 2, 'Diploma in Informatica presso Scuola Tecnica Informatica Milano', '2008-09-01', '2010-07-01', 3, 85),
    ('Laurea in Ingegneria Informatica', 2, 'Corso di laurea triennale in Ingegneria Informatica presso Politecnico di Milano', '2010-09-01', '2013-07-01', 3, 88),
    ('Specializzazione in Design e Sviluppo Software', 2, 'Corso di specializzazione in Design e Sviluppo Software', '2014-09-01', '2015-07-01', 3, 94);

-- Istruzione per Sofia Conti
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 3, 'Diploma in Informatica presso Scuola Tecnica Informatica LMN', '2008-09-01', '2010-07-01', 4, 87),
    ('Laurea in Psicologia Informatica', 3, 'Corso di laurea triennale in Psicologia Informatica presso Università LMN', '2010-09-01', '2013-07-01', 4, 94),
    ('Master in Psicologia delle Interfacce', 3, 'Master in Psicologia delle Interfacce presso Università LMN', '2014-09-01', '2016-07-01', 4, 97);

-- Istruzione per Matteo Moretti
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 4, 'Diploma in Informatica presso Scuola Tecnica Informatica XYZ', '2008-09-01', '2010-07-01', 5, 82),
    ('Laurea in Ingegneria Informatica', 4, 'Corso di laurea triennale in Ingegneria Informatica presso Università XYZ', '2010-09-01', '2013-07-01', 5, 90),
    ('Dottorato in Sistemi Intelligenti', 4, 'Dottorato in Sistemi Intelligenti presso Università XYZ', '2014-09-01', '2018-07-01', 5, 96);

-- Istruzione per Elisa Gallo
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 1, 'Diploma in Informatica presso Scuola Tecnica Informatica ABC', '2008-09-01', '2010-07-01', 6, 89),
    ('Laurea in Lettere Informatiche', 1, 'Corso di laurea triennale in Lettere Informatiche presso Università ABC', '2010-09-01', '2013-07-01', 6, 91),
    ('Master in Storia dell Informatica', 1, 'Master in Storia dell Informatica presso Università ABC', '2014-09-01', '2016-07-01', 6, 95);

-- Istruzione per Giovanni Romano
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 2, 'Diploma in Informatica presso Scuola Tecnica Informatica DEF', '2008-09-01', '2010-07-01', 7, 92),
    ('Laurea in Medicina Informatica', 2, 'Corso di laurea triennale in Medicina Informatica presso Università DEF', '2010-09-01', '2013-07-01', 7, 96),
    ('Specializzazione in Chirurgia Informatica', 2, 'Specializzazione in Chirurgia Informatica presso Università DEF', '2014-09-01', '2019-07-01', 7, 99);

-- Istruzione per Alice Rossi
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 1, 'Diploma in Informatica presso Scuola Tecnica Informatica ABC', '2008-09-01', '2010-07-01', 8, 88),
    ('Laurea in Scienze Politiche Informatiche', 1, 'Corso di laurea triennale in Scienze Politiche Informatiche presso Università ABC', '2010-09-01', '2013-07-01', 8, 89),
    ('Master in Relazioni Informatiche', 1, 'Master in Relazioni Informatiche presso Università ABC', '2014-09-01', '2016-07-01', 8, 94);

-- Istruzione per Luca Bianchi
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 2, 'Diploma in Informatica presso Scuola Tecnica Informatica DEF', '2008-09-01', '2010-07-01', 9, 90),
    ('Laurea in Economia Aziendale e Informatica', 2, 'Corso di laurea triennale in Economia Aziendale e Informatica presso Università DEF', '2010-09-01', '2013-07-01', 9, 93),
    ('Master in Finanza Informatica', 2, 'Master in Finanza Informatica presso Università DEF', '2014-09-01', '2016-07-01', 9, 97);

-- Istruzione per Sophia Verdi
INSERT INTO Istruzione (grado, id_citta, descrizione_istruzione, data_inizio, data_fine, id_user, valutazione)
VALUES 
    ('Diploma in Informatica', 3, 'Diploma in Informatica presso Scuola Tecnica Informatica LMN', '2008-09-01', '2010-07-01', 10, 85),
    ('Laurea in Lingue Straniere Informatiche', 3, 'Corso di laurea triennale in Lingue Straniere Informatiche presso Università LMN', '2010-09-01', '2013-07-01', 10, 87),
    ('Diploma in Traduzione e Interpretariato Informatico', 3, 'Diploma in Traduzione e Interpretariato Informatico presso Università LMN', '2014-09-01', '2016-07-01', 10, 91);


    
/*	Insert CategoriaPosizione	*/

insert into CategoriaPosizione (nome_categoria) values ('Sviluppattore');
--Sviluppatore di Software, Sviluppatore Web, Sviluppatore Front-end, Sviluppatore Back-end, Sviluppatore Full-stack, Sviluppatore Mobile, Sviluppatore di Applicazioni, Sviluppatore di Giochi, Sviluppatore Embedded, Sviluppatore DevOps
insert into CategoriaPosizione (nome_categoria) values ('Analyst'); 
--Analista di Dati,Analista di Sistema,Analista di Business,Analista di Sicurezza,Analista di Marketing,Analista delle Operazioni
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Gestione Progetti');
--Project Manager, Coordinatore di Progetto, Direttore dei Progetti, Responsabile della Gestione Progetti, Project Leader, Analista di Progetto,
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Sicurezza Informatica');
--Esperto di Sicurezza Informatica, Analista di Sicurezza delle Informazioni, Amministratore di Sicurezza di Rete, Esperto di Analisi delle Vulnerabilità, Architetto di Sicurezza, Ingegnere di Sicurezza, Consulente di Sicurezza, Esperto di Penetration Testing
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Amministrazione di Sistema e Reti');
--mministratore di Rete, Ingegnere di Rete, Specialista di Sistemi e Reti, Tecnico di Supporto di Rete, Gestore di Infrastruttura IT, Amministratore di Server, Tecnico di Sistemi, Responsabile di Reti, Esperto di Architettura di Rete
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Architettura Software');
--Progettista Software, Ingegnere Software, Architetto delle Applicazioni, Design Pattern Specialist, Analista di Architettura Software, Lead Developer, Esperto di Software Design
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Supporto Tecnico');
--Tecnico di Assistenza, Tecnico del Supporto Clienti, Esperto di Supporto Tecnico, Tecnico di Primo Livello, Tecnico di Secondo Livello, Analista del Supporto Tecnico, Ingegnere del Supporto Tecnico, Tecnico di Rete, Tecnico di Assistenza Tecnica.
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Gestione Qualità');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Analisi dei Dati e Business Intelligence');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Progettazione UX/UI');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Sviluppo Software');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Analyst developer');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Cloud Computing');


/*	Inserimento	quiz Python - Domande e Risposte	*/
INSERT INTO Quiz VALUES ('Python', 8);

INSERT INTO Domanda VALUES ('Che cos è Python', 1);
INSERT INTO Domanda VALUES ('Qual è la principale caratteristica di Python che lo rende facile da leggere e scrivere?', 1);
INSERT INTO Domanda VALUES ('Come si dichiara una variabile in Python?', 1);
INSERT INTO Domanda VALUES ('Qual è il modo corretto per commentare il codice in Python?', 1);
INSERT INTO Domanda VALUES ('Come si esegue un ciclo for in Python?', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra una lista e una tupla in Python?', 1);
INSERT INTO Domanda VALUES ('Come si definisce una funzione in Python?', 1);
INSERT INTO Domanda VALUES ('Come si effettua limport di un modulo in Python?', 1);

INSERT INTO RisposteDomanda VALUES ('Un linguaggio di programmazione orientato agli oggetti', 'Un serpente velenoso', 'Un sistema operativo', 'Un framework di sviluppo web', 'scelta1', 1);
INSERT INTO RisposteDomanda VALUES ('La sintassi chiara e leggibile.', 'L alta velocità di esecuzione.', 'La compatibilità con Java.', 'La tipizzazione statica.', 'scelta1', 2)
INSERT INTO RisposteDomanda VALUES ('var nome_variabile = valore', 'Dim nome_variabile As Integer', 'nome_variabile = valore', 'nome_variabile = valore(tipo)', 'scelta3', 3);
INSERT INTO RisposteDomanda VALUES ('//Questo è un commento', '#Questo è un commento ', '/*Questo è un commento*/', '-- Questo è un commento', 'scelta2', 4);
INSERT INTO RisposteDomanda VALUES ('for i in range(10):', 'while i < 10:', 'repeat(10):', 'foreach i in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]:', 'scelta1', 5);
INSERT INTO RisposteDomanda VALUES ('Le liste sono immutabili, le tuple sono mutabili.', 'Le liste sono ordinate, le tuple sono non ordinate.', 'Le liste sono mutabili, le tuple sono immutabili.', 'Non ci sono differenze tra liste e tuple.', 'scelta3', 6);
INSERT INTO RisposteDomanda VALUES ('function nome_funzione(parametri):', 'def nome_funzione(parametri):', 'define nome_funzione(parametri):', 'define nome_funzione(parametri):', 'scelta2', 7);
INSERT INTO RisposteDomanda VALUES ('use modulo', 'require modulo', 'import modulo', 'include modulo', 'scelta3', 8);

INSERT INTO QuizDomanda VALUES(1, 1);
INSERT INTO QuizDomanda VALUES(2, 1);
INSERT INTO QuizDomanda VALUES(3, 1);
INSERT INTO QuizDomanda VALUES(4, 1);
INSERT INTO QuizDomanda VALUES(5, 1);
INSERT INTO QuizDomanda VALUES(6, 1);
INSERT INTO QuizDomanda VALUES(7, 1);
INSERT INTO QuizDomanda VALUES(8, 1);


/*	Inserimento	quiz Java - Domande e Risposte	*/
INSERT INTO Quiz VALUES ('Java', 8);

INSERT INTO Domanda VALUES ('Qual è il principio fondamentale di Java che contribuisce a garantire la portabilità del codice?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo JVM in Java?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per l ambiente di esecuzione in cui viene eseguito il codice Java?', 1);
INSERT INTO Domanda VALUES (' Qual è il risultato dell istruzione System.out.println(5 / 2); in Java? ', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine thread in Java?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per la gestione delle eccezioni in Java?', 1);
INSERT INTO Domanda VALUES ('Qual è il costrutto utilizzato per iterare attraverso una collezione di elementi in Java?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per la capacità di una classe di ereditare da una sola classe base in Java?', 1);

INSERT INTO RisposteDomanda VALUES ('JVM (Java Virtual Machine)', 'JRE (Java Runtime Environment)', 'JDK (Java Development Kit)', 'JAR (Java Archive)', 'scelta1', 9)
INSERT INTO RisposteDomanda VALUES ('Java Version Manager', 'Java Virtual Machine', 'Java Variable Manager', 'Java View Model', 'scelta2', 10);
INSERT INTO RisposteDomanda VALUES ('IDE (Integrated Development Environment)', 'JVM (Java Virtual Machine)', 'JAR (Java Archive)', 'JRE (Java Runtime Environment)', 'scelta2', 11);
INSERT INTO RisposteDomanda VALUES ('2.5', '2', '2.0', '2 con troncamento a 2', 'scelta2', 12);
INSERT INTO RisposteDomanda VALUES ('Un blocco di codice racchiuso tra parentesi graffe.', ' Un unità di esecuzione concorrente leggera all interno di un processo.', 'Un interfaccia grafica utente.', 'Un costruttore di classe.', 'scelta2', 13);
INSERT INTO RisposteDomanda VALUES ('try/catch', 'if/else', 'switch/case', 'for/while', 'scelta1', 14);
INSERT INTO RisposteDomanda VALUES ('foreach', 'for/in', 'while/loop', 'repeat/until', 'scelta1', 15);
INSERT INTO RisposteDomanda VALUES ('Ereditarietà singola', 'Ereditarietà multipla', 'Ereditarietà multi-strato', 'Ereditarietà multi-diretta', 'scelta1', 16);

INSERT INTO QuizDomanda VALUES(9, 2);
INSERT INTO QuizDomanda VALUES(10, 2);
INSERT INTO QuizDomanda VALUES(11, 2);
INSERT INTO QuizDomanda VALUES(12, 2);
INSERT INTO QuizDomanda VALUES(13, 2);
INSERT INTO QuizDomanda VALUES(14, 2);
INSERT INTO QuizDomanda VALUES(15, 2);
INSERT INTO QuizDomanda VALUES(16, 2);


/* Inserimento quiz C  */
INSERT INTO Quiz VALUES ('C', 8);

INSERT INTO Domanda VALUES ('Qual è il simbolo utilizzato per l operatore di assegnazione in C?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine printf in C?', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra un array e un puntatore in C?', 1);
INSERT INTO Domanda VALUES ('Come si dichiara una variabile intera (int) chiamata numero in C?', 1);
INSERT INTO Domanda VALUES ('Qual è l operatore utilizzato per accedere all indirizzo di una variabile in C?', 1);
INSERT INTO Domanda VALUES ('Cosa fa l istruzione sizeof in C?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine void in una dichiarazione di funzione in C?', 1);
INSERT INTO Domanda VALUES ('Qual è l operatore logico per l AND in C?', 1);

INSERT INTO RisposteDomanda VALUES (':=', '=', '->', '==', 'scelta2', 17)
INSERT INTO RisposteDomanda VALUES ('Una funzione per l input utente.', 'Una funzione per la stampa su schermo.', 'Una funzione per la somma di numeri.', 'Una costante predefinita.', 'scelta2', 18);
INSERT INTO RisposteDomanda VALUES ('Gli array possono cambiare dimensione dinamicamente, i puntatori no.', 'Gli array possono essere utilizzati solo per dati interi, mentre i puntatori possono contenere qualsiasi tipo di dato.', ' Gli array sono sempre di dimensione fissa, mentre i puntatori possono essere riallocati dinamicamente.', 'Gli array e i puntatori sono concettualmente equivalenti in C.', 'scelta3', 19);
INSERT INTO RisposteDomanda VALUES ('integer numero;', 'int numero;', 'declare numero as int;', 'numero int;', 'scelta3', 20);
INSERT INTO RisposteDomanda VALUES ('&', '*', '->', '@', 'scelta1', 21);
INSERT INTO RisposteDomanda VALUES ('Restituisce il valore di una variabile.', 'Restituisce la dimensione in byte di un tipo di dati o una variabile.', 'Calcola la somma di tutti gli elementi di un array.', 'Esegue una scansione di un file.', 'scelta2', 22);
INSERT INTO RisposteDomanda VALUES ('Il tipo di ritorno della funzione.', 'L assenza di parametri per la funzione.', 'Una variabile globale.', 'La presenza di parametri opzionali.', 'scelta1', 23);
INSERT INTO RisposteDomanda VALUES ('&&', '||', '&', '|', 'scelta1', 24);

INSERT INTO QuizDomanda VALUES(17, 3);
INSERT INTO QuizDomanda VALUES(18, 3);
INSERT INTO QuizDomanda VALUES(19, 3);
INSERT INTO QuizDomanda VALUES(20, 3);
INSERT INTO QuizDomanda VALUES(21, 3);
INSERT INTO QuizDomanda VALUES(22, 3);
INSERT INTO QuizDomanda VALUES(23, 3);
INSERT INTO QuizDomanda VALUES(24, 3);


/* Inserimento quiz C++  Id_quiz 4*/
INSERT INTO Quiz VALUES ('C++', 8);

INSERT INTO Domanda VALUES ('Qual è la differenza principale tra C e C++?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine polimorfismo in C++?', 1);
INSERT INTO Domanda VALUES ('Qual è l operatore utilizzato per la gestione delle eccezioni in C++?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo STL in C++?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per indicare la creazione di una nuova classe basata su un altra classe esistente in C++?', 1);
INSERT INTO Domanda VALUES ('Come si dichiara una variabile costante (const) in C++?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per una funzione membro di una classe che viene chiamata automaticamente quando un oggetto di quella classe viene creato?', 1);
INSERT INTO Domanda VALUES ('Qual è il risultato dell istruzione cout << 5 / 2 in C++?', 1);

INSERT INTO RisposteDomanda VALUES ('C++ è un linguaggio interpretato, mentre C è compilato.', 'C++ è un estensione di C che aggiunge il supporto agli oggetti.', 'C++ è noto per essere più veloce in termini di esecuzione rispetto a C.', 'C++ è completamente incompatibile con C.', 'scelta2', 25)
INSERT INTO RisposteDomanda VALUES ('La capacità di avere molteplici definizioni di una stessa funzione nello stesso programma.', 'La capacità di una classe di ereditare da più di una classe base.', 'La capacità di una funzione di essere utilizzata in modo diverso a seconda del tipo degli oggetti su cui viene chiamata.', 'La capacità di utilizzare una variabile senza dichiararla.', 'scelta3', 26);
INSERT INTO RisposteDomanda VALUES ('try/catch', 'if/else', 'switch/case', 'for/while', 'scelta1', 27);
INSERT INTO RisposteDomanda VALUES ('Standard Text Library', 'Standard Template Library', 'Standard Time Library', 'Standard Type Library', 'scelta2', 28);
INSERT INTO RisposteDomanda VALUES ('Clonazione', 'Ereditarietà', 'Polimorfismo', 'Astrazione', 'scelta2', 29);
INSERT INTO RisposteDomanda VALUES ('constant int nome_variabile = valore;', 'int const nome_variabile = valore;', 'readonly int nome_variabile = valore;', 'constante nome_variabile = valore;', 'scelta2', 30);
INSERT INTO RisposteDomanda VALUES ('Inizializzatore', 'Costruttore', 'Distruttore', 'Metodo', 'scelta2', 31);
INSERT INTO RisposteDomanda VALUES ('2.5', '2', '2.0', '2.5 con troncamento a 2', 'scelta2', 32);

INSERT INTO QuizDomanda VALUES(25, 4);
INSERT INTO QuizDomanda VALUES(26, 4);
INSERT INTO QuizDomanda VALUES(27, 4);
INSERT INTO QuizDomanda VALUES(28, 4);
INSERT INTO QuizDomanda VALUES(29, 4);
INSERT INTO QuizDomanda VALUES(30, 4);
INSERT INTO QuizDomanda VALUES(31, 4);
INSERT INTO QuizDomanda VALUES(32, 4);


/* Crezione quiz Javascript Id_quiz 5*/
INSERT INTO Quiz VALUES ('Javascript', 8);

INSERT INTO Domanda VALUES ('Qual è il tipo di dati primitivo per rappresentare numeri interi in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Come si dichiara una variabile in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Quale operatore è utilizzato per la concatenazione di stringhe in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Come si crea un array vuoto in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo DOM in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Qual è l output del seguente codice JavaScript?', 1);
INSERT INTO Domanda VALUES ('Come si definisce una funzione in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per la capacità di una funzione di richiamare se stessa in JavaScript? ```console.log(3 + 2 + 7);```', 1);

INSERT INTO RisposteDomanda VALUES ('int', 'long', 'float', 'number', 'scelta4', 33)
INSERT INTO RisposteDomanda VALUES ('declare var nome_variabile;', 'let nome_variabile;', 'variable nome_variabile;', 'var nome_variabile;', 'scelta4', 34);
INSERT INTO RisposteDomanda VALUES ('+', '&', '||', ':', 'scelta1', 35);
INSERT INTO RisposteDomanda VALUES ('emptyArray()', '[]', 'new Array()', 'array()', 'scelta2', 36);
INSERT INTO RisposteDomanda VALUES ('Data Object Model', 'Document Object Model', 'Digital Object Model', 'Dynamic Object Model', 'scelta1', 37);
INSERT INTO RisposteDomanda VALUES ('57', '12', '32', '57', 'scelta4', 38);
INSERT INTO RisposteDomanda VALUES ('function nome_funzione(parametri) {}', 'def nome_funzione(parametri) {}', 'create function nome_funzione(parametri) {}', 'func nome_funzione(parametri) {}', 'scelta1', 39);
INSERT INTO RisposteDomanda VALUES ('Ricorsione', 'Chiamata multipla', 'Esecuzione parallela', 'Iterazione', 'scelta1', 40);

INSERT INTO QuizDomanda VALUES(33, 5);
INSERT INTO QuizDomanda VALUES(34, 5);
INSERT INTO QuizDomanda VALUES(35, 5);
INSERT INTO QuizDomanda VALUES(36, 5);
INSERT INTO QuizDomanda VALUES(37, 5);
INSERT INTO QuizDomanda VALUES(38, 5);
INSERT INTO QuizDomanda VALUES(39, 5);
INSERT INTO QuizDomanda VALUES(40, 5);


/* Crezione quiz HTML, CSS Id_quiz 6*/
INSERT INTO Quiz VALUES ('HTML, CSS', 10);

INSERT INTO Domanda VALUES ('Qual è il linguaggio utilizzato per definire la struttura di una pagina web? ', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per il tipo di tag HTML che non richiede una tag di chiusura?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo CSS in relazione alla progettazione web?', 1);
INSERT INTO Domanda VALUES ('Qual è il selettore in CSS che seleziona tutti gli elementi di un determinato tipo?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per il modello di formattazione che consente di posizionare elementi HTML in modo relativo agli altri?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per l attributo HTML che definisce lo stile CSS direttamente nell elemento?', 1);
INSERT INTO Domanda VALUES ('Qual è l elemento HTML utilizzato per collegare un file CSS esterno a una pagina HTML?', 1);
INSERT INTO Domanda VALUES ('Qual è il selettore CSS per selezionare tutti gli elementi con una determinata classe?', 1);
INSERT INTO Domanda VALUES ('Quale dei seguenti è un elemento HTML per creare una lista numerata?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per l attributo HTML che definisce il colore del testo?', 1);

INSERT INTO RisposteDomanda VALUES ('HTML', 'CSS', 'JavaScript', 'XML', 'scelta1', 41);
INSERT INTO RisposteDomanda VALUES ('Tag autonomi', 'Tag comuni', 'Tag principali', 'Tag essenziali', 'scelta1', 42);
INSERT INTO RisposteDomanda VALUES ('Cascading Style Sheet', 'Creative Styling System', 'Computer Style Specification', 'Complex Styling Syntax', 'scelta1', 43);
INSERT INTO RisposteDomanda VALUES ('*', '#', '.', ':', 'scelta1', 44);
INSERT INTO RisposteDomanda VALUES ('Layout di griglia', 'Box Model', 'Posizionamento statico', 'Modello di posizionamento', 'scelta1', 45);
INSERT INTO RisposteDomanda VALUES ('Style', 'Class', 'Id', 'Link', 'scelta1', 46);
INSERT INTO RisposteDomanda VALUES ('link', 'style', 'script', 'css', 'scelta1', 47);
INSERT INTO RisposteDomanda VALUES ('a', '#', '*', ':', 'scelta1', 48);
INSERT INTO RisposteDomanda VALUES ('ul', 'li', 'ol', 'dl', 'scelta3', 49);
INSERT INTO RisposteDomanda VALUES ('color', 'text-color', 'font-color', 'style', 'scelta1', 50);

INSERT INTO QuizDomanda VALUES(41, 6);
INSERT INTO QuizDomanda VALUES(42, 6);
INSERT INTO QuizDomanda VALUES(43, 6);
INSERT INTO QuizDomanda VALUES(44, 6);
INSERT INTO QuizDomanda VALUES(45, 6);
INSERT INTO QuizDomanda VALUES(46, 6);
INSERT INTO QuizDomanda VALUES(47, 6);
INSERT INTO QuizDomanda VALUES(48, 6);
INSERT INTO QuizDomanda VALUES(49, 6);
INSERT INTO QuizDomanda VALUES(50, 6);

/* Crezione quiz Comunicazione efficace Id_quiz 7*/
INSERT INTO Quiz VALUES ('Comunicazione efficace', 5);

INSERT INTO Domanda VALUES ('Come ti comporti quando devi spiegare un concetto complesso a qualcuno che non ne ha familiarità?', 1);
INSERT INTO Domanda VALUES ('Come rispondi quando qualcuno ti interrompe durante una conversazione?', 1);
INSERT INTO Domanda VALUES ('Come gestisci una situazione in cui devi dare feedback negativo a un collega?', 1);
INSERT INTO Domanda VALUES ('Quando parli in pubblico, come prepari il tuo discorso?', 1);
INSERT INTO Domanda VALUES ('Come ti comporti quando hai una divergenza di opinioni con un collega durante una riunione?', 1);

INSERT INTO RisposteDomanda VALUES ('Non ho mai lavorato in un team', 'Ho lavorato in un team, ma non ho fatto molto', 'Ho lavorato come parte di un team e ho contribuito con le mie competenze', 'Non ricordo nessuna esperienza di lavoro di squadra', 'scelta3', 51)
INSERT INTO RisposteDomanda VALUES ('Cerco di imporre la mia opinione a tutti i costi', 'Evito il confronto e non dico niente', 'Discuto apertamente e cerco un compromesso', ' Non so come gestire le divergenze', 'scelta3', 52);
INSERT INTO RisposteDomanda VALUES ('Non ho mai aiutato un collega', 'Non ho mai avuto occasioni di aiutare un collega', 'Ho offerto supporto e aiuto in situazioni simili', 'Non ricordo di aver aiutato nessuno', 'scelta3', 53);
INSERT INTO RisposteDomanda VALUES ('Non condivido mai le mie opinioni', 'Lo faccio in modo aggressivo e dominante', 'Condivido apertamente e ascolto le opinioni degli altri', 'Non so come comunicare le mie idee', 'scelta3', 54);
INSERT INTO RisposteDomanda VALUES ('Non ho un ruolo ideale', 'Voglio sempre essere il capo', 'Mi piace adattarmi al ruolo necessario per il successo del team', 'Non ho mai pensato a un ruolo ideale', 'scelta3', 55);

INSERT INTO QuizDomanda VALUES(51, 7);
INSERT INTO QuizDomanda VALUES(52, 7);
INSERT INTO QuizDomanda VALUES(53, 7);
INSERT INTO QuizDomanda VALUES(54, 7);
INSERT INTO QuizDomanda VALUES(55, 7);


/* Quiz Lavoro di squadra Id_quiz 8 */
INSERT INTO Quiz VALUES ('Lavoro di squadra', 5);

INSERT INTO Domanda VALUES ('Descrivi un esperienza recente in cui hai lavorato in un team. Qual è stato il tuo ruolo e come hai contribuito al successo del progetto?', 1);
INSERT INTO Domanda VALUES ('Come gestisci le divergenze di opinione con i membri del tuo team durante un progetto? ', 1);
INSERT INTO Domanda VALUES ('Puoi raccontare un esempio in cui hai aiutato un collega a superare una sfida o un ostacolo sul lavoro?', 1);
INSERT INTO Domanda VALUES ('Come comunichi le tue idee e opinioni all interno del tuo team?', 1);
INSERT INTO Domanda VALUES ('Qual è il tuo ruolo ideale in un team e perché?', 1);

INSERT INTO RisposteDomanda VALUES ('Non ho mai lavorato in un team', 'Ho lavorato in un team, ma non ho fatto molto', 'Ho lavorato come parte di un team e ho contribuito con le mie competenze', 'Non ricordo nessuna esperienza di lavoro di squadra', 'scelta3', 56);
INSERT INTO RisposteDomanda VALUES ('Cerco di imporre la mia opinione a tutti i costi', 'Evito il confronto e non dico niente', 'Discuto apertamente e cerco un compromesso', 'Non so come gestire le divergenze', 'scelta3', 57);
INSERT INTO RisposteDomanda VALUES ('Non ho mai aiutato un collega', 'Non ho mai avuto occasioni di aiutare un collega', 'Ho offerto supporto e aiuto in situazioni simili', 'Non ricordo di aver aiutato nessuno', 'scelta3', 58);
INSERT INTO RisposteDomanda VALUES ('Non condivido mai le mie opinioni', 'Lo faccio in modo aggressivo e dominante', 'Condivido apertamente e ascolto le opinioni degli altri ', 'Non so come comunicare le mie idee', 'scelta3', 59);
INSERT INTO RisposteDomanda VALUES ('Non ho un ruolo ideale', 'Voglio sempre essere il capo', 'Mi piace adattarmi al ruolo necessario per il successo del team', 'Non ho mai pensato a un ruolo ideale', 'scelta3', 60);

INSERT INTO QuizDomanda VALUES(56, 8);
INSERT INTO QuizDomanda VALUES(57, 8);
INSERT INTO QuizDomanda VALUES(58, 8);
INSERT INTO QuizDomanda VALUES(59, 8);
INSERT INTO QuizDomanda VALUES(60, 8);


/* Quiz Leadership Id_quiz 9 */
INSERT INTO Quiz VALUES ('Leadership', 5);

INSERT INTO Domanda VALUES ('Puoi raccontare un esempio in cui hai guidato un gruppo o una squadra verso il raggiungimento di un obiettivo? Qual è stato il risultato?', 1);
INSERT INTO Domanda VALUES ('Come ispiri e motivi gli altri a dare il massimo nel loro lavoro o nei progetti?', 1);
INSERT INTO Domanda VALUES ('Come prendi decisioni importanti quando sei alla guida di un progetto o di un team?', 1);
INSERT INTO Domanda VALUES ('Come gestisci le situazioni di conflitto all interno del tuo gruppo o team?', 1);
INSERT INTO Domanda VALUES ('Quali sono le tue strategie per comunicare la visione e gli obiettivi a lungo termine al tuo team?', 1);

INSERT INTO RisposteDomanda VALUES ('Non ho mai guidato un gruppo', 'Ho guidato un gruppo, ma senza successo', 'Non ricordo nessun esempio del genere', 'Ho guidato un gruppo e abbiamo raggiunto l obiettivo con successo', 'scelta4', 61);
INSERT INTO RisposteDomanda VALUES ('Non mi interesso di motivare gli altri', 'Cerco di controllare e dire agli altri cosa fare', ' Offro supporto, incoraggiamento e riconoscimento', 'Non so come motivare gli altri', 'scelta3', 62);
INSERT INTO RisposteDomanda VALUES ('Decido da solo senza coinvolgere gli altri', 'Cerco il consenso senza prendere una decisione definitiva', 'Coinvolgo il team nella discussione e prendiamo una decisione collettiva', 'Non so come prendere decisioni importanti', 'scelta3', 63);
INSERT INTO RisposteDomanda VALUES ('Evito il conflitto e spero che si risolva da solo', 'Impongo la mia decisione senza ascoltare gli altri', 'Promuovo una discussione aperta e cerco di raggiungere un compromesso', 'Non so come gestire il conflitto', 'scelta3', 64);
INSERT INTO RisposteDomanda VALUES ('Non ho una visione o obiettivi a lungo termine', 'Non condivido la mia visione con il team', 'Comunico chiaramente la visione e coinvolgo il team nella sua realizzazione', 'Non ho mai dovuto comunicare una visione', 'scelta3', 65);

INSERT INTO QuizDomanda VALUES(61, 9);
INSERT INTO QuizDomanda VALUES(62, 9);
INSERT INTO QuizDomanda VALUES(63, 9);
INSERT INTO QuizDomanda VALUES(64, 9);
INSERT INTO QuizDomanda VALUES(65, 9);



/* Quiz Gestione dello stress Id_quiz 10*/
INSERT INTO Quiz VALUES ('Gestione dello stress', 5);

INSERT INTO Domanda VALUES ('Come reagisci quando ti trovi sotto una pressione estrema al lavoro o a scuola?', 1);
INSERT INTO Domanda VALUES ('Quali sono le tue strategie per affrontare situazioni stressanti nella tua vita quotidiana?', 1);
INSERT INTO Domanda VALUES ('Come gestisci scadenze strette e molteplici compiti da completare contemporaneamente?', 1);
INSERT INTO Domanda VALUES ('Cosa fai quando ricevi una critica o un feedback negativo da parte di un superiore o di un collega?', 1);
INSERT INTO Domanda VALUES ('Quali attività o hobby pratici per rilassarti e ricaricare le energie dopo una giornata stressante? ', 1);

INSERT INTO RisposteDomanda VALUES ('Perdo il controllo e mi arrabbio', 'Cerco di sfogare lo stress su altre persone', 'Respiro profondamente e cerco di affrontare la situazione in modo razionale', 'Non so come reagire sotto pressione', 'scelta3', 66);
INSERT INTO RisposteDomanda VALUES ('Non ho strategie, cerco solo di sopravvivere', 'Mi faccio prendere dal panico', 'Esercito la meditazione, faccio attività fisica o pratico il rilassamento', ' Non so come affrontare lo stress', 'scelta3', 67);
INSERT INTO RisposteDomanda VALUES ('Lascio tutto all ultimo minuto e spero per il meglio', 'Sono costantemente sopraffatto e non riesco a gestirlo', 'Pianifico e organizzo il mio lavoro, concentrandomi sulle priorità', 'Non so come gestire scadenze strette', 'scelta3', 68);
INSERT INTO RisposteDomanda VALUES ('Mi sento ferito e arrabbiato', 'Ignoro il feedback e faccio finta di niente', 'Accetto il feedback in modo costruttivo e cerco di imparare dalle critiche', 'Non so come reagire al feedback negativo', 'scelta3', 69);
INSERT INTO RisposteDomanda VALUES ('Non ho attività di rilassamento', 'Non riesco a rilassarmi', 'Pratico hobby, faccio esercizio fisico o leggo per rilassarmi', 'Non ho bisogno di rilassarmi', 'scelta3', 70);

INSERT INTO QuizDomanda VALUES(66, 10);
INSERT INTO QuizDomanda VALUES(67, 10);
INSERT INTO QuizDomanda VALUES(68, 10);
INSERT INTO QuizDomanda VALUES(69, 10);
INSERT INTO QuizDomanda VALUES(70, 10);


/* Quiz Risoluzione dei problemi Id_quiz 11 */
INSERT INTO Quiz VALUES ('Risoluzione dei problemi', 5);

INSERT INTO Domanda VALUES ('Puoi raccontare un esempio di un problema complesso che hai affrontato e risolto con successo?', 1);
INSERT INTO Domanda VALUES ('Come affronti una situazione in cui incontri una difficoltà o un ostacolo in un progetto o nel lavoro?', 1);
INSERT INTO Domanda VALUES ('Quali sono le tue strategie per raccogliere informazioni e dati necessari per risolvere un problema?', 1);
INSERT INTO Domanda VALUES ('Come coinvolgi gli altri nella risoluzione di un problema complesso?', 1);
INSERT INTO Domanda VALUES ('Quali sono i passaggi che segui per analizzare e scomporre un problema in sotto-problemi più gestibili?', 1);

INSERT INTO RisposteDomanda VALUES ('Non ho mai affrontato problemi complessi', 'Ho affrontato problemi, ma non sono riuscito a risolverli', 'Ho analizzato il problema, sviluppato soluzioni e risolto con successo', 'Non ricordo situazioni del genere', 'scelta3', 71);
INSERT INTO RisposteDomanda VALUES ('Mi arrendo e chiedo aiuto a qualcun altro', 'Cerco di ignorare il problema e sperare che svanisca', 'Identifico la causa del problema e cerco soluzioni per superarlo', 'Non so come affrontare le difficoltà', 'scelta3', 72);
INSERT INTO RisposteDomanda VALUES ('Non raccolgo mai informazioni', 'Ricerco solo informazioni di base', 'Ricerco, analizzo e valuto attentamente le informazioni', 'Non so come raccogliere informazioni', 'scelta3', 73);
INSERT INTO RisposteDomanda VALUES ('Non coinvolgo nessuno, preferisco lavorare da solo', 'Coinvolgo gli altri, ma non ascolto le loro opinioni', 'Faccio brainstorming e collaboro con il team per trovare soluzioni', 'Non so come coinvolgere gli altri', 'scelta3', 74);
INSERT INTO RisposteDomanda VALUES ('Non scompongo il problema', 'Scompongo il problema in modo casuale', 'Identifico le parti del problema e le analizzo in dettaglio', 'Non so come scomporre un problema', 'scelta3', 75);

INSERT INTO QuizDomanda VALUES(71, 11);
INSERT INTO QuizDomanda VALUES(72, 11);
INSERT INTO QuizDomanda VALUES(73, 11);
INSERT INTO QuizDomanda VALUES(74, 11);
INSERT INTO QuizDomanda VALUES(75, 11);




/* QUIZ NUOVI HARDSKILL */
INSERT INTO Quiz VALUES ('Linux', 5);


-- Inserisci domande casuali per il nuovo quiz
INSERT INTO Domanda VALUES ('Cos''è Linux e quali sono le sue principali caratteristiche?', 2);
INSERT INTO Domanda VALUES ('Spiega il concetto di shell in Linux.', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra una directory e un file in Linux?', 2);
INSERT INTO Domanda VALUES ('Descrivi il ruolo del file /etc/passwd in Linux.', 2);
INSERT INTO Domanda VALUES ('Come funziona la gestione dei permessi in Linux?', 1);

-- Inserisci risposte casuali per le nuove domande
INSERT INTO RisposteDomanda VALUES ('Linux è un sistema operativo open source basato su kernel Unix.', 'Linux è una suite di produttività aziendale.', 'Linux è specifico solo per dispositivi mobili.', 'Linux è una piattaforma per il design grafico.', 'scelta1', 76);
INSERT INTO RisposteDomanda VALUES ('La shell in Linux è un interprete di comandi che consente agli utenti di interagire con il sistema operativo.', 'La shell in Linux è un concetto obsoleto e non dovrebbe essere utilizzata.', 'Linux non supporta una shell.', 'La shell in Linux è utilizzata solo per la gestione dei file.', 'scelta1', 77);
INSERT INTO RisposteDomanda VALUES ('In Linux, una directory è una raccolta di file, mentre un file contiene dati o programmi.', 'Le directory e i file in Linux sono sinonimi e possono essere utilizzati intercambiabilmente.', 'Linux non supporta directory o file.', 'Le directory in Linux sono utilizzate solo per la gestione degli utenti.', 'scelta1', 78);
INSERT INTO RisposteDomanda VALUES ('Il file /etc/passwd in Linux contiene informazioni sugli account degli utenti, come nome utente, UID e GID.', 'Il file /etc/passwd in Linux è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Linux non ha un file /etc/passwd.', 'Il file /etc/passwd in Linux contiene solo informazioni sui privilegi di amministratore.', 'scelta1', 79);
INSERT INTO RisposteDomanda VALUES ('La gestione dei permessi in Linux si basa sull''utilizzo di comandi come chmod e chown per controllare l''accesso ai file e alle directory.', 'La gestione dei permessi in Linux è un concetto obsoleto e non dovrebbe essere utilizzata.', 'Linux non supporta la gestione dei permessi.', 'La gestione dei permessi in Linux è limitata solo agli account amministrativi.', 'scelta1', 80);

INSERT INTO QuizDomanda VALUES(76, 12);	
INSERT INTO QuizDomanda VALUES(77, 12);
INSERT INTO QuizDomanda VALUES(78, 12);	
INSERT INTO QuizDomanda VALUES(79, 12);
INSERT INTO QuizDomanda VALUES(80, 12);




INSERT INTO Quiz VALUES ('Windows', 5);

-- Inserisci domande casuali per il nuovo quiz
INSERT INTO Domanda VALUES ('Cos''è Windows e quali sono le sue principali caratteristiche?', 2);
INSERT INTO Domanda VALUES ('Spiega il concetto di file system in Windows.', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra una finestra e un processo in Windows?', 4);
INSERT INTO Domanda VALUES ('Descrivi il ruolo del registro di sistema in Windows.', 1);
INSERT INTO Domanda VALUES ('Come funziona la gestione degli utenti in Windows?', 2);

-- Inserisci risposte casuali per le nuove domande
INSERT INTO RisposteDomanda VALUES ('Windows è un sistema operativo per computer sviluppato da Microsoft.', 'Windows è una suite di produttività aziendale.', 'Windows è specifico solo per dispositivi mobili.', 'Windows è una piattaforma per il design grafico.', 'scelta1', 81);
INSERT INTO RisposteDomanda VALUES ('Il file system in Windows gestisce la memorizzazione e l''organizzazione dei file su un disco.', 'Il file system in Windows è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Windows non supporta un file system.', 'Il file system in Windows è limitato solo ai file di sistema.', 'scelta1', 82);
INSERT INTO RisposteDomanda VALUES ('In Windows, una finestra rappresenta un''area visualizzabile dell''interfaccia utente, mentre un processo è un''istanza di un''applicazione in esecuzione.', 'Le finestre e i processi in Windows sono sinonimi e possono essere utilizzati intercambiabilmente.', 'Windows non supporta finestre o processi.', 'Le finestre in Windows sono utilizzate solo per la gestione degli utenti.', 'scelta1', 83);
INSERT INTO RisposteDomanda VALUES ('Il registro di sistema in Windows contiene informazioni di configurazione importanti per il sistema operativo e le applicazioni.', 'Il registro di sistema in Windows è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Windows non ha un registro di sistema.', 'Il registro di sistema in Windows è limitato solo alla registrazione degli errori di sistema.', 'scelta1', 84);
INSERT INTO RisposteDomanda VALUES ('La gestione degli utenti in Windows si basa sull''utilizzo di account utente che possono avere diverse autorizzazioni.', 'La gestione degli utenti in Windows è un concetto obsoleto e non dovrebbe essere utilizzata.', 'Windows non supporta la gestione degli utenti.', 'La gestione degli utenti in Windows è limitata solo agli account amministrativi.', 'scelta1', 85);

--Collega le nuove domande al nuovo quiz per Widnwos
INSERT INTO QuizDomanda VALUES(81, 13);	-- Dove 13 è l'ID del nuovo quiz
INSERT INTO QuizDomanda VALUES(82, 13);
INSERT INTO QuizDomanda VALUES(83, 13);
INSERT INTO QuizDomanda VALUES(84, 13);
INSERT INTO QuizDomanda VALUES(85, 13);



INSERT INTO Quiz VALUES ('React: Introduzione', 5);

-- Inserisci domande casuali per il nuovo quiz
INSERT INTO Domanda VALUES ('Cos''è React e quali sono i suoi principali concetti?', 1);
INSERT INTO Domanda VALUES ('Spiega il concetto di componenti controllati e non controllati in React.', 4);
INSERT INTO Domanda VALUES ('Qual è la differenza tra state e props in React?', 4);
INSERT INTO Domanda VALUES ('Descrivi il ciclo di vita di un componente React.', 2);
INSERT INTO Domanda VALUES ('Come funziona la gestione degli eventi in React?', 3);

-- Inserisci risposte casuali per le nuove domande
INSERT INTO RisposteDomanda VALUES ('React è una libreria JavaScript per la costruzione di interfacce utente.', 'React è un linguaggio di programmazione indipendente.', 'React è specifico solo per lo sviluppo del lato server.', 'React è una piattaforma per la creazione di pagine web statiche.', 'scelta1', 86);
INSERT INTO RisposteDomanda VALUES ('I componenti controllati sono gestiti completamente dallo stato di React, mentre i componenti non controllati mantengono il proprio stato interno.', 'I componenti controllati e non controllati sono sinonimi e possono essere utilizzati intercambiabilmente.', 'I componenti non controllati sono obsoleti in React.', 'React non supporta la distinzione tra componenti controllati e non controllati.', 'scelta1', 87);
INSERT INTO RisposteDomanda VALUES ('Lo state in React è uno spazio di memoria interno di un componente, mentre le props sono dati passati da un componente padre a un componente figlio.', 'state e props sono sinonimi e possono essere utilizzati intercambiabilmente.', 'React non supporta l''utilizzo di state e props.', 'Le props in React sono utilizzate solo per la gestione degli eventi.', 'scelta1', 88);
INSERT INTO RisposteDomanda VALUES ('Il ciclo di vita di un componente React comprende fasi come il montaggio, l''aggiornamento e lo smontaggio.', 'Il ciclo di vita di un componente React include solo la fase di aggiornamento.', 'Il ciclo di vita di un componente React include solo la fase di montaggio.', 'Il ciclo di vita di un componente React è un concetto obsoleto.', 'scelta1', 89);
INSERT INTO RisposteDomanda VALUES ('La gestione degli eventi in React si basa sull''utilizzo di funzioni di gestione degli eventi come onClick e onChange.', 'React non supporta la gestione degli eventi.', 'La gestione degli eventi in React può essere effettuata solo mediante l''utilizzo di librerie esterne.', 'La gestione degli eventi in React si basa esclusivamente sulla manipolazione diretta del DOM.', 'scelta1', 90);

-- Collega le nuove domande al nuovo quiz per React
-- Collega le nuove domande al nuovo quiz per Git
INSERT INTO QuizDomanda VALUES(86, 14); 
INSERT INTO QuizDomanda VALUES(87, 14);
INSERT INTO QuizDomanda VALUES(88, 14);
INSERT INTO QuizDomanda VALUES(89, 14);
INSERT INTO QuizDomanda VALUES(90, 14);





INSERT INTO Quiz VALUES ('Angular: Concetti di Base', 5);

-- Inserisci domande casuali per il nuovo quiz
INSERT INTO Domanda VALUES ('Cos''è Angular e quali sono le sue principali caratteristiche?', 5);
INSERT INTO Domanda VALUES ('Spiega il concetto di binding in Angular.', 3);
INSERT INTO Domanda VALUES ('Qual è la differenza tra un componente e un servizio in Angular?', 4);
INSERT INTO Domanda VALUES ('Descrivi il concetto di dependency injection in Angular.', 2);
INSERT INTO Domanda VALUES ('Come funziona la gestione delle route in Angular?', 1);

-- Inserisci risposte casuali per le nuove domande
INSERT INTO RisposteDomanda VALUES ('Angular è un framework TypeScript per la costruzione di applicazioni web.', 'Angular è una libreria JavaScript indipendente.', 'Angular è specifico solo per lo sviluppo del lato server.', 'Angular è una piattaforma per la creazione di pagine web statiche.', 'scelta1', 91);
INSERT INTO RisposteDomanda VALUES ('Il binding in Angular consente di sincronizzare automaticamente i dati tra il modello e la vista.', 'Il binding in Angular è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Il binding in Angular si basa solo sull''utilizzo di variabili globali.', 'Angular non supporta la sincronizzazione automatica tra il modello e la vista.', 'scelta1', 92);
INSERT INTO RisposteDomanda VALUES ('In Angular, un componente rappresenta un''elemento dell''interfaccia utente, mentre un servizio è un oggetto con funzionalità condivise tra più componenti.', 'I componenti e i servizi in Angular sono sinonimi e possono essere utilizzati intercambiabilmente.', 'Angular non supporta l''utilizzo di servizi.', 'I servizi in Angular rappresentano solo funzionalità legate al database.', 'scelta1', 93);
INSERT INTO RisposteDomanda VALUES ('La dependency injection in Angular consente di iniettare automaticamente le dipendenze nei componenti e nei servizi.', 'La dependency injection in Angular è un concetto obsoleto e non dovrebbe essere utilizzata.', 'Angular non supporta la dependency injection.', 'La dependency injection in Angular può essere utilizzata solo con componenti.', 'scelta1', 94);
INSERT INTO RisposteDomanda VALUES ('La gestione delle route in Angular si basa sull''utilizzo del modulo RouterModule e dell''oggetto Router.', 'La gestione delle route in Angular è una funzionalità obsoleta.', 'Angular non supporta la gestione delle route.', 'La gestione delle route in Angular si basa esclusivamente sulla manipolazione diretta del DOM.', 'scelta1', 95);

INSERT INTO QuizDomanda VALUES(91, 15);  -- Dove 15 è l'ID del nuovo quiz
INSERT INTO QuizDomanda VALUES(92, 15);
INSERT INTO QuizDomanda VALUES(93, 15);
INSERT INTO QuizDomanda VALUES(94, 15);
INSERT INTO QuizDomanda VALUES(95, 15);


-- Genera casualmente un nuovo quiz per Django
INSERT INTO Quiz VALUES ('Django: Fondamenti', 5);

-- Inserisci domande casuali per il nuovo quiz
INSERT INTO Domanda VALUES ('Cos è Django e quali sono i suoi principali concetti?', 6);
INSERT INTO Domanda VALUES ('Spiega il concetto di ORM in Django.', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra un modello e una vista in Django?', 2);
INSERT INTO Domanda VALUES ('Descrivi il concetto di middleware in Django.', 3);
INSERT INTO Domanda VALUES ('Come funziona la gestione degli URL in Django?', 1);

-- Inserisci risposte casuali per le nuove domande
INSERT INTO RisposteDomanda VALUES ('Django è un framework web Python per lo sviluppo rapido di applicazioni.', 'Django è un linguaggio di programmazione indipendente.', 'Django è specifico solo per lo sviluppo del lato client.', 'Django è una piattaforma per la creazione di applicazioni mobile.', 'scelta1', 96);
INSERT INTO RisposteDomanda VALUES ('L''ORM in Django consente di interagire con il database utilizzando oggetti Python invece di query SQL dirette.', 'L''ORM in Django è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Django non supporta l''utilizzo di ORM.', 'L''ORM in Django è limitato solo ai database SQL.', 'scelta1', 97);
INSERT INTO RisposteDomanda VALUES ('In Django, un modello rappresenta la struttura dei dati nel database, mentre una vista è responsabile della presentazione dei dati all''utente.', 'I modelli e le viste in Django sono sinonimi e possono essere utilizzati intercambiabilmente.', 'Django non supporta la definizione di modelli e viste.', 'I modelli in Django sono utilizzati solo per la gestione degli URL.', 'scelta1', 98);
INSERT INTO RisposteDomanda VALUES ('Il middleware in Django è uno strato di processi che possono modificare la richiesta, la risposta o l''esecuzione di un''applicazione.', 'Il middleware in Django è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Django non supporta l''utilizzo di middleware.', 'Il middleware in Django è limitato solo alle funzionalità del lato server.', 'scelta1', 99);
INSERT INTO RisposteDomanda VALUES ('La gestione degli URL in Django si basa sull''utilizzo di file di configurazione e funzioni di visualizzazione.', 'La gestione degli URL in Django è una funzionalità obsoleta.', 'Django non supporta la gestione degli URL.', 'La gestione degli URL in Django si basa esclusivamente sulla manipolazione diretta del DOM.', 'scelta1', 100);
-- Collega le nuove domande al nuovo quiz per Angular
INSERT INTO QuizDomanda VALUES(96, 16);  -- Dove 16 è l'ID del nuovo quiz
INSERT INTO QuizDomanda VALUES(97, 16);
INSERT INTO QuizDomanda VALUES(98, 16);
INSERT INTO QuizDomanda VALUES(99, 16);
INSERT INTO QuizDomanda VALUES(100, 16);



--  quiz per Git
INSERT INTO Quiz VALUES ('Git: Concetti di Base', 5);

INSERT INTO Domanda VALUES ('Cos è Git e come funziona?', 1);
INSERT INTO Domanda VALUES ('Spiega il concetto di branch in Git.', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra commit e push in Git?', 1);
INSERT INTO Domanda VALUES ('Descrivi il processo di risoluzione dei conflitti in Git.',1);
INSERT INTO Domanda VALUES ('Come funziona il comando git merge in Git?', 1);

-- Inserisci risposte casuali per le nuove domande
INSERT INTO RisposteDomanda VALUES ('Git è un sistema di controllo di versione distribuito per il tracciamento delle modifiche al codice sorgente.', 'Git è un sistema operativo indipendente.', 'Git è specifico solo per il controllo dei file multimediali.', 'Git è una piattaforma per la creazione di database relazionali.', 'scelta1', 101);
INSERT INTO RisposteDomanda VALUES ('Un branch in Git è un ramo separato di sviluppo che consente di lavorare su nuove funzionalità senza influire sul ramo principale.', 'I branch in Git sono obsoleti e non dovrebbero essere utilizzati.', 'Git non supporta la creazione di branch.', 'I branch in Git sono utilizzati solo per scopi di debugging.', 'scelta1', 102);
INSERT INTO RisposteDomanda VALUES ('Il commit in Git registra le modifiche nel repository locale, mentre il push invia le modifiche al repository remoto.', 'commit e push sono sinonimi e possono essere utilizzati intercambiabilmente.', 'commit in Git invia le modifiche al repository remoto senza bisogno di push.', 'Il push in Git registra le modifiche solo nel repository locale.', 'scelta1', 103);
INSERT INTO RisposteDomanda VALUES ('La risoluzione dei conflitti in Git avviene quando ci sono modifiche conflittuali tra branch o commit.', 'La risoluzione dei conflitti in Git è un concetto obsoleto e non dovrebbe essere utilizzata.', 'Git non supporta la risoluzione dei conflitti.', 'La risoluzione dei conflitti in Git avviene solo nel repository remoto.', 'scelta1', 104);
INSERT INTO RisposteDomanda VALUES ('Il comando git merge in Git combina le modifiche di un branch con un altro.', 'Il comando git merge è un concetto obsoleto e non dovrebbe essere utilizzato.', 'Git non supporta il merge tra branch.', 'Il comando git merge in Git elimina tutte le modifiche non commit in un branch.', 'scelta1', 105);
-- Collega le nuove domande al nuovo quiz per Django
INSERT INTO QuizDomanda VALUES(101, 17);  -- Dove 17 è l'ID del nuovo quiz
INSERT INTO QuizDomanda VALUES(102, 17);
INSERT INTO QuizDomanda VALUES(103, 17);
INSERT INTO QuizDomanda VALUES(104, 17);
INSERT INTO QuizDomanda VALUES(105, 17);

/* Inserimento quiz softskill */
 
 
--QUIZ PROBLEM SOLVING--
-- Quiz Soft Skills 4
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Problem Solving', 5);
 
 
-- Domande per il Quiz "Problem Solving" (Quiz ID: 4)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Definisci il concetto di pensiero laterale nel problem solving.', 9),
       ('Qual è la definizione di problem solving?', 8),
       ('Quali sono i passaggi principali nel processo di problem solving?', 9),
       ('Come si affronta un problema per il quale non si ha una soluzione immediata?', 8),
       ('Cosa si intende per approccio sistematico nel problem solving?', 9);
 
-- Quiz "Problem Solving" (Quiz ID: 4)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (106, 18), (107, 18), (108, 18), (109, 18), (110, 18);
 
 
-- 4Risoste per problem solving
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Un modo creativo di pensare che considera diverse prospettive', 'Un approccio lineare e logico alla risoluzione dei problemi', 'Una strategia che si basa solo sulle conoscenze passate', 'Un approccio che ignora le variabili del problema', 'scelta1', 106);
-- Domanda 2
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Il processo di risolvere un problema in modo efficace', 'Un problema irrisolvibile', 'Un concetto teorico senza applicazioni pratiche', 'La ricerca di problemi senza soluzioni', 'scelta1', 107);
-- Domanda 3
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Identificazione del problema, analisi, generazione di soluzioni, valutazione delle soluzioni', 'Esclusione delle idee, accettazione del primo risultato, chiusura del processo', 'Individuazione del problema, elaborazione di una soluzione, implementazione della soluzione', 'Sperimentazione casuale, selezione casuale, accettazione della soluzione', 'scelta1', 108);
-- Domanda 4
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Esaminando il problema da diverse prospettive, chiedendo aiuto ad altri, sperimentando nuove idee', 'Rinunciando al problema, ignorandolo completamente', 'Accettando la situazione senza tentare di risolvere il problema', 'Concentrandosi solo sui problemi noti', 'scelta1', 109);
-- Domanda 5
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Un approccio strutturato che utilizza metodi e procedure per affrontare un problema', 'Un approccio casuale e disorganizzato alla risoluzione dei problemi', 'Evitare completamente di affrontare il problema', 'Accettare le soluzioni senza valutarle', 'scelta1', 110);
 
 
--QUIZ ADATTABILITA'--
-- Quiz Soft Skills 5
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Adattabilità', 4);
 
-- Domande per il Quiz "Adattabilità" (Quiz ID: 5)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Cos''è la flessibilità mentale?', 8),
       ('Come va gestita una situazione in cui bisogna adattarsi a un cambiamento improvviso nel lavoro.', 9),
       ('Quali sono i vantaggi dell''adattabilità in un ambiente lavorativo?', 8),
       ('Come si mantiene la calma e la produttività in situazioni di cambiamento repentino?', 9);
 
-- Quiz "Adattabilità" (Quiz ID: 5)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (111, 19), (112, 19), (113, 19), (114, 19);
 
 
-- 5Risoste per adattabilità
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('La capacità di adattarsi a nuove situazioni, idee o metodi', 'Rigidezza mentale e resistenza ai cambiamenti', 'Mancanza di aderenza a schemi predefiniti', 'Assenza di capacità decisionale', 'scelta1', 111);
-- Domanda 2
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Mantenendo la calma, cercando di comprendere il cambiamento e adattando le azioni di conseguenza', 'Ignorando completamente il cambiamento', 'Pensando solo a soluzioni rigide', 'Pretendendo che il cambiamento non sia reale', 'scelta1', 112);
-- Domanda 3
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Aumento della resilienza, migliore capacità di risolvere problemi, maggiore adattabilità alle nuove situazioni', 'Limitazioni nella gestione delle sfide, riduzione della creatività', 'Mancanza di adattamento alle mutevoli esigenze', 'Incremento delle rigidità nell''ambiente lavorativo', 'scelta1', 113);
-- Domanda 4
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Respirando profondamente, mantenendo la prospettiva, e cercando il supporto di colleghi o superiori', 'Smettendo di lavorare finché la situazione non è tornata alla normalità', 'Pretendendo che il cambiamento non sia accaduto', 'Agendo in modo impulsivo senza valutare la situazione', 'scelta1', 114);
 
 
--QUIZ CREATIVITA' E INNOVAZIONE--
-- Quiz Soft Skills 6
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Creatività e Innovazione', 5);
 
-- Domande per il Quiz "Creatività e Innovazione" (Quiz ID: 6)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è il legame tra creatività e problem solving?', 9),
       ('Cos''hanno in comune creatività e innovazione', 8),
       ('Come si incoraggia l''innovazione in un team di lavoro?', 9),
       ('Quali sono gli ostacoli principali alla creatività e all''innovazione nel contesto lavorativo?', 8),
       ('Come si può stimolare la propria creatività quando si affronta un problema complesso?', 9);
 
-- Quiz "Creatività e Innovazione" (Quiz ID: 6)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (115, 20), (116, 20), (117, 20), (118, 20), (119, 20);
 
-- 6Risoste per creatività e innovazione
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('La creatività è parte del processo di problem solving', 'Non c''è alcun legame tra creatività e problem solving', 'Il problem solving limita la creatività', 'La creatività è incompatibile con il problem solving', 'scelta1', 115);
-- Domanda 2
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Entrambe richiedono un approccio non convenzionale e l''apertura a nuove idee', 'La creatività si basa solo su vecchi schemi mentre l''innovazione richiede nuovi schemi', 'La creatività è limitata mentre l''innovazione è sempre nuova', 'La creatività è individuale mentre l''innovazione è di gruppo', 'scelta1', 116);
-- Domanda 3
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Promuovendo un ambiente aperto all''espressione di idee, incoraggiando la diversità e la collaborazione', 'Limitando le discussioni e le idee innovative', 'Riducendo la diversità di pensiero e l''interazione tra i membri del team', 'Incentivando la competizione e il segreto delle informazioni', 'scelta1', 117);
-- Domanda 4
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Paura del fallimento, conformità eccessiva, mancanza di risorse e tempo limitato', 'Apertura mentale, collaborazione, abbondanza di risorse', 'Approccio sperimentale, valutazione delle idee, adattabilità', 'Eccessiva creatività, mancanza di struttura, scarsa comunicazione', 'scelta1', 118);
-- Domanda 5
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Spostando prospettive, esplorando diverse soluzioni, prendendosi del tempo per riflettere', 'Evitando il problema, concentrandosi solo su soluzioni note', 'Chiedendo suggerimenti solo a un gruppo ristretto di persone', 'Lavorando sempre in modo simile a come si è fatto in passato', 'scelta1', 119);
 
 
--QUIZ GESTIONE DEL TEMPO--
-- Quiz Soft Skills 7
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Gestione del Tempo', 6);
 
-- Domande per il Quiz "Gestione del Tempo" (Quiz ID: 7)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Quali sono alcune strategie efficaci per gestire il tempo?', 9),
       ('Come si priorizzano i compiti quando hai molte scadenze ravvicinate?', 8),
       ('Perchè è importante saper gestire il proprio tempo?', 9),
       ('Cos''è più importante: efficienza o efficacia nella gestione del tempo?', 8),
       ('Quali tecniche sono utili per migliorare la gestione del tempo?', 9),
       ('E'' venerdì e ti sono rimasti 10 compiti da svolgere ma sai che ne riuscirai a svolgere solo 8, a quali rinunci?', 7);
 
 
-- Quiz "Gestione del Tempo" (Quiz ID: 7)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (120, 21), (121, 21), (122, 21), (123, 21), (124, 21), (125, 21);
 
-- 7Risoste per gestione del tempo
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Pianificazione giornaliera, prioritizzazione delle attività, eliminazione delle distrazioni', 'Procrastinazione, gestione casuale delle attività, multitasking', 'Impegno in molte attività contemporaneamente, lavoro senza pause', 'Esclusione di alcune attività importanti per risparmiare tempo', 'scelta1', 120);
-- Domanda 2
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Valutando l''urgenza e l''importanza di ciascun compito, concentrandosi su quelli più critici', 'Ignorando le scadenze e gestendo i compiti casualmente', 'Dando priorità solo ai compiti più facili da svolgere', 'Iniziando sempre dal compito meno urgente', 'scelta1', 121);
-- Domanda 3
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Per aumentare la produttività, ridurre lo stress e raggiungere gli obiettivi in modo efficiente', 'Per rendere più complessa la gestione quotidiana', 'Per avere più tempo libero senza fare nulla', 'Per affrontare le attività in modo disorganizzato', 'scelta1', 122);
-- Domanda 4
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Per aumentare la produttività, ridurre lo stress e raggiungere gli obiettivi in modo efficiente', 'Per rendere più complessa la gestione quotidiana', 'Per avere più tempo libero senza fare nulla', 'Per affrontare le attività in modo disorganizzato', 'scelta1', 122);
-- Domanda 5
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Tecnica Pomodoro, Matrice di Eisenhower, To-do list prioritaria', 'Aumentare il multitasking, eliminare le pause, lavorare senza obiettivi', 'Procrastinare costantemente, non pianificare nulla, seguire uno schema casuale', 'Gestione del tempo in base all''umore del momento', 'scelta1', 124);
-- Domanda 6
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Alle attività meno importanti o meno urgenti, considerando l''urgenza e l''importanza di ciascuna', 'Alle attività più importanti, tralasciando quelle meno cruciali', 'Casualmente, senza considerare l''importanza delle attività', 'Lavorando su tutte le attività in modo ugualmente distribuito', 'scelta1', 125);
 
 
--QUIZ EMPATIA E COMPASSIONE--
-- Quiz Soft Skills 9
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Empatia e Compassione', 4);
 
 
-- Domande per il Quiz "Empatia e Compassione" (Quiz ID: 9)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è la differenza tra empatia e compassione?', 8),
       ('Quali sono le caratteristiche comuni tra empatia e compassione', 9),
       ('Quali vantaggi comporta l''esercizio dell''empatia nel mondo del lavoro?', 8),
       ('Come si gestiscono le situazioni emotive dei colleghi durante momenti difficili?', 9);
 
 
-- Quiz "Empatia e Compassione" (Quiz ID: 9)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (126, 22), (127, 22), (128, 22), (129, 22);
 
-- 9Risoste per empatia e compassione
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Empatia è la capacità di comprendere i sentimenti degli altri, mentre la compassione è l''azione di aiutare gli altri', 'Non c''è differenza tra empatia e compassione', 'Empatia e compassione sono sinonimi', 'La compassione è la capacità di comprendere i sentimenti degli altri, mentre l''empatia è l''azione di aiutare gli altri', 'scelta1', 126);
-- Domanda 2
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Empatia è la capacità di comprendere i sentimenti degli altri, mentre la compassione è l''azione di aiutare gli altri', 'Non c''è differenza tra empatia e compassione', 'Empatia e compassione sono sinonimi', 'La compassione è la capacità di comprendere i sentimenti degli altri, mentre l''empatia è l''azione di aiutare gli altri', 'scelta1', 126);
-- Domanda 3
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Aumento della fiducia e della coesione del team, miglioramento delle relazioni interpersonali, riduzione dei conflitti', 'Diminuzione della fiducia, isolamento nel team, aumento dei conflitti', 'Miglioramento delle relazioni solo con alcuni colleghi, senza impatto sul lavoro', 'Riduzione della coesione del team e aumento delle tensioni', 'scelta1', 128);
-- Domanda 4
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Ascoltando attivamente, mostrando empatia senza giudicare, offrendo supporto e conforto', 'Ignorando le situazioni emotive, criticando i colleghi, non prestando attenzione', 'Evitando completamente le situazioni emotive, non mostrando interesse', 'Giudicando i colleghi, ignorando le loro emozioni, non offrendo supporto', 'scelta1', 129);
 
 
--QUIZ PENSIERO CRITICO--
-- Quiz Soft Skills 10
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Pensiero Critico', 5);
 
-- Domande per il Quiz "Pensiero Critico" (Quiz ID: 10)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Cos''è il pensiero critico?', 8),
       ('Quali sono i vantaggi di saper usare il pensiero critico?', 9),
       ('Qual è l''importanza del pensiero critico nell''ambiente lavorativo?', 8),
       ('Quali sono gli ostacoli principali al pensiero critico nel contesto lavorativo?', 9),
       ('Perchè il pensiero critico è importante nel contesto lavorativo',7);
 
-- Quiz "Pensiero Critico" (Quiz ID: 10)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (130, 23), (131, 23), (132, 23), (133, 23), (134,23);
 
-- 10Risoste per pensiero Critico
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Il pensiero critico è la capacità di valutare, analizzare e formulare giudizi in modo riflessivo e razionale', 'Il pensiero critico non esiste', 'Il pensiero critico è l''abilità di accettare qualsiasi informazione senza valutazione', 'Il pensiero critico è la capacità di accettare solo le idee personali', 'scelta1', 130);
-- Domanda 2
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Aiuta a prendere decisioni informate, migliora la risoluzione dei problemi, favorisce la comprensione e la comunicazione', 'Non ci sono vantaggi nell''usare il pensiero critico', 'Riduce la capacità di valutare informazioni, limita la risoluzione dei problemi', 'Complica la comprensione e la comunicazione', 'scelta1', 131);
-- Domanda 3
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Il pensiero critico è cruciale per prendere decisioni informate e risolvere problemi complessi', 'Il pensiero critico non ha importanza nell''ambiente lavorativo', 'Il pensiero critico crea confusione e complica il lavoro', 'Il pensiero critico limita la creatività nel lavoro', 'scelta1', 132);
-- Domanda 4
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('La mancanza di tempo, la resistenza al cambiamento, la paura del fallimento', 'L''entusiasmo per il pensiero critico, la gestione ottimale del tempo', 'La collaborazione eccessiva, la scarsa fiducia nelle capacità personali', 'L''apertura al cambiamento, la gestione efficiente del tempo', 'scelta1', 133);
-- Domanda 5
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Perché aiuta a valutare informazioni, prendere decisioni informed, risolvere problemi complessi e favorire la comprensione e comunicazione.', 'Il pensiero critico non è importante nel contesto lavorativo', 'Perché complica le decisioni e rallenta i processi lavorativi', 'Perché limita la capacità di valutare informazioni', 'scelta1', 134);
 

/*quiz per la posizione di sviluppatore python con conoscenza di Django*/
insert into quiz values ('Python and Django', 10);

insert into quizdomanda values(96, 24),
                              (97, 24),
                              (99, 24),
                              (100, 24),
                              (2, 24),
                              (3, 24),
                              (4, 24),
                              (5, 24),
                              (7, 24),
                              (8, 24);
                              
                              
/*quiz per la posizione front-end devoloper*/
insert into quiz values('Front-end', 15)

insert into quizdomanda values(33, 25),
                              (34, 25),
                              (35, 25),
                              (36, 25),
                              (38, 25),
                              (39, 25),
                              (40, 25),
                              (42, 25),
                              (43, 25),
                              (44, 25),
                              (45, 25),
                              (46, 25),
                              (48, 25),
                              (49, 25),
                              (50, 25);
 
 /*quiz per la posizione full-stack web devoloper*/
insert into quiz values('Web', 20)

insert into quizdomanda values(76, 26),
                              (77, 26),
                              (79, 26),
                              (82, 26),
                              (84, 26),
                              (87, 26),
                              (89, 26),
                              (91, 26),
                              (94, 26),
                              (95, 26),
                              (4, 26),
                              (9, 26),
                              (15, 26),
                              (20, 26),
                              (25, 26),
                              (30, 26),
                              (35, 26),
                              (40, 26),
                              (42, 26),
                              (47, 26);
 
 
-- Quiz Sistemista Informatico
-- Quiz Soft Skills 10
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Sistemista Informatico', 8);

-- Domande per il Quiz "Competenze Sistemista Informatico" (Quiz ID: 10)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Cosa significa RAID?', 8),
       ('Qual è la differenza tra HTTP e HTTPS?', 9),
       ('Descrivi il concetto di virtualizzazione.', 8),
       ('Cos''è un attacco DDoS e come funziona?', 9),
       ('Spiega la differenza tra un hub, uno switch e un router.', 8),
       ('Cosa sono i protocolli TCP/IP e a cosa servono?', 9),
       ('Descrivi brevemente la differenza tra un sistema operativo Windows e Linux.', 8),
       ('Quali sono i principali vantaggi e svantaggi del cloud computing?', 9);

-- Quiz "Competenze Sistemista Informatico" (Quiz ID: 10)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (130, 27), (131, 27), (132, 27), (133, 27), (134, 27), (135, 27), (136, 27), (137, 27);

-- Risposte per "Competenze Sistemista Informatico"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Redundant Array of Independent Disks: un metodo di archiviazione dei dati che utilizza più dischi per garantire la ridondanza e/o prestazioni migliori.', 'Remote Access to Important Data: un protocollo per accedere a dati remoti in modo sicuro.', 'RAID: una tecnica per ridurre i costi di archiviazione dei dati.', 'RAID: un tipo di processore per migliorare le prestazioni dei server.', 'scelta1', 130),
       -- Domanda 2
       ('HTTP (Hypertext Transfer Protocol) è non sicuro, mentre HTTPS (HTTP Secure) è sicuro e cifrato SSL/TLS.', 'HTTP è più veloce di HTTPS.', 'HTTP è utilizzato solo per siti web statici, mentre HTTPS è per siti dinamici.', 'HTTP è vecchio, mentre HTTPS è il nuovo protocollo di rete.', 'scelta1', 131),
       -- Domanda 3
       ('La virtualizzazione è la creazione di risorse hardware/software virtuali piuttosto che fisiche.', 'La virtualizzazione riguarda la creazione di reti virtuali all’interno di un’azienda.', 'La virtualizzazione è l''uso esclusivo di computer portatili.', 'La virtualizzazione si riferisce all''uso esclusivo di software open-source.', 'scelta1', 132),
       -- Domanda 4
       ('Un attacco DDoS (Distributed Denial of Service) sovraccarica un server con un''enorme quantità di richieste, rendendolo inaccessibile agli utenti legittimi.', 'Un attacco DDoS permette di accedere ai dati sensibili di un server.', 'Un attacco DDoS è simile a un attacco fisico a un server.', 'Un attacco DDoS limita il numero di richieste al server per garantire la sicurezza.', 'scelta1', 133),
       -- Domanda 5
       ('Un hub trasmette i dati a tutti i dispositivi connessi, uno switch li invia solo al dispositivo di destinazione, mentre un router gestisce il traffico tra reti diverse.', 'Non c’è differenza tra un hub, uno switch e un router.', 'Uno switch è più veloce di un hub ma meno sicuro di un router.', 'Uno switch è un dispositivo wireless, mentre un router gestisce solo reti cablate.', 'scelta1', 134),
       -- Domanda 6
       ('TCP/IP è un insieme di protocolli utilizzati per la comunicazione su Internet, definendo come i dati dovrebbero essere inviati e ricevuti.', 'TCP/IP è un metodo per la manutenzione dei computer aziendali.', 'TCP/IP è un linguaggio di programmazione per sviluppare applicazioni web.', 'TCP/IP riguarda esclusivamente la sicurezza delle reti aziendali.', 'scelta1', 135),
       -- Domanda 7
       ('Windows è comunemente usato per desktop e sistemi operativi personali, mentre Linux è più popolare nei server e negli ambienti aziendali.', 'Windows è completamente gratuito, mentre Linux è a pagamento.', 'Windows è più sicuro di Linux.', 'Linux è stato sviluppato da Microsoft, mentre Windows è open-source.', 'scelta1', 136),
       -- Domanda 8
       ('Vantaggi: scalabilità, flessibilità, riduzione dei costi di hardware. Svantaggi: dipendenza dalla connessione Internet, questioni di sicurezza e privacy.', 'Vantaggi: alta sicurezza e controllo. Svantaggi: costo elevato e complessità.', 'Vantaggi: accesso ovunque. Svantaggi: nessun controllo sull''ambiente di hosting.', 'Vantaggi: nessun costo. Svantaggi: ridotta affidabilità e prestazioni.', 'scelta1', 137);

    
       
       
-- Quiz Web Developer
-- Quiz Soft Skills 11
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Web Developer', 8);

-- Domande per il Quiz "Competenze Web Developer" (Quiz ID: 11)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Spiega la differenza tra HTML, CSS e JavaScript.', 8),
       ('Cosa sono i framework frontend e perché sono utili?', 9),
       ('Descrivi l’utilizzo di AJAX in web development.', 8),
       ('Qual è l’importanza della SEO per un sito web?', 9),
       ('Quali sono le best practices per la sicurezza di un sito web?', 8),
       ('Spiega il concetto di responsive design e perché è importante.', 9),
       ('Cos’è il version control e come aiuta nello sviluppo web?', 8),
       ('Descrivi il funzionamento dei cookie nei siti web.', 9);

-- Quiz "Competenze Web Developer" (Quiz ID: 11)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (138, 28), (139, 28), (140, 28), (141, 28), (142, 28), (143, 28), (144, 28), (145, 28);

-- Risposte per "Competenze Web Developer"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('HTML è il linguaggio di markup per la struttura del contenuto, CSS è utilizzato per lo stile e la presentazione, JavaScript è per l’interattività e la logica.', 'HTML, CSS e JavaScript sono tutti linguaggi di scripting intercambiabili.', 'HTML e CSS sono lo stesso linguaggio, JavaScript è un linguaggio di database.', 'JavaScript è utilizzato solo per la struttura del contenuto.', 'scelta1', 138),
       -- Domanda 2
       ('I framework frontend sono set di strumenti e librerie predefinite che semplificano lo sviluppo web, fornendo modelli e funzioni comuni.', 'I framework frontend non sono utili poiché limitano la flessibilità dello sviluppo.', 'I framework frontend sono utilizzati esclusivamente per il backend del sito web.', 'I framework frontend sono solo per principianti.', 'scelta1', 139),
       -- Domanda 3
       ('AJAX (Asynchronous JavaScript and XML) consente agli utenti di interagire con un sito web senza dover ricaricare la pagina.', 'AJAX è un linguaggio di programmazione per il web.', 'AJAX è una nuova versione di HTML5.', 'AJAX è usato solo per animazioni su siti web.', 'scelta1', 140),
       -- Domanda 4
       ('La SEO (Search Engine Optimization) è importante per migliorare la visibilità e il posizionamento di un sito web sui motori di ricerca.', 'La SEO è irrilevante per un sito web.', 'La SEO riguarda esclusivamente la grafica di un sito web.', 'La SEO è utile solo per siti web aziendali.', 'scelta1', 141),
       -- Domanda 5
       ('Best practices includono l''uso di HTTPS, l''aggiornamento costante dei software, la protezione contro attacchi di SQL injection e XSS.', 'Non ci sono best practices per la sicurezza di un sito web.', 'La sicurezza di un sito web non è importante.', 'Basta affidarsi a un buon firewall per la sicurezza del sito web.', 'scelta1', 142),
       -- Domanda 6
       ('Il responsive design è la capacità di un sito web di adattarsi a diverse dimensioni di schermi e dispositivi, importante per garantire un’esperienza utente ottimale.', 'Il responsive design riguarda solo il backend di un sito web.', 'Il responsive design è utile solo per i dispositivi mobili.', 'Il responsive design non è più rilevante.', 'scelta1', 143),
       -- Domanda 7
       ('Il version control permette di tenere traccia delle modifiche al codice, consentendo il lavoro collaborativo e il ripristino a versioni precedenti.', 'Il version control è esclusivamente per la gestione dei server web.', 'Il version control è un framework di frontend.', 'Il version control è solo per principianti.', 'scelta1', 144),
       -- Domanda 8
       ('I cookie sono piccoli file di testo memorizzati sul computer dell’utente per tracciare informazioni come preferenze e stato di login.', 'I cookie sono solo per l’archiviazione di immagini nei siti web.', 'I cookie non sono più utilizzati nei siti web moderni.', 'I cookie sono usati solo per la grafica dei siti web.', 'scelta1', 145);

       

	   INSERT INTO Domanda (testo, punteggio)
VALUES ('', 8),
       ('', 9),
       ('', 8),
       ('', 9),
       ('', 8),
       ('', 9),
       ('', 8),
       ('', 9),
	   ('', 8),
       ('', 9),
       ('', 8),
       ('', 9);
       
-- Quiz Cybersecurity
-- Quiz Soft Skills 12
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Conoscenze Cybersecurity', 8);

-- Domande per il Quiz "Conoscenze Cybersecurity" (Quiz ID: 12)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Definisci l’attacco di phishing e come può essere prevenuto.', 8),
       ('Cosa sono le vulnerabilità zero-day e come possono essere affrontate?', 9),
       ('Spiega l’importanza dell’implementazione di un firewall per la sicurezza informatica.', 8),
       ('Qual è la differenza tra crittografia simmetrica e asimmetrica?', 9),
       ('Come funziona un attacco di tipo DDoS e quali sono le possibili contromisure?', 8),
       ('Descrivi l’uso delle VPN (Virtual Private Network) per la sicurezza.', 9),
       ('Cosa sono gli IDS (Intrusion Detection System) e come funzionano?', 8),
       ('Spiega il concetto di penetration testing e perché è importante.', 9);

-- Quiz "Conoscenze Cybersecurity" (Quiz ID: 12)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (146, 29), (147, 29), (148, 29), (149, 29), (150, 29), (151, 29), (152, 29), (153, 29);

-- Risposte per "Conoscenze Cybersecurity"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Il phishing è un attacco che mira a ottenere informazioni sensibili tramite messaggi ingannevoli; può essere prevenuto con formazione agli utenti e filtri antispam.', 'Il phishing è un attacco informatico su reti sociali; non può essere prevenuto.', 'Il phishing è un tipo di attacco che colpisce solo server aziendali; è impossibile prevenirlo.', 'Il phishing riguarda solo l’invio di email non richieste.', 'scelta1', 146),
       -- Domanda 2
       ('Le vulnerabilità zero-day sono falle di sicurezza sfruttate prima che il produttore possa rilasciare un fix; possono essere affrontate con aggiornamenti costanti e soluzioni di sicurezza aggiuntive.', 'Le vulnerabilità zero-day non richiedono azioni specifiche; non possono essere affrontate.', 'Le vulnerabilità zero-day non rappresentano una minaccia per la sicurezza informatica.', 'Le vulnerabilità zero-day sono prevenibili solo tramite cambiamenti hardware.', 'scelta1', 147),
       -- Domanda 3
       ('Un firewall filtra il traffico di rete in entrata e in uscita, aiutando a proteggere da attacchi esterni e interni.', 'Un firewall non è essenziale per la sicurezza informatica.', 'Il firewall è utile solo per proteggere contro gli attacchi di phishing.', 'Il firewall è solo per la protezione dei file sui computer.', 'scelta1', 148),
       -- Domanda 4
       ('La crittografia simmetrica utilizza la stessa chiave per crittografare e decrittografare i dati, mentre la crittografia asimmetrica utilizza una coppia di chiavi (pubblica/privata).', 'Non esiste differenza tra crittografia simmetrica e asimmetrica.', 'La crittografia asimmetrica è più debole della crittografia simmetrica.', 'La crittografia simmetrica è utilizzata solo per i siti web.', 'scelta1', 149),
       -- Domanda 5
       ('Un attacco DDoS sovraccarica un sistema o un servizio con una quantità eccessiva di traffico, rendendolo inaccessibile; contromisure possibili includono filtri e servizi anti-DDoS.', 'Un attacco DDoS è impossibile da fermare.', 'Un attacco DDoS è solo un errore di sistema.', 'Un attacco DDoS è efficace solo su server di grandi dimensioni.', 'scelta1', 150),
       -- Domanda 6
       ('Le VPN consentono di creare una connessione sicura su reti pubbliche come Internet, garantendo crittografia dei dati e privacy.', 'Le VPN sono utilizzate solo per l’accesso ai social network.', 'Le VPN sono utilizzate solo per siti di streaming.', 'Le VPN non offrono protezione aggiuntiva.', 'scelta1', 151),
       -- Domanda 7
       ('Gli IDS monitorano il traffico di rete per individuare comportamenti sospetti o attacchi informatici; possono essere basati su firme o comportamento.', 'Gli IDS non sono utili per la sicurezza informatica.', 'Gli IDS sono utilizzati solo per le reti aziendali.', 'Gli IDS non possono rilevare gli attacchi informatici.', 'scelta1', 152),
       -- Domanda 8
       ('Il penetration testing è un test di sicurezza che simula gli attacchi informatici per identificare e correggere le vulnerabilità; è importante per mantenere la sicurezza preventiva.', 'Il penetration testing non è essenziale per la sicurezza informatica.', 'Il penetration testing è solo per i principianti.', 'Il penetration testing può compromettere la sicurezza di un sistema.', 'scelta1', 153);

                              

       
-- Quiz Ingegnere del Software
-- Quiz Soft Skills 15
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Ingegnere del Software', 8);

-- Domande per il Quiz "Competenze Ingegnere del Software" (Quiz ID: 15)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Spiega il concetto di design pattern e fornisci un esempio.', 8),
       ('Qual è la differenza tra waterfall e metodologie Agile nello sviluppo software?', 9),
       ('Cosa sono i principi SOLID nel contesto della programmazione orientata agli oggetti?', 8),
       ('Descrivi il processo di continuous integration e continuous deployment (CI/CD).', 9),
       ('Che cos’è il version control e quali benefici offre nello sviluppo software?', 8),
       ('Illustra le differenze tra testing unitario, di integrazione e di sistema.', 9),
       ('Cosa significa il termine "refactoring" e quando è appropriato farlo?', 8),
       ('Spiega l’importanza di documentare il codice durante lo sviluppo software.', 9);

-- Quiz "Competenze Ingegnere del Software" (Quiz ID: 15)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (166, 30), (167, 30), (168, 30), (169, 30), (170, 30), (171, 30), (172, 30), (173, 30);

-- Risposte per "Competenze Ingegnere del Software"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('I design pattern sono soluzioni ricorrenti a problemi comuni nello sviluppo software; un esempio è il pattern Singleton.', 'I design pattern non sono utili nello sviluppo software.', 'I design pattern sono sinonimi di codice di buona qualità.', 'I design pattern non sono adattabili.', 'scelta1', 166),
       -- Domanda 2
       ('Waterfall è un approccio sequenziale allo sviluppo software, mentre Agile è iterativo e si adatta ai cambiamenti.', 'Waterfall e Agile sono la stessa cosa.', 'Agile non è adatto allo sviluppo software.', 'Waterfall non è più utilizzato nello sviluppo software.', 'scelta1', 167),
       -- Domanda 3
       ('I principi SOLID sono linee guida per scrivere codice manutenibile e scalabile, come il principio di singola responsabilità e l’inversione delle dipendenze.', 'I principi SOLID non sono importanti nello sviluppo software.', 'I principi SOLID si applicano solo ai linguaggi di programmazione specifici.', 'I principi SOLID non influenzano la qualità del codice.', 'scelta1', 168),
       -- Domanda 4
       ('La continuous integration coinvolge l’integrazione frequente del codice nel repository con test automatici; continuous deployment è la pratica di rilasciare il software in modo automatico e frequente.', 'La continuous integration non è rilevante nello sviluppo software.', 'La continuous deployment coinvolge solo test manuali.', 'La continuous integration è solo per grandi progetti software.', 'scelta1', 169),
       -- Domanda 5
       ('Il version control gestisce le modifiche al codice, consentendo il tracciamento delle revisioni e facilitando la collaborazione; offre benefici come la gestione delle versioni e la risoluzione delle conflittualità.', 'Il version control non è utile nello sviluppo software.', 'Il version control è solo per il codice di piccole dimensioni.', 'Il version control è solo per i singoli sviluppatori.', 'scelta1', 170),
       -- Domanda 6
       ('Il testing unitario verifica singole unità di codice, quello di integrazione testa l’interazione tra unità e quello di sistema testa il sistema completo.', 'Non esistono differenze tra i diversi tipi di testing.', 'Il testing unitario e di integrazione sono la stessa cosa.', 'Il testing di sistema è il più inutile tra i tre.', 'scelta1', 171),
       -- Domanda 7
       ('Il refactoring è il processo di miglioramento del codice senza modificarne il comportamento; è appropriato farlo durante lo sviluppo per migliorare la leggibilità e la manutenibilità del codice.', 'Il refactoring compromette la qualità del codice.', 'Il refactoring non è utile nello sviluppo software.', 'Il refactoring è solo per i progetti già completati.', 'scelta1', 172),
       -- Domanda 8
       ('La documentazione del codice aiuta a comprendere il funzionamento del software; è importante per la manutenzione, la collaborazione e la comprensione del codice.', 'La documentazione del codice non è importante.', 'La documentazione del codice rallenta lo sviluppo.', 'La documentazione del codice è utile solo per i programmatori esperti.', 'scelta1', 173);


-- Quiz "back-end"
 insert into quiz values('Back-End', 15)

 INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual''è il comando SQL per raggruppare?', 8),
       ('Qual''è il linguaggio più comune per fare le query su java?', 9),
       ('Qual''è l''ordine di esecuzione dei comandi?', 8),
       ('Cos''è e qual''è la funzione della chiave primaria all''interno di una tabella', 9),
       ('Cosa succede se si ha una ralazione molti a molti?', 8);
  
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('group by', 'order by', 'group by to by', 'division for', 'scelta1', 174),
       -- Domanda 2
       ('jbpc', 'jbdc', 'jdbc', 'ybdc', 'scelta2', 175),
       -- Domanda 3
       ('select, from, where, e poi tutti gli altri', 'from, group by, where, select order by', 'from, where, group by, having, select, order by', 'from, group by, having, where, select, order by', 'scelta3', 176),
       -- Domanda 4
       ('Serve solo per collegare le tabelle', 'Serve per avere un coolegamento tra tabelle e può essere uguale in determinate condizioni', 'Sono le chiavi esterne della tabella madre', 'Funge da identificatore univoco della tabella e serve per evitare i avere record identici', 'scelta4', 177),
       -- Domanda 5
       ('Si crea una terza tabella con nome quello della relazione e campi le due chiavi primarie delle due tabelle sotto forma di chiavi esterne più eventuali attributi', 'Si uniscono le due tabelle diventando una unica con chiave primaria la combinazione delle chiavi primarie delle due tabelle', 'La tabella più importante ricava come attributo la chiave primaria dell''altra tabella sotto forma di chiave esterna', 'Non succede niente', 'scelta1', 178);

 
insert into quizdomanda values(2, 31),
                              (3, 31),
                              (5, 31),
                              (6, 31),
                              (8, 31),
                              (10, 31),
                              (12, 31),
                              (13, 31),
                              (15, 31),
                              (16, 31),
                              (174, 31),
                              (175, 31),
                              (176, 31),
                              (177, 31),
                              (178, 31);
                              
      
-- Quiz Project Manager
-- Quiz Soft Skills 20
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Project Manager', 8);

-- Domande per il Quiz "Competenze Project Manager" (Quiz ID: 20)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è il ruolo principale di un Project Manager in un team di sviluppo software?', 8),
       ('Spiega la differenza tra il modello Waterfall e Agile e quali benefici offrono.', 9),
       ('Come gestisci efficacemente le risorse e i tempi all’interno di un progetto software?', 8),
       ('Descrivi il processo di pianificazione di progetti software.', 9),
       ('Quali sono le principali sfide che un Project Manager potrebbe affrontare in un progetto software?', 8),
       ('Spiega il concetto di gestione dei rischi in un progetto software.', 9),
       ('Quali sono i vantaggi dell’implementazione di una comunicazione efficace nel contesto dei progetti software?', 8),
       ('Descrivi l’importanza della leadership nel ruolo di un Project Manager.', 9);

-- Quiz "Competenze Project Manager" (Quiz ID: 20)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (179, 32), (180, 32), (181, 32), (182, 32), (183, 32), (184, 32), (185, 32), (186, 32);

-- Risposte per "Competenze Project Manager"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Il Project Manager coordina il team, pianifica il progetto e assicura il raggiungimento degli obiettivi entro i limiti di tempo e budget.', 'Il Project Manager non è coinvolto nel team.', 'Il Project Manager si occupa solo del budget del progetto.', 'Il Project Manager si concentra solo sulla pianificazione.', 'scelta1', 179),
       -- Domanda 2
       ('Waterfall è un approccio sequenziale, mentre Agile è iterativo e adattivo; Agile permette maggiore flessibilità e risposta ai cambiamenti.', 'Waterfall è più adattabile di Agile.', 'Waterfall e Agile sono la stessa cosa.', 'Agile non è adatto allo sviluppo software.', 'scelta1', 180),
       -- Domanda 3
       ('Gestisco le risorse assegnando compiti in base alle competenze e pianifico i tempi utilizzando metodologie di gestione del tempo come la PERT e il Gantt.', 'Non gestisco le risorse e i tempi all’interno del progetto.', 'Gestisco le risorse in modo casuale.', 'Non pianifico i tempi del progetto.', 'scelta1', 181),
       -- Domanda 4
       ('La pianificazione di progetti software coinvolge la definizione degli obiettivi, la stima dei tempi, la creazione di un piano di lavoro e l’allocazione delle risorse.', 'La pianificazione di progetti software non è importante.', 'La pianificazione di progetti software è solo per progetti di grandi dimensioni.', 'La pianificazione di progetti software riguarda solo gli obiettivi.', 'scelta1', 182),
       -- Domanda 5
       ('Le sfide possono includere il rispetto dei tempi, la gestione delle risorse, l’adattamento ai cambiamenti dei requisiti e la comunicazione efficace.', 'Non esistono sfide in un progetto software.', 'Le sfide in un progetto software non riguardano la comunicazione.', 'Le sfide in un progetto software sono solo tecnologiche.', 'scelta1', 183),
       -- Domanda 6
       ('La gestione dei rischi coinvolge l’identificazione, l’analisi e la mitigazione dei rischi nel progetto per ridurre la loro probabilità e impatto.', 'La gestione dei rischi non è importante in un progetto software.', 'La gestione dei rischi riguarda solo gli errori del team.', 'La gestione dei rischi è solo per i progetti di lunga durata.', 'scelta1', 184),
       -- Domanda 7
       ('Una comunicazione efficace riduce i malintesi, migliora la collaborazione e garantisce che tutte le parti coinvolte siano informate e allineate.', 'La comunicazione efficace non è importante nei progetti software.', 'La comunicazione efficace è solo per i team di piccole dimensioni.', 'La comunicazione efficace rallenta i progetti software.', 'scelta1', 185),
       -- Domanda 8
       ('La leadership è fondamentale per motivare il team, guidare il progetto e prendere decisioni cruciali.', 'La leadership non è necessaria in un Project Manager.', 'La leadership è solo per i team senior.', 'La leadership non influenza la riuscita del progetto.', 'scelta1', 186);

       
-- Quiz Scrum Master
-- Quiz Soft Skills 33
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Scrum Master', 6);

-- Domande per il Quiz "Competenze Scrum Master" (Quiz ID: 33)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è il ruolo principale dello Scrum Master in un team Agile?', 8),
       ('Spiega il concetto di sprint nel contesto di Scrum.', 9),
       ('Come gestisci gli ostacoli e le impedimenti nel processo di sviluppo Agile?', 8),
       ('Quali sono i principali strumenti utilizzati da uno Scrum Master per facilitare la collaborazione del team?', 9),
       ('Descrivi la differenza tra un meeting di Sprint Planning e uno di Sprint Review.', 8),
       ('Qual è l’importanza della trasparenza e ispezione nel framework Agile?', 9);

-- Quiz "Competenze Scrum Master" (Quiz ID: 33)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (187, 33), (188, 33), (189, 33), (190, 33), (191, 33), (192, 33);

-- Risposte per "Competenze Scrum Master"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Lo Scrum Master è responsabile di facilitare il processo Agile, rimuovere gli ostacoli e garantire che il team segua correttamente i principi di Scrum.', 'Lo Scrum Master non ha alcun ruolo specifico in un team Agile.', 'Lo Scrum Master è responsabile della pianificazione dei progetti.', 'Lo Scrum Master è solo uno sviluppatore senior.', 'scelta1', 187),
       -- Domanda 2
       ('Lo sprint è un periodo di tempo fisso, solitamente di 2-4 settimane, in cui viene sviluppato un incremento di funzionalità del prodotto.', 'Lo sprint è una riunione giornaliera del team Agile.', 'Lo sprint non è parte di Scrum.', 'Lo sprint è solo per grandi progetti.', 'scelta1', 188),
       -- Domanda 3
       ('Gestisco gli ostacoli collaborando con il team per risolverli rapidamente e rimuovendo le impedimenti che bloccano lo sviluppo.', 'Gli ostacoli non sono gestiti dallo Scrum Master.', 'Gli ostacoli vengono ignorati.', 'Gli ostacoli vengono gestiti solo dai manager.', 'scelta1', 189),
       -- Domanda 4
       ('Gli strumenti includono la bacheca Scrum (Scrum board), software di gestione dei task, applicazioni di comunicazione e collaborazione.', 'Gli Scrum Master non utilizzano strumenti.', 'Gli Scrum Master utilizzano solo email.', 'Gli Scrum Master utilizzano solo la carta e penna.', 'scelta1', 190),
       -- Domanda 5
       ('Lo Sprint Planning si concentra sulla pianificazione delle attività da svolgere nell’Sprint, mentre lo Sprint Review valuta il lavoro svolto e presenta il prodotto al cliente.', 'Lo Sprint Planning e lo Sprint Review sono la stessa cosa.', 'Lo Sprint Planning è per la presentazione al cliente.', 'Lo Sprint Review è per pianificare le attività.', 'scelta1', 191),
       -- Domanda 6
       ('La trasparenza e l’ispezione sono fondamentali per garantire che il processo di sviluppo sia visibile, comprensibile e che le modifiche necessarie siano effettuate.', 'La trasparenza e l’ispezione non sono importanti nel framework Agile.', 'La trasparenza e l’ispezione sono utilizzate solo in alcuni team.', 'La trasparenza e l’ispezione sono solo per i team di sviluppo.', 'scelta1', 192);

       
-- Quiz Progettista UX/UI
-- Quiz Soft Skills 34
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Progettista UX/UI', 5);

-- Domande per il Quiz "Competenze Progettista UX/UI" (Quiz ID: 34)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è la differenza tra UX e UI design?', 8),
       ('Descrivi il processo di creazione di una user persona nel design UX.', 9),
       ('Qual è l''importanza dei test utente nel design UX/UI?', 8),
       ('Cosa significa "mobile-first design"?', 9),
       ('Come si crea un wireframe nel processo di progettazione UX/UI?', 8);

-- Quiz "Competenze Progettista UX/UI" (Quiz ID: 34)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (193, 34), (194, 34), (195, 34), (196, 34), (197, 34);

-- Risposte per "Competenze Progettista UX/UI"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('UX design si concentra sull''esperienza dell''utente, mentre UI design si riferisce all''aspetto visivo dell''interfaccia.', 'Non c''è differenza tra UX e UI design.', 'UX design riguarda solo i dispositivi mobili.', 'UI design riguarda solo il design del sito web.', 'scelta1', 193),
       -- Domanda 2
       ('Creare una user persona coinvolge la raccolta di dati demografici, comportamentali, obiettivi e sfide degli utenti per creare un profilo immaginario rappresentativo.', 'Le user persona non sono parte del processo di design.', 'La user persona si riferisce solo agli utenti più giovani.', 'La user persona si riferisce solo agli utenti più anziani.', 'scelta1', 194),
       -- Domanda 3
       ('I test utente sono essenziali per comprendere le reazioni e il comportamento degli utenti di fronte al prodotto o all''interfaccia e per identificare miglioramenti.', 'I test utente non sono rilevanti nel design UX/UI.', 'I test utente sono utilizzati solo nelle fasi finali del progetto.', 'I test utente sono utilizzati solo per la fase di ricerca.', 'scelta1', 195),
       -- Domanda 4
       ('"Mobile-first design" significa progettare un''interfaccia considerando innanzitutto i dispositivi mobili e adattando successivamente il design per i desktop.', 'Il "mobile-first design" riguarda solo l''aspetto estetico.', 'Il "mobile-first design" è obsoleto nel mondo del design.', 'Il "mobile-first design" si riferisce solo alle app per dispositivi mobili.', 'scelta1', 196),
       -- Domanda 5
       ('I wireframe sono creati utilizzando strumenti come software di progettazione grafica o strumenti specifici per la prototipazione, presentando la struttura di base dell''interfaccia senza dettagli visivi.', 'I wireframe non sono importanti nel design UX/UI.', 'I wireframe sono sempre dettagliati al massimo.', 'I wireframe vengono creati solo alla fine del processo di design.', 'scelta1', 197);

       
--quiz 35 da mettere qua ma le domande vanno in fondo     
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Tecnico di supporto IT', 5); 
       
       
       
       
-- Quiz Architetto dell'Esperienza Utente (UX Architect)
-- Quiz Soft Skills 36
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Architetto dell''Esperienza Utente', 6);

-- Domande per il Quiz "Competenze Architetto dell''Esperienza Utente" (Quiz ID: 36)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Quali sono le fasi fondamentali del processo di progettazione dell''esperienza utente (UX)?', 8),
       ('Descrivi l''importanza della ricerca utente nel design dell''esperienza utente.', 9),
       ('Spiega il concetto di mappatura del percorso utente (user journey mapping) e come viene utilizzato nel processo di design.', 8),
       ('Qual è il ruolo della prototipazione nel design dell''esperienza utente?', 9),
       ('Cosa comporta l''usabilità nel contesto dell''architettura dell''esperienza utente?', 8),
       ('Descrivi l''importanza dell''accessibilità nell''architettura dell''esperienza utente.', 9);

-- Quiz "Competenze Architetto dell''Esperienza Utente" (Quiz ID: 36)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (198, 36), (199, 36), (200, 36), (201, 36), (202, 36), (203, 36);

-- Risposte per "Competenze Architetto dell''Esperienza Utente"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Ricerca, Analisi, Progettazione, Test', 'Progettazione, Sviluppo, Implementazione, Valutazione', 'Test, Valutazione, Implementazione, Sviluppo', 'Sviluppo, Ricerca, Analisi, Implementazione', 'scelta1', 198),
       -- Domanda 2
       ('La ricerca utente aiuta a comprendere le esigenze, i comportamenti e le preferenze degli utenti finali, guidando decisioni informate durante il processo di design.', 'La ricerca utente non è rilevante nel design dell''esperienza utente.', 'La ricerca utente si concentra solo sulla fase di test finale.', 'La ricerca utente si basa solo su dati demografici.', 'scelta1', 199),
       -- Domanda 3
       ('Il mappatura del percorso utente visualizza il percorso che un utente compie con un prodotto o servizio, consentendo di comprendere le interazioni e le emozioni degli utenti durante l''utilizzo.', 'Il mappatura del percorso utente è utile solo per valutare il prodotto una volta completato.', 'Il mappatura del percorso utente riguarda solo l''aspetto visivo delle interfacce utente.', 'Il mappatura del percorso utente si concentra solo sugli utenti più giovani.', 'scelta1', 200),
       -- Domanda 4
       ('I prototipi consentono di creare rappresentazioni funzionali o visuali di un prodotto, consentendo test e iterazioni prima della realizzazione definitiva.', 'I prototipi non sono utili nel design dell''esperienza utente.', 'I prototipi vengono creati solo alla fine del processo di design.', 'I prototipi si concentrano solo sull''aspetto visivo senza funzionalità.', 'scelta1', 201),
       -- Domanda 5
       ('L''usabilità si concentra sull''efficacia, l''efficienza e la soddisfazione con cui gli utenti possono raggiungere i propri obiettivi utilizzando un sistema o un prodotto.', 'L''usabilità non è una considerazione importante nell''architettura dell''esperienza utente.', 'L''usabilità si concentra solo sull''aspetto estetico di un prodotto.', 'L''usabilità si concentra solo sulle prestazioni di un sistema.', 'scelta1', 202),
       -- Domanda 6
       ('L''accessibilità si riferisce alla progettazione di prodotti, siti web e applicazioni che possono essere utilizzati da tutti, comprese le persone con disabilità o esigenze diverse.', 'L''accessibilità non è rilevante nell''architettura dell''esperienza utente.', 'L''accessibilità si concentra solo sulla grafica e i colori.', 'L''accessibilità riguarda solo l''accesso da dispositivi mobili.', 'scelta1', 203);

       
-- Quiz Direttore Amministrativo
-- Quiz Soft Skills 37
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Direttore Amministrativo', 5);

-- Domande per il Quiz "Competenze Direttore Amministrativo" (Quiz ID: 37)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Descrivi le responsabilità principali di un Direttore Amministrativo in un''organizzazione.', 8),
       ('Quali sono gli aspetti chiave della gestione finanziaria e contabile che un Direttore Amministrativo dovrebbe supervisionare?', 9),
       ('Spiega l''importanza della pianificazione finanziaria nel ruolo di un Direttore Amministrativo.', 8),
       ('Come gestiresti efficacemente le risorse umane e la struttura organizzativa all''interno di un''azienda?', 9),
       ('Qual è l''importanza della compliance normativa e come garantiresti che l''azienda sia conforme alle leggi e ai regolamenti?', 8);

-- Quiz "Competenze Direttore Amministrativo" (Quiz ID: 37)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (204, 37), (205, 37), (206, 37), (207, 37), (208, 37);

-- Risposte per "Competenze Direttore Amministrativo"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Le responsabilità principali includono la gestione finanziaria, la pianificazione strategica, la supervisione delle risorse umane e la garanzia della conformità normativa.', 'Il Direttore Amministrativo si occupa solo della contabilità.', 'Le responsabilità principali riguardano solo le questioni amministrative interne.', 'La gestione delle risorse umane è l''unica responsabilità del Direttore Amministrativo.', 'scelta1', 204),
       -- Domanda 2
       ('Gli aspetti chiave includono la contabilità, il budgeting, la gestione delle entrate e delle spese, la redazione dei bilanci e la gestione delle relazioni finanziarie con banche e fornitori.', 'La gestione finanziaria non è una priorità per il Direttore Amministrativo.', 'Il Direttore Amministrativo si occupa solo della gestione delle risorse umane.', 'Gli aspetti chiave includono solo la supervisione della struttura organizzativa.', 'scelta1', 205),
       -- Domanda 3
       ('La pianificazione finanziaria è cruciale per assicurare la sostenibilità finanziaria a lungo termine e prevedere eventuali rischi finanziari.', 'La pianificazione finanziaria è irrilevante per un Direttore Amministrativo.', 'La pianificazione finanziaria si concentra solo sui profitti a breve termine.', 'La pianificazione finanziaria riguarda solo la gestione del personale.', 'scelta1', 206),
       -- Domanda 4
       ('Gestirei le risorse umane attraverso strategie di reclutamento efficaci, programmi di sviluppo del personale e la creazione di un ambiente di lavoro positivo.', 'La gestione delle risorse umane non è responsabilità del Direttore Amministrativo.', 'Gestirei le risorse umane solo attraverso la supervisione gerarchica.', 'Gestirei le risorse umane solo attraverso politiche di riduzione dei costi.', 'scelta1', 207),
       -- Domanda 5
       ('La compliance normativa è fondamentale per evitare sanzioni legali e garantire che l''azienda operi in conformità con leggi e regolamenti.', 'La compliance normativa è trascurabile per il Direttore Amministrativo.', 'La compliance normativa riguarda solo la gestione delle risorse umane.', 'La compliance normativa riguarda solo la gestione finanziaria.', 'scelta1', 208);

       
-- Quiz Responsabile Amministrativo
-- Quiz Soft Skills 38
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Responsabile Amministrativo', 5);

-- Domande per il Quiz "Competenze Responsabile Amministrativo" (Quiz ID: 38)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Descrivi le responsabilità principali di un Responsabile Amministrativo in un''organizzazione.', 8),
       ('Quali sono gli aspetti chiave della gestione finanziaria e contabile che un Responsabile Amministrativo dovrebbe supervisionare?', 9),
       ('Spiega l''importanza della pianificazione finanziaria nel ruolo di un Responsabile Amministrativo.', 8),
       ('Come gestiresti efficacemente le risorse umane e la struttura organizzativa all''interno di un''azienda?', 9),
       ('Qual è l''importanza della compliance normativa e come garantiresti che l''azienda sia conforme alle leggi e ai regolamenti?', 8);

-- Quiz "Competenze Responsabile Amministrativo" (Quiz ID: 38)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (209, 38), (210, 38), (211, 38), (212, 38), (213, 38);

-- Risposte per "Competenze Responsabile Amministrativo"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Le responsabilità principali includono la gestione finanziaria, la pianificazione strategica, la supervisione delle risorse umane e la garanzia della conformità normativa.', 'Il Responsabile Amministrativo si occupa solo della contabilità.', 'Le responsabilità principali riguardano solo le questioni amministrative interne.', 'La gestione delle risorse umane è l''unica responsabilità del Responsabile Amministrativo.', 'scelta1', 209),
       -- Domanda 2
       ('Gli aspetti chiave includono la contabilità, il budgeting, la gestione delle entrate e delle spese, la redazione dei bilanci e la gestione delle relazioni finanziarie con banche e fornitori.', 'La gestione finanziaria non è una priorità per il Responsabile Amministrativo.', 'Il Responsabile Amministrativo si occupa solo della gestione delle risorse umane.', 'Gli aspetti chiave includono solo la supervisione della struttura organizzativa.', 'scelta1', 210),
       -- Domanda 3
       ('La pianificazione finanziaria è cruciale per assicurare la sostenibilità finanziaria a lungo termine e prevedere eventuali rischi finanziari.', 'La pianificazione finanziaria è irrilevante per un Responsabile Amministrativo.', 'La pianificazione finanziaria si concentra solo sui profitti a breve termine.', 'La pianificazione finanziaria riguarda solo la gestione del personale.', 'scelta1', 211),
       -- Domanda 4
       ('Gestirei le risorse umane attraverso strategie di reclutamento efficaci, programmi di sviluppo del personale e la creazione di un ambiente di lavoro positivo.', 'La gestione delle risorse umane non è responsabilità del Responsabile Amministrativo.', 'Gestirei le risorse umane solo attraverso la supervisione gerarchica.', 'Gestirei le risorse umane solo attraverso politiche di riduzione dei costi.', 'scelta1', 212),
       -- Domanda 5
       ('La compliance normativa è fondamentale per evitare sanzioni legali e garantire che l''azienda operi in conformità con leggi e regolamenti.', 'La compliance normativa è trascurabile per il Responsabile Amministrativo.', 'La compliance normativa riguarda solo la gestione delle risorse umane.', 'La compliance normativa riguarda solo la gestione finanziaria.', 'scelta1', 213);

       
-- Quiz Responsabile Finanziario
-- Quiz Soft Skills 39
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Responsabile Finanziario', 5);

-- Domande per il Quiz "Competenze Responsabile Finanziario" (Quiz ID: 39)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è la differenza tra finanza e contabilità?', 8),
       ('Spiega l''importanza dell''analisi finanziaria nelle decisioni aziendali.', 9),
       ('Quali sono le strategie principali per gestire un budget aziendale in modo efficace?', 8),
       ('Come può un Responsabile Finanziario gestire e mitigare i rischi finanziari di un''azienda?', 9),
       ('Qual è il ruolo del Responsabile Finanziario nella pianificazione finanziaria a breve e lungo termine?', 8);

-- Quiz "Competenze Responsabile Finanziario" (Quiz ID: 39)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (214, 39), (215, 39), (216, 39), (217, 39), (218, 39);

-- Risposte per "Competenze Responsabile Finanziario"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('La finanza riguarda la gestione del denaro e delle risorse, mentre la contabilità si concentra sulla registrazione e classificazione dei dati finanziari.', 'Non esiste differenza tra finanza e contabilità.', 'La contabilità è legata ai profitti, la finanza alle spese aziendali.', 'La contabilità si occupa solo dei budget, la finanza delle previsioni finanziarie.', 'scelta1', 214),
       -- Domanda 2
       ('L''analisi finanziaria fornisce informazioni dettagliate sullo stato finanziario dell''azienda e aiuta a prendere decisioni informate riguardo investimenti, espansioni o risparmi.', 'L''analisi finanziaria non influisce sulle decisioni aziendali.', 'L''analisi finanziaria è solo per la documentazione aziendale.', 'L''analisi finanziaria si concentra solo sulla contabilità.', 'scelta1', 215),
       -- Domanda 3
       ('Le strategie possono includere riduzione dei costi superflui, investimenti mirati, revisione periodica del budget e adozione di tecnologie efficienti.', 'Non ci sono strategie per gestire un budget aziendale.', 'Le strategie per gestire il budget sono limitate al taglio delle risorse umane.', 'Le strategie per gestire il budget sono solo in ambito informatico.', 'scelta1', 216),
       -- Domanda 4
       ('Il Responsabile Finanziario può identificare i rischi finanziari, valutarli e attuare piani di mitigazione, ad esempio tramite assicurazioni, diversificazione degli investimenti o riserve di liquidità.', 'Il Responsabile Finanziario non ha responsabilità nella gestione dei rischi finanziari.', 'I rischi finanziari non sono gestibili.', 'I rischi finanziari possono essere gestiti solo dal CEO.', 'scelta1', 217),
       -- Domanda 5
       ('Il Responsabile Finanziario definisce obiettivi finanziari chiari a breve e lungo termine per garantire la stabilità e la crescita finanziaria dell''azienda.', 'Gli obiettivi finanziari non sono importanti per il Responsabile Finanziario.', 'Gli obiettivi finanziari sono stabiliti solo dal reparto vendite.', 'Gli obiettivi finanziari sono importanti solo a breve termine.', 'scelta1', 218);

       
-- Quiz per Responsabile Finanziario
-- Quiz Soft Skills 39
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Responsabile Finanziario', 5);

-- Domande per il Quiz "Competenze Responsabile Finanziario" (Quiz ID: 39)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è l''importanza dell''analisi dei costi in un''azienda?', 8),
       ('Spiega il concetto di budget aziendale e come viene utilizzato nella pianificazione finanziaria.', 9),
       ('Descrivi le principali fonti di finanziamento per un''azienda e i loro impatti sulla gestione finanziaria.', 8),
       ('Come un responsabile finanziario gestisce i rischi finanziari all''interno di un''azienda?', 9),
       ('Qual è il ruolo delle performance finanziarie nel processo decisionale aziendale?', 8);

-- Quiz "Competenze Responsabile Finanziario" (Quiz ID: 39)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (219, 40), (220, 40), (221, 40), (222, 40), (223, 40);

-- Risposte per "Competenze Responsabile Finanziario"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('L''analisi dei costi permette di identificare aree di inefficienza, ottimizzare le risorse e prendere decisioni informate per migliorare la redditività aziendale.', 'L''analisi dei costi non è rilevante per la gestione aziendale.', 'L''analisi dei costi riguarda solo i profitti aziendali.', 'L''analisi dei costi è solo una funzione del reparto contabile.', 'scelta1', 219),
       -- Domanda 2
       ('Il budget aziendale è un piano finanziario che descrive le entrate e le spese previste per un determinato periodo, aiutando nell''allocazione delle risorse e nella pianificazione finanziaria.', 'Il budget aziendale non ha alcun ruolo nella gestione finanziaria.', 'Il budget aziendale è un processo casuale.', 'Il budget aziendale riguarda solo le spese aziendali.', 'scelta1', 220),
       -- Domanda 3
       ('Le fonti di finanziamento includono prestiti bancari, investitori privati, emissioni di azioni e utili reinvestiti, ognuno con impatti diversi sulle finanze aziendali e sui rapporti con i finanziatori.', 'Non esistono fonti di finanziamento per le aziende.', 'Le fonti di finanziamento non influenzano la gestione finanziaria.', 'Le fonti di finanziamento sono esclusivamente attraverso prestiti bancari.', 'scelta1', 221),
       -- Domanda 4
       ('Gestisce i rischi attraverso l''identificazione, la valutazione e la mitigazione dei rischi finanziari, adottando strategie di copertura e diversificazione delle fonti di finanziamento.', 'I responsabili finanziari non gestiscono i rischi finanziari.', 'I rischi finanziari non sono rilevanti per la gestione aziendale.', 'La gestione dei rischi finanziari è compito esclusivo del reparto legale.', 'scelta1', 222),
       -- Domanda 5
       ('Le performance finanziarie forniscono dati e metriche che supportano il processo decisionale aziendale, come investimenti, espansioni o riduzioni di costi.', 'Le performance finanziarie non influenzano il processo decisionale aziendale.', 'Il processo decisionale aziendale non è basato sulle performance finanziarie.', 'Il processo decisionale aziendale si basa solo sull''intuizione.', 'scelta1', 223);

  
-- Quiz per Responsabile Risorse Umane
-- Quiz Soft Skills 41
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze Responsabile Risorse Umane', 5);

-- Domande per il Quiz "Competenze Responsabile Risorse Umane" (Quiz ID: 41)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Qual è il ruolo delle risorse umane nella strategia aziendale?', 8),
       ('Come vengono gestiti i processi di selezione e assunzione del personale?', 9),
       ('Descrivi l''importanza della formazione e dello sviluppo del personale.', 8),
       ('Come affrontare le problematiche legate al clima organizzativo e alle relazioni interne?', 9),
       ('Quali sono le sfide principali nell''amministrazione delle risorse umane?', 8);

-- Quiz "Competenze Responsabile Risorse Umane" (Quiz ID: 41)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (224, 41), (225, 41), (226, 41), (227, 41), (228, 41);

-- Risposte per "Competenze Responsabile Risorse Umane"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Le risorse umane giocano un ruolo chiave nell''allineamento delle persone con gli obiettivi aziendali e nella gestione del capitale umano.', 'Le risorse umane non hanno un ruolo strategico nell''azienda.', 'Il ruolo delle risorse umane è solo amministrativo.', 'Le risorse umane non influenzano la strategia aziendale.', 'scelta1', 224),
       -- Domanda 2
       ('Attraverso la progettazione di processi efficaci, la valutazione delle competenze e delle culture aziendali, e la selezione di candidati in linea con le esigenze dell''azienda.', 'La selezione del personale avviene in modo casuale senza seguire procedure specifiche.', 'La gestione delle risorse umane non coinvolge la selezione del personale.', 'I processi di selezione si basano solo sull''esperienza personale.', 'scelta1', 225),
       -- Domanda 3
       ('La formazione e lo sviluppo del personale favoriscono l''acquisizione di nuove competenze, la crescita professionale e la retention dei talenti all''interno dell''organizzazione.', 'La formazione del personale è irrilevante per il successo aziendale.', 'Lo sviluppo del personale non influisce sulla produttività.', 'La formazione del personale è un costo aggiuntivo senza beneficio aziendale.', 'scelta1', 226),
       -- Domanda 4
       ('Affrontando le problematiche attraverso la promozione di una cultura aziendale positiva, l''ascolto attivo dei dipendenti e la gestione tempestiva di conflitti o tensioni interne.', 'Le problematiche interne non sono di competenza delle risorse umane.', 'Le problematiche interne vengono ignorate.', 'La gestione delle problematiche è responsabilità esclusiva del management.', 'scelta1', 227),
       -- Domanda 5
       ('Le sfide includono la gestione del cambiamento organizzativo, l''attrazione e la retention dei talenti, la conformità normativa e la gestione delle prestazioni.', 'La gestione delle risorse umane non affronta sfide specifiche.', 'La retention dei talenti non è una sfida per le risorse umane.', 'Le sfide riguardano solo l''aspetto amministrativo delle risorse umane.', 'scelta1', 228);

       
-- Quiz per Recruiter
-- Quiz Soft Skills 42
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze del Recruiter', 5);

-- Domande per il Quiz "Competenze del Recruiter" (Quiz ID: 42)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Quali sono le competenze fondamentali per un recruiter?', 8),
       ('Come viene condotto un efficace processo di selezione?', 9),
       ('Descrivi l''importanza delle soft skills nella valutazione dei candidati.', 8),
       ('Quali sono le sfide principali nel reclutamento e nella gestione del personale?', 9),
       ('Come si valuta la cultura aziendale di un candidato?', 8);

-- Quiz "Competenze del Recruiter" (Quiz ID: 42)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (229, 42), (230, 42), (231, 42), (232, 42), (233, 42);

-- Risposte per "Competenze del Recruiter"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Capacità di comunicazione, conoscenza approfondita del ruolo, abilità di valutazione delle competenze.', 'Non ci sono competenze specifiche per un recruiter.', 'Conoscenza generale dell''azienda, esperienza lavorativa nel settore.', 'Solo competenze informatiche e tecniche.', 'scelta1', 229),
       -- Domanda 2
       ('Attraverso la definizione dei requisiti del ruolo, la valutazione dei candidati in base alle competenze richieste e l''utilizzo di strumenti di selezione appropriati.', 'La selezione avviene in modo casuale senza seguire procedure specifiche.', 'Non esiste un processo standard di selezione.', 'La selezione si basa solo sull''intuizione del recruiter.', 'scelta1', 230),
       -- Domanda 3
       ('Le soft skills sono fondamentali per valutare l''adattabilità, la gestione dello stress e la capacità di collaborare dei candidati.', 'Solo le competenze tecniche sono rilevanti nel processo di selezione.', 'Le soft skills non sono considerate nel processo di reclutamento.', 'Solo l''esperienza lavorativa è importante.', 'scelta1', 231),
       -- Domanda 4
       ('Le sfide includono l''attrazione e la retention dei talenti, la gestione dei tempi di selezione e la concorrenza con altre aziende.', 'Il reclutamento non ha sfide specifiche.', 'La retention dei talenti non è una sfida.', 'Le sfide riguardano solo l''aspetto burocratico del reclutamento.', 'scelta1', 232),
       -- Domanda 5
       ('Valutando la coerenza dei valori del candidato con quelli dell''azienda, attraverso interviste specifiche e la valutazione delle esperienze passate.', 'La cultura aziendale non è rilevante nel processo di selezione.', 'La cultura aziendale viene valutata solo tramite test psicometrici.', 'Non c''è modo di valutare la cultura aziendale di un candidato.', 'scelta1', 233);

       
-- Quiz per Responsabile Contratti
-- Quiz Soft Skills 43
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze del Responsabile Contratti', 5);

-- Domande per il Quiz "Competenze del Responsabile Contratti" (Quiz ID: 43)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Quali sono le competenze chiave richieste per un responsabile contratti?', 8),
       ('Descrivi il processo di gestione contrattuale da negoziazione a firma.', 9),
       ('Qual è l''importanza della precisione e della comprensione legale nel ruolo di responsabile contratti?', 8),
       ('Quali sono le sfide più comuni nel gestire contratti complessi?', 9),
       ('Come si assicura la conformità dei contratti alle normative e regolamenti?', 8);

-- Quiz "Competenze del Responsabile Contratti" (Quiz ID: 43)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (234, 43), (235, 43), (236, 43), (237, 43), (238, 43);

-- Risposte per "Competenze del Responsabile Contratti"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Conoscenza legale, capacità di negoziazione, abilità di gestione dei tempi.', 'Solo conoscenza amministrativa.', 'Solo competenze informatiche.', 'Solo abilità di comunicazione.', 'scelta1', 234),
       -- Domanda 2
       ('Attraverso la definizione dei termini, la negoziazione delle condizioni, la revisione legale e l''approvazione finale.', 'I contratti vengono firmati senza alcun processo specifico.', 'Non c''è processo di negoziazione.', 'Solo tramite l''approvazione legale senza negoziazione.', 'scelta1', 235),
       -- Domanda 3
       ('È fondamentale per garantire che i termini siano chiari, corretti e conformi alla legge.', 'La precisione e la comprensione legale non sono rilevanti nel ruolo di responsabile contratti.', 'La comprensione legale è più importante della precisione.', 'La precisione è più importante della comprensione legale.', 'scelta1', 236),
       -- Domanda 4
       ('Le sfide includono la gestione dei tempi, la complessità delle clausole e la mitigazione dei rischi.', 'Non ci sono sfide nella gestione dei contratti.', 'Solo la complessità delle clausole.', 'Solo la gestione dei tempi.', 'scelta1', 237),
       -- Domanda 5
       ('Attraverso la revisione legale costante, l''utilizzo di modelli standard e l''aggiornamento sulle normative vigenti.', 'Non esiste un modo per garantire la conformità.', 'Solo attraverso l''utilizzo di modelli standard.', 'Solo tramite la revisione legale finale.', 'scelta1', 238);

       
-- Quiz per il Legale Aziendale
-- Quiz Soft Skills 44
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze del Legale Aziendale', 5);

-- Domande per il Quiz "Competenze del Legale Aziendale" (Quiz ID: 44)
INSERT INTO Domanda (testo, punteggio)
VALUES ('Quali sono i principali rischi legali che un''azienda potrebbe affrontare?', 8),
       ('Spiega l''importanza della compliance normativa per un''azienda.', 9),
       ('Come gestisci una controversia legale all''interno di un''azienda?', 8),
       ('Quale approccio adotti per minimizzare i rischi legali all''interno di un''azienda?', 9),
       ('Come contribuisce il legale aziendale nella redazione dei contratti aziendali?', 8);

-- Quiz "Competenze del Legale Aziendale" (Quiz ID: 44)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (239, 44), (240, 44), (241, 44), (242, 44), (243, 44);

-- Risposte per "Competenze del Legale Aziendale"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Rischi contrattuali, controversie legali, problemi di conformità, violazioni della privacy.', 'Un''azienda non affronta rischi legali.', 'Solo violazioni della privacy.', 'Solo rischi contrattuali.', 'scelta1', 239),
       -- Domanda 2
       ('Evita sanzioni legali, riduce le vulnerabilità aziendali, costruisce fiducia con i clienti e le parti interessate.', 'La compliance normativa non è importante per un''azienda.', 'Solo per evitare sanzioni legali.', 'Solo per ridurre le vulnerabilità aziendali.', 'scelta1', 240),
       -- Domanda 3
       ('Attraverso negoziazione, mediazione, se necessario, ricorrendo a soluzioni legali.', 'Non è possibile gestire controversie legali all''interno di un''azienda.', 'Solo attraverso soluzioni legali.', 'Solo attraverso mediazione.', 'scelta1', 241),
       -- Domanda 4
       ('Conduzione di audit legali, formazione del personale, implementazione di procedure interne.', 'Non è possibile minimizzare i rischi legali.', 'Solo attraverso formazione del personale.', 'Solo tramite implementazione di procedure interne.', 'scelta1', 242),
       -- Domanda 5
       ('Nella redazione accurata, nella revisione e nella negoziazione dei termini dei contratti aziendali.', 'Il legale aziendale non è coinvolto nella redazione dei contratti.', 'Solo nella revisione dei contratti.', 'Solo nella negoziazione dei termini contrattuali.', 'scelta1', 243);

       
-- Quiz per l'Amministratore del Database
-- Quiz Soft Skills 45
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze dell''Amministratore del Database', 5);
-- Domande per il Quiz "Competenze dell'Amministratore del Database"
INSERT INTO Domanda (testo, punteggio)
VALUES ('Quali sono le principali fasi di progettazione di un database?', 8),
       ('Spiega il concetto di normalizzazione dei dati e perché è importante.', 9),
       ('Come gestiresti un problema di rallentamento delle query in un database?', 8),
       ('Quale ruolo gioca l''ottimizzazione del database nelle prestazioni complessive del sistema?', 9),
       ('Come identifichi e risolvi i problemi di sicurezza in un database?', 8);

-- Quiz "Competenze dell'Amministratore del Database" (ID Quiz: 45)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (244, 45), (245, 45), (246, 45), (247, 45), (248, 45);

-- Risposte per "Competenze dell'Amministratore del Database"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Progettazione concettuale, progettazione logica, implementazione fisica.', 'Solo implementazione fisica.', 'Solo progettazione logica.', 'Solo progettazione concettuale.', 'scelta1', 244),
       -- Domanda 2
       ('La normalizzazione organizza i dati per ridurre la ridondanza e garantire l''integrità dei dati.', 'La normalizzazione non ha importanza in un database.', 'La normalizzazione duplica i dati per una migliore accessibilità.', 'La normalizzazione non è relativa all''integrità dei dati.', 'scelta1', 245),
       -- Domanda 3
       ('Analizzando gli indici, ottimizzando le query, verificando le statistiche dei database.', 'Non è possibile gestire il rallentamento delle query.', 'Solo analizzando gli indici.', 'Solo ottimizzando le query.', 'scelta1', 246),
       -- Domanda 4
       ('Migliora le prestazioni del database, contribuisce a un migliore utilizzo delle risorse di sistema.', 'L''ottimizzazione del database non ha impatto sulle prestazioni del sistema.', 'Solo migliora le prestazioni del database.', 'Solo contribuisce a un migliore utilizzo delle risorse.', 'scelta1', 247),
       -- Domanda 5
       ('Attraverso la valutazione delle vulnerabilità, l''applicazione di patch, l''implementazione di criteri di sicurezza.', 'I problemi di sicurezza non possono essere risolti in un database.', 'Solo applicando patch.', 'Solo implementando criteri di sicurezza.', 'scelta1', 248);





--Quiz sviluppatore di db
INSERT INTO Quiz (descrizione, n_domande)
VALUES ('Competenze per Sviluppatore di Database', 5);

INSERT INTO Domanda (testo, punteggio)
VALUES ( 'Cos''è un indice in un database e quale è il suo scopo principale?', 8),
       ('Quali sono le differenze tra un database SQL e un database NoSQL?', 9),
       ('Cosa significa normalizzazione in un database relazionale?', 8),
       ('Cosa sono le stored procedure in un database?', 9),
       ('Qual è l''importanza dell''indicizzazione in un database?', 8);

--Quiz sviluppatore di db (ID Quiz: 46)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (249, 46), (250, 46), (251, 46), (252, 46), (253, 46);


-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Un indice è un tipo di dato in un database.', 'Un indice è una chiave primaria di una tabella.', 'Un indice è una struttura che migliora la velocità di ricerca dei dati in una tabella.', 'Un indice è una procedura memorizzata in un database.', 'scelta3', 249),
       -- Domanda 2
       ('SQL supporta solo linguaggio di query strutturato, mentre NoSQL supporta solo database non relazionali.', 'SQL è basato su schema, mentre NoSQL è basato su schema flessibile.', 'SQL è adatto solo per dati piccoli, mentre NoSQL è adatto solo per dati molto grandi.', 'SQL è più veloce di NoSQL nella maggior parte dei casi.', 'scelta2', 250),
       -- Domanda 3
       ('La normalizzazione è il processo di aggiunta di dati duplicati per migliorare le prestazioni.', 'La normalizzazione è il processo di organizzare i dati in modo efficiente riducendo la ridondanza.', 'La normalizzazione è il processo di eliminazione di tutte le tabelle in un database.', 'La normalizzazione è il processo di creazione di un database senza relazioni.', 'scelta2', 251),
       -- Domanda 4
       ('Le stored procedure sono un tipo di linguaggio di programmazione.', 'Le stored procedure sono procedure che vengono eseguite solo una volta.', 'Le stored procedure sono un insieme di istruzioni SQL precompilate che possono essere eseguite.', 'Le stored procedure sono utilizzate solo per la creazione di tabelle in un database.', 'scelta3', 252),
       -- Domanda 5
       ('L''indicizzazione rallenta le ricerche in un database.', ' L''indicizzazione non ha alcun impatto sulle prestazioni di un database.', 'L''indicizzazione accelera le ricerche e l''accesso ai dati in un database.', ' L''indicizzazione è utile solo per le tabelle vuote.', 'scelta3', 253);






















--lascia qua in fondo -- Quiz per il Tecnico di Supporto IT (ID Quiz: 35)
-- Domande per il Quiz "Tecnico di Supporto IT"
INSERT INTO Domanda (testo, punteggio)
VALUES ('Descrivi i passaggi fondamentali per risolvere un problema di connessione internet.', 8),
       ('Come identifichi e risolvi i problemi di stampa su una rete condivisa?', 9),
       ('Quale approccio useresti per gestire richieste di supporto multiple contemporaneamente?', 8),
       ('Come affronti le richieste di supporto da parte di utenti non tecnici?', 9),
       ('Quali sono gli strumenti di monitoraggio dei sistemi che utilizzi abitualmente?', 8);

-- Quiz "Tecnico di Supporto IT" (ID Quiz: 35)
INSERT INTO QuizDomanda (id_domanda, id_quiz)
VALUES (269, 35), (270, 35), (271, 35), (272, 35), (273, 35);

-- Risposte per "Tecnico di Supporto IT"
-- Domanda 1
INSERT INTO RisposteDomanda (scelta1, scelta2, scelta3, scelta4, scelta_corretta, id_domanda)
VALUES ('Verifica hardware, controlla connessioni fisiche, testa connessione con un altro dispositivo.', 'Riavvia il router, controlla le mail, contatta l''ISP.', 'Cambia browser, cancella la cronologia, usa un nuovo computer.', 'Cambia password, chiama il supporto.', 'scelta1', 269),
       -- Domanda 2
       ('Verifica lo stato della stampante, controlla i driver, verifica la connessione di rete.', 'Non ci sono problemi con le stampanti di rete.', 'Disconnettiti e riconnettiti alla rete.', 'Cambia la stampante.', 'scelta1', 270),
       -- Domanda 3
       ('Priorità basata sull''impatto, gestione multitasking, comunicazione efficace con gli utenti.', 'Risolvere una richiesta alla volta.', 'Ignorare le richieste di supporto meno urgenti.', 'Impiegare il minor tempo possibile in ogni richiesta.', 'scelta1', 271),
       -- Domanda 4
       ('Comunicare in modo chiaro e non tecnico, seguire procedure step-by-step, offrire assistenza remota.', 'Richiedere assistenza da un altro tecnico, ignorare la richiesta.', 'Fornire istruzioni complesse, assumere che l''utente capisca termini tecnici.', 'Chiedere all''utente di chiamare un altro dipartimento.', 'scelta1', 272),
       -- Domanda 5
       ('Nagios, Zabbix, SolarWinds.', 'Nessuno strumento di monitoraggio è necessario.', 'Solo Nagios.', 'Solo Zabbix.', 'scelta1', 273);
/*Insert  Skill */
 
INSERT INTO Skill VALUES('Python','hard', 1);
INSERT INTO Skill VALUES('Java','hard', 2);
INSERT INTO Skill VALUES('C','hard', 3);
INSERT INTO Skill VALUES('C++','hard', 4);
INSERT INTO Skill VALUES('Javascript','hard', 5);
INSERT INTO Skill VALUES('HTML, CSS','hard', 6);
INSERT INTO Skill VALUES('Comunicazione efficace','soft', 7);
INSERT INTO Skill VALUES('Lavoro di squadra','soft', 8);
INSERT INTO Skill VALUES('Leadership','soft', 9);
INSERT INTO Skill VALUES('Gestione dello stress','soft', 10);
INSERT INTO Skill VALUES('Risoluzione dei problemi','soft', 11);
INSERT INTO Skill VALUES('Linux','hard', 12);
INSERT INTO Skill VALUES('Windows','hard', 13);
INSERT INTO Skill VALUES('React: Introduzione','hard', 14);
INSERT INTO Skill VALUES('Angular: Concetti di Base','hard', 15);
INSERT INTO Skill VALUES('Django: Fondamenti','hard', 16);
INSERT INTO Skill VALUES('Git: Concetti di Base','hard', 17);
insert into Skill values('Problem solving','soft', 18);
insert into Skill values('Adattabilità','soft', 19);
insert into Skill values('Creatività e Innovazione','soft', 20);
insert into Skill values('Gestione del tempo','soft', 21);
insert into Skill values('Relationship','soft', 22);
insert into Skill values('Pensiero critico','soft', 23);
 
/*Insert userskill*/
 
insert into UserSkills values (8, 1, 1),
                             (8, 2, 1),
							 (8, 3, 1),
							 (8, 22, 1),
							 (8, 16, 1),
							 (11, 23, 1),
							 (15, 20, 1),
							 (9, 4, 1),
							 (9, 6, 1),
							 (10, 8, 1),
							 (13, 10, 1),
							 (10, 12, 1),
							 (11, 17, 1),
							 (10, 19, 1),
							 (11, 21, 1),
							 (12, 11, 1),
							 (14, 13, 1),
							 (9, 16, 1),
							 (9, 5, 1),
							 (16, 3, 1),
							 (11, 1, 1);
/*insert userQuiz*/
 
insert into UtenteQuiz values (1,8,6, '2023-11-18 18:34:50'),
                              (1,11,4, '2023-11-18 18:34:50'),
							  (2,8,6, '2023-11-18 18:34:50'),
                              (3,8,1, '2023-11-18 18:34:50'),
							  (22,8,4, '2023-11-18 18:34:50'),
                              (16,8,6, '2023-11-18 18:34:50'),
							  (4,9,4, '2023-11-18 18:34:50'),
                              (6,9,2, '2023-11-18 18:34:50'),
							  (16,9,10, '2023-11-18 18:34:50'),
                              (5,9,3, '2023-11-18 18:34:50'),
							  (8,10,6, '2023-11-18 18:34:50'),
                              (12,10,2, '2023-11-18 18:34:50'),
							  (19,10,25, '2023-11-18 18:34:50'),
                              (23,11,17, '2023-11-18 18:34:50'),
							  (17,11,9, '2023-11-18 18:34:50'),
                              (21,11,30, '2023-11-18 18:34:50'),
							  (1,11,6, '2023-11-18 18:34:50'),
                              (11,12,5, '2023-11-18 18:34:50'),
                              (10,13,5, '2023-11-18 18:34:50'),
                              (13,14,14, '2023-11-18 18:34:50'),
                              (20,15,30, '2023-11-18 18:34:50'),
                              (3,16,5, '2023-11-18 18:34:50'),
                              (25,18,10, '2023-11-18 18:34:50'),
                              (26,18,18, '2023-11-18 18:34:50');
                              

/*	Inserimento delle posizioni	*/

INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','Cerchiamo un sistemista esperto con almeno 3 anni di esperienza su progetti di media grandezza','1','6','27','aperta','20231101','Sistemista');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','Cerchiamo un full-stack developer','1','1','26','aperta','20231102','Web Developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','Cerchiamo uno sviluppatore Java','2','1','2','aperta','20231107','Java Developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','Cerchiamo uno sviluppatore Front End','1','2','25','aperta','20231102','Front-End Developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('8','Cerchiamo uno sviluppatore Back End con nozioni di Java e Python','5','3','31','aperta','20231102','Back-End Developer');

INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('2','Siamo alla ricerca di una figura per lo sviluppo di applicazioni web','6','3','26','aperta','20240120','Full stack web developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('3','Siamo alla ricerca di uno sviluppatore Python/Django esperto per unirsi al nostro team. Lideale candidato avrà una passione per la programmazione e l innovazione tecnologica, con un focus su Python e il framework Django.','6','3','24','aperta','20240120','Sviluppatore python');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','Siamo alla ricerca di giovani candidati con passione per la tecnologia per un percorso di crescita nell ambito IT/Digital. Nello specifico, le risorse avranno l’opportunità di essere inserite negli ambiti di Cyber Security, di sviluppo software e di tecnologie per dei Canali Digitali con l’obiettivo di partecipare a progetti interfunzionali dalla definizione delle soluzioni con il cliente interno, di sviluppo/programmazione e supporto nelle fasi di certificazione fino alla manutenzione/gestione delle applicazioni.','29','3','29','aperta','20240120','Cyber security, Sviluppo software');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','Il candidato che stiamo cercando avrà le seguenti responsabilità: implementazione di interfacce per gestionali in cloud; realizzare prototipi delle interfacce sotto la direzione del team leader. Ai candidati sarà offerta l’opportunità di lavorare in un ambiente dinamico, in forte espansione all’interno del quale sono previsti percorsi di crescita, supportati da una continua attenzione alla valorizzazione delle risorse.','13','3','25','aperta','20240120','Sviluppatore front end');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('2','Siamo alla ricerca di sviluppatori Web Full stack con almeno 4 anni di esperienza, è un requisito gradito la conoscenza dei seguenti CMS/linguaggi: Wordpress, Prestashop, Magento 2, HTML, CSS, Javascript, PHP, MySQL.','7','3','26','aperta','20240120','Senior web developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('3','Sei appassionato di tecnologia e di programmazione? iamo cercando un/una Back-end Developer con esperienza in ambito Node con Javascript/Typescript','8','3','31','aperta','20240120','Back-end web developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('1','ll candidato è diplomato/laureato, ha maturato esperienza pluriennale nello sviluppo software web based, ed ha una conoscenza tecnica della lingua inglese. Sono requisiti fondamentali una buona capacità relazionale, attitudine al lavoro in team, capacità di adattamento e flessibilità.','5','3','26','aperta','20240120','Full stack web developer');

-- Sviluppatore Full-Stack
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo uno sviluppatore full-stack altamente motivato per unirsi al nostro team dinamico. La persona ideale avrà competenze sia nel frontend che nel backend e sarà coinvolta nello sviluppo di soluzioni software innovative.', 1, 1, 26, 'aperta', '2023-11-30 10:00:00.000', 'Sviluppatore Full-Stack'); 
-- Ingegnere del Software
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Stiamo cercando un ingegnere del software talentuoso e appassionato per contribuire alla progettazione, sviluppo e manutenzione del nostro software. Se hai esperienza nella creazione di soluzioni scalabili, sei la persona che stiamo cercando.', 2, 2, 30, 'aperta', '2023-11-30 11:30:00.000', 'Ingegnere del Software');

/*creare quiz*/
-- Project Manager Software
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Siamo alla ricerca di un Project Manager Software con una comprovata esperienza nella gestione di progetti software complessi. Se hai una forte leadership e capacità organizzative, entra a far parte della nostra squadra.', 3, 3, 32, 'aperta', '2023-11-30 13:45:00.000', 'Project Manager Software');
-- Scrum Master
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo uno Scrum Master motivato e orientato ai risultati per guidare e facilitare le pratiche agile nel nostro team di sviluppo. Se sei appassionato di metodologie agili, candidati ora.', 4, 1, 33, 'aperta', '2023-11-30 14:30:00.000', 'Scrum Master');
-- Progettista UX/UI
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Stiamo cercando un Progettista UX/UI creativo ed esperto per migliorare l''esperienza degli utenti dei nostri prodotti software. Se hai una visione innovativa e competenze di progettazione eccezionali, fai domanda oggi stesso.', 5, 6, 34, 'aperta', '2023-11-30 15:15:00.000', 'Progettista UX/UI');
-- Architetto dell'Esperienza Utente
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Architetto dell''Esperienza Utente appassionato per guidare la progettazione di interfacce utente intuitive e coinvolgenti. Se hai una forte comprensione dell''usabilità, sei la persona giusta per noi.', 6, 6, 36, 'aperta', '2023-11-30 16:00:00.000', 'Architetto dell''Esperienza Utente');
-- Direttore Amministrativo
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Direttore Amministrativo altamente qualificato per sovrintendere alle operazioni quotidiane dell''azienda. Il candidato ideale avrà una solida comprensione delle pratiche aziendali e un forte orientamento alla leadership.', 7, 3, 37, 'aperta', '2023-11-30 16:45:00.000', 'Direttore Amministrativo');
-- Responsabile Amministrativo
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Stiamo cercando un Responsabile Amministrativo con esperienza comprovata nella gestione delle operazioni finanziarie e contabili. Se hai una solida competenza in finanza aziendale, candidati ora.', 8, 3, 38, 'aperta', '2023-11-30 17:30:00.000', 'Responsabile Amministrativo');
-- Responsabile Finanziario
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Siamo alla ricerca di un Responsabile Finanziario esperto per guidare la gestione finanziaria dell''azienda. Se hai una solida competenza contabile e una visione strategica delle finanze, ti incoraggiamo a candidarti.',29, 3, 39, 'aperta', '2023-11-30 18:15:00.000', 'Responsabile Finanziario');
-- Contabile
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Contabile altamente organizzato con esperienza nella gestione delle transazioni finanziarie. Se sei preciso e attento ai dettagli, potresti essere la persona giusta per unirti al nostro team contabile.', 23, 3, 40, 'aperta', '2023-11-29 09:00:00.000', 'Contabile');
-- Responsabile delle Risorse Umane
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Responsabile delle Risorse Umane che guidi le iniziative HR, dalla selezione alla gestione delle prestazioni. Se hai una forte capacità relazionale e una visione strategica delle risorse umane, ti invitiamo a candidarti.', 76, 3, 41, 'aperta', '2023-11-30 09:45:00.000', 'Responsabile delle Risorse Umane');
-- Recruiter
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Recruiter talentuoso con abilità di ricerca e selezione. Se hai una buona comprensione del mercato del lavoro e capacità di valutare il talento, ti invitiamo a far parte del nostro team HR.', 1, 3, 42, 'aperta', '2023-11-30 10:30:00.000', 'Recruiter');
-- Responsabile Contratti
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Siamo alla ricerca di un Responsabile Contratti con esperienza nella gestione e negoziazione di contratti aziendali. Se hai competenze legali e una buona comprensione delle pratiche contrattuali, candidati ora.', 3, 3, 43, 'aperta', '2023-11-29 11:15:00.000', 'Responsabile Contratti');
-- Avvocato Aziendale o Consulente Legale
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Avvocato Aziendale o Consulente Legale per fornire consulenza legale interna. Se hai una solida esperienza in diritto commerciale, contrattuale e delle società, potresti essere la persona che stiamo cercando.', 7,3, 44, 'aperta', '2023-11-29 12:00:00.000', 'Avvocato Aziendale o Consulente Legale');
-- Amministratore del Database
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Amministratore del Database esperto per gestire e ottimizzare i database aziendali. Se hai competenze nella progettazione, implementazione e manutenzione di database, ti invitiamo a candidarti.', 9, 9, 45, 'aperta', '2023-11-29 12:45:00.000', 'Amministratore del Database');
-- Sviluppatore di Database
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Stiamo cercando uno Sviluppatore di Database talentuoso per progettare e implementare soluzioni database efficaci. Se hai competenze nello sviluppo SQL e una conoscenza approfondita delle best practice, fai domanda oggi stesso.', 20, 9, 46, 'aperta', '2023-11-29 13:30:00.000', 'Sviluppatore di Database');
-- Architetto Cloud
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Architetto Cloud altamente qualificato per progettare e implementare soluzioni cloud scalabili e sicure. Se hai esperienza nella migrazione verso il cloud e nella gestione delle risorse cloud, candidati subito.', 2, 8, 47, 'aperta', '2023-11-29 14:15:00.000', 'Architetto Cloud');
-- Ingegnere di Sistemi Cloud
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Siamo alla ricerca di un Ingegnere di Sistemi Cloud per supportare lo sviluppo e la gestione di infrastrutture cloud. Se hai competenze nella configurazione e nell''ottimizzazione delle risorse cloud, ti invitiamo a far parte del nostro team.', 80, 8, 48, 'aperta', '2023-11-29 15:00:00.000', 'Ingegnere di Sistemi Cloud');
-- Amministratore di Reti
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Cerchiamo un Amministratore di Reti competente per gestire e mantenere la nostra infrastruttura di rete. Se hai esperienza nella progettazione, implementazione e sicurezza delle reti, fai domanda oggi stesso.', 64, 2, 49, 'aperta', '2023-11-29 15:45:00.000', 'Amministratore di Reti');
-- Tecnico di Supporto IT
INSERT INTO Posizione (n_ammissioni, descrizione, id_citta, id_Categoria, id_quiz, stato, data_inserimento, ruolo)
VALUES (300, 'Siamo alla ricerca di un Tecnico di Supporto IT per fornire assistenza tecnica agli utenti interni ed esterni. Se hai una passione per la risoluzione dei problemi tecnici e un''eccellente capacità di comunicazione, candidati subito.', 32, 4, 35, 'aperta', '2023-11-29 16:30:00.000', 'Tecnico di Supporto IT');




/*insert candidaturauser*/
                              
insert into candidaturauser values(4, 18, '2023-09-12 16:25:35'),
                                  (6, 18, '2023-09-17 12:55:35');



