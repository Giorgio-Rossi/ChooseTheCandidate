package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import com.candidatoDB.pw2.entity.Citta;

//id_istruzione int identity not null primary key,
//grado varchar(50) not null,
//id_citta int not null,
//descrizione_istruzione varchar(100) not null,
//data_inizio datetime,
//data_fine datetime,
//id_user int not null,
//valutazione smallint,
//CONSTRAINT FK_istruzione_citta FOREIGN KEY (id_citta) REFERENCES Citta (id_citta),
//CONSTRAINT FK_utente_istruzione FOREIGN KEY (id_user) REFERENCES Utente (id_user)


public class Istruzione {
	
	
	
	private int id_istruzione; 
private String 	grado;
private List<Citta> id_citta = new ArrayList<Citta>();
private String	descrizione_istruzione;
private Date	data_inizio ;
private Date	data_fine ;
private int id_user; 
private int	valutazione;
	
	
	

}
