package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;
import com.candidatoDB.pw2.interfaces.UtenteQuizDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;

public class UtenteQuizIMPL implements UtenteQuizDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public UtenteQuizIMPL() {
        connection.Connect();
    }
    @Override
    public void Save(UtenteQuiz utenteQuiz) {
        String sql = "INSERT INTO UtenteQuiz(id_quiz, id_user, punteggio) VALUES(?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, utenteQuiz.getId_quiz());
            statement.setInt(2, utenteQuiz.getId_user());
            statement.setInt(3, utenteQuiz.getPunteggio());

            statement.executeUpdate();
            //resultSet = statement.getGeneratedKeys();

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            //DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close((Connection) connection);
        }
    }

    @Override
    public UtenteQuiz getUtenteQuizById(int id_quiz, Utente utente) {
        UtenteQuiz utenteQuiz = null;
        String sql = "SELECT * from UtenteQuiz where id_quiz=? and id_user=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_quiz);
            statement.setInt(2, utente.getId_user());

            resultSet = statement.executeQuery();

            if(!resultSet.isBeforeFirst()){
                return null;
            }else {
                utenteQuiz = new UtenteQuiz();

                while (resultSet.next()) {
                    utenteQuiz.setId_quiz(resultSet.getInt("id_quiz"));
                    utenteQuiz.setId_user(resultSet.getInt("id_user"));
                    utenteQuiz.setPunteggio(resultSet.getInt("punteggio"));
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return utenteQuiz;
    }

    public UtenteQuiz getUtenteQuizById(Utente utente) {
        UtenteQuiz utenteQuiz = null;
        String sql = "SELECT * from UtenteQuiz where id_user=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, utente.getId_user());

            resultSet = statement.executeQuery();

            if(!resultSet.isBeforeFirst()){
                return null;
            }else {
                utenteQuiz = new UtenteQuiz();

                while (resultSet.next()) {
                    utenteQuiz.setId_quiz(resultSet.getInt("id_quiz"));
                    utenteQuiz.setId_user(resultSet.getInt("id_user"));
                    utenteQuiz.setPunteggio(resultSet.getInt("punteggio"));
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return utenteQuiz;
    }

    @Override
    public ArrayList<Quiz> getAllUtenteQuizByUser(int id_user) {
        ArrayList<Quiz> allUtenteQuizzes = new ArrayList<>();
        String sql = "SELECT * from UtenteQuiz uq inner join Quiz q on uq.id_quiz = q.id_quiz where uq.id_user = ?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_user);

            resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    QuizIMPL quizIMPL = new QuizIMPL();

                    Quiz quiz = quizIMPL.getQuizById(resultSet.getInt("id_quiz"));

                    allUtenteQuizzes.add(quiz);
                }

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return allUtenteQuizzes;
    }
}
