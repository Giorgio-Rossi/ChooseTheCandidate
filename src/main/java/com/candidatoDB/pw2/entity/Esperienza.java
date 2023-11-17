package com.candidatoDB.pw2.entity;

import java.util.Date;

public class Esperienza {

	private int id_esperienza;
	private int anni;
	private String descrizione_attivita;
	private Utente utente;
	private String azienda;
	private Date data_inizio;
	private Date data_fine;
	private int ral;
	private String tipo_contratto;
	private String settore;
	private String posizione_lavorativa;

	private Citta id_citta;

	
	
	
	public Esperienza() {
		super();
	}
	public Esperienza(int id_esperienza, int anni, String descrizione_attivita, Utente utente, String azienda,
			Date data_inizio, Date data_fine, int ral, String tipo_contratto, String settore,
			String posizione_lavorativa, Citta id_citta) {
		super();
		this.id_esperienza = id_esperienza;
		this.anni = anni;
		this.descrizione_attivita = descrizione_attivita;
		this.utente = utente;
		this.azienda = azienda;
		this.data_inizio = data_inizio;
		this.data_fine = data_fine;
		this.ral = ral;
		this.tipo_contratto = tipo_contratto;
		this.settore = settore;
		this.posizione_lavorativa = posizione_lavorativa;
		this.id_citta = id_citta;
	}
	public int getId_esperienza() {
		return id_esperienza;
	}
	public void setId_esperienza(int id_esperienza) {
		this.id_esperienza = id_esperienza;
	}
	public int getAnni() {
		return anni;
	}
	public void setAnni(int anni) {
		this.anni = anni;
	}
	public String getDescrizione_attivita() {
		return descrizione_attivita;
	}
	public void setDescrizione_attivita(String descrizione_attivita) {
		this.descrizione_attivita = descrizione_attivita;
	}
	public Utente getUtente() {
		return utente;
	}
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	public String getAzienda() {
		return azienda;
	}
	public void setAzienda(String azienda) {
		this.azienda = azienda;
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
	public int getRal() {
		return ral;
	}
	public void setRal(int Int) {
		this.ral = Int;
	}
	public String getTipo_contratto() {
		return tipo_contratto;
	}
	public void setTipo_contratto(String tipo_contratto) {
		this.tipo_contratto = tipo_contratto;
	}
	public String getSettore() {
		return settore;
	}
	public void setSettore(String settore) {
		this.settore = settore;
	}
	public String getPosizione_lavorativa() {
		return posizione_lavorativa;
	}
	public void setPosizione_lavorativa(String posizione_lavorativa) {
		this.posizione_lavorativa = posizione_lavorativa;
	}

	public void setId_citta(Citta id_citta) {
		this.id_citta = id_citta;
	}

	public Citta getId_citta() {
		return id_citta;
	}

	public boolean isValid() {
		return this.id_esperienza != 0 || this.anni != 0 || this.id_citta != null || this.descrizione_attivita != null || this.data_inizio != null || this.data_fine != null || this.utente != null || this.azienda != null || this.tipo_contratto != null
				|| this.settore != null || this.posizione_lavorativa != null || this.ral < 0;
	}

	@Override
	public String toString() {
		return "Esperienza [id_esperienza=" + id_esperienza + ", anni=" + anni + ", descrizione_attivita="
				+ descrizione_attivita + ", utente=" + utente + ", azienda=" + azienda + ", data_inizio=" + data_inizio
				+ ", data_fine=" + data_fine + ", ral=" + ral + ", tipo_contratto=" + tipo_contratto + ", settore="
				+ settore + ", posizione_lavorativa=" + posizione_lavorativa + "]";
	}
	/*
	public void setRal(String parameter) {
		// TODO Auto-generated method stub
		
	}
	*/

	

	
	
	

}
