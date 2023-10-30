package com.candidatoDB.pw2.entity;

import java.util.Date;

//id_esperienza int identity not null primary key,
//anni smallint,
//descrizione_attivita varchar(100),
//id_user int not null,
//azienda varchar(50),
//data_inizio datetime,
//data_fine datetime,
//ral int,
//tipo_contratto varchar(50),
//settore varchar(20),
//posizione_lavorativa varchar(30),
//CONSTRAINT FK_utente_esperienza FOREIGN KEY (id_user) REFERENCES Utente (id_user)

public class Esperienza {

	private int id_esperienza;
	private int anni;
	private String descrizione_attivita;
	private int id_user;
	private String azienda;
	private Date data_inizio;
	private Date data_fine;
	private int ral;
	private String tipo_contratto;
	private String settore;
	private String posizione_lavorativa;

}
