package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;
import com.candidatoDB.pw2.entity.QuizDomande;

public class QuizDomande {
	private int id_quiz_domanda;
	private List<Domanda> id_domanda = new ArrayList<Domanda>();
	private List<Quiz> id_quiz = new ArrayList<Quiz>();

	public QuizDomande() {
		super();
	}

	public QuizDomande(int id_quiz_domanda, List<Domanda> id_domanda, List<Quiz> id_quiz) {
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

	public List<Domanda> getId_domanda() {
		return id_domanda;
	}

	public void setId_domanda(List<Domanda> id_domanda) {
		this.id_domanda = id_domanda;
	}

	public List<Quiz> getId_quiz() {
		return id_quiz;
	}

	public void setId_quiz(List<Quiz> id_quiz) {
		this.id_quiz = id_quiz;
	}

	@Override
	public String toString() {
		return "QuizDomande [id_quiz_domand=" + id_quiz_domanda + ", id_domanda=" + id_domanda + ", id_quiz=" + id_quiz
				+ "]";
	}

}
