package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.candidatoDB.pw2.entity.Citta;
import com.candidatoDB.pw2.entity.Esperienza;
import com.candidatoDB.pw2.entity.Quiz;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.UtenteDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

public class UtenteIMPL implements UtenteDAO {

	private SQLServerConnection connection = new SQLServerConnection();

	public UtenteIMPL() {
		connection.Connect();
	}

	@Override
	public void save(Utente utente) {
		String sql = "INSERT INTO Utente(id_user,nome,cognome,codice_fiscale,email,data_nascita,indirizzo,id_citta,cap,telefono,ruolo_admin,password) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, utente.getId_user());
			statement.setString(2, utente.getNome());
			statement.setString(3, utente.getCognome());
			statement.setString(4, utente.getCodice_fiscale());
			statement.setString(5, utente.getEmail());
			statement.setDate(6, new java.sql.Date(utente.getData_nascita().getTime()));
			statement.setInt(7, utente.getId_user());
			statement.setString(8, utente.getIndirizzo());
			statement.setInt(9, utente.getId_citta().getId_citta());
			statement.setString(10, utente.getCap());
			statement.setString(11, utente.getTelefono());
			statement.setString(12, utente.getRuolo_admin());
			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next())
				utente.setId_user(resultSet.getInt(1));
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}
	}

	@Override
	public void update(Utente utente) {
		String sql = "UPDATE Utente SET id_user=?,nome=?,cognome=?,codice_fiscale=?,email=?,data_nascita=?,indirizzo=?,id_citta=?,cap=?,telefono=?,ruolo_admin=?,password=? WHERE id_user=?";

		PreparedStatement statement = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, utente.getId_user());
			statement.setString(2, utente.getNome());
			statement.setString(3, utente.getCognome());
			statement.setString(4, utente.getCodice_fiscale());
			statement.setString(5, utente.getEmail());
			statement.setDate(6, new java.sql.Date(utente.getData_nascita().getTime()));
			statement.setInt(7, utente.getId_user());
			statement.setString(8, utente.getIndirizzo());
			statement.setInt(9, utente.getId_citta().getId_citta());
			statement.setString(10, utente.getCap());
			statement.setString(11, utente.getTelefono());
			statement.setString(12, utente.getRuolo_admin());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			DBUtil.close(connection.getConnection());
		}

	}




	@Override
	public Utente findById(int id_user) {
		Utente utente = new Utente();
		Citta cittaUtente = new Citta();
		String sql = "SELECT Utente.id_user, Utente.nome, Utente.cognome, Utente.codice_fiscale, Utente.email, Utente.data_nascita, Utente.indirizzo, Citta.nome, Citta.id_citta, Utente.cap, Utente.telefono, Utente.password, Utente.foto_profilo, Utente.genere from Utente inner join Citta on Citta.id_citta = Utente.id_citta where Utente.id_user=?";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_user);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				utente.setId_user(resultSet.getInt(1));
				utente.setNome(resultSet.getString(2));
				utente.setCognome(resultSet.getString(3));
				utente.setCodice_fiscale(resultSet.getString(4));
				utente.setEmail(resultSet.getString(5));
				utente.setData_nascita(new java.sql.Date(resultSet.getDate(6).getTime()));
				utente.setIndirizzo(resultSet.getString(7));
				cittaUtente.setNome(resultSet.getString(8));
				cittaUtente.setId_citta(resultSet.getInt(9));
				utente.setId_citta(cittaUtente);
				utente.setCap(resultSet.getString(10));
				utente.setTelefono(resultSet.getString(11));
				utente.setPassword(resultSet.getString(12));
				utente.setFoto_profilo(resultSet.getString(13));
				utente.setGenere(resultSet.getString(14));
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			//DBUtil.close(connection.getConnection());
		}
		return utente;
	}

	@Override
	public List<Esperienza> findEsperienzeById(int id_user) {
		List<Esperienza> esperienze = new ArrayList<Esperienza>();
		String sql = "SELECT Esperienza.id_esperienza,Esperienza.anni,Esperienza.descrizione_attivita,Esperienza.azienda,Esperienza.data_inizio,Esperienza.data_fine,Esperienza.ral, Esperienza.tipo_contratto, Esperienza.settore, Esperienza.posizione_lavorativa FROM Esperienza  INNER JOIN Utente  ON Esperienza.id_user = Utente.id_user WHERE Utente.id_user = ?;";

		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_user);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Esperienza esperienza = new Esperienza();
				esperienza.setId_esperienza(resultSet.getInt(1));
				esperienza.setAnni(resultSet.getInt(2));
				esperienza.setDescrizione_attivita(resultSet.getString(3));
				Utente utente = new Utente();
				utente.setId_user(resultSet.getInt(4));
				esperienza.setUtente(utente);
				esperienza.setAzienda(resultSet.getString(5));
				esperienza.setData_inizio(new java.sql.Date(resultSet.getDate(6).getTime()));
				esperienza.setData_fine(new java.sql.Date(resultSet.getDate(7).getTime()));
				esperienza.setRal(resultSet.getInt(8));
				esperienza.setTipo_contratto(resultSet.getString(9));
				esperienza.setSettore(resultSet.getString(10));
				esperienza.setPosizione_lavorativa(resultSet.getString(11));
				esperienze.add(esperienza);
			}
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}
		return esperienze;
	}

	@Override
	public List<Quiz> findByUtenteQuiz(int id_utente_quiz) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findPunteggioById(int id_utente_quiz) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteEsperienza(Esperienza esperienza) {
		String sql = "DELETE FROM Utente INNER JOIN Eseperienza ON Utente.id_user = Esperienza.id_user WHERE id_esperienza = ?";
		PreparedStatement statement = null;
		try {
		
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, esperienza.getId_esperienza());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			DBUtil.close((Connection) connection);
		}

		
	}

}
