package com.candidatoDB.pw2.interfaces.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.candidatoDB.pw2.entity.Istruzione;
import com.candidatoDB.pw2.interfaces.IstruzioneDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

public class IstruzioneIMPL implements IstruzioneDAO {    

	private SQLServerConnection connection = new SQLServerConnection();

    public IstruzioneIMPL(){
        connection.Connect();
    }

    @Override
    public void save(Istruzione istruzioni){
        String sql = "INSERT INTO Istruzione(id_istruzione,grado,id_citta,descrizione_istruzione,data_inizio,data_fine,id_user,valutazione) VALUES(?,?,?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, istruzioni.getId_istruzione());
			statement.setString(2, istruzioni.getGrado());
			statement.setInt(3, istruzioni.getId_citta());
			statement.setString(4, istruzioni.getDescrizione_istruzione());
			statement.setDate(6, new java.sql.Date(istruzioni.getData_inizio().getTime()));
			statement.setDate(6, new java.sql.Date(istruzioni.getData_fine().getTime()));
			statement.setInt(5, istruzioni.getId_user());
            statement.setInt(8, istruzioni.getValutazione());

			statement.executeUpdate();
			resultSet = statement.getGeneratedKeys();
			if (resultSet.next())
				istruzioni.setId_istruzione(resultSet.getInt(1));
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(resultSet);
			DBUtil.close(statement);
			//DBUtil.close((Connection) connection);
		}
	}
    
	@Override
	public void update(Istruzione istruzioni) {
		String sql = "UPDATE Istruzione SET id_istruzione=?,grado=?id_citta=?,descrizione_istruzione=?,data_inizio=?,data_fine=?,id_user=?,valutazione=?";
		PreparedStatement statement = null;

		try {
			statement = connection.getConnection().prepareStatement(sql, new String[] { "id" });
			statement.setInt(1, istruzioni.getId_istruzione());
			statement.setString(2, istruzioni.getGrado());
			statement.setInt(3, istruzioni.getId_citta());
			statement.setString(4, istruzioni.getDescrizione_istruzione());
			statement.setDate(6, new java.sql.Date(istruzioni.getData_inizio().getTime()));
			statement.setDate(6, new java.sql.Date(istruzioni.getData_fine().getTime()));
			statement.setInt(5, istruzioni.getId_user());
            statement.setInt(8, istruzioni.getValutazione());
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close(connection.getConnection());
	}

	}
}
