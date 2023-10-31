package com.candidatoDB.pw2.entity;

import java.util.Date;

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
	
	
	public Posizione() {
		super();
	}
	
	public Posizione(int id_poszione, int n_ammissioni, String descrizione, int id_citta, int id_categoria, int id_quiz,
			String stato, Date data_inserimento, String ruolo) {
		super();
		this.id_poszione = id_poszione;
		this.n_ammissioni = n_ammissioni;
		this.descrizione = descrizione;
		this.id_citta = id_citta;
		this.id_categoria = id_categoria;
		this.id_quiz = id_quiz;
		this.stato = stato;
		this.data_inserimento = data_inserimento;
		this.ruolo = ruolo;
	}
	public int getId_poszione() {
		return id_poszione;
	}
	public void setId_poszione(int id_poszione) {
		this.id_poszione = id_poszione;
	}
	public int getN_ammissioni() {
		return n_ammissioni;
	}
	public void setN_ammissioni(int n_ammissioni) {
		this.n_ammissioni = n_ammissioni;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public int getId_citta() {
		return id_citta;
	}
	public void setId_citta(int id_citta) {
		this.id_citta = id_citta;
	}
	public int getId_categoria() {
		return id_categoria;
	}
	public void setId_categoria(int id_categoria) {
		this.id_categoria = id_categoria;
	}
	public int getId_quiz() {
		return id_quiz;
	}
	public void setId_quiz(int id_quiz) {
		this.id_quiz = id_quiz;
	}
	public String getStato() {
		return stato;
	}
	public void setStato(String stato) {
		this.stato = stato;
	}
	public Date getData_inserimento() {
		return data_inserimento;
	}
	public void setData_inserimento(Date data_inserimento) {
		this.data_inserimento = data_inserimento;
	}
	public String getRuolo() {
		return ruolo;
	}
	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}
	@Override
	public String toString() {
		return "Posizione [id_poszione=" + id_poszione + ", n_ammissioni=" + n_ammissioni + ", descrizione="
				+ descrizione + ", id_citta=" + id_citta + ", id_categoria=" + id_categoria + ", id_quiz=" + id_quiz
				+ ", stato=" + stato + ", data_inserimento=" + data_inserimento + ", ruolo=" + ruolo + "]";
	}

}

