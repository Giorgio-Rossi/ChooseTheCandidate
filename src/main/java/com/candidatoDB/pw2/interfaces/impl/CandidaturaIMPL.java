package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.candidatoDB.pw2.entity.CandidaturaUser;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.interfaces.CandidaturaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

public class CandidaturaIMPL implements CandidaturaDAO {
	private SQLServerConnection connection = new SQLServerConnection();

	public CandidaturaIMPL() {
		connection.Connect();
	}

	@Override
	public List<CandidaturaUser> orderCandidature() {
		List<CandidaturaUser> candidature = new ArrayList<>();
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT id_candidatura_user, id_posizione, id_user, data_candidatura FROM CandidaturaUser ORDER BY data_candidatura DESC";

		try {
			statement = connection.getConnection().prepareStatement(sql);
			resultSet = statement.executeQuery();

			while (resultSet.next()) {
				CandidaturaUser candidatura = new CandidaturaUser();
				candidatura.setId_candidatura(resultSet.getInt("id_candidatura_user"));
				PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
				candidatura.setPosizione(posizioneIMPL.getPosizioneById(resultSet.getInt("id_posizione")));
				UtenteIMPL utenteIMPL = new UtenteIMPL();
				candidatura.setUtente(utenteIMPL.findById(resultSet.getInt("id_user")));

				candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate("data_candidatura").getTime()));
				candidature.add(candidatura);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
		}
		return candidature;
	}

	@Override
	public CandidaturaUser trovaCandidaturaPiuRecente(int id_user) {

		CandidaturaUser candidatura = null;
		// Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		String sql = "SELECT top 3 id_candidatura_user, id_posizione, id_user, data_candidatura "
				+ "FROM CandidaturaUser " + "WHERE id_user = ? " + "ORDER BY data_candidatura DESC ";

		try {

			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, id_user);
			resultSet = statement.executeQuery();

			if (resultSet.next()) {
				candidatura = new CandidaturaUser();
				candidatura.setId_candidatura(resultSet.getInt("id_candidatura_user"));
				PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
				candidatura.setPosizione(posizioneIMPL.getPosizioneById(resultSet.getInt("id_posizione")));
				UtenteIMPL utenteIMPL = new UtenteIMPL();
				candidatura.setUtente(utenteIMPL.findById(resultSet.getInt("id_user")));

				candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate("data_candidatura").getTime()));

				System.out.println("metodo Candidatura piu recente funziona");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close((Connection) connection);
		}

		return candidatura;
	}

	@Override
	public List<CandidaturaUser> findCandidatureUtenteById(int id_user) {
	    List<CandidaturaUser> candidature = new ArrayList<>();
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    String sql = "SELECT * FROM CandidaturaUser WHERE id_user = ?";

	    try {
	        preparedStatement = connection.getConnection().prepareStatement(sql);
	        preparedStatement.setInt(1, id_user);
	        resultSet = preparedStatement.executeQuery();

	        while (resultSet.next()) {
	            CandidaturaUser candidatura = new CandidaturaUser();
	            candidatura.setId_candidatura(resultSet.getInt("id_candidatura_user"));
	            PosizioneIMPL posizioneIMPL = new PosizioneIMPL();
	            candidatura.setPosizione(posizioneIMPL.getPosizioneById(resultSet.getInt("id_posizione")));
	            UtenteIMPL utenteIMPL = new UtenteIMPL();
	            candidatura.setUtente(utenteIMPL.findById(resultSet.getInt("id_user")));
	            candidatura.setData_candidatura(new java.sql.Date(resultSet.getDate("data_candidatura").getTime()));
	            candidature.add(candidatura);

	            /*for (CandidaturaUser candidaturaUser : candidature) {
	                System.out.println(candidaturaUser);
				}
	            System.out.println("Query " + sql + " eseguita correttamente");*/
	        }

	     

	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.err.println("Errore durante l'esecuzione della query: " + e.getMessage());
	    } finally {
	        DBUtil.close(resultSet);
	        DBUtil.close(preparedStatement);
	        
	    }

	    return candidature;
	}


	

	public Posizione getPosizioneByCandidaturaId(CandidaturaUser candidaturaUser) {
		Posizione posizione = new Posizione();
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			String sql = "SELECT * FROM Posizione WHERE id_posizione = ? ";
			preparedStatement = connection.getConnection().prepareStatement(sql);
			preparedStatement.setInt(1, candidaturaUser.getPosizione().getId_posizione()); 

			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));

				CittaIMPL cittaIMPL = new CittaIMPL();
				posizione.setCitta(cittaIMPL.getCittaById(resultSet.getInt(4)));

				CategoriaPosizioneIMPL categoriaPosizioneIMPL = new CategoriaPosizioneIMPL();
				posizione.setCategoria(categoriaPosizioneIMPL.getCategoriaPosizioneById(resultSet.getInt(5)));

				QuizIMPL quizIMPL = new QuizIMPL();
				posizione.setQuiz(quizIMPL.getQuizById(6));

				posizione.setStato(resultSet.getString(7));
				posizione.setData_inserimento(resultSet.getDate(8));
				posizione.setRuolo(resultSet.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
		}

		return posizione;
	}

}
