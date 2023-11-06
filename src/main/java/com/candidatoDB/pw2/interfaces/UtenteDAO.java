package com.candidatoDB.pw2.interfaces;

import java.util.List;

import com.candidatoDB.pw2.entity.*;

public interface UtenteDAO {

	void save(Utente utente);

	void update(Utente utente);

	Utente findById(int id_user);

	List<Esperienza> findEsperienzeById(int id_user);

	List<Quiz> findByUtenteQuiz(int id_utente_quiz);
	
	int findPunteggioById (int id_utente_quiz);
	
	void deleteEsperienza ( Esperienza esperienza);

	Citta getUserCitta(Utente utente);
	

}
