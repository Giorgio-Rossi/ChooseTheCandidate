package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;

import java.util.ArrayList;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;

public interface UtenteQuizDAO {

    void Save(UtenteQuiz utenteQuiz);

    UtenteQuiz getUtenteQuizById(int id_quiz, Utente utente);

    ArrayList<UtenteQuiz> getAllUtenteQuizByUser(int id_user);
    UtenteQuiz BestCandidatura (int id_user);
//    UtenteQuiz bestPunteggio (int id_utente_quiz);
//    
//    UtenteQuiz findByIdUtenteQuiz (int id_utente_quiz);
}
