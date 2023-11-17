package com.candidatoDB.pw2.interfaces;

import java.util.ArrayList;

import com.candidatoDB.pw2.entity.Quiz;

public interface QuizDAO {

    Quiz getQuizById(int id_quiz);

    Integer getPunteggioTotaleById(int id_quiz);

    Integer getNdomandeById (int id_quiz);
    
    ArrayList<Quiz> getAllQuiz();
}
