package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;

import java.util.ArrayList;

public interface UtenteQuizDAO {

    void Save(UtenteQuiz utenteQuiz);

    UtenteQuiz getUtenteQuizById(int id_quiz, Utente utente);

    ArrayList<Quiz> getAllUtenteQuizByUser(int id_user);
}
