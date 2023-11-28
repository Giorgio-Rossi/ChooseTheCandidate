package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.entity.UtenteQuiz;
import com.candidatoDB.pw2.interfaces.UtenteQuizDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
			statement.setTimestamp(4, new Timestamp(utenteQuiz.getData_inserimento().getTime()));

			statement.executeUpdate();
			// resultSet = statement.getGeneratedKeys();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			// DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
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

			if (!resultSet.isBeforeFirst()) {
				return null;
			} else {
				utenteQuiz = new UtenteQuiz();

				while (resultSet.next()) {
					utenteQuiz.setId_quiz(resultSet.getInt("id_quiz"));
					utenteQuiz.setId_user(resultSet.getInt("id_user"));
					utenteQuiz.setPunteggio(resultSet.getInt("punteggio"));
					utenteQuiz.setData_inserimento(resultSet.getTimestamp("data_inserimento"));
				}
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection.getConnection());
		}
		return utenteQuiz;
	}

	public UtenteQuiz getUtenteQuizById(int id_utente_quiz) {
		UtenteQuiz utenteQuiz = null;
		String sql = "SELECT * from UtenteQuiz where id_utente_quiz=?";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_utente_quiz);

			resultSet = statement.executeQuery();

			if (!resultSet.isBeforeFirst()) {
				return null;
			} else {
				utenteQuiz = new UtenteQuiz();

				while (resultSet.next()) {
					utenteQuiz.setId_quiz(resultSet.getInt("id_quiz"));
					utenteQuiz.setId_user(resultSet.getInt("id_user"));
					utenteQuiz.setPunteggio(resultSet.getFloat("punteggio"));
					utenteQuiz.setData_inserimento(resultSet.getTimestamp("data_inserimento"));

				}
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection.getConnection());
		}
		return utenteQuiz;
	}

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
				utenteQuiz.setData_inserimento(resultSet.getTimestamp(5));

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


	@Override
	public Map<Posizione,UtenteQuiz> BestCandidatura(int id_utente) {
		Map<Posizione,UtenteQuiz> best_candidatura = null;
	    String sql = "SELECT TOP 1 \n" +
				"    UQ.id_user, \n" +
				"    UQ.id_quiz, \n" +
				"    UQ.punteggio, \n" +
				"    CU.id_candidatura_user, \n" +
				"    P.id_posizione, \n" +
				"    P.descrizione, \n" +
				"    UQ.id_utente_quiz \n" +
				"FROM \n" +
				"    UtenteQuiz UQ \n" +
				"JOIN \n" +
				"    CandidaturaUser CU ON UQ.id_user = CU.id_user \n" +
				"JOIN \n" +
				"    Posizione P ON CU.id_posizione = P.id_posizione AND P.id_quiz = UQ.id_quiz \n" +
				"WHERE \n" +
				"    UQ.id_user = ? \n" +
				"ORDER BY \n" +
				"    UQ.punteggio DESC;";
	    PreparedStatement statement = null;
	    ResultSet resultSet = null;
	    try {
	        statement = connection.getConnection().prepareStatement(sql);
	        statement.setInt(1, id_utente);

	        resultSet = statement.executeQuery();

	        while (resultSet.next()) {
				PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
				best_candidatura = new HashMap<>();

				best_candidatura.put(posizioneIMPL.getPosizioneById(resultSet.getInt("id_posizione")),getUtenteQuizById(resultSet.getInt("id_utente_quiz")));
	        }

	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    } finally {
	       // DBUtil.close(resultSet);
	        DBUtil.close(statement);
	        //DBUtil.close(connection.getConnection());
	    }
	    return best_candidatura;
	}

	}
	

