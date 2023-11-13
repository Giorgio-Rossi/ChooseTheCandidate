package com.candidatoDB.pw2.interfaces;

public interface UtenteQuizDAO {

    void Save(int id_utente_quiz, int id_quiz, int id_user, int punteggio);
}
