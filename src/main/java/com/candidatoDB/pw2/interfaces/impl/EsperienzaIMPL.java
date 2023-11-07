package com.candidatoDB.pw2.interfaces.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.candidatoDB.pw2.entity.Esperienza;
import com.candidatoDB.pw2.entity.Skill;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.EsperienzaDAO;
import com.servlets.pw2.controller.DBUtil;

public class EsperienzaIMPL implements EsperienzaDAO{

	@Override
	public void save(Esperienza esperienze) {
		String sql = "INSERT INTO Utente(id_esperienza,anni,descrizione_attivita,id_user,azienda,data_inizio,data_fine,ral,tipo_contratto,settore,posizione_lavorativa) VALUES(?,?,?,?,?,?,?,?,?,?,?))";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		Statement connection;
		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, esperienze.getId_esperienza());
			statement.setInt(2, esperienze.getAnni());
			statement.setString(3, esperienze.getDescrizione_attivita());
			statement.setInt(4, esperienze.getId_esperienza());
			statement.setString(5, esperienze.getAzienda());
			statement.setDate(6, new java.sql.Date(esperienze.getData_inizio().getTime()));
			statement.setDate(6, new java.sql.Date(esperienze.getData_fine().getTime()));
			statement.setInt(8, esperienze.getRal());
			statement.setString(9, esperienze.getTipo_contratto());
			statement.setString(10, esperienze.getSettore());
			statement.setString(11, esperienze.getPosizione_lavorativa());



			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next())
				esperienze.setId_esperienza(resultSet.getInt(1));
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			//DBUtil.close((Connection) connection);
		}
	}


	@Override
	public void update(Esperienza esperienze) {
		String sql = "UPDATE Utente SET id_esperienza=?,anni=?,descrizione_attivita=?,id_user=?,azienda=?,data_inizio=?,data_fine=?,ral=?,tipo_contratto=?,settore=?,posizione_lavorativa=?";
		PreparedStatement statement = null;

		Statement connection;
		try {
			//statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, esperienze.getId_esperienza());
			statement.setInt(2, esperienze.getAnni());
			statement.setString(3, esperienze.getDescrizione_attivita());
			statement.setInt(4, esperienze.getId_esperienza());
			statement.setString(5, esperienze.getAzienda());
			statement.setDate(6, new java.sql.Date(esperienze.getData_inizio().getTime()));
			statement.setDate(6, new java.sql.Date(esperienze.getData_fine().getTime()));
			statement.setInt(8, esperienze.getRal());
			statement.setString(9, esperienze.getTipo_contratto());
			statement.setString(10, esperienze.getSettore());
			statement.setString(11, esperienze.getPosizione_lavorativa());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close(connection.getConnection());
	}

	}
}

	


// 