package com.candidatoDB.pw2.interfaces.impl;

import com.candidatoDB.pw2.entity.Esperienza;
import com.candidatoDB.pw2.entity.Posizione;
import com.candidatoDB.pw2.entity.Utente;
import com.candidatoDB.pw2.interfaces.impl.UtenteIMPL;
import com.candidatoDB.pw2.interfaces.EsperienzaDAO;
import com.servlets.pw2.controller.DBUtil;
import com.servlets.pw2.controller.SQLServerConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class EsperienzaIMPL implements EsperienzaDAO {

	private SQLServerConnection connection = new SQLServerConnection();

	public EsperienzaIMPL(){
		connection.Connect();
	}

	@Override
	public void save(Esperienza esperienze) {
		String sql = "INSERT INTO Esperienza(anni,descrizione_attivita,id_user,azienda,data_inizio,data_fine,ral,tipo_contratto,settore,posizione_lavorativa,id_citta) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			statement = connection.getConnection().prepareStatement(sql);
			statement.setInt(1, esperienze.getAnni());
			statement.setString(2, esperienze.getDescrizione_attivita());
			statement.setInt(3, esperienze.getUtente().getId_user());
			statement.setString(4, esperienze.getAzienda());

			if(esperienze.getData_inizio() != null){
				statement.setDate(5, new java.sql.Date(esperienze.getData_inizio().getTime()));
			}else{
				statement.setNull(5, Types.INTEGER);
			}

			if(esperienze.getData_fine() != null){
				statement.setDate(6, new java.sql.Date(esperienze.getData_fine().getTime()));
			}else{
				statement.setNull(6, Types.INTEGER);
			}

			statement.setInt(7, esperienze.getRal());
			statement.setString(8, esperienze.getTipo_contratto());
			statement.setString(9, esperienze.getSettore());
			statement.setString(10, esperienze.getPosizione_lavorativa());

			if(esperienze.getId_citta() == null){
				statement.setNull(11, Types.INTEGER);
			}else{
				statement.setInt(11,esperienze.getId_citta().getId_citta());
			}

			statement.executeUpdate();
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
		String sql = "UPDATE Esperienza SET anni=?,descrizione_attivita=?,id_user=?,azienda=?,data_inizio=?,data_fine=?,ral=?,tipo_contratto=?,settore=?,posizione_lavorativa=?, id_citta=? where id_esperienza=?";
		PreparedStatement statement = null;

		try {
			statement = connection.getConnection().prepareStatement(sql);

			statement.setInt(1, esperienze.getAnni());
			statement.setString(2, esperienze.getDescrizione_attivita());
			statement.setInt(3, esperienze.getUtente().getId_user());
			statement.setString(4, esperienze.getAzienda());

			if(esperienze.getData_inizio() != null){
				statement.setDate(5, new java.sql.Date(esperienze.getData_inizio().getTime()));
			}else{
				statement.setNull(5, Types.INTEGER);
			}
			if(esperienze.getData_fine() != null){
				statement.setDate(6, new java.sql.Date(esperienze.getData_fine().getTime()));
			}else{
				statement.setNull(6, Types.INTEGER);
			}
			statement.setInt(7, esperienze.getRal());
			statement.setString(8, esperienze.getTipo_contratto());
			statement.setString(9, esperienze.getSettore());
			statement.setString(10, esperienze.getPosizione_lavorativa());

			if(esperienze.getId_citta()==null){
				statement.setNull(11, Types.INTEGER);
			}else{
				statement.setInt(11,esperienze.getId_citta().getId_citta());
			}

			statement.setInt(12, esperienze.getId_esperienza());

			statement.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			DBUtil.close(statement);
			//DBUtil.close(connection.getConnection());
	}	
		
	}
	
	public List<Esperienza> getAllExperience(int id_user) {
		ArrayList<Esperienza> esperienze1 = new ArrayList<Esperienza>();
		String sql = "SELECT * FROM Esperienza where id_user=?";
				
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
				
				UtenteIMPL utenteIMPL = new UtenteIMPL();
				esperienza.setUtente(utenteIMPL.findById(resultSet.getInt(4)));
				esperienza.setAzienda(resultSet.getString(5));

				if(resultSet.getDate(6) != null) {
					esperienza.setData_inizio(new java.sql.Date(resultSet.getDate(6).getTime()));
				}

				if(resultSet.getDate(7) != null) {
					esperienza.setData_fine(new java.sql.Date(resultSet.getDate(7).getTime()));
				}

				esperienza.setRal(resultSet.getInt(8));
				esperienza.setTipo_contratto(resultSet.getString(9));
				esperienza.setSettore(resultSet.getString(10));
				esperienza.setPosizione_lavorativa(resultSet.getString(11));

				if(resultSet.getString(12)==null){
				}else {
					esperienza.setId_citta(new CittaIMPL().getCittaById(resultSet.getInt(12)));
				}


				esperienze1.add(esperienza);


			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			//DBUtil.close(resultSet);
			DBUtil.close(statement);
			// DBUtil.close(connection);
		}
		return esperienze1;
	}

		@Override
		public void deleteEsperienzaUtente(Integer id_esperienza) {
			String sql = "DELETE Esperienza WHERE id_esperienza = ?";
			PreparedStatement statement = null;
			try {
			
				statement = connection.getConnection().prepareStatement(sql);
				statement.setInt(1, id_esperienza);
				statement.executeUpdate();
			} catch (SQLException e) {
				System.err.println(e.getMessage());
			} finally {
				DBUtil.close(statement);
				//DBUtil.close((Connection) connection);
			}

		}
		

}

	
