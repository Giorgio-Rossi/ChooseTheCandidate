package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Domanda;
import com.candidatoDB.pw2.interfaces.QuizDomandaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QuizDomandaIMPL implements QuizDomandaDAO {

    private SQLServerConnection connection = new SQLServerConnection();

    public QuizDomandaIMPL() {
        connection.Connect();
    }

    @Override
    public ArrayList<Domanda> getDomandeByIdQuiz(int id_quiz) {
        ArrayList<Domanda> domande_quiz = new ArrayList<>();
        DomandaIMPL domandaIMPL = new DomandaIMPL();
        String sql = "SELECT id_domanda from QuizDomanda where id_quiz=?";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_quiz);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                domande_quiz.add(domandaIMPL.getDomandaById(resultSet.getInt(1)));
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            DBUtil.close(resultSet);
            DBUtil.close(statement);
            //DBUtil.close(connection.getConnection());
        }
        return domande_quiz;
    }
}

