package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.candidatoDB.pw2.entity.CategoriaPosizione;
import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.interfaces.PosizioneDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

public class PosizioneIMPL implements PosizioneDAO {
	private SQLServerConnection connection = new SQLServerConnection();

	public PosizioneIMPL() {
		connection.Connect();
	}

	@Override
	public List<Posizione> searchByCity(Citta citta) {
		List<Posizione> posizioni = new ArrayList<>();

		String sql = "SELECT * FROM Posizione p INNER JOIN Citta c ON p.id_citta = c.id_citta WHERE p.id_citta =?";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {

			statement.setInt(1, citta.getId_citta());

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));
				citta = new Citta();
				citta.setId_citta(resultSet.getInt(4));
				posizione.setCitta(citta);
				CategoriaPosizione categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt(5));
				posizione.setCategoria(categoriaPosizione);
				Quiz quiz = new Quiz();
				quiz.setId_quiz(resultSet.getInt(6));
				posizione.setQuiz(quiz);
				posizione.setStato(resultSet.getString(7));
				posizione.setData_inserimento(new java.sql.Date(resultSet.getDate(8).getTime()));
				posizione.setRuolo(resultSet.getString(9));

				posizioni.add(posizione);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}

		return posizioni;

	}

	@Override
	public List<Posizione> searchByRuolo(String ruolo) {
		List<Posizione> posizioni = new ArrayList<>();

		String sql = "SELECT * FROM Posizione WHERE ruolo =?";
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		try {

			statement.setString(1, ruolo);

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();
				posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));
				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt(4));
				posizione.setCitta(citta);
				CategoriaPosizione categoriaPosizione = new CategoriaPosizione();
				categoriaPosizione.setId_categoria(resultSet.getInt(5));
				posizione.setCategoria(categoriaPosizione);
				Quiz quiz = new Quiz();
				quiz.setId_quiz(resultSet.getInt(6));
				posizione.setQuiz(quiz);
				posizione.setStato(resultSet.getString(7));
				posizione.setData_inserimento(new java.sql.Date(resultSet.getDate(8).getTime()));
				posizione.setRuolo(resultSet.getString(9));
				posizione.add(posizione);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}
		return posizioni;
	}

	@Override
	public List<Posizione> searchByCategoria(CategoriaPosizione categoria) {
        List<Posizione> posizioni = new ArrayList<>();
      
        String sql = "SELECT * FROM Posizione p INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria  WHERE cp.id_categoria = ?";
        PreparedStatement statement = null;
		ResultSet resultSet = null;
        try {
    		
        	statement.setInt(1, categoria.getId_categoria());

			resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Posizione posizione = new Posizione();
        		posizione.setId_posizione(resultSet.getInt(1));
				posizione.setN_ammissioni(resultSet.getInt(2));
				posizione.setDescrizione(resultSet.getString(3));
				Citta citta = new Citta();
				citta.setId_citta(resultSet.getInt(4));
				posizione.setCitta(citta);
				categoria = new CategoriaPosizione();
				categoria.setId_categoria(resultSet.getInt(5));
				posizione.setCategoria(categoria);
				Quiz quiz = new Quiz();
				quiz.setId_quiz(resultSet.getInt(6));
				posizione.setQuiz(quiz);
				posizione.setStato(resultSet.getString(7));
     posizione.setData_inserimento(new java.sql.Date(resultSet.getDate(8).getTime()));
     posizione.setRuolo(resultSet.getString(9));
          
                posizioni.add(posizione);
            }
            } catch (SQLException e) {
    			System.err.println(e.getMessage());
    		} finally {
    			DBUtil.close(resultSet);
    			DBUtil.close(statement);
    			DBUtil.close((Connection) connection);
    		}     
        return posizioni;
}

	@Override
	public List<Posizione> findPosizioniPiuRecenti() {
		
		    List<Posizione> posizioni = new ArrayList<>();
		    PreparedStatement statement = null;
		    ResultSet resultSet = null;

		    try {
	
		        String sql = "SELECT p.*, c.id_citta, c.regione, c.nome, cp.id_categoria, cp.descrizione, q.id_quiz, q.descrizione, q.n_domande " +
		                     "FROM Posizione p " +
		                     "INNER JOIN Citta c ON p.id_citta = c.id_citta " +
		                     "INNER JOIN CategoriaPosizione cp ON p.id_categoria = cp.id_categoria " +
		                     "LEFT JOIN Quiz q ON p.id_quiz = q.id_quiz " +
		                     "ORDER BY p.data_inserimento DESC";
		        statement = connection.getConnection().prepareStatement(sql);
		        resultSet = statement.executeQuery();

		        while (resultSet.next()) {
		            Posizione posizione = new Posizione();
		            posizione.setId_posizione(resultSet.getInt("id_posizione"));
		            posizione.setN_ammissioni(resultSet.getInt("n_ammissioni"));
		            posizione.setDescrizione(resultSet.getString("descrizione"));

		            Citta citta = new Citta();
		            citta.setId_citta(resultSet.getInt("id_citta"));
		            citta.setRegione(resultSet.getString("regione"));
		            citta.setNome(resultSet.getString("nome"));
		            posizione.setCitta(citta);

		            CategoriaPosizione categoria = new CategoriaPosizione();
		            categoria.setId_categoria(resultSet.getInt("id_categoria"));
		            categoria.setDescrizione(resultSet.getString("descrizione"));
		            posizione.setCategoria(categoria);

		            int idQuiz = resultSet.getInt("id_quiz");
		            if (!resultSet.wasNull()) {
		                Quiz quiz = new Quiz();
		                quiz.setId_quiz(idQuiz);
		                quiz.setDescrizione(resultSet.getString("q.descrizione"));
		                quiz.setN_domande(resultSet.getInt("q.n_domande"));
		                posizione.setQuiz(quiz);
		            }

		            posizione.setStato(resultSet.getString("stato"));
		            posizione.setData_inserimento(resultSet.getDate("data_inserimento"));
		            posizione.setRuolo(resultSet.getString("ruolo"));

		            posizioni.add(posizione);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		       
		        DBUtil.close(resultSet);
		        DBUtil.close(statement);
		       // DBUtil.close((Connection) connection);
		    }

		    return posizioni;
		}

	}

	
