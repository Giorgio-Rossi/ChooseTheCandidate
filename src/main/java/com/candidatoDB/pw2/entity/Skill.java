package com.candidatoDB.pw2.entity;


public class Skill {	
	private int id_skill;
	private String nome;
	private String tipo_skill;
	
	
	public Skill() {
		super();
	}
	
	public Skill(int id_skill, String nome, String tipo_skill) {
		super();
		this.id_skill = id_skill;
		this.nome = nome;
		this.tipo_skill = tipo_skill;
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
	@Override
	public String toString() {
		return "Skill [id_skill=" + id_skill + ", nome=" + nome + ", tipo_skill=" + tipo_skill + "]";
	}
	
	
}
