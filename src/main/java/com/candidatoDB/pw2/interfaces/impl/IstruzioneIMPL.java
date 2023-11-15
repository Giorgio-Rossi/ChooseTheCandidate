package com.candidatoDB.pw2.interfaces.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.candidatoDB.pw2.entity.Esperienza;
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

	@Override
	public ArrayList<Istruzione> getAllInstruction() {
		ArrayList<Istruzione> istruzione1 = new ArrayList<Istruzione>();
		String sql = "SELECT * FROM Istruzione where id_user=?";
				
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Istruzione istruzione = new Istruzione();

				istruzione.setId_istruzione(resultSet.getInt(1));
				istruzione.setGrado(resultSet.getString(2));
				istruzione.setId_citta(resultSet.getInt(3));
				istruzione.setDescrizione_istruzione(resultSet.getString(4));
				istruzione.setData_inizio(new java.sql.Date(resultSet.getDate(5).getTime()));
				istruzione.setData_fine(new java.sql.Date(resultSet.getDate(6).getTime()));
				istruzione.setId_user(resultSet.getInt(7));
				istruzione.setValutazione(resultSet.getInt(8));
				istruzione1.add(istruzione);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection);
		}
		return istruzione1;
	}

	@Override
	public void deleteIstruzioneUtente(Istruzione istruzione) {
		String sql = "DELETE Istruzione WHERE id_user = ?";
		PreparedStatement statement = null;
		try {
		
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, istruzione.getId_istruzione());
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close((Connection) connection);
		}

	}
}
