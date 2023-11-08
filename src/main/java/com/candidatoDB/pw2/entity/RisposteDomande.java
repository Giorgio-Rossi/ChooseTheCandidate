package com.candidatoDB.pw2.entity;

public class RisposteDomande {
	private int id_risposta;;
	private String scelta1; // a 
	private String scelta2; // b
	private String scelta3; // c
	private String scelta4; // d
	private int scelta_corretta;
	
	private int id_domanda;
		
	public RisposteDomande() {
		super();
	}

	public RisposteDomande(int id_risposta, String scelta1, String scelta2, String scelta3, String scelta4,
			int scelta_corretta, int id_domanda) {
		super();
		this.id_risposta = id_risposta;
		this.scelta1 = scelta1;
		this.scelta2 = scelta2;
		this.scelta3 = scelta3;
		this.scelta4 = scelta4;
		this.scelta_corretta = scelta_corretta;
		this.id_domanda = id_domanda;
	}

	public int getId_risposta() {
		return id_risposta;
	}

	public void setId_risposta(int id_risposta) {
		this.id_risposta = id_risposta;
	}

	public String getScelta1() {
		return scelta1;
	}

	public void setScelta1(String scelta1) {
		this.scelta1 = scelta1;
	}

	public String getScelta2() {
		return scelta2;
	}

	public void setScelta2(String scelta2) {
		this.scelta2 = scelta2;
	}

	public String getScelta3() {
		return scelta3;
	}

	public void setScelta3(String scelta3) {
		this.scelta3 = scelta3;
	}

	public String getScelta4() {
		return scelta4;
	}

	public void setScelta4(String scelta4) {
		this.scelta4 = scelta4;
	}

	public int getScelta_corretta() {
		return scelta_corretta;
	}

	public void setScelta_corretta(int scelta_corretta) {
		this.scelta_corretta = scelta_corretta;
	}

	public int getId_domanda() {
		return id_domanda;
	}

	public void setId_domanda(int id_domanda) {
		this.id_domanda = id_domanda;
	}

	@Override
	public String toString() {
		return "RisposteDomande [id_risposta=" + id_risposta + ", scelta1=" + scelta1 + ", scelta2=" + scelta2
				+ ", scelta3=" + scelta3 + ", scelta4=" + scelta4 + ", scelta_corretta=" + scelta_corretta
				+ ", id_domanda=" + id_domanda + "]";
	}

	
	
	
}

