package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.interfaces.QuizDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QuizIMPL implements QuizDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public QuizIMPL() {
        connection.Connect();
    }
    @Override
    public Quiz getQuizById(int id_quiz) {
        Quiz quiz = new Quiz();
        String sql = "SELECT * from Quiz where id_quiz=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_quiz);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                quiz.setId_quiz(resultSet.getInt(1));
                quiz.setDescrizione(resultSet.getString(2));
                quiz.setN_domande(resultSet.getInt(3));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return quiz;
    }

    @Override
    public Integer getPunteggioTotaleById(int id_quiz) {
        Integer punteggio_totale = null;
        String sql = "SELECT sum(d.punteggio) from Domanda d inner join QuizDomanda qd on d.id_domanda = qd.id_domanda inner join Quiz q on qd.id_quiz = q.id_quiz where q.id_quiz = ?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_quiz);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                punteggio_totale = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return punteggio_totale;
    }
    //----------------------admin----------------------
    
    @Override
    public Integer getNdomandeById (int id_quiz) {
    	Integer nDomande = null;
    	String sql = "SELECT count(d.id_domanda) from Quiz q inner join QuizDomanda qd on q.id_quiz = qd.id_quiz where q.id_quiz = ?";
    	PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_quiz);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                nDomande = resultSet.getInt(1);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
    	return nDomande;
    }
}
