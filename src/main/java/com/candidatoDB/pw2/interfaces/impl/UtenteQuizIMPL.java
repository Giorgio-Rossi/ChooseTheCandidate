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
					utenteQuiz.setData_inserimento(resultSet.getDate("data_inserimento"));
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

	public UtenteQuiz getUtenteQuizById(Utente utente) {
		UtenteQuiz utenteQuiz = null;
		String sql = "SELECT * from UtenteQuiz where id_user=?";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, utente.getId_user());

			resultSet = statement.executeQuery();

			if (!resultSet.isBeforeFirst()) {
				return null;
			} else {
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
			// DBUtil.close(connection.getConnection());
		}
		return utenteQuiz;
	}

	// TODO CAMBIARE VALORE DI RITORNO MEDOTO
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
			// DBUtil.close(connection.getConnection());
		}
		return allUtenteQuizzes;
	}

	@Override
	public UtenteQuiz BestCandidatura(int id_user) {
	
			 UtenteQuiz utenteQuiz = null;
			    String sql="select top 1 punteggio,uq.*, uc.* from UtenteQuiz uq join CandidaturaUser uc on uq.id_user=uc.id_user where uq.id_user=? and uc.id_user=? order by punteggio desc";
			    PreparedStatement statement = null;
			    ResultSet resultSet = null;
			    try {
			        statement = connection.getConnection().prepareStatement(sql);
			        statement.setInt(1, id_user);
			 
			        resultSet = statement.executeQuery();
			 
			            while (resultSet.next()) {
			            	utenteQuiz = new UtenteQuiz();
							utenteQuiz.setId_utente_quiz(resultSet.getInt("id_utente_quiz"));
							utenteQuiz.setId_quiz(resultSet.getInt("id_quiz"));
							utenteQuiz.setPunteggio(resultSet.getDouble("punteggio"));
							utenteQuiz.setData_inserimento(new java.sql.Date(resultSet.getDate("data_inserimento").getTime()));
							
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
	

//	@Override
//	public UtenteQuiz bestPunteggio(int id_utente_quiz) {
//		UtenteQuiz utenteQuiz = null;
//		String sql = "select top 1 punteggio from UtenteQuiz  where id_utente_quiz = ? order by punteggio desc ";
//		PreparedStatement statement = null;
//		ResultSet resultSet = null;
//		try {
//			statement = connection.getConnection().prepareStatement(sql);
//			statement.setInt(1, id_utente_quiz);
//
//			resultSet = statement.executeQuery();
//
//			while (resultSet.next()) {
//				utenteQuiz = new UtenteQuiz();
//
//				candidatura.setPosizione(posizioneIMPL.getPosizioneById(resultSet.getInt("posizione")));
//				UtenteIMPL utenteIMPL = new UtenteIMPL();
//				candidatura.setUtente(utenteIMPL.findById(resultSet.getInt("utente")));
//				candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate("data_candidatura").getTime()));
//
//			}
//
//		} catch (SQLException e) {
//			System.err.println(e.getMessage());
//		} finally {
//			DBUtil.close(resultSet);
//			DBUtil.close(statement);
//			// DBUtil.close(connection.getConnection());
//		}
//		return utenteQuiz;
//	}
//
//	@Override
//	public UtenteQuiz findByIdUtenteQuiz(int id_utente_quiz) {
//		UtenteQuiz utenteQuiz = new UtenteQuiz();
//		String sql = "SELECT * from UtenteQuiz where id_utente_quiz = ?";
//
//		PreparedStatement statement = null;
//		ResultSet resultSet = null;
//		try {
//			statement = connection.getConnection().prepareStatement(sql);
//			statement.setInt(1, id_utente_quiz);
//			resultSet = statement.executeQuery();
//			while (resultSet.next()) {
//
//				utenteQuiz.setId_utente_quiz(resultSet.getInt("id_utente_quiz"));
//				utenteQuiz.setId_user(resultSet.getInt("id_user"));
//				utenteQuiz.setId_quiz(resultSet.getInt("id_quiz"));
//				utenteQuiz.setPunteggio(resultSet.getDouble("punteggio"));
//				utenteQuiz.setData_inserimento(new java.sql.Date(resultSet.getDate("data_inserimento").getTime()));
//
//				System.out.println("Funziono");
//			}
//		} catch (SQLException e) {
//			System.err.println(e.getMessage());
//		} finally {
//			DBUtil.close(resultSet);
//			DBUtil.close(statement);
//			// DBUtil.close(connection.getConnection());
//		}
//		return utenteQuiz;
//	}
//

}
