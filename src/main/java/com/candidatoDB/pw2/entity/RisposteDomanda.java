package com.candidatoDB.pw2.entity;


//id_risposta int identity not null primary key,
//scelta1 varchar(150) not null,
//scelta2 varchar(150), 
//scelta3 varchar(150), 
//scelta4 varchar(150),
//scelta_corretta smallint check(scelta_corretta in('scelta1','scelta2','scelta3','scelta4')),
//id_domanda int not null,
//
//CONSTRAINT FK_Risposte_Domanda FOREIGN KEY (id_domanda) REFERENCES Domanda (id_domanda),

public class RisposteDomanda {

	
	private int id_risposta;
	private String scelta1;
	private String scelta2;
	private String scelta3;
	private String scelta4;
	private int scelta_corretta;
	private int id_domanda;
}
