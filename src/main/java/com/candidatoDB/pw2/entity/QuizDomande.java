package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;
import com.candidatoDB.pw2.entity.QuizDomande;

public class QuizDomande {
	private int id_quiz_domanda;
	private int id_domanda;
	private int id_quiz;

	public QuizDomande() {
		super();
	}

	public QuizDomande(int id_quiz_domanda, int id_domanda, int id_quiz) {
		super();
		this.id_quiz_domanda = id_quiz_domanda;
		this.id_domanda = id_domanda;
		this.id_quiz = id_quiz;
	}

	public int getId_quiz_domand() {
		return id_quiz_domanda;
	}

	public void setId_quiz_domand(int id_quiz_domand) {
		this.id_quiz_domanda = id_quiz_domand;
	}

	public int getId_domanda() {
		return id_domanda;
	}

	public void setId_domanda(int id_domanda) {
		this.id_domanda = id_domanda;
	}

	public int getId_quiz() {
		return id_quiz;
	}

	public void setId_quiz(int id_quiz) {
		this.id_quiz = id_quiz;
	}

	@Override
	public String toString() {
		return "QuizDomande [id_quiz_domand=" + id_quiz_domanda + ", id_domanda=" + id_domanda + ", id_quiz=" + id_quiz
				+ "]";
	}

}
