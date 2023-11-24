package com.candidatoDB.pw2.interfaces.impl;

import java.sql.*;
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
        String sql = "INSERT INTO Istruzione(grado,id_citta,descrizione_istruzione,data_inizio,data_fine,id_user,valutazione) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setString(1, istruzioni.getGrado());
			if(istruzioni.getId_citta()==0){
				statement.setNull(2, Types.INTEGER);
			}else{
				statement.setInt(2,istruzioni.getId_citta());
			}
			statement.setString(3, istruzioni.getDescrizione_istruzione());

			if(istruzioni.getData_inizio() != null){
				statement.setDate(4, new java.sql.Date(istruzioni.getData_inizio().getTime()));
			}else{
				statement.setNull(4, Types.INTEGER);
			}

			if(istruzioni.getData_fine() != null){
				statement.setDate(5, new java.sql.Date(istruzioni.getData_fine().getTime()));
			}else{
				statement.setNull(5, Types.INTEGER);
			}

			statement.setInt(6, istruzioni.getId_user());
            statement.setInt(7, istruzioni.getValutazione());

			statement.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			//DBUtil.close(resultSet);
			DBUtil.close(statement);
			//DBUtil.close((Connection) connection);
		}
	}
    
	@Override
	public void update(Istruzione istruzioni) {
		String sql = "UPDATE Istruzione SET grado=?,id_citta=?,descrizione_istruzione=?,data_inizio=?,data_fine=?,id_user=?,valutazione=? where id_istruzione=?";
		PreparedStatement statement = null;

		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setString(1, istruzioni.getGrado());

			if(istruzioni.getId_citta()==0){
				statement.setNull(2, Types.INTEGER);
			}else{
				statement.setInt(2,istruzioni.getId_citta());
			}

			statement.setString(3, istruzioni.getDescrizione_istruzione());
			if(istruzioni.getData_inizio() != null){
				statement.setDate(4, new java.sql.Date(istruzioni.getData_inizio().getTime()));
			}else{
				statement.setNull(4, Types.INTEGER);
			}

			if(istruzioni.getData_fine() != null){
				statement.setDate(5, new java.sql.Date(istruzioni.getData_fine().getTime()));
			}else{
				statement.setNull(5, Types.INTEGER);
			}
			statement.setInt(6, istruzioni.getId_user());
            statement.setInt(7, istruzioni.getValutazione());
			statement.setInt(8, istruzioni.getId_istruzione());
			statement.executeUpdate();

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close(connection.getConnection());
	}

	}

	@Override
	public List<Istruzione> getAllInstruction(int id_user) {
		ArrayList<Istruzione> istruzione1 = new ArrayList<Istruzione>();
		String sql = "SELECT * FROM Istruzione  where id_user = ?";
				
		PreparedStatement statement = null;
		
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_user);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				Istruzione istruzione = new Istruzione();

				istruzione.setId_istruzione(resultSet.getInt(1));
				istruzione.setGrado(resultSet.getString(2));
				istruzione.setId_citta(resultSet.getInt(3));
				istruzione.setDescrizione_istruzione(resultSet.getString(4));
				if(resultSet.getDate(5) != null) {
					istruzione.setData_inizio(new java.sql.Date(resultSet.getDate(5).getTime()));
				}
				if(resultSet.getDate(6) != null){
					istruzione.setData_fine(new java.sql.Date(resultSet.getDate(6).getTime()));
				}
				istruzione.setId_user(resultSet.getInt(7));
				istruzione.setValutazione(resultSet.getInt(8));
				istruzione1.add(istruzione);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			//DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection);
		}
		return istruzione1;
	}

	@Override
	public void deleteIstruzioneUtente(int  id_istruzione) {
		String sql = "DELETE Istruzione WHERE id_istruzione = ?";
		PreparedStatement statement = null;
		try {
		
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, id_istruzione);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close((Connection) connection);
		}

	}
}
