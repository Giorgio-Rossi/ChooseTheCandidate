package com.candidatoDB.pw2.entity;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class UtenteQuiz {

	private int id_utente_quiz;
	private int id_quiz;
	private int id_user;
	private double punteggio;

	private Date data_inserimento;
	
	public UtenteQuiz() {
		super();
	}
	public UtenteQuiz(int id_utente_quiz, int id_quiz, int id_user, double punteggio,  Date data_inserimento) {
		super();
		this.id_utente_quiz = id_utente_quiz;
		this.id_quiz = id_quiz;
		this.id_user = id_user;
		this.punteggio = punteggio;
		this.data_inserimento = data_inserimento;
	}
	public int getId_utente_quiz() {
		return id_utente_quiz;
	}
	public void setId_utente_quiz(int id_utente_quiz) {
		this.id_utente_quiz = id_utente_quiz;
	}
	public int getId_quiz() {
		return id_quiz;
	}
	public void setId_quiz(int id_quiz) {
		this.id_quiz = id_quiz;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public double getPunteggio() {
		return punteggio;
	}
	public void setPunteggio(double punteggio) {
		this.punteggio = punteggio;
	}

	public void setData_inserimento(Date data_inserimento) {
		this.data_inserimento = data_inserimento;
	}

	public Date getData_inserimento() {
		return data_inserimento;
	}

	@Override
	public String toString() {
		return "UtenteQuiz [id_utente_quiz=" + id_utente_quiz + ", id_quiz=" + id_quiz + ", id_user=" + id_user
				+ ", punteggio=" + punteggio + "]";
	}
	
	
}
