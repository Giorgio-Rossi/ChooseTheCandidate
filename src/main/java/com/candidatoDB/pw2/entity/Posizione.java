package com.candidatoDB.pw2.entity;

import java.util.Date;

//id_posizione int identity not null primary key,
//n_ammissioni smallint,
//descrizione varchar(300),
//id_citta int not null,
//id_Categoria int not null,
//id_quiz int,
//stato varchar(15) not null check(stato in('aperta','chiusa')),
//data_inserimento datetime,
//ruolo varchar(60),
//
//CONSTRAINT FK_Posizione_Citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta),
//CONSTRAINT FK_Posizione_Categoria FOREIGN KEY (id_Categoria) REFERENCES CategoriaPosizione (id_Categoria),
//CONSTRAINT FK_Posizione_Quiz FOREIGN KEY (id_quiz) REFERENCES Quiz (id_quiz),


public class Posizione {

	
	
	private int id_poszione;
	private int n_ammissioni;
	private String descrizione;
	private int id_citta;
	private int id_categoria;
	private int id_quiz;
	private String stato;
	private Date data_inserimento;
	private String ruolo;
}
