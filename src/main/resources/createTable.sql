
create table CategoriaPosizione(
id_Categoria int identity not null primary key,
descrizione varchar(70)
);
 
create table Citta(
id_citta int identity not null primary key,
regione varchar(70),
nome varchar(50) not null
)
 
create table Utente(
id_user int identity not null primary key,
nome varchar(20) not null,
cognome varchar(40) not null,
codice_fiscale varchar(16),
email varchar(30) not null,
data_nascita datetime,
indirizzo varchar(50),
id_citta int,
cap varchar(5),
telefono varchar(9),
ruolo_admin varchar(10) not null check(ruolo_admin in('user','admin')),
password varchar(70) not null,
CONSTRAINT FK_utente_citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta)
)
 
create table Istruzione(
id_istruzione int identity not null primary key,
grado varchar(50) not null,
id_citta int not null,
descrizione_istruzione varchar(100) not null,
data_inizio datetime,
data_fine datetime,
id_user int not null,
valutazione smallint,
CONSTRAINT FK_istruzione_citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta),
CONSTRAINT FK_utente_istruzione FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Esperienza(
id_esperienza int identity not null primary key,
anni smallint,
descrizione_attivita varchar(100),
id_user int not null,
azienda varchar(50),
data_inizio datetime,
data_fine datetime,
ral int,
tipo_contratto varchar(50),
settore varchar(20),
posizione_lavorativa varchar(30),
CONSTRAINT FK_utente_esperienza FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Quiz(
id_quiz int identity not null primary key,
descrizione varchar(50),
n_domande smallint
)
 
create table Domanda(
id_domanda int identity not null primary key,
testo varchar(150),
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
scelta1 varchar(150) not null,
scelta2 varchar(150),
scelta3 varchar(150),
scelta4 varchar(150),
scelta_corretta smallint check(scelta_corretta in('scelta1','scelta2','scelta3','scelta4')),
id_domanda int not null,
 
CONSTRAINT FK_Risposte_Domanda FOREIGN KEY (id_domanda) REFERENCES Domanda (id_domanda),
)
 
create table UtenteQuiz(
id_utente_quiz int identity not null primary key,
id_quiz int not null,
id_user int not null,
punteggio smallint not null,
 
CONSTRAINT FK_Quiz_UtenteQuiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),
CONSTRAINT FK_Utente_UtenteQuiz FOREIGN KEY (id_user) REFERENCES Utente (id_user)
)
 
create table Skill(
id_skill int identity not null primary key,
nome varchar(50),
tipo_skill varchar(10) not null check(tipo_skill in('soft','hard')),
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
descrizione varchar(300),
id_citta int not null,
id_Categoria int not null,
id_quiz int,
stato varchar(15) not null check(stato in('aperta','chiusa')),
data_inserimento datetime,
ruolo varchar(60),
 
CONSTRAINT FK_Posizione_Citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta),
CONSTRAINT FK_Posizione_Categoria FOREIGN KEY (id_Categoria) REFERENCES CategoriaPosizione (id_Categoria),
CONSTRAINT FK_Posizione_Quiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),
)
 
create table CandidaturaUser(
id_candidatura_user int identity not null primary key,
id_posizione int not null,
id_user int not null,
data_candidatura datetime,
 
CONSTRAINT FK_Posizione_CandidaturaUser FOREIGN KEY (id_posizione) REFERENCES Posizione (id_posizione),
CONSTRAINT FK_User_CandidaturaUser FOREIGN KEY (id_user) REFERENCES Utente (id_user),
)

ALTER TABLE Skill
    ADD id_quiz int;

ALTER TABLE Skill
    ADD CONSTRAINT FK_Skill_Quiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz);

ALTER TABLE Utente
    ADD foto_profilo varchar(100);

ALTER TABLE Utente
    ADD    genere varchar(30)  check(genere in('uomo','donna','non specificare'));

alter table utente add CONSTRAINT DF_Utenti_ruolo_admin DEFAULT 'user' for ruolo_admin;
