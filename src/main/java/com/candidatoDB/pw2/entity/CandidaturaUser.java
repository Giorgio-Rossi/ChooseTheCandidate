package com.candidatoDB.pw2.entity;

import java.util.Date;

public class CandidaturaUser {

	
	private int id_candidatura;
	private int id_posizione;
	private int id_user;
	private Date data_candidatura;
	
	
	public CandidaturaUser() {
		super();
	}
	
	public CandidaturaUser(int id_candidatura, int id_posizione, int id_user, Date data_candidatura) {
		super();
		this.id_candidatura = id_candidatura;
		this.id_posizione = id_posizione;
		this.id_user = id_user;
		this.data_candidatura = data_candidatura;
	}
	
	public int getId_candidatura() {
		return id_candidatura;
	}
	
	public void setId_candidatura(int id_candidatura) {
		this.id_candidatura = id_candidatura;
	}
	
	public int getId_posizione() {
		return id_posizione;
	}
	
	public void setId_posizione(int id_posizione) {
		this.id_posizione = id_posizione;
	}
	
	public int getId_user() {
		return id_user;
	}
	
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	
	public Date getData_candidatura() {
		return data_candidatura;
	}
	
	public void setData_candidatura(Date data_candidatura) {
		this.data_candidatura = data_candidatura;
	}

	@Override
	public String toString() {
		return "CandidaturaUser [id_candidatura=" + id_candidatura + ", id_posizione=" + id_posizione + ", id_user="
				+ id_user + ", data_candidatura=" + data_candidatura + "]";
	}
	
	
	
}
	

