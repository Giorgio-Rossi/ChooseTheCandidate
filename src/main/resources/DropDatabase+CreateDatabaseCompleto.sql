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
CV varchar(600),
chiaveSicurezza varchar(200) not null,
genere varchar(30)  check(genere in('uomo','donna','non specificare')),
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
id_quiz int,
nome varchar(500),
tipo_skill varchar(500) not null check(tipo_skill in('soft','hard')),
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






/*INSERT*/
insert into CategoriaPosizione ( nome_categoria) values ( 'bella desc');
insert into CategoriaPosizione ( nome_categoria) values ( ' desc 2');
insert into CategoriaPosizione ( nome_categoria) values ( 'Sviluppo Web');
insert into CategoriaPosizione ( nome_categoria) values ( 'Testing web');

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

/*	Inserimento delle Citta	*/
insert into Citta (nome,id_regione) values ('Genova','8');
insert into Citta (nome,id_regione) values ('Roma','7');
insert into Citta (nome,id_regione) values ('Napoli','4');
insert into Citta (nome,id_regione) values ('Lodi','9');
insert into Citta (nome,id_regione) values ('Torino','12');
insert into Citta (nome,id_regione) values ('Venezia','20');
insert into Citta (nome,id_regione) values ('Firenze','16');
insert into Citta (nome,id_regione) values ('Bologna','5');

insert into Citta (nome,id_regione) values ('Aquila','1');
insert into Citta (nome,id_regione) values ('Pescara','1');
insert into Citta (nome,id_regione) values ('Potenza','2');
insert into Citta (nome,id_regione) values ('Matera','2');
insert into Citta (nome,id_regione) values ('Reggio Calabria','3');
insert into Citta (nome,id_regione) values ('Catanzaro','3');
insert into Citta (nome,id_regione) values ('Avellino','4');
insert into Citta (nome,id_regione) values ('Salerno','4');
insert into Citta (nome,id_regione) values ('Reggio Emilia','5');
insert into Citta (nome,id_regione) values ('Udine','6');
insert into Citta (nome,id_regione) values ('Trieste','6');
insert into Citta (nome,id_regione) values ('Latina','7');
insert into Citta (nome,id_regione) values ('Viterbo','7');
insert into Citta (nome,id_regione) values ('Savona','8');
insert into Citta (nome,id_regione) values ('La Spezia','8');
insert into Citta (nome,id_regione) values ('Bergamo','9');
insert into Citta (nome,id_regione) values ('Brescia','9');
insert into Citta (nome,id_regione) values ('Ancona','10');
insert into Citta (nome,id_regione) values ('Ascoli','10');
insert into Citta (nome,id_regione) values ('Campobasso','11');
insert into Citta (nome,id_regione) values ('Isernia','11');
insert into Citta (nome,id_regione) values ('Asti','12');
insert into Citta (nome,id_regione) values ('Novare','12');
insert into Citta (nome,id_regione) values ('Bari','13');
insert into Citta (nome,id_regione) values ('Lecce','13');
insert into Citta (nome,id_regione) values ('Cagliari','14');
insert into Citta (nome,id_regione) values ('Alghero','14');
insert into Citta (nome,id_regione) values ('Palermo','15');
insert into Citta (nome,id_regione) values ('Catania','15');
insert into Citta (nome,id_regione) values ('Pisa','16');
insert into Citta (nome,id_regione) values ('Lucca','16');
insert into Citta (nome,id_regione) values ('Bolzano','17');
insert into Citta (nome,id_regione) values ('Trento','17');
insert into Citta (nome,id_regione) values ('Perugia','18');
insert into Citta (nome,id_regione) values ('Assisi','18');
insert into Citta (nome,id_regione) values ('Aosta','19');
insert into Citta (nome,id_regione) values ('Champoluc','19');
insert into Citta (nome,id_regione) values ('Verona','20');
insert into Citta (nome,id_regione) values ('Vicenza','20');

/*	Inserimento degli utenti	*/
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin , chiaveSicurezza,password) VALUES ('admin', 'admin', null,'admin@gmail.com', null, null, null, null, null,'admin', 'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password) VALUES ('Giorgio', 'Rossi', null, 'giorgiorossi@gmail.com', null, null, null, null, null,'admin', 'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password)VALUES ('Nicolo', 'Drovandi', null,'nicolodrovandi@gmail.com', null, null, null, null, null,'admin', 'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password) VALUES ('Lorenzo', 'Franco', null,'lorenzofranco@gmail.com', null, null, null, null, null, 'admin','admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password) VALUES ('Luca', 'Sanguinetti', null, 'lucasanguinetti@gmail.com', null, null, null, null, null,'admin', 'admin', 'admin' );
INSERT INTO Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password)VALUES ('Claudio', 'Balzani', null,'claudiobalzani@gmail.com', null, null, null, null, null,'admin', 'admin', 'admin' );
INSERT INTO Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password) VALUES ('Biagio', 'Ricci', null,'biagioricci@gmail.com', null, null, null, null, null,'admin', 'admin', 'admin' );
insert into Utente (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password) values ('Matteo','Salvo','slvmtt00b03e300m','matteosalvo@gmail.com','20000203','Via Marconi 2','1','17900','3547689876','user','ciao','salvini');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password)values ('Fiona','Giusti','gstfna03h06e300m','fionagiusti@gmail.com','20030806','Via Roma 29','1','16177','3495680856','user','ciao','fiona');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password)values ('Gianluca','Torre','trrglc80d07e300m','gianlu@gmail.com','19800407','Via Milano 56','2','20321','3857689806','user','ciao','torre');
insert into Utente  (nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap ,telefono,ruolo_admin ,chiaveSicurezza,password)values ('Marta','Lupu','lpumrt03b03e300m','mlupu@gmail.com','20030203','Via Rodi 70','2','16167','3398805856','user','ciao','marta');

/*	Insert CategoriaPosizione	*/

insert into CategoriaPosizione ( nome_categoria) values ( 'Sviluppo Web');
insert into CategoriaPosizione ( nome_categoria) values ( 'Testing web');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Analisi software');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Gestione Progetti');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Sicurezza Informatica');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Amministrazione di Sistema');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Architettura Software');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Specialista Tecnico');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Supporto Tecnico');
INSERT INTO CategoriaPosizione (nome_categoria) VALUES ('Gestione Qualità');



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
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo "JVM" in Java?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per l ambiente di esecuzione in cui viene eseguito il codice Java?', 1);
INSERT INTO Domanda VALUES (' Qual è il risultato dell istruzione "System.out.println(5 / 2);" in Java? ', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine "thread" in Java?', 1);
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
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine "printf" in C?', 1);
INSERT INTO Domanda VALUES ('Qual è la differenza tra un array e un puntatore in C?', 1);
INSERT INTO Domanda VALUES ('Come si dichiara una variabile intera (int) chiamata "numero" in C?', 1);
INSERT INTO Domanda VALUES ('Qual è l operatore utilizzato per accedere all indirizzo di una variabile in C?', 1);
INSERT INTO Domanda VALUES ('Cosa fa l istruzione "sizeof" in C?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine "void" in una dichiarazione di funzione in C?', 1);
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
INSERT INTO Domanda VALUES ('Cosa rappresenta il termine "polimorfismo" in C++?', 1);
INSERT INTO Domanda VALUES ('Qual è l operatore utilizzato per la gestione delle eccezioni in C++?', 1);
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo "STL" in C++?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per indicare la creazione di una nuova classe basata su un altra classe esistente in C++?', 1);
INSERT INTO Domanda VALUES ('Come si dichiara una variabile costante (const) in C++?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per una funzione membro di una classe che viene chiamata automaticamente quando un oggetto di quella classe viene creato?', 1);
INSERT INTO Domanda VALUES ('Qual è il risultato dell istruzione "cout << 5 / 2" in C++?', 1);

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
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo "DOM" in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Qual è l output del seguente codice JavaScript?', 1);
INSERT INTO Domanda VALUES ('Come si definisce una funzione in JavaScript?', 1);
INSERT INTO Domanda VALUES ('Qual è il termine utilizzato per la capacità di una funzione di richiamare se stessa in JavaScript? ```console.log(3 + 2 + "7");```', 1);

INSERT INTO RisposteDomanda VALUES ('int', 'long', 'float', 'number', 'scelta4', 33)
INSERT INTO RisposteDomanda VALUES ('declare var nome_variabile;', 'let nome_variabile;', 'variable nome_variabile;', 'var nome_variabile;', 'scelta4', 34);
INSERT INTO RisposteDomanda VALUES ('+', '&', '||', ':', 'scelta1', 35);
INSERT INTO RisposteDomanda VALUES ('emptyArray()', '[]', 'new Array()', 'array()', 'scelta2', 36);
INSERT INTO RisposteDomanda VALUES ('Data Object Model', 'Document Object Model', 'Digital Object Model', 'Dynamic Object Model', 'scelta1', 37);
INSERT INTO RisposteDomanda VALUES ('57', '12', '32', '"57"', 'scelta4', 38);
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
INSERT INTO Domanda VALUES ('Cosa rappresenta l acronimo "CSS" in relazione alla progettazione web?', 1);
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
INSERT INTO RisposteDomanda VALUES ('<link>', '<style>', '<script>', '<css>', 'scelta1', 47);
INSERT INTO RisposteDomanda VALUES ('.', '#', '*', ':', 'scelta1', 48);
INSERT INTO RisposteDomanda VALUES ('<ul>', '<li>', '<ol>', '<dl>', 'scelta3', 49);
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


/*	Inserimento delle posizioni	*/

INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','Cerchiamo un sistemista esperto con almeno 3 anni di esperienza su progetti di media grandezza','1','6','4','aperta','20231101','Sistemista');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','Cerchiamo un full-stack developer','1','1','1','aperta','20231102','Web Developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','Cerchiamo uno sviluppatore Java','2','1','2','aperta','20231107','Java Developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','Cerchiamo uno sviluppatore Front End','1','2','8','aperta','20231102','Front-End Developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('8','Cerchiamo uno sviluppatore Back End con nozioni di Java e Python','5','3','2','aperta','20231102','Back-End Developer');

INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('2','Siamo alla ricerca di una figura per lo sviluppo di applicazioni web','6','3','2','aperta','20240120','Full stack web developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('3','Siamo alla ricerca di uno sviluppatore Python/Django esperto per unirsi al nostro team. Lideale candidato avrà una passione per la programmazione e l innovazione tecnologica, con un focus su Python e il framework Django.','6','3','1','aperta','20240120','Sviluppatore python');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('10','Siamo alla ricerca di giovani candidati con passione per la tecnologia per un percorso di crescita nell ambito IT/Digital. Nello specifico, le risorse avranno l’opportunità di essere inserite negli ambiti di Cyber Security, di sviluppo software e di tecnologie per dei Canali Digitali con l’obiettivo di partecipare a progetti interfunzionali dalla definizione delle soluzioni con il cliente interno, di sviluppo/programmazione e supporto nelle fasi di certificazione fino alla manutenzione/gestione delle applicazioni.','29','3','1','aperta','20240120','Cyber security, Sviluppo software');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('5','Il candidato che stiamo cercando avrà le seguenti responsabilità: implementazione di interfacce per gestionali in cloud; realizzare prototipi delle interfacce sotto la direzione del team leader. Ai candidati sarà offerta l’opportunità di lavorare in un ambiente dinamico, in forte espansione all’interno del quale sono previsti percorsi di crescita, supportati da una continua attenzione alla valorizzazione delle risorse.','13','3','6','aperta','20240120','Sviluppatore front end');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('2','Siamo alla ricerca di sviluppatori Web Full stack con almeno 4 anni di esperienza, è un requisito gradito la conoscenza dei seguenti CMS/linguaggi: Wordpress, Prestashop, Magento 2, HTML, CSS, Javascript, PHP, MySQL.','7','3','5','aperta','20240120','Senior web developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('3','Sei appassionato di tecnologia e di programmazione? iamo cercando un/una Back-end Developer con esperienza in ambito Node con Javascript/Typescript','8','3','2','aperta','20240120','Back-end web developer');
INSERT INTO Posizione (n_ammissioni,descrizione,id_citta,id_Categoria,id_quiz,stato,data_inserimento,ruolo) VALUES('1','ll candidato è diplomato/laureato, ha maturato esperienza pluriennale nello sviluppo software web based, ed ha una conoscenza tecnica della lingua inglese. Sono requisiti fondamentali una buona capacità relazionale, attitudine al lavoro in team, capacità di adattamento e flessibilità.','5','3','2','aperta','20240120','Full stack web developer');


