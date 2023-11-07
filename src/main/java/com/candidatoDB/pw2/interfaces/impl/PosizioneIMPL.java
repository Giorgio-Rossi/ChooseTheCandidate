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

		String sql = "SELECT * FROM Posizione WHERE id_citta =?";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {

			statement.setInt(1, citta.getId_citta());

			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Posizione posizione = new Posizione();
				posizione.setId_poszione(resultSet.getInt(1));
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

//	@Override
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
				posizione.setId_poszione(resultSet.getInt(1));
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
      
        String sql = "SELECT * FROM Posizione WHERE id_Categoria = ?";
        PreparedStatement statement = null;
		ResultSet resultSet = null;
        try {
    		
        	statement.setInt(1, categoria.getId_categoria());

			resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Posizione posizione = new Posizione();
        		posizione.setId_poszione(resultSet.getInt(1));
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

}
