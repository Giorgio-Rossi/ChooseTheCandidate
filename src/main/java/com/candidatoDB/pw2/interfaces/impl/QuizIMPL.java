package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.*;
import com.candidatoDB.pw2.interfaces.QuizDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.*;
import java.util.ArrayList;

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
    
    @Override
    public ArrayList<Quiz> getAllQuiz() {
		ArrayList<Quiz> quiz = new ArrayList<>();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {

			String sql = "SELECT * FROM Quiz";
			preparedStatement = connection.getConnection().prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				Quiz q = new Quiz();
				q.setId_quiz(resultSet.getInt(1));
				q.setDescrizione(resultSet.getString(2));
				q.setN_domande(resultSet.getInt(3));
                quiz.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			// DBUtil.close(connection);
		}

		return quiz;
	}

    @Override
    public void save(Quiz quiz, ArrayList<Domanda> domande, ArrayList<RisposteDomande> risposteDomande) {
        String InsertQuiz = "INSERT INTO Quiz VALUES (?,?);";
        String InsertDomande = "INSERT INTO Domanda VALUES (?,?)";
        String InsertRisposteDomanda = "INSERT INTO RisposteDomanda VALUES (?,?,?,?,?,?);";
        String InsertQuizDomanda = "INSERT INTO QuizDomanda VALUES(?,?)";

        PreparedStatement st_quiz = null;
        PreparedStatement st_domande = null;
        PreparedStatement st_risposte_domande = null;
        PreparedStatement st_quiz_domande = null;

        try {

            st_quiz= connection.getConnection().prepareStatement(InsertQuiz, Statement.RETURN_GENERATED_KEYS);
            st_domande= connection.getConnection().prepareStatement(InsertDomande, Statement.RETURN_GENERATED_KEYS);
            st_risposte_domande = connection.getConnection().prepareStatement(InsertRisposteDomanda);
            st_quiz_domande = connection.getConnection().prepareStatement(InsertQuizDomanda);

            st_quiz.setString(1, quiz.getDescrizione());
            st_quiz.setInt(2, quiz.getN_domande());

            st_quiz.executeUpdate();

            ResultSet generatedKeysQuiz = st_quiz.getGeneratedKeys();

            generatedKeysQuiz.next();

            int i= 0;
            for(Domanda domanda: domande) {
                st_domande.setString(1, domanda.getTesto());
                st_domande.setInt(2,domanda.getPunteggio());

                st_domande.executeUpdate();

                ResultSet generatedKeys = st_domande.getGeneratedKeys();

                generatedKeys.next();

                st_risposte_domande.setString(1,risposteDomande.get(i).getScelta1());
                st_risposte_domande.setString(2,risposteDomande.get(i).getScelta2());
                st_risposte_domande.setString(3,risposteDomande.get(i).getScelta3());
                st_risposte_domande.setString(4,risposteDomande.get(i).getScelta4());
                st_risposte_domande.setString(5,risposteDomande.get(i).getScelta_corretta());

                st_risposte_domande.setInt(6,generatedKeys.getInt(1));

                st_risposte_domande.executeUpdate();

                st_quiz_domande.setInt(1,generatedKeys.getInt(1));
                st_quiz_domande.setInt(2,generatedKeysQuiz.getInt(1));

                st_quiz_domande.executeUpdate();

                i++;

            }








            // resultSet = statement.getGeneratedKeys();

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            // DBUtil.close(resultSet);
            DBUtil.close(st_quiz);
            DBUtil.close(st_domande);
            DBUtil.close(st_risposte_domande);
            // DBUtil.close((Connection) connection);
        }
    }

    @Override
    public void delete(Integer id_quiz) {
        String sql = "DELETE FROM UtenteQuiz WHERE id_quiz = ? DELETE FROM RisposteDomanda WHERE id_domanda IN (SELECT id_domanda FROM QuizDomanda WHERE id_quiz = ?);DELETE FROM QuizDomanda WHERE id_quiz = ?;UPDATE Posizione SET id_quiz = NULL WHERE id_quiz = ?; UPDATE Skill SET id_quiz = NULL WHERE id_quiz = ?; DELETE FROM Quiz WHERE id_quiz = ?;";
        PreparedStatement statement = null;
        try {
            statement = connection.getConnection().prepareStatement(sql);
            statement.setInt(1, id_quiz);
            statement.setInt(2, id_quiz);
            statement.setInt(3, id_quiz);
            statement.setInt(4, id_quiz);
            statement.setInt(5, id_quiz);
            statement.setInt(6, id_quiz);
            statement.executeUpdate();

        } catch (SQLException e) {
            System.err.println(e.getMessage());

        } finally {
            DBUtil.close(statement);
            // DBUtil.close((Connection) connection);
        }
    }
}
