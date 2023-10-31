package com.candidatoDB.pw2.entity;

public class Domanda {

	
	private int id_domanda;
	private String testo;
	private int punteggio;
	
	
	public Domanda() {
		super();
	}

	public Domanda(int id_domanda, String testo, int punteggio) {
		super();
		this.id_domanda = id_domanda;
		this.testo = testo;
		this.punteggio = punteggio;
	}
	
	public int getId_domanda() {
		return id_domanda;
	}
	public void setId_domanda(int id_domanda) {
		this.id_domanda = id_domanda;
	}
	public String getTesto() {
		return testo;
	}
	public void setTesto(String testo) {
		this.testo = testo;
	}
	public int getPunteggio() {
		return punteggio;
	}
	public void setPunteggio(int punteggio) {
		this.punteggio = punteggio;
	}

	@Override
	public String toString() {
		return "Domanda [id_domanda=" + id_domanda + ", testo=" + testo + ", punteggio=" + punteggio + "]";
	}
	
	
}
