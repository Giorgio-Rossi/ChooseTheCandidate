package com.candidatoDB.pw2.entity;

import java.util.Date;

public class Istruzione {

	private int id_istruzione;
	private String grado;
	private int id_citta;
	private String descrizione_istruzione;
	private Date data_inizio;
	private Date data_fine;
	private int id_user;
	private int valutazione;
	
		
	public Istruzione() {
		super();
	}
	
	public Istruzione(int id_istruzione, String grado, int id_citta, String descrizione_istruzione, Date data_inizio,
			Date data_fine, int id_user, int valutazione) {
		super();
		this.id_istruzione = id_istruzione;
		this.grado = grado;
		this.id_citta = id_citta;
		this.descrizione_istruzione = descrizione_istruzione;
		this.data_inizio = data_inizio;
		this.data_fine = data_fine;
		this.id_user = id_user;
		this.valutazione = valutazione;
	}
	
	public int getId_istruzione() {
		return id_istruzione;
	}
	public void setId_istruzione(int id_istruzione) {
		this.id_istruzione = id_istruzione;
	}
	public String getGrado() {
		return grado;
	}
	public void setGrado(String grado) {
		this.grado = grado;
	}
	public int getId_citta() {
		return id_citta;
	}
	public void setId_citta(int id_citta) {
		this.id_citta = id_citta;
	}
	public String getDescrizione_istruzione() {
		return descrizione_istruzione;
	}
	public void setDescrizione_istruzione(String descrizione_istruzione) {
		this.descrizione_istruzione = descrizione_istruzione;
	}
	public Date getData_inizio() {
		return data_inizio;
	}
	public void setData_inizio(Date data_inizio) {
		this.data_inizio = data_inizio;
	}
	public Date getData_fine() {
		return data_fine;
	}
	public void setData_fine(Date data_fine) {
		this.data_fine = data_fine;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public int getValutazione() {
		return valutazione;
	}
	public void setValutazione(int valutazione) {
		this.valutazione = valutazione;
	}
	
	@Override
	public String toString() {
		return "Istruzione [id_istruzione=" + id_istruzione + ", grado=" + grado + ", id_citta=" + id_citta
				+ ", descrizione_istruzione=" + descrizione_istruzione + ", data_inizio=" + data_inizio + ", data_fine="
				+ data_fine + ", id_user=" + id_user + ", valutazione=" + valutazione + "]";
	}

}
