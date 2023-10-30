package com.candidatoDB.pw2.entity;

import java.util.Date;

//
//id_candidatura_user int identity not null primary key,
//id_posizione int not null,
//id_user int not null,
//data_candidatura datetime,
//
//CONSTRAINT FK_Posizione_CandidaturaUser FOREIGN KEY (id_posizione) REFERENCES Posizione (id_posizione),
//CONSTRAINT FK_User_CandidaturaUser FOREIGN KEY (id_user) REFERENCES Utente (id_user),

public class CandidaturaUser {

	
	private int id_candidatura;
	private int id_posizione;
	private int id_user;
	private Date data_candidatura;
}
