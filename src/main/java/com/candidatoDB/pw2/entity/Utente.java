package com.candidatoDB.pw2.entity;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

//create table Utente(
//id_user int identity not null primary key,
//nome varchar(20) not null,
//cognome varchar(40) not null,
//codice_fiscale varchar(16),
//email varchar(30),
//data_nascita datetime,
//indirizzo varchar(50),
//id_citta int,
//cap varchar(5),
//telefono varchar(9),
//ruolo_admin varchar(10) not null check(ruolo_admin in('user','admin')),
//password varchar(70) not null,
//CONSTRAINT FK_utente_citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta)
//)

public class Utente {
	
	private int id_user;
	private String nome;
	private String cognome;
	private String codice_fiscale;
	private String email;
	private Date data_nascita;
	private String indirizzo;
	private int id_citta ;	
	private String cap;
	private String telefono;
	private String ruolo_admin;
	private String password;
	
	
	
	
	
	

}
