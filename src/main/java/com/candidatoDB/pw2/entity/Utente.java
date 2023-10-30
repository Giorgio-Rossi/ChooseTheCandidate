package com.candidatoDB.pw2.entity;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import com.candidatoDB.pw2.entity.Esperienza;

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
	private List<Esperienza> new_esperienza = new ArrayList<Esperienza> ();
	
	
	
	
	
	public Utente(int id_user, String nome, String cognome, String codice_fiscale, String email, Date data_nascita,
			String indirizzo, int id_citta, String cap, String telefono, String ruolo_admin, String password,
			List<Esperienza> new_esperienza) {
		super();
		this.id_user = id_user;
		this.nome = nome;
		this.cognome = cognome;
		this.codice_fiscale = codice_fiscale;
		this.email = email;
		this.data_nascita = data_nascita;
		this.indirizzo = indirizzo;
		this.id_citta = id_citta;
		this.cap = cap;
		this.telefono = telefono;
		this.ruolo_admin = ruolo_admin;
		this.password = password;
		this.new_esperienza = new_esperienza;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public String getCodice_fiscale() {
		return codice_fiscale;
	}
	public void setCodice_fiscale(String codice_fiscale) {
		this.codice_fiscale = codice_fiscale;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getData_nascita() {
		return data_nascita;
	}
	public void setData_nascita(Date data_nascita) {
		this.data_nascita = data_nascita;
	}
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	public int getId_citta() {
		return id_citta;
	}
	public void setId_citta(int id_citta) {
		this.id_citta = id_citta;
	}
	public String getCap() {
		return cap;
	}
	public void setCap(String cap) {
		this.cap = cap;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getRuolo_admin() {
		return ruolo_admin;
	}
	public void setRuolo_admin(String ruolo_admin) {
		this.ruolo_admin = ruolo_admin;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Esperienza> getNew_esperienza() {
		return new_esperienza;
	}
	public void setNew_esperienza(List<Esperienza> new_esperienza) {
		this.new_esperienza = new_esperienza;
	}
	@Override
	public String toString() {
		return "Utente [id_user=" + id_user + ", nome=" + nome + ", cognome=" + cognome + ", codice_fiscale="
				+ codice_fiscale + ", email=" + email + ", data_nascita=" + data_nascita + ", indirizzo=" + indirizzo
				+ ", id_citta=" + id_citta + ", cap=" + cap + ", telefono=" + telefono + ", ruolo_admin=" + ruolo_admin
				+ ", password=" + password + "]";
	}
	
	
	
	
	

}
