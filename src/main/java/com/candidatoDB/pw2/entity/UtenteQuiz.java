package com.candidatoDB.pw2.entity;
//
//id_utente_quiz int identity not null primary key,
//id_quiz int not null,
//id_user int not null,
//punteggio smallint not null,
//
//CONSTRAINT FK_Quiz_UtenteQuiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),
//CONSTRAINT FK_Utente_UtenteQuiz FOREIGN KEY (id_user) REFERENCES Utente (id_user)
//);

public class UtenteQuiz {

	private int id_utente_quiz;
	private int id_quiz;
	private int id_user;
	private int punteggio;
	
	
}
