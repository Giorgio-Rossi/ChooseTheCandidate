package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;

public class UsersSkills {


	private int id_user_skills;
	private int id_user;
	private List<Skill> id_skills = new ArrayList<Skill>();
	private boolean verificata;

	
	public UsersSkills() {
		super();
	}
	
	public UsersSkills(int id_user_skills, int id_user, List<Skill> id_skills, boolean verificata) {
		super();
		this.id_user_skills = id_user_skills;
		this.id_user = id_user;
		this.id_skills = id_skills;
		this.verificata = verificata;
	}
	public int getId_user_skills() {
		return id_user_skills;
	}
	public void setId_user_skills(int id_user_skills) {
		this.id_user_skills = id_user_skills;
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public List<Skill> getId_skills() {
		return id_skills;
	}
	public void setId_skills(List<Skill> id_skills) {
		this.id_skills = id_skills;
	}
	public boolean isVerificata() {
		return verificata;
	}
	public void setVerificata(boolean verificata) {
		this.verificata = verificata;
	}


	@Override
	public String toString() {
		return "UsersSkills [id_user_skills=" + id_user_skills + ", id_user=" + id_user + ", id_skills=" + id_skills
				+ ", verificata=" + verificata + "]";
	}
	
	
	
}



