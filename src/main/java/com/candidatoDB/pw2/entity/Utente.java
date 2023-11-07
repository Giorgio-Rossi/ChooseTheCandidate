package com.candidatoDB.pw2.entity;

import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class Utente {
	
	private int id_user;
	private String nome;
	private String cognome;
	private String codice_fiscale;
	private String email;
	private Date data_nascita;
	private String indirizzo;
	private Citta id_citta ;
	private String cap;
	private String telefono;
	private String ruolo_admin;
	private String password;
	private List<Esperienza> new_esperienza = new ArrayList<Esperienza> ();

	private String genere;

	private String foto_profilo;
	
	
	
	public Utente() {
		super();
	}
	public Utente(int id_user, String nome, String cognome, String codice_fiscale, String email, Date data_nascita,
			String indirizzo, Citta id_citta, String cap, String telefono, String ruolo_admin, String password,
			List<Esperienza> new_esperienza, String foto_profilo, String genere) {
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
		this.foto_profilo = foto_profilo;
		this.genere = genere;
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
	public Citta getId_citta() {
		return id_citta;
	}
	public void setId_citta(Citta id_citta) {
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

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getFoto_profilo() {
		return foto_profilo;
	}

	public void setFoto_profilo(String foto_profilo) {
		this.foto_profilo = foto_profilo;
	}

	@Override
	public String toString() {
		return "Utente{" +
				"id_user=" + id_user +
				", nome='" + nome + '\'' +
				", cognome='" + cognome + '\'' +
				", codice_fiscale='" + codice_fiscale + '\'' +
				", email='" + email + '\'' +
				", data_nascita=" + data_nascita +
				", indirizzo='" + indirizzo + '\'' +
				", id_citta=" + id_citta +
				", cap='" + cap + '\'' +
				", telefono='" + telefono + '\'' +
				", ruolo_admin='" + ruolo_admin + '\'' +
				", password='" + password + '\'' +
				", new_esperienza=" + new_esperienza +
				", genere='" + genere + '\'' +
				", foto_profilo='" + foto_profilo + '\'' +
				'}';
	}
}
