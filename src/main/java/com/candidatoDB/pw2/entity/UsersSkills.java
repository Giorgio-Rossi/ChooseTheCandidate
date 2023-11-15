package com.candidatoDB.pw2.entity;

import java.util.ArrayList;
import java.util.List;

public class UsersSkills {


	private int id_user_skills;
	private int id_user;

	private int id_skill;
	private boolean verificata;

	
	public UsersSkills() {
		super();
	}
	
	public UsersSkills(int id_user_skills, int id_user, int id_skill, boolean verificata) {
		super();
		this.id_user_skills = id_user_skills;
		this.id_user = id_user;
		this.id_skill = id_skill;
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
	public int getId_skills() {
		return id_skill;
	}
	public void setId_skill(int id_skill) {
		this.id_skill = id_skill;
	}
	public boolean isVerificata() {
		return verificata;
	}
	public void setVerificata(boolean verificata) {
		this.verificata = verificata;
	}


	@Override
	public String toString() {
		return "UsersSkills [id_user_skills=" + id_user_skills + ", id_user=" + id_user + ", id_skills=" + id_skill
				+ ", verificata=" + verificata + "]";
	}
	
	
	
}



