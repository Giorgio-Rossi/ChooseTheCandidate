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
        String sql = "INSERT INTO UtenteQuiz(id_quiz, id_user, punteggio, data_inserimento) VALUES(?,?,?,?)";
        PreparedStatement statement = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, utenteQuiz.getId_quiz());
            statement.setInt(2, utenteQuiz.getId_user());
            statement.setDouble(3, utenteQuiz.getPunteggio());
            statement.setDate(4, utenteQuiz.getData_inserimento());

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
                    utenteQuiz.setData_inserimento(resultSet.getDate("data_inserimento"));
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
                    utenteQuiz.setData_inserimento(resultSet.getDate("data_inserimento"));

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

    //TODO CAMBIARE VALORE DI RITORNO MEDOTO
    @Override
    public ArrayList<UtenteQuiz> getAllUtenteQuizByUser(int id_user) {
        ArrayList<UtenteQuiz> allUtenteQuizzes = new ArrayList<>();
        String sql = "SELECT * from UtenteQuiz uq where uq.id_user = ?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_user);

            resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    UtenteQuiz utenteQuiz = new UtenteQuiz();

                   utenteQuiz.setId_utente_quiz(resultSet.getInt(1));
                   utenteQuiz.setId_quiz(resultSet.getInt(2));
                   utenteQuiz.setId_user(resultSet.getInt(3));
                   utenteQuiz.setPunteggio(resultSet.getFloat(4));
                   utenteQuiz.setData_inserimento(resultSet.getDate(5));

                    allUtenteQuizzes.add(utenteQuiz);
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
