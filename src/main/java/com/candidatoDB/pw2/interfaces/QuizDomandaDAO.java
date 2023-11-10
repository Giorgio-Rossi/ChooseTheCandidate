package com.candidatoDB.pw2.interfaces;

import com.candidatoDB.pw2.entity.Domanda;

import java.util.ArrayList;

public interface QuizDomandaDAO {

    ArrayList<Domanda> getDomandeByIdQuiz(int id_quiz);
}
