package com.candidatoDB.pw2.interfaces;

import java.util.List;

import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;
import com.candidatoDB.pw2.entity.Esperienza;
import com.candidatoDB.pw2.entity.Quiz;

public interface UtenteDAO {

	void save(Utente utente);

	void update(Utente utente);

	void delete(Utente utente);

	List<Utente> findAll();

	Utente findById(int id_user);

	List<Esperienza> findEsperienzeById(int id_user);

	List<Quiz> findByUtenteQuiz(int id_utente_quiz);
	
	int findPunteggioById (int id_utente_quiz);

}
