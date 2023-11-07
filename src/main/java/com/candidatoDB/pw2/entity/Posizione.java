package com.candidatoDB.pw2.entity;

import java.util.Date;

public class Posizione {
	private int id_posizione;
	private int n_ammissioni;
	private String descrizione;
	private Citta citta;
	private CategoriaPosizione categoria;
	private Quiz quiz;
	private String stato;
	private Date data_inserimento;
	private String ruolo;
	
	
	public Posizione() {
		super();
	}


	public Posizione(int id_posizione, int n_ammissioni, String descrizione, Citta citta, CategoriaPosizione categoria,
			Quiz quiz, String stato, Date data_inserimento, String ruolo) {
		super();
		this.id_posizione = id_posizione;
		this.n_ammissioni = n_ammissioni;
		this.descrizione = descrizione;
		this.citta = citta;
		this.categoria = categoria;
		this.quiz = quiz;
		this.stato = stato;
		this.data_inserimento = data_inserimento;
		this.ruolo = ruolo;
	}


	public int getId_posizione() {
		return id_posizione;
	}


	public void setId_poszione(int id_posizione) {
		this.id_posizione = id_posizione;
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


	public Citta getCitta() {
		return citta;
	}


	public void setCitta(Citta citta) {
		this.citta = citta;
	}


	public CategoriaPosizione getCategoria() {
		return categoria;
	}


	public void setCategoria(CategoriaPosizione categoria) {
		this.categoria = categoria;
	}


	public Quiz getQuiz() {
		return quiz;
	}


	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
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
		return "Posizione [id_posizione=" + id_posizione + ", n_ammissioni=" + n_ammissioni + ", descrizione="
				+ descrizione + ", citta=" + citta + ", categoria=" + categoria + ", quiz=" + quiz + ", stato=" + stato
				+ ", data_inserimento=" + data_inserimento + ", ruolo=" + ruolo + "]";
	}


    public void add(Posizione posizione) {
    }
	
	
	

	
}

