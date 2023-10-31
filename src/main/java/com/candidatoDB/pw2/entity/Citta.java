package com.candidatoDB.pw2.entity;

public class Citta {
	
	private int id_citta;
	private String regione;
	private String nome;
		
	
	public Citta() {
		super();
	}


	public Citta(int id_citta, String regione, String nome) {
		super();
		this.id_citta = id_citta;
		this.regione = regione;
		this.nome = nome;
	}
	
		
	public int getId_citta() {
		return id_citta;
	}
	public void setId_citta(int id_citta) {
		this.id_citta = id_citta;
	}
	public String getRegione() {
		return regione;
	}
	public void setRegione(String regione) {
		this.regione = regione;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	@Override
	public String toString() {
		return "Citta [id_citta=" + id_citta + ", regione=" + regione + ", nome=" + nome + "]";
	}

	
	
	 
}
