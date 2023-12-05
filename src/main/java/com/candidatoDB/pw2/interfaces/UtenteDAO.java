package com.candidatoDB.pw2.interfaces;
 
import java.util.ArrayList;
import java.util.List;
 
import com.candidatoDB.pw2.entity.*;
 
public interface UtenteDAO {
 
	void save(Utente utente);
 
	void updateAll(Utente utente);
 
	Utente findById(int id_user);
 
	List<Esperienza> findEsperienzeById(int id_user);
 
	List<Quiz> findByUtenteQuiz(int id_utente_quiz);
	int findPunteggioById (int id_utente_quiz);
	void deleteEsperienza ( Esperienza esperienza);
 
	Citta getUserCitta(Utente utente);
 
	ArrayList<Utente> getTop3UserByIdCandidatura(int id_posizione);
 
	//TODO METODO TEMPORANEO
	ArrayList<Utente> getAllUserByIdCandidatura(int id_posizione);
	public void updateMail(Utente utente);
	public void updateCodF(Utente utente);
	public void updateTel(Utente utente);
	public void updateMailAndTel(Utente utente);
	public void updateMailAndCodF(Utente utente);
	public void updateTelAndCodF(Utente utente);
	public void updateOnlyNotUnique(Utente utente);

	void UpdatePrimoLogin(Utente user);
	
}