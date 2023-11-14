package com.candidatoDB.pw2.entity;

import java.util.Date;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Utente;
public class CandidaturaUser {

	
	private int id_candidatura;
	private Posizione posizione;
	private Utente utente;
	private Date data_candidatura;
	
	
	public CandidaturaUser() {
		super();
	}


	public CandidaturaUser(int id_candidatura, Posizione posizione, Utente utente, Date data_candidatura) {
		super();
		this.id_candidatura = id_candidatura;
		this.posizione = posizione;
		this.utente = utente;
		this.data_candidatura = data_candidatura;
	}


	public int getId_candidatura() {
		return id_candidatura;
	}


	public void setId_candidatura(int id_candidatura) {
		this.id_candidatura = id_candidatura;
	}


	public Posizione getPosizione() {
		return posizione;
	}


	public void setPosizione(Posizione posizione) {
		this.posizione = posizione;
	}


	public Utente getUtente() {
		return utente;
	}


	public void setUtente(Utente utente) {
		this.utente = utente;
	}


	public Date getData_candidatura() {
		return data_candidatura;
	}


	public void setData_candidatura(Date data_candidatura) {
		this.data_candidatura = data_candidatura;
	}


	@Override
	public String toString() {
		return "CandidaturaUser [id_candidatura=" + id_candidatura + ", posizione=" + posizione + ", utente=" + utente
				+ ", data_candidatura=" + data_candidatura + "]";
	}
	
	
	
}
	

