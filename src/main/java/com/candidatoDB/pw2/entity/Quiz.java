package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;

public class Quiz {
	private int id_quiz;
	private String descrizione;
	private int n_domande;

	private List<Domanda> id_domanda = new ArrayList<Domanda>();

	public Quiz() {
		super();
	}

	public Quiz(int id_quiz, String descrizione, int n_domande, List<Domanda> id_domanda) {
		super();
		this.id_quiz = id_quiz;
		this.descrizione = descrizione;
		this.n_domande = n_domande;
		this.id_domanda = id_domanda;
	}

	public int getId_quiz() {
		return id_quiz;
	}

	public void setId_quiz(int id_quiz) {
		this.id_quiz = id_quiz;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getN_domande() {
		return n_domande;
	}

	public void setN_domande(int n_domande) {
		this.n_domande = n_domande;
	}

	public List<Domanda> getId_domanda() {
		return id_domanda;
	}

	public void setId_domanda(List<Domanda> id_domanda) {
		this.id_domanda = id_domanda;
	}

	@Override
	public String toString() {
		return "Quiz [id_quiz=" + id_quiz + ", descrizione=" + descrizione + ", n_domande=" + n_domande
				+ ", id_domanda=" + id_domanda + "]";
	}

}
