package com.candidatoDB.pw2.entity;


public class Skill {	
	private int id_skill;
	private String nome;
	private String tipo_skill;

	private int id_quiz;
	
	
	public Skill() {
		super();
	}
	
	public Skill(int id_skill, String nome, String tipo_skill, int id_quiz) {
		super();
		this.id_skill = id_skill;
		this.nome = nome;
		this.tipo_skill = tipo_skill;
		this.id_quiz = id_quiz;
	}
	public int getId_skill() {
		return id_skill;
	}
	public void setId_skill(int id_skill) {
		this.id_skill = id_skill;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTipo_skill() {
		return tipo_skill;
	}
	public void setTipo_skill(String tipo_skill) {
		this.tipo_skill = tipo_skill;
	}

	public void setId_quiz(int id_quiz) {
		this.id_quiz = id_quiz;
	}

	public int getId_quiz() {
		return id_quiz;
	}

	@Override
	public String toString() {
		return "Skill{" +
				"id_skill=" + id_skill +
				", nome='" + nome + '\'' +
				", tipo_skill='" + tipo_skill + '\'' +
				", id_quiz=" + id_quiz +
				'}';
	}
}
